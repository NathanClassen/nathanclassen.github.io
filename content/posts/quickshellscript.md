---
title: "quick shell script"
date: 2022-06-18T17:34:59-06:00
draft: false
---

Though I am sure most IDEs come packaged with a command to open a desired file or directory within the IDE, I find that creating a quick script to accomplish this task is less taxing than searching for the native IDE command.

After all, one can already specify which applicaiton to use for opening a file via `open`, by passing in the `-a` option. So writing the tool in question can really be accomplished in a matter of seconds (depending on how quickly one can type I suppose), and then all that's left is to set it up for use anywhere on ones machine.

This post documents the very basic process that I use to create such classes of programs, all from the terminal.

## write the program

Create a file and give it the same name you would like to invoke in order to use it. Below is my code for a command which opens a file or project with IntelliJ Community Edition:

#### create the file:
- `$ touch tellj`

#### write the script:
`nano` into `tellj` and:

- `#!/bin/bash`
- `# open file with IntelliJ IDE`
- `open -a IntelliJ\ IDEA\ CE.app $1`



## set permissions

Next set the proper permissions on the file to allow it to be executed:

- `$ chmod 755 tellj` will allow the file owner to read, modify, and execute the file as a command; all users may read and execute the file as a command
- `$ chmod 555 tellj` will allow all users to read and execute the command, but none may change it

## put it in the PATH

The `tellj` file is now an executable file, and may be used by referencing the file itself:

`./tellj some_file`

Currently, one would have to a complete relative path to the `tellj` file in order to execute it. A complete path would also have to be used to pass in the argument for the file to be opened.

The `tellj` command should be executable from whatever location in the file system. Therefore, the executable `tellj` file should be moved into a location which falls in the PATH:

`$ mv tellj some/location/in/PATH`

## execute

`$ tellj my/project`

<br>
The end.
