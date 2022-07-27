---
title: "LinuxRecipes"
date: 2022-07-27T13:23:49-06:00
draft: true
---

As I learn and encounter helpful cmmd line tools I am going to document them here

---
## write output to stdout _AND_ save to a file


Copying output to a file is very handy and straightforward:

`<some_output_producing_cmmd> > <a_file_to_write_to>`

Output will be written to the file, but it will not be displayed in the command line.

To display output to the command line _and_ write to a file, we can pipe the standard use the `tee` tool.

`<some_output_producing_cmmd> | tee <a_file_to_write_to>`

The manual reveals that "the `tee` utility copies standard input to standard output, making a copy in zero or more files."

So with the command above, we pipe the output of the command to `tee`, `tee` copies it to standard input _and_ makes a copy in the given file.

**tip**: `tee` will overwrite the contents of the provided file. To append the output, similar to `>>`, use the `-a` flag to append the output to the file(s) rather than overwriting.
___

