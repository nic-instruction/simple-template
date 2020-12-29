# Easy Setup for GitHub Classrooms

   * This setup does not require gradle or maven, which are fun but can be confusing for intro students
   * This setup switches the java version to 12 using hooks in the autograding feature
   * This setup does not create a package, it just compiles and tests a class (teachers: please edit the tests to match your specific class names or use the commands below)
   * This setup uses autograding to compile & run a class, it tests that the class ran sucessfully, then performs an i/o matching test
   
   
   Contents:
   
   `my_bash_script.sh` and `.replit` -- These are the files that let us get around having to use the heavy duty package tools.  Basically, repl.it is an online IDE and the `.replit` file was designed to help with compatability with that program.  It runs a bash script that compiles and runs your class.  Note that you will have to modify the bash script for each new class.  More info here: https://repl.it/talk/ask/Documentation-for-using-Replit-with-GitHub-classroom-and-Java/40767

`HelloWorld.java` is the example class in this repo

`.github/classroom/autograding.json` contains the hook that sets up java version 12, a test to make sure we're using version 12, a 'does this run' test and an i/o test.

`.github/workflows/classroom.yml` Just defines the GitHub workflow (what steps are run during autograding)

Since you have to include the name of your new class in a bunch of places, make your life easier by cloning this repo, pulling it to the command line, going to the root of the clone and running these two commands:

```
MyNewClass=""     # put the name of your new class between the quotes.
grep -rlZ 'HelloWorld' . | xargs -0 sed -i "s/HelloWorld/$MyNewClass/g" # Finds every file containing HelloWorld and changes HelloWorld to the value of $MyNewClass
mv HelloWorld.java $MyNewClass.java                                     # Moves HelloWorld.java to $MyNewClass.java, note you'll need to alter the contents
```
Note: for macOS you can use ` grep -rlZ 'HelloWorld' . | tr \\n \\0 | xargs -0 sed -i '' -e "s/HelloWorld/$MyNewClass/g"`

It will replace every instance of HelloWorld in your repo files with the new class name you put into the `$MyNewClass` variable and then move the class code to `MyNewClass.java` so that you can set up new code for your students.  

I'm mostly just doing this for myself and my colleagues, but if I don't know you and you find this setup useful, please feel free to follow this repo or give me a mention!
