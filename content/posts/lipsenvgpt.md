---
title: "Setting up my Lisp environment with ChatGPT"
date: 2023-08-08T15:32:23-05:00
draft: true
---

Recently, I decided to work through *The Structure and Interpretation of Computer Programs*, by Harold Abelson, Gerald Jay Sussman and Julie Sussman.

This is a classic computer science text book beloved for its ability to teach one to _think differently_ about the programs one writes. Or rather about programming in general.

For teaching programming concepts the authors chose Lisp. In their words, "the language possess unqique features that make it an excellent medium for studying important programming constructs and datastructures and for relating them to the linguistic features that support them."

There is a new Javascript edition of the book but I nevertheless desire to work through SICP with Lisp.

However, I had some issues getting my Lisp environment set up.

I got one installation working, but it was a different dialect of Lisp than the one used in the book (they use a dialect of Lisp called Scheme), and it did not have some of the libraries and syntax used in the book.

I turned to ChatGPT to see if it could help me set up my environment.

Below is the "conversation" and I will end this post with that conversation and note that the suggestions worked like a charm and I am now working my way through the book. So, if you would like to read SICP and set up a Lisp environment, you may try the following.

---

**ME:** how can I set up a local dev environment to start writing and executing Scheme Lisp programs?

---

**GPT:** Setting up a local development environment to write and execute Scheme Lisp programs is a straightforward process. Here's a step-by-step guide to get you started:

**Install a Scheme implementation:**
There are various Scheme implementations available. One popular option is Racket, which is user-friendly and comes with a comprehensive development environment. You can download Racket from its official website: https://racket-lang.org/

**Install a Text Editor or IDE:**
Choose a text editor or integrated development environment (IDE) to write your Scheme code. Some popular choices include Visual Studio Code with the "Calva" extension, Emacs with "Geiser," or DrRacket, which comes bundled with the Racket installation.

**Install Racket language support for your editor (optional):**
If you decide to use a text editor like Visual Studio Code or Emacs, you may want to install language support extensions or packages. For example, "Calva" for Visual Studio Code or "Geiser" for Emacs.

**Verify Racket installation:**
After installing Racket, open your terminal or command prompt and type racket. This should start the Racket REPL (Read-Eval-Print Loop) where you can interactively write and execute Scheme code. Exit the REPL by typing (exit) or pressing Ctrl+D.

**Set up PATH environment variable (optional):**
To make it easier to run Racket from any directory, you can add the Racket bin folder to your PATH environment variable. For example, on Linux/macOS, you can add the following line to your shell configuration file (e.g., `~/.bashrc`, `~/.bash_profile`, or `~/.zshrc`):

`export PATH="$PATH:/path/to/racket/bin"`

On Windows, you can add the Racket bin folder to your system's `PATH` environment variable through the Control Panel.

**Create a project directory:**
Create a new folder for your Scheme projects. You can organize your code within this directory as needed.

**Write and run a Scheme program:**
Open your text editor or IDE, create a new file with a .rkt extension (e.g., hello.rkt), and write a simple Scheme program, such as:

```scheme
; hello.rkt
(displayln "Hello, world!")

```

Save the file in your project directory.

**Execute the Scheme program:**
Open your terminal or command prompt, navigate to the project directory using the `cd` command, and then run the program using Racket:

`racket hello.rkt`

You should see the output "Hello, world!" displayed in the terminal.

Congratulations! You now have a local development environment set up for writing and executing Scheme Lisp programs. You can continue to write more complex programs, create new files, and use the Racket REPL for interactive development. Happy coding!

---

**ME:** how can I just download Racket without the IDE?

---

**GPT:** If you want to download Racket without the full IDE, you can opt for the "Minimal Racket" installation, which includes only the core Racket language and libraries without any additional GUI-based tools. Here's how you can do it:

**Visit the Racket Downloads page:**
Go to the official Racket website's Downloads page: https://download.racket-lang.org/

**Choose the appropriate version:**
Select the appropriate version of Racket for your operating system (Windows, macOS, or Linux). Make sure to choose "Minimal Racket" instead of the regular installation.

**Download and install:**
Download the Minimal Racket installer for your operating system and run the installer. Follow the installation wizard's instructions to complete the installation.

**Verify Racket installation:**
After the installation is complete, open your terminal or command prompt and type racket. This should start the Racket REPL (Read-Eval-Print Loop), indicating that Racket is successfully installed.

**Set up PATH environment variable (optional):**
As mentioned earlier, you may want to add the Racket bin folder to your `PATH` environment variable to run Racket from any directory. Follow the same steps described in Step 5 of the previous answer.

With Minimal Racket installed, you'll have access to the core Scheme language and standard libraries, allowing you to write and run Scheme programs from the command line without the additional IDE components. You can use your preferred text editor to write Scheme code, and then execute it through the terminal using the racket command.

---

**ME:** everything seems to be working okay, but when I try to execute the hello.rkt file, I get the following error:

> default-load-handler: expected a `module' declaration, but found
> something else
>
> file: /Users/nathanclassen/Schemes/hello-world/hello.rkt

**GPT:** The error message you encountered indicates that the `hello.rkt` file contains code that Racket does not recognize as a module declaration. By default, Racket expects the entry point of a Racket program to be defined within a module.

To fix this issue, you have a couple of options:

**Option 1:** Use `#lang` declaration (recommended)

At the beginning of your hello.rkt file, add the #lang racket declaration to specify that this file uses the Racket language.

```scheme
#lang racket
(displayln "Hello, world!")
```

With the `#lang` racket declaration, Racket recognizes the file as a Racket module, and you can execute it using the racket command as previously shown.

**Option 2:** Use a module declaration

If you prefer to use a module explicitly, you can modify your `hello.rkt` file like this:

```scheme
#lang racket

(module hello-module racket
(provide main)

(define (main)
(displayln "Hello, world!")))
```

The above code creates a module named hello-module that exports a function main. The main function displays "Hello, world!" when executed. To run this program, you need to use the racket command in combination with the `-e` flag to invoke the main function from the module:

`racket -e '(require "hello.rkt") (hello-module)'`

Option 1 is recommended for simple scripts and quick experimentation, as it's more straightforward and doesn't require additional flags when executing. Option 2 is useful when you want to organize your code into modules for more complex projects.

Choose the option that suits your needs and run your `hello.rkt` file accordingly.
