#!/bin/sh

echo "echo $0 $1 # file and arguments"
echo $0 $1 # file and arguments

echo

echo "echo $1 $2 $3 # arguments only"
echo $1 $2 $3 # arguments only

echo

echo "echo $# # number of arguments"
echo $# # number of arguments

echo

echo "echo $* # all arguments as a single word"
echo $* # all arguments as a single word

echo

echo "echo \"$*\" # all arguments as a single word, quoted"
echo "$*" # all arguments as a single word, quoted

echo

echo "echo \$@ # all arguments as separate words"
echo $@ # all arguments as separate words

echo

echo "echo \"\$@\" # all arguments as separate words, quoted"
echo "$@" # all arguments as separate words, quoted

echo

echo "echo \$# # number of arguments"
echo $? # exit status of the last command

echo

echo "echo \$- # current options set for the shell"
echo $- # current options set for the shell

echo

echo "echo \$0 # name of the script"
echo $!# PID of the last background command