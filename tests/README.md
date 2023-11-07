# About

This directory about testing the program or part of it using testsuits


## Rules:

- All the test files should be inside
- unittest module is used in the test files
- All the test files are python files (extension: .py)
- All the test files and folders starts by test_
- The file organization in the tests folder is the same as the project
	- e.g., For `models/base_model.py`, unit tests must be in: `tests/test_models/test_base_model.py`
	- e.g., For `models/user.py`, unit tests must be in: `tests/test_models/test_user.py`
- All the tests are executed by using this command: `python3 -m unittest discover tests`
- You can also test file by file by using this command: `python3 -m unittest tests/test_models/test_base_model.py`
- All your modules should have a documentation `(python3 -c 'print(__import__("my_module").__doc__)')`
- All your classes should have a documentation `(python3 -c 'print(__import__("my_module").MyClass.__doc__)')`
- All your functions (inside and outside a class) should have a documentation `(python3 -c 'print(__import__("my_module").my_function.__doc__)' and python3 -c 'print(__import__("my_module").MyClass.my_function.__doc__)')`
