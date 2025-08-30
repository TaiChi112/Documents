#!/bin/bash

if whiptail --title "Example Dialog" --yesno "This is an example of a yes/no box." 0 0; then
    echo "User selected Yes, exit status was $?."
else
    echo "User selected No, exit status was $?."
fi