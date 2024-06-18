@echo off

rem Ensure Java installation is found
set JAVA_HOME=

:check_java_home
if "%JAVA_HOME%"=="" (
  setlocal enabledelayedexpansion
  for %%a in ("C:\Program Files\Java\jdk*", "C:\Program Files (x86)\Java\jdk*") do (
    if exist "%%a\bin\javac.exe" (
      set JAVA_HOME=%%a
      goto found_java
    )
  )
  echo Error: Java compiler (javac.exe) not found!
  goto exit
)

:found_java
rem Compile all .java files in src folder to build folder
javac -d build -sourcepath src *.java

if %errorlevel%==0 (
  echo Compilation successful!
) else (
  echo Compilation failed with errors.
)

:exit

endlocal