SW-Tutor
========

**SW-Tutor** is a Windows application which is part of an educational project that includes a book entitled *O Jovem Programador* (The Young Programmer). It provides an integrated programming environment, with facilities to edit, execute and debug programs. It implements an interpreter of the programming language used in the book, *Lume-br*, which is a mix of Pascal and C, using words in Portuguese. The idea is: the student reads the book and practices everything using the SW-Tutor program.

Interacting with the SW-Tutor application, the student optionally can see the so called *Memory Diagram*. To facilitate the understanding of important dynamic aspects of the execution of a program, the SW-Tutor memory diagram shows the current value of variables, activation and deactivation of routines, passing of arguments, etc. In combination with the step by step execution, it is an interesting and didatic resource.

You can find more information by visiting the site [O Jovem Programador] (http://www.ojovemprogramador.com.br). It is written in Portuguese, by the way.

Building the resource file
-------

Before building SW-Tutor.exe, you need an updated version of the *sw_tutor.res* file, the Windows resource file that is linked with the application. Change the current directory to *rc* and run the resource compiler:

    $ cd rc
    $ rc /r sw_tutor.rc

The two binary files necessary to run the resource compiler (*rc.exe* and *rcdll.dll*) are preserved in the *rc* directory.

The resource compiler produces the *sw_tutor.res* file. You must copy this file to the main directory:

	$ cd ..
	$ copy rc\sw_tutor.res

After these steps, the resource file is ready to be linked to the application. Now you need to build the SW-Tutor executable.

Building SW-Tutor.exe
-------

To build SW-Tutor.exe, you will need *MSBuild*. Use Windows' search engine to find and run the *RAD Studio Command Prompt*. A command window will open, with some environment variables set appropriately, so that *MSBuild* runs smoothly.

In that command window, change the current directory (`cd`) to the working directory, and run *MSBuild* using *DSL_PORT.dproj* as argument:

    $ MSBuild DSL_PORT.dproj
	
The build must have zero errors, although some warnings may be shown.

