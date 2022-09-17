## Instructions


Use 'translate.sh' to translate 'kitty_ipsum_1.txt' and 'kitty_ipsum_2.txt' into their doggy counterparts. Use the commands inside of 'kitty_info.txt' to gather additional information about the text files.

Translate into doggy: 
`$ ./translate.sh kitty_ipsum_1.txt >> doggy_ipsum_1.txt`

Search for words starting with 'dog' to make sure they're there: 
`$ ./translate.sh kitty_ipsum_1.txt | grep --color 'dog[a-z]*'`

Search for words starting with 'cat' to make sure they're gone: 
`$ ./translate.sh kitty_ipsum_1.txt | grep --color 'cat[a-z]*'`

Search for words starting with 'dog' or 'woof': 
`$ ./translate.sh kitty_ipsum_1.txt | grep -E --color 'dog[a-z]*|woof[a-z]*'`

Search for words starting with 'cat' or 'meow': 
`$ ./translate.sh kitty_ipsum_1.txt | grep --color -E 'cat[a-z]*|meow[a-z]*'`

Compare the 2 files: 
`$ diff --color kitty_ipsum_1.txt doggy_ipsum_1.txt`

3 different ways to set stdin for ./translate.sh (arg1 is the string to translate):
`$ ./translate.sh kitty_ipsum_1.txt`
`$ ./translate.sh < kitty_ipsum_1.txt`
`$ cat kitty_ipsum_1.txt | ./translate.sh`
