@echo off
:: Change to the directory where the batch file is located
cd /d %~dp0
set "MY_EXTRACTEDPATH=C:\Extracted_Files"

:: Check if the destination directory exists, if 0not, create it
if not exist "%MY_EXTRACTEDPATH%" (
    mkdir "%MY_EXTRACTEDPATH%"
)

:: Extract all zip files to the C:\ directory
for %%f in (*.zip) do (
    powershell -Command "Expand-Archive -Path '%%f' -DestinationPath '%MY_EXTRACTEDPATH%'"
    powershell -Command "del '%%f'"
)

:: Display a message for 3 seconds
echo Extraction completed. The files have been extracted to %MY_EXTRACTEDPATH%.
timeout /t 5 /nobreak > nul

:: Optional: Clear the screen after the timeout
cls