#!/bin/bash
# You must set the value of MyNewClass for this to work

export LC_CTYPE="C"
export MyNewClass=""
grep -rlZ 'HelloWorld' . | tr \\n \\0 | xargs -0 sed -i '' -e "s/HelloWorld/$MyNewClass/g"
