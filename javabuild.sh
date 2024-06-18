#!/bin/bash

# Ensure Java installation is found
JAVA_HOME=

# Function to check for Java installation
check_java_home() {
  for java_dir in "/usr/lib/jvm/java-*/bin" "/usr/local/java/jdk*/bin"; do
    if [[ -f "$java_dir/javac" ]]; then
      JAVA_HOME=$(dirname "$java_dir")
      return 0  # Exit function with success (0)
    fi
  done
  echo "Error: Java compiler (javac) not found!"
  return 1  # Exit function with error (1)
}

# Check for Java and exit if not found
check_java_home || exit 1

# Compile all .java files in src folder to build folder
javac -d build -sourcepath src *.java

# Check compilation exit code and display message
if [[ $? -eq 0 ]]; then
  echo "Compilation successful!"
else
  echo "Compilation failed with errors."
fi