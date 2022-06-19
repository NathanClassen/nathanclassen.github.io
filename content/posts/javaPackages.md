---
title: "java packages "
date: 2022-06-14T17:03:01-06:00
draft: true
---

# Java Packages without an IDE

> “If you give a man a fish he will eat for a day. If you teach a man how to create Java packages, compile them, and import them into separate projects without using a big fancy IDE… he will be as happy as a clam”
– Confucius 

In my years programming in Java I have created and worked on containerized, scalable, available, reliable, insatiable applications that handle infinite requests every nano-second of the day...

yet this I lacked: a few basics surrounding Java packages, and how to create new ones without relying on something like IntelliJ or VSCode.

I wanted to be able to create a new project from scratch without having to rely on my IDE to generate project stucture for me, but I wasn't sure how to do it?

I had surely done this many times when first learning Java. After my fancy IDE however... I had waxed fat and smooth.

I found this to be a very irksome thought both times that I thought about it, and so I created this challenge and set out on an arduous 30 minute journey to get to the bottom of this.

If I could not accomplish this–this one simple task–then I would close my laptop, never to write another program again, until the next day when I would forget my pitiful failure and go on using IntelliJ like the “can’t create a Java program without his IDE" man that I would have proven myself to be

## challenge

create and run a small Java application from scratch using only `cd`, `mkdir`, `touch` and `nano`. The program should consist of a `main` file which should be located in some directory, and it should import a `utils` class, stored in a package somewhere else. And it should work. It should not yell at me about symbols or any of that nonsense!

### two directories, for two packages

I knew that I would want two packages, one for the main code and another to put the package-to-be-imported in. So I created two directories, each containing a single **.java** file
```
nathanclassen@ Desktop % mkdir myProgram
nathanclassen@ Desktop % mkdir myUtils
nathanclassen@ Desktop % touch myProgram/main.java
nathanclassen@ Desktop % touch myUtils/greetings.java
```
#### no package? no problem
In order to create a package, one must include a `package` statement as the first line in the Java file to be packaged. And files of `somePackageName` must be situated within a directory of `somePackageName`. Check.

Something I was not consciously aware of was that omitting a package statement in a source file relagates the classes in such a file, devoid of that coveted `package` statement as it is, to a life of shame and misery in the default package.

For the purpose of my little challenge I did not need the main code to specify a package. It's the default package life for `myProgram/main`

### `naNO` IDE, just like a real hacker
Moving along I `nano`'d  into the `main` file and wrote:

```
import myUtils.greetings;

public class Main {
	public static void main(String[] args) {
		System.out.println("hello world");
		greetings.hello();
	}
}
```

With the `import` locked and loaded, ready to import the `greetings.class` and it was time to fill out the `myUtils` package with a `greetings` class

`nano myUtils/greetings.java`!
```
package myUtils;

public class greetings {
	public static void hello() {
		System.out.println("greetings to you. Yes, hello");
	}
}
```
### failing... errors... symbol!

with everything in place, it was time to run my program
```
nathanclassen@ Desktop % cd myProgram
nathanclassen@ myProgram % java main.java
main.java:1: error: package myUtils does not exist
import myUtils.greetings;
              ^
main.java:6: error: cannot find symbol
		greetings.hello();
		^
  symbol:   variable greetings
  location: class Main
2 errors
error: compilation failed
```
no dice

ah! compile the `myUtils.greetings` class and re-run
```
nathanclassen@ myProgram % javac ../myUtils/greetings.java
nathanclassen@ myProgram % java main.java
main.java:1: error: package myUtils does not exist
import myUtils.greetings;
              ^
main.java:6: error: cannot find symbol
		greetings.hello();
		^
  symbol:   variable greetings
  location: class Main
2 errors
error: compilation failed
```
Still a no go

Java did not know where to find `myUtils` package one way or the other

It is time to look again to the guilded pages of _Java - The Complete Reference Edition, 11 Edition_ 

Basically, Java will look for packages by either:
	1. looking in the working directory, and seeing if it can find the package as a sub-directory
	2. using the `CLASSPATH` environment variable to find paths in which it should look for packages
	3. using the `-classpath` (or `-cp`) option passed to `java` and/or `javac` to specify where to find packages

Since I had `cd`'d into `myProgram` the `myUtils` package was no longer going to be found by Java, not being a sub-directory of `myProgram`

I could easily solve this problem by either `cd`'ing back into Desktop, as Java would then be able to find the `myUtils` directory, OR use the `-classpath` option to specify the location that Java should search for `myUtils`

```
nathanclassen@ myProgram % java -classpath /Users/nathanclassen/Desktop main.java 
hello world
greetings to you. Yes, hello
nathanclassen@ myProgram %
```

Boom.

And that is the story of how I decided to uninstall IntelliJ and create my own IDE.

It's a combo. Finder + TextEdit + Terminal

the end
