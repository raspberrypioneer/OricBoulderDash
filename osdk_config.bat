@ECHO OFF

::
:: Set the build paremeters
::
SET OSDKADDR=$600
SET OSDKNAME=BDASH
SET OSDKTAPNAME=BDASH
SET OSDKLINK=-B

:: Use single row keyboard (arrow keys, space, <, > and left shift)
SET OSDKFILE=main single_row_keyboard vars spr cavedata
:: *** OR ***
:: Use full matrix keyboard
:: Currently the same keys as the single row keyboard are checkedin the game, but it allows extension to use other keys in future
::SET OSDKFILE=main full_matrix_keyboard vars spr cavedata
