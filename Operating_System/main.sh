#!/bin/sh

echo "echo $0 $1 # file and arguments"
echo $0 $1 $2 # file and arguments

echo

echo "echo $# # number of arguments"
echo $# # number of arguments

echo

echo "echo $* # all arguments as a single word"
echo $* # all arguments as a single word

echo

echo "echo \$@ # all arguments as separate words"
echo $@ # all arguments as separate words

echo

echo "echo \$# # number of arguments"
echo $? # exit status of the last command

echo

echo "echo \$0 # name of the script"
echo $! # PID of the last background command
