@echo off

rem Define the folder paths (modify if needed)
set SRC_FOLDER=src
set BUILD_FOLDER=build

rem Create the "build" folder (if it doesn't exist)
if not exist "%BUILD_FOLDER%" md "%BUILD_FOLDER%"

rem Loop through all assembly files in "src" folder
for %%f in ("%SRC_FOLDER%\*.asm") do (
  rem Extract filename without extension
  set FILENAME=%%~nf
  
  rem Assemble the file
  nasm -f elf64 "%%f" -o "%BUILD_FOLDER%\%%~nf.obj"

  if errorlevel 1 (
    echo An error occurred during assembly of "%%f".
    exit /b 1
  )
)

echo Assembly successful!

pause