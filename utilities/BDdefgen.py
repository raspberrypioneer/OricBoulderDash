################################################################################
# BDdefgen.py - Utility to convert caves files back to the BD definition file

### Imports
import os
from os import path
import json

CAVE_FILE_FOLDER = "ArnoDash01"  #Specify folder in output to reverse engineer and create BD definition file
UNUSED_PARAMS_FROM_POS = 43

################################################################################
def generate_BD_for_cave(cave_number, cave_bytes):

    border_tile = 3
    #print(f"[cave]\nName=Cave {cave_number}", end="")
    output_file.write(f"[cave]\nName=Cave {cave_number}")
            
    rockford_positions = []
    next_is_rockford_pos = False
    tiles_drawn = 0

    for i, byte in enumerate(cave_bytes):
        if i < 48:
            #Reverse engineer parameters using the config addresses
            if i < UNUSED_PARAMS_FROM_POS:
                param_address = find_param(i)
                if param_address != "#use_previous_address#":
                    #print(f"\n{param_address}={byte}", end="")
                    output_file.write(f"\n{param_address}={byte}")

                    #special cases
                    if param_address in ["RockfordStart","RockfordExit"]:
                        rockford_positions.append(byte)
                        next_is_rockford_pos = True
                else:
                    #print(f" {byte}", end="")
                    output_file.write(f" {byte}")
                    if param_address == "BorderTile":
                        border_tile = byte
                    if next_is_rockford_pos:
                        rockford_positions.append(byte)
                        next_is_rockford_pos = False

        else:
            #Reverse engineer map tiles
            if (i == 48):
                #print("\n\n[map]")
                #print(element_list[border_tile]*40, end="")
                output_file.write("\n\n[map]\n")
                output_file.write(element_list[border_tile]*40)

                rockford_start = ((rockford_positions[0]-1) * 40) + (rockford_positions[1]+1)
                rockford_exit = ((rockford_positions[2]-1) * 40) + (rockford_positions[3]+1)

            if (i-48) % 20 == 0:
                #print()
                output_file.write("\n")
            high, low = byte >> 4, byte & 0x0F
            #print(f"{element_list[high]}{element_list[low]}", end="")
            first_tile = element_list[high]
            second_tile = element_list[low]

            #special case for rockford start and exit
            if rockford_start == tiles_drawn + 1:
                first_tile = "P"
            elif rockford_exit == tiles_drawn + 1:
                first_tile = "X"
            elif rockford_start == tiles_drawn + 2:
                second_tile = "P"
            elif rockford_exit == tiles_drawn + 2:
                second_tile = "X"

            output_file.write(f"{first_tile}{second_tile}")
            tiles_drawn += 2

    #print()
    #print(element_list[border_tile]*40, end="")
    #print("\n[/map]\n[/cave]\n")
    output_file.write("\n")
    output_file.write(element_list[border_tile]*40)
    output_file.write("\n[/map]\n[/cave]\n\n")

################################################################################
def find_param(pos):

    return_address = ""
    last_address_pos = 0
    for param_name in parameter_list:
        address_pos = parameter_list[param_name]["address"]
        if (pos == address_pos):
            return_address = param_name
            break
        
        if (pos > last_address_pos and pos < address_pos):
            return_address = "#use_previous_address#"
            break

        last_address_pos = address_pos

    return return_address

################################################################################
# Main Routine
if __name__ == '__main__':

    ### Config and file paths
    base_path = path.dirname(path.abspath(__file__))
    base_path = path.join(base_path, "..")
    config_file = open(path.join(base_path, "config", "config.json"))
    config_settings = json.load(config_file)
    element_map = config_settings["element_map"]
    element_list = list(element_map.keys())
    parameter_list = config_settings["parameters"]

    cave_letters = ['A','B','C','D','Q','E','F','G','H','R','I','J','K','L','S','M','N','O','P','T']
    BD_caves_folder = path.join(base_path, "caves_bin", CAVE_FILE_FOLDER)

    #Open bd file to write to
    output_file_name = path.join(BD_caves_folder, CAVE_FILE_FOLDER + ".bd")
    output_file = open(output_file_name, "w")

    ### Process each cave file (e.g. A, B, C) in the folder
    n = 1
    for cavefile in cave_letters:

        if path.isfile(path.join(BD_caves_folder, cavefile)) and cavefile in cave_letters:

            input_cave_file = open(path.join(BD_caves_folder, cavefile), "rb")  #Open the cave file as binary
            cave_bytes = input_cave_file.read()
            input_cave_file.close()

            #Use the BD file contents to generate caves
            print(f"Generating definition file from cave in {CAVE_FILE_FOLDER}: {cavefile} to {output_file_name}")
            generate_BD_for_cave(n, cave_bytes)
            n += 1

    output_file.close()
