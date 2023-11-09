#!/usr/bin/env bash

# The script should be in a directory which is in the root directory of the repo
# This script generated with the help of AI

set -e

# Check if a file is provided as an argument
if [ "$#" -le 0 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

FILEDIR="$(pwd)"
SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOTDIR="$(cd "${SCRIPTDIR}/.." && pwd)"

for FILE in "$@"
do
    FILEPATH="$FILEDIR/$FILE"
    PathFromRepoRoot=$(sed "s|$ROOTDIR||" <<< "${FILEPATH}")
    TestPathFromRepoRoot=$(echo "tests$PathFromRepoRoot" | sed 's/\//\/test_/g')
    TESTPATH="$ROOTDIR/$TestPathFromRepoRoot"

    # Check the shebang:
    SHEBANGE="#!/usr/bin/python3"
    echo "The shebange to check is $SHEBANGE"
    echo "Checking shebange..."
    
    FIRST_LINE=$(head -n 1 "$FILE")
    
    if [ "$FIRST_LINE" == "$SHEBANGE" ]; then
    	echo "Shebang is the same"
    else
    	echo "Shebang is not the same"
    fi
    echo -e "\n============================================\n"

    # Checking pycodestyle
    echo "Cheching pycodestyle $FILE"
    pycodestyle "$FILEPATH"
    echo -e "\n============================================\n"

    # Checking if there is a test file
    echo "Checking if there is a test file..."
    echo "$TESTPATH"
    if [ -f "$TESTPATH" ]; then
        echo "Test file is found"
    else
        echo "Test file not found"
    fi
    echo -e "\n============================================\n"


    MODULE="$(basename $FILE .py)"
    # Check module documentation
    echo "Checking the module documentation"

    module_doc=$(python3 -c "import $MODULE; print($MODULE.__doc__)")
    if [[ -z $module_doc ]]; then
        echo "Module documentation missing: $MODULE"
    else
        echo "The documentation found:"
        echo "$module_doc"
    fi
    echo -e "\n============================================\n"

done
exit 1
<<notWorking
    # Check class documentation
    echo "Checking the classes documentation"

    class_list=$(python3 -c "import $MODULE; print([name for name, obj in vars($MODULE).items() if isinstance(obj, type)])")
    while IFS= read -r class_name; do
        class_doc=$(python3 -c "import $MODULE; print($MODULE.$class_name.__doc__)")
        if [[ -z $class_doc ]]; then
            echo "Class documentation missing: $MODULE.$class_name"
        else
            echo "The documentation found:"
            echo "$class_doc"
        fi
    done <<< "$class_list"

    echo -e "\n============================================\n"


    # Check function documentation
    function_list=$(python3 -c "import $MODULE; print([name for name, obj in vars($MODULE).items() if callable(obj)])")
    while IFS= read -r function_name; do
        function_doc=$(python3 -c "import $MODULE; print($MODULE.__dict__['$function_name'].__doc__)")
        if [[ -z $function_doc ]]; then
            echo "Function documentation missing: $MODULE.$function_name"
        fi
    done <<< "$function_list"
notWorking
