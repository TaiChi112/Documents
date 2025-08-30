#!/bin/bash
username="$(whiptail --inputbox "What is your username?" 10 30 "$USER" 3>&1 1>&2 2>&3)"
printf "Your username is : %s\n" "${username}"