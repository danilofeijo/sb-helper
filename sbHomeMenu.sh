#!/bin/bash
# SB Home Menu

source ~/labspace/sb-helper/sbFunctions.sh

QUESTION(){
  echo
  echo " Press ENTER and go back to SB MENU..."
  echo
  read -r BACK
}

while true 
do
  clear
  echo
  echo "  ======================================== "
  echo " |            *** SB MENU ***             |"
  echo "  ======================================== "
  echo " |                                        |"
  echo " | 1 - Hello World                        |"
  echo " | 2 - Setup                              |"
  echo " |________________________________________|"
  echo " |                                        |"
  echo " | 3 - Reboot                             |"
  echo " | 4 - Exit                               |"
  echo " |________________________________________|"
  echo
  echo -ne " Choose an option: "
  read -r OPTION
  echo
  echo

  case $OPTION in
    1) while true; do
      helloWorld
      sleep 1

      QUESTION
      if [ -z "$BACK" ]; then
        break
      fi
    done
    ;;

    2) while true; do
      echo " You chosen the Setup option"
      sleep 1

      QUESTION
      if [ -z "$BACK" ]; then
        break
      fi
    done
    ;;

    3)
      echo " Rebooting..."
      sleep 2
      shutdown -r now
      clear
      break
    ;;

    4)
      clear
      echo " Closing SB MENU..."
      sleep 1
      clear
      break
    ;;

    *)
      echo " Invalid option !!!"
      sleep 1
    ;;

  esac
done
