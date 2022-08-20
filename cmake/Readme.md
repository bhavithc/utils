## How do I know what are all the variables set in other projects 

There are two way we can do
1. Those variables are obtained via find_package(XXXX) calls
You can find the info in two different places 
 - `FindXXX.cmake` script -> shipped with CMake or contained in the project which uses it
 - `XXXConfig.cmake` script -> Shipped with library 

2. Other way is read `VARIABLES` propery using `get_directory_property` function 

Example:
```makefile
    cmake_minimum_required(VERSION 3.2)
    project(FindPackageVars)

    get_directory_property(_vars_before VARIABLES)
    find_package(OpenGL)
    get_directory_property(_vars VARIABLES)

    list(REMOVE_ITEM _vars _vars_before ${_vars_before})
    foreach(_var IN LISTS _vars)
        message(STATUS "${_var} = ${${_var}}")
    endforeach()
```

Refer: https://stackoverflow.com/questions/42741501/how-to-know-library-variable-names-for-cmakelists#:~:text=Under%20Writing%20find%20modules%20you,the%20name%20of%20the%20variable.
