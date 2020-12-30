#!/bin/bash
# You must set the value of MyNewClass & MyNewName for this to work
# You must be in the root of your new repository for this to work.

export LC_CTYPE="C"
export MyNewClass=""  # Example: CaloriesBurned
export MyNewName=""   # Example Calories Burned

grep -rlZ 'HelloWorld' . | tr \\n \\0 | xargs -0 sed -i '' -e "s/HelloWorld/$MyNewClass/g"
mv HelloWorld.java $MyNewClass.java
grep -rlZ 'Hello World' . | tr \\n \\0 | xargs -0 sed -i '' -e "s/Hello World/$MyNewName/g"

rm -f .git/index
git reset
