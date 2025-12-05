################################################################################
# BDcavegen.py - For the Vic20 Boulder Dash game
#   Python program to read BDCFF files and convert into playable cave files. 
#
#   Each cave file is self-contained and just needs the Boulder Dash game 'engine'
#   to be played. It holds the cave parameters (48 bytes) and map (400 bytes).
#
#   A cave definition JSON file is also created in this process which is a more 
#   structured and readable BD file.
#   BDCFF files can be found online here: https://www.boulder-dash.nl/
#
#   Notes:
#   There are 2 types of BD files supported by this program.
#   - Original-type where caves are created using pseudo-random generation of tiles (boulders, diamonds etc).
#     These usually also have a set of base tiles (often walls) which are defined with object instructions
#     e.g. "FillRect=8 8 11 11 DIRT SPACE"
#   - Map-type where caves are defined by characters which map to tiles, e.g. 'd' for diamond, 'r' for rock.
#     The pseudo-random generation of tiles is not used, which means different skill levels have the same map layout,
#     only the parameters like number of diamonds needed, cave time may be different for each level
#
#   There are 3 definable colour groups applied to each cave used to paint the elements (black is always present).
#   -  Group 1 for most of titanium walls, rocks, amoeba; part of rockford, diamonds
#   -  Group 2 dirt
#   -  Group 3 most of walls, rockford; part of rocks, diamonds
#   The butterflies and fireflies contain a bit of each.
#

### Imports
import os
from os import path
import json
import numpy as np
from distutils.dir_util import copy_tree
import shutil

ATTEMPT_BD_COLOUR_MAP = False  #Attempt to map the colours in the BDCFF or use the config file scheme per cave

################################################################################
#region Helper functions

def safe_byte(value):

    if value < 0:
        return 0
    elif value > 255:
        return 255
    else:
        return value

def get_object_map_value(element):

    if element in object_element_map:
        value = object_element_map[element]["value"]
        value_int = int(value)
    else:
        print(f"No element value found for {element}")
        value_int = 99
    return value_int

def get_object_map_symbol(element):

    if element in object_element_map:
        symbol = object_element_map[element]['symbol']
    else:
        print(f"No element symbol found for {element}")
        symbol = "?"
    return symbol

def plot_diagonal_line(object_cave_map, row1, col1, row2, col2, value):

    #Plot repeated points from start to end of diagonal line
    y = 1  #Assume step from top row to bottom
    if row1 > row2:
        y = -1  #Step from bottom row to top

    x = 1  #Assume step from left col to right
    if col1 > col2:
        x = -1  #Step from right col to left
    
    while row1 != row2:
        while col1 != col2:
            object_cave_map[row1:row1+1,col1:col1+1] = value  #Draw single point
            col1 += x
            row1 += y
    object_cave_map[row1:row1+1,col1:col1+1] = value  #Draw single point for last point, values are equal

def add_cave_parameter(output_cave_json, output_cave_params, param_name, value):
    if param_name not in ["Colors", "InitialFill", "BorderTile", "TileForProbability", "RandomFillBelow"]:   #Some parameters are added to JSON separately
        output_cave_json[param_name] = value

    i = addresses.get(param_name)
    if type(value) == bool:
        #Convert boolean parameter to 1 (true), or 0 (false)
        output_cave_params[i] = 1 if value == True else 0
    elif type(value) == list:
        for j in range(len(value)):
            output_cave_params[i] = value[j]
            i += 1
    else:
        output_cave_params[i] = value

def add_cave_map_row(cave_count, cave_line_count, line, output_cave_json, output_cave_params, output_cave_map_bytes, unsupported_elements):

    last_value = 0
    char_count = 0
    for c in line.strip('\n'):

        e = 0
        if c in element_map:

            if c == "P":  #Special element "P" Rockford starting point, needs to be a cave parameter
                add_cave_parameter(output_cave_json, output_cave_params, "RockfordStart", [cave_line_count - 1, char_count])  #Is -1 because output caves don't need the top and botton lines
            elif c == "X":  #Special element "X" Rockford exit, needs to be a cave parameter
                add_cave_parameter(output_cave_json, output_cave_params, "RockfordExit", [cave_line_count - 1, char_count])  #Is -1 because output caves don't need the top and botton lines
            else:
                e = element_map[c]['value']

            char_count += 1
            if char_count % 2 == 0:  #New two mapped values (both nibbles) to combine into a single byte
                output_cave_map_bytes.append(((last_value<<4) | e).to_bytes(1, byteorder='big'))
            last_value = e
        else:
            if c not in unsupported_elements:  #Add to unsupported elements for the cave
                unsupported_elements.append(c)

            if c in element_no_map:  #Use the substitute element if possible
                s = element_no_map[c]['substitute']
                e = element_map[s]['value']
                char_count += 1
                if char_count % 2 == 0:  #New two mapped values (both nibbles) to combine into a single byte
                    output_cave_map_bytes.append(((last_value<<4) | e).to_bytes(1, byteorder='big'))
                last_value = e
            else:
                print(f"mapping for element {c} in cave {cave_count} not found, using space instead")

#endregion

################################################################################
#region Generate caves from BD definition

def generate_caves(all_input_lines, output_subfolder):

    #Every fifth cave has to be an intermission / bonus cave, with cave letters Q, R, S, T
    cave_letters = ['A','B','C','D','Q','E','F','G','H','R','I','J','K','L','S','M','N','O','P','T','Z']
    output_all_caves_json = []
    output_cave_map_bytes = []

    within_cave = False
    within_map = False
    within_objects = False
    intermission_cave = False
    cave_count = 0
    for line in all_input_lines:

        #Start of a cave
        if line == "[cave]\n":
            cave_count += 1
            within_cave = True
            within_map = False
            within_objects = False
            intermission_cave = False

            output_cave_json = {}
            output_cave_json["CaveLetter"] = cave_letters[cave_count-1]
            output_cave_json["CaveNumber"] = cave_count
            output_cave_json["Map"] = []

            output_cave_params = []
            output_cave_map_bytes = []
            unsupported_elements = []
            last_tile_for_probability = []

            #Initialise the cave parameter bytes
            for i in range(48):
                output_cave_params.append(0)

            #Set the parameter initial fill to dirt "." and border to steelwall "W", these paramters may be changed in some caves
            output_cave_params[addresses.get("InitialFill")] = element_map["."]["value"]
            output_cave_params[addresses.get("BorderTile")] = element_map["W"]["value"]

            #The cave is filled with the null time, border with the steelwall
            cave_fill_tile = "-"  #The game engine will replace null tiles with pseudo-random tiles or the initial fill time
            border_tile = "W"

        #End of a cave
        elif line == "[/cave]\n":
            within_cave = False
            within_map = False
            within_objects = False

            #Check if any unsupported elements found and report them
            if len(unsupported_elements) > 0:
                print(f"*** Unsupported elements found for cave {cave_count} ({cave_letters[cave_count-1]})")
                for e in [u for u in unsupported_elements if u in element_no_map]:
                    sub_element = element_no_map[e]['substitute']
                    print(f"    '{e}' {element_no_map[e]['element']} becomes '{sub_element}' {element_map[sub_element]['element']}")
                for e in [u for u in unsupported_elements if u not in element_no_map]:
                    print(f"    Remaining {unsupported_elements} become ' ' space")

            #Write cave contents file
            output_file_name = path.join(output_subfolder, cave_letters[cave_count-1])
            output_file = open(output_file_name, "wb")

            #Write cave parameters
            for value in output_cave_params:
                output_file.write(value.to_bytes(1, byteorder='big'))

            #Write cave map
            if intermission_cave:
                skip_bytes = 9  #9 because intermissions are 20 tiles with each tile being one nibble, and zero based counting
                for i, byte in enumerate(output_cave_map_bytes):
                    if i % 10 == 0 and i > 10:
                        output_file.write(b"3" * 10)  #Write out steelwall padding at the end of a line (every 10th byte)
                    if i > skip_bytes:
                        output_file.write(byte)
                output_file.write(b"3" * 10)
                for i in range(0,9):
                    output_file.write(b"3" * 20)  #Write out steelwall padding lines (20 bytes)

            else:  #standard cave
                skip_bytes = 19  #19 because there are 40 tiles with each tile being one nibble, and zero based counting
                for i, byte in enumerate(output_cave_map_bytes):
                    if i > skip_bytes and i < len(output_cave_map_bytes) - skip_bytes -1:
                        output_file.write(byte)

            output_file.close()

            #Add cave definition json to master list
            output_all_caves_json.append(output_cave_json)

        #Start of the map section within a cave
        elif line == "[map]\n":
            cave_line_count = 0
            within_map = True

        #End of the map section within a cave
        elif line == "[/map]\n":
            within_map = False

        #Start of the objects section within a cave
        elif line == "[objects]\n":
            within_objects = True

            if intermission_cave:
                object_cave_map = np.full((12, 20), border_tile, dtype = np.str_)  #String datatype for tile symbols
                object_cave_map[1:11,1:19] = cave_fill_tile
            else:
                object_cave_map = np.full((22, 40), border_tile, dtype = np.str_)  #String datatype for tile symbols
                object_cave_map[1:21,1:39] = cave_fill_tile

        #End of the objects section within a cave
        elif line == "[/objects]\n":
            within_objects = False

            #Map numpy array integer values to tile symbols, write an output cave line and append line to JSON map
            cave_line_count = 0
            for object_map_line in object_cave_map:
                map_line = ""
                for tile in object_map_line:

                    #If a null tile is used in a cave without pseudo-random cave parameters, replace null with dirt tile
                    if tile == '-' and last_tile_for_probability == []:
                        map_line += "."
                    else:
                        if tile in element_map:
                            map_line += tile
                        else:
                            map_line += "?"

                cave_line_count += 1
                add_cave_map_row(cave_count, cave_line_count, map_line, output_cave_json, output_cave_params, output_cave_map_bytes, unsupported_elements)
                output_cave_json["Map"].append(map_line)  #Add line to json file

        #Within the cave parameters section, but not the map or objects sections
        elif within_cave and not within_map and not within_objects:
            if "=" in line:
                line_param = line.strip().split("=")  #e.g. CaveTime=120
                if line_param[0] in config_settings["parameters"] or line_param[0] == "RandomFill":  #RandomFill is a special case replaced with "TileProbability", "TileForProbability"

                    #DiamondValue may have 2 values, DiamondValue and DiamondExtraValue, space delimited
                    if line_param[0] == "DiamondValue":
                        line_values = line_param[1].strip().split(" ")
                        add_cave_parameter(output_cave_json, output_cave_params, "DiamondValue", safe_byte(int(line_values[0])))  #DiamondValue
                        if len(line_values) > 1:
                            add_cave_parameter(output_cave_json, output_cave_params, "DiamondExtraValue", safe_byte(int(line_values[1])))  #Use the extra value
                        else:
                            add_cave_parameter(output_cave_json, output_cave_params, "DiamondExtraValue", safe_byte(int(line_values[0])))  #No extra value, use DiamondValue

                    #These parameters may have up to 5 values for each level, space delimited
                    elif line_param[0] in ["DiamondsRequired", "CaveTime", "RandSeed"]:
                        line_values = [safe_byte(int(x)) for x in line_param[1].strip().split(" ")]

                        #If less than 5 line values, use the last value for the missing ones
                        param_count = len(line_values)
                        if param_count < 5:
                            last_value = line_values[param_count-1]
                            for n in range(param_count,5):
                                line_values.append(last_value)

                        add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", line_values)

                    #AmoebaTime and MagicWallTime are optionally present, if there use it, single value per cave
                    elif line_param[0] in ["AmoebaTime","MagicWallTime"]:
                        add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", safe_byte(int(line_param[1])))

                    elif line_param[0] == "Intermission":
                        intermission_cave = True if line_param[1].upper() == "TRUE" else False
                        add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", intermission_cave)

                    #Decode Initial fill element if present
                    elif line_param[0] == "InitialFill":
                        cave_fill_tile = get_object_map_symbol(line_param[1])
                        add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", element_map[cave_fill_tile]["value"])
                        output_cave_json[line_param[0]] = element_map[cave_fill_tile]["element"]

                    #Decode Border tile element if present
                    elif line_param[0] == "BorderTile":
                        border_tile = get_object_map_symbol(line_param[1])
                        add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", element_map[border_tile]["value"])
                        output_cave_json[line_param[0]] = element_map[border_tile]["element"]

                    elif line_param[0] == "Colors":
                        colour_codes = []
                        colour_list = []
                        if ATTEMPT_BD_COLOUR_MAP:
                            for text_colour in line_param[1].split(" "):
                                if colour_map.get(text_colour.lower()) != None:  #Attempt to map the text values in Colors
                                    colour_codes.append(colour_map[text_colour.lower()])
                                    colour_list.append(text_colour.lower())
                        if len(colour_codes) == 3:  #If exactly 3 mapped results, used the mapped scheme
                            add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", colour_codes)
                            output_cave_json[line_param[0]] = colour_list
                        else:  #Use the scheme from the config for the cave
                            add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", colour_schemes[str(cave_count)]['code'])
                            output_cave_json[line_param[0]] = colour_schemes[str(cave_count)]['colours']

                    #Decode RandomFill with 1 to 4 pairs of values, e.g. SPACE 60 BOULDER 50 DIAMOND 9 FIREFLYl 2
                    elif line_param[0] == "RandomFill":
                        
                        TileForProbability = []
                        TileProbability = []
                        TileForProbabilityJSON = []
                        line_values = line_param[1].strip().split(" ")
                        for i in range(len(line_values)):
                            if i % 2 == 0:  #Even values are elements to decode
                                value = get_object_map_value(line_values[i])
                                TileForProbability.append(value)
                                TileForProbabilityJSON.append(line_values[i])
                            elif i > 0:  #Odd values are random integer values
                                TileProbability.append(int(line_values[i]))

                        last_tile_for_probability = TileForProbability  #Potentially used later

                        add_cave_parameter(output_cave_json, output_cave_params, "TileForProbability", TileForProbability)
                        add_cave_parameter(output_cave_json, output_cave_params, "TileProbability", TileProbability)
                        output_cave_json["TileForProbability"] = TileForProbabilityJSON

                    elif line_param[0] == "SlimePermeability":
                        add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", safe_byte(int(float(line_param[1]))))

                    else:
                        add_cave_parameter(output_cave_json, output_cave_params, f"{line_param[0]}", safe_byte(int(line_param[1])))

        #Within the map section
        elif within_map:

            map_line = line.strip('\n')
            cave_line_count += 1
            add_cave_map_row(cave_count, cave_line_count, map_line, output_cave_json, output_cave_params, output_cave_map_bytes, unsupported_elements)
            output_cave_json["Map"].append(map_line)  #Add line to json file

        #Within the objects section
        elif within_objects:
            #Note array co-ordinates are specified: object_cave_map[row1:row2,col1,col2]
            pl = line.replace("="," ").strip().split(" ")
            if pl[0] == "Point":
                tile = get_object_map_symbol(pl[3])
                object_cave_map[int(pl[2]):int(pl[2])+1,int(pl[1]):int(pl[1])+1] = tile  #Draw single point
            elif pl[0] == "Line":
                tile = get_object_map_symbol(pl[5])
                if pl[1] == pl[3] or pl[2] == pl[4]:
                    object_cave_map[int(pl[2]):int(pl[4])+1,int(pl[1]):int(pl[3])+1] = tile  #Draw single line
                else:
                    plot_diagonal_line(object_cave_map, int(pl[2]),int(pl[1]),int(pl[4]),int(pl[3]), tile)
            elif pl[0] == "FillRect":
                if len(pl) > 6:
                    tile = get_object_map_symbol(pl[5])
                    fill_tile = get_object_map_symbol(pl[6])
                    object_cave_map[int(pl[2]):int(pl[4])+1,int(pl[1]):int(pl[3])+1] = tile  #Draw outer filled rectangle
                    object_cave_map[int(pl[2])+1:int(pl[4]),int(pl[1])+1:int(pl[3])] = fill_tile  #Draw inner filled rectangle
                else:
                    tile = get_object_map_symbol(pl[5])
                    object_cave_map[int(pl[2]):int(pl[4])+1,int(pl[1]):int(pl[3])+1] = tile  #Draw filled rectangle
            elif pl[0] == "Rectangle":
                tile = get_object_map_symbol(pl[5])
                object_cave_map[int(pl[2]):int(pl[2])+1,int(pl[1]):int(pl[3])+1] = tile  #Top line
                object_cave_map[int(pl[2]):int(pl[4])+1,int(pl[1]):int(pl[1])+1] = tile  #Left line
                object_cave_map[int(pl[2]):int(pl[4])+1,int(pl[3]):int(pl[3])+1] = tile  #Right line
                object_cave_map[int(pl[4]):int(pl[4])+1,int(pl[1]):int(pl[3])+1] = tile  #Bottom line
            elif pl[0] == "Raster":
                tile = get_object_map_symbol(pl[7])
                plot_row = int(pl[2])
                for r in range(int(pl[4])):
                    plot_col = int(pl[1])
                    for c in range(int(pl[3])):
                        object_cave_map[plot_row:plot_row+1,plot_col:plot_col+1] = tile  #Draw single point
                        plot_col += int(pl[5])
                    plot_row += int(pl[6])
            elif pl[0] == "Add":
                #Only seen in BoulderDash02.bd twice with values:
                #  Add=0 1 FIREFLYl BOULDER   #means add BOULDER on row below FIREFLYl
                #  Add=0 1 DIAMOND MAGICWALL  #means add MAGICWALL on row below DIAMOND
                #These become cave parameters (max 4 values), with e.g. BOULDER element value (5) occupying parameter 3
                #because FIREFLYl is the 3rd randomly generated tile. All other parameters are 0
                find_tile = get_object_map_value(pl[3])  #e.g. FIREFLYl as above
                apply_tile = get_object_map_value(pl[4])  #e.g. BOULDER as above
                RandomFillBelow = [0,0,0,0]
                i = last_tile_for_probability.index(find_tile)
                RandomFillBelow[i] = apply_tile
                add_cave_parameter(output_cave_json, output_cave_params, "RandomFillBelow", RandomFillBelow)

                RandomFillBelowJSON = ["","","",""]
                RandomFillBelowJSON[i] = pl[4]
                output_cave_json["RandomFillBelow"] = RandomFillBelowJSON

    #Write all caves to json file
    output_file_name = path.join(output_subfolder, "cavedef.json")
    with open(output_file_name, "w") as outfile: 
        json.dump(output_all_caves_json, outfile, indent=4, sort_keys=True)

#endregion

################################################################################
# Main Routine
if __name__ == '__main__':

    ### Config and file paths
    base_path = path.dirname(path.abspath(__file__))
    base_path = path.join(base_path, "..")
    config_file = open(path.join(base_path, "config", "config.json"))
    config_settings = json.load(config_file)
    element_map = config_settings["element_map"]
    parameter_list = config_settings["parameters"]
    colour_schemes = config_settings["colour_schemes"]
    colour_map = config_settings["colour_map"]
    config_file.close()

    #Create unsupported element list from element_map (where substitute values are being used)
    element_no_map = [e for e in element_map if "substitute" in element_map[e]]
        
    #Create object_element_map from element_map by making the element name the key, using substitute values if available
    object_element_map = {}
    for e in element_map:
        new_key = element_map[e]["element"]
        object_element_map[new_key] = {}
        if "substitute" in element_map[e]:
            sub = element_map[e]["substitute"]
            object_element_map[new_key]["symbol"] = sub
            object_element_map[new_key]["value"] = element_map[sub]["value"]
        else:
            object_element_map[new_key]["symbol"] = e
            object_element_map[new_key]["value"] = element_map[e]["value"]

    #Create addresses where parameters will be stored in the output cave file
    addresses = {}
    for a in parameter_list:
        addresses[a] = parameter_list[a]["address"]

    BD_files_folder = path.join(base_path, "caves_bdcff")

    ### Process each BD file in the bdcff folder
    for filename in os.listdir(BD_files_folder):

        if path.isfile(path.join(BD_files_folder, filename)) and filename[-2:].upper() == "BD":

            BD_filename = filename.split('.')[0]  #e.g. ArnoDash01 without the ".bd" extension
            output_subfolder = path.join(base_path, "build", BD_filename)
            if not os.path.exists(output_subfolder):
                print(f"Creating output subfolder {output_subfolder}")
                os.mkdir(output_subfolder)

            #Read the BD file contents
            input_file_name = path.join(base_path, BD_files_folder, filename)
            input_file = open(input_file_name, "r")
            all_input_lines = input_file.readlines()
            input_file.close()

            #Use the BD file contents to generate caves
            print(f"Generating caves for {BD_filename}")
            generate_caves(all_input_lines, output_subfolder)

            #Move the generated caves and json file to their destination folders
            os.replace(path.join(output_subfolder, "cavedef.json"), path.join("caves_json", BD_filename + ".json"))
            shutil.copytree(output_subfolder, path.join("caves_bin", BD_filename), dirs_exist_ok=True)
            print(f"Completed {BD_filename}")
