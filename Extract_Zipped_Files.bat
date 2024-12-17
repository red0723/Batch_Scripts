@echo off
:: Change to the directory where the batch file is located
cd /d %~dp0

:: Check if the destination directory exists, if not, create it
if not exist "C:\Extracted_Files\" (
    mkdir "C:\Extracted_Files"
)

:: Extract all zip files to the C:\ directory
for %%f in (*.zip) do (
    powershell -Command "Expand-Archive -Path '%%f' -DestinationPath 'C:\Extracted_Files'"
    powershell -Command "del '%%f'"
)

:: Delete all files and subdirectories in the current directory except the batch file


:: Display a message for 3 seconds
echo Extraction completed. The files have been extracted to C:\Extracted_Files.
timeout /t 10 /nobreak > nul

:: Optional: Clear the screen after the timeout
cls