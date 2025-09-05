#!/bin/bash

# Define variables for the dialog box
HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=8
# BACKTITLE="Custom Bash Script GUI"
TITLE="Email Scheduler"
MENU="Choose an option:"

# Define menu options as an array
OPTIONS=(
    1 "Add New Email"
    2 "View All Emails"
    3 "Edit Email"
    4 "Delete Email"
    5 "Exit"
)
SELECT_CATEGORY=(
    1 "Personal"
    2 "Work"
    3 "Marketing"
    4 "Newsletters"
)

Add_New_Email(){
    EMAIL_ADDRESS=$(whiptail --inputbox "Enter Email Address" 8 39 --title "Enter Email Address" 3>&1 1>&2 2>&3)
    EMAIL_SUBJECT=$(whiptail --inputbox "Enter Email Subject" 8 39 --title "Enter Email Subject" 3>&1 1>&2 2>&3)
    EMAIL_BODY=$(whiptail --inputbox "Enter Email Body" 8 39 --title "Enter Email Body" 3>&1 1>&2 2>&3)
    SELETE_CATEGORY=$(whiptail --clear \
                  --title "SELETE CATEGORY" \
                  --menu "Select Category" \
                  $HEIGHT $WIDTH $CHOICE_HEIGHT \
                  "${SELECT_CATEGORY[@]}" \
                  2>&1 >/dev/tty)
    echo "$EMAIL_ADDRESS|$EMAIL_SUBJECT|$EMAIL_BODY|$SELECT_CATEGORY" >> file.csv
    {
    for i in {0..100..20}; do
        echo "XXX"
        echo $i
        echo "Processing file $((i/20 + 1)) of 6..."
        echo "XXX"
        sleep 1
    done
    } | whiptail --gauge "File Processing" 6 50 0

    echo "Done!"
    clear # Clear the whiptail screen after interaction
    case $CHOICE in
        1)
            whiptail --msgbox --title "Intro to Whiptail" "PERSONAL" 25 80
            ;;
        2)
            whiptail --msgbox --title "Intro to Whiptail" "WORK" 25 80
            ;;
        3)
            whiptail --msgbox --title "Intro to Whiptail" "MARKETING" 25 80
            ;;
        4)
            whiptail --msgbox --title "Intro to Whiptail" "NEWSLETTERS" 25 80
            ;;
        5)
            Exit
            ;;
        *)
            whiptail --msgbox "Invalid choice. Exiting." 8 50
            exit 1
        ;;
    esac
}
View_All_Emails(){
    whiptail --msgbox "File Management Options:\n\n- List files\n- Create directory\n- Delete file" 10 70
}
Edit_Email(){
    whiptail --msgbox "Network Tools:\n\n- Ping a host\n- Check network status" 10 70
}
Delete_Email(){
    whiptail --msgbox "Deleting an email..." 10 70
}
Exit(){
    whiptail --msgbox "Exiting the email scheduler..." 10 70
}

CHOICE=$(whiptail --clear \
                  --backtitle "$BACKTITLE" \
                  --title "$TITLE" \
                  --menu "$MENU" \
                  $HEIGHT $WIDTH $CHOICE_HEIGHT \
                  "${OPTIONS[@]}" \
                  2>&1 >/dev/tty)

clear # Clear the whiptail screen after interaction
case $CHOICE in
    1)
        Add_New_Email
        ;;
    2)
        View_All_Emails
        ;;
    3)
        Edit_Email
        ;;
    4)
        Delete_Email
        ;;
    5)
        Exit
        ;;
    *)
        whiptail --msgbox "Invalid choice. Exiting." 8 50
        exit 1
        ;;
esac

exitstatus=$?
if [ $exitstatus = 0 ]; then
echo "Email address," $EMAIL_ADDRESS $EMAIL_SUBJECT $EMAIL_BODY $CHOICE
else
echo "User canceled input."
fi

exit 0