#!/bin/bash
# SB Home Menu

QUESTION(){
  echo ""
  echo "Pressione ENTER para voltar ao MENU..."
  echo ""
  read BACK
}

while true 
do
  clear
  echo ""
  echo "  ========================================"
  echo " |            *** SB MENU ***             |"
  echo "  ========================================"
  echo " |                                        |"
  echo " | 1 - Op 01                              |"
  echo " | 2 - Op 02                              |"
  echo " | 3 - Reboot [to do]                     |"
  echo " | 3 - Exit                               |"
  echo " |________________________________________|"
  echo -ne "\n: "
  read OPERATION
  echo

  case $OPERATION in
    1)
      echo
      echo 'Option number selected 01'
      sleep 1
    ;;

    2)
      echo
      echo 'Option number selected 02'
      sleep 1
    ;;

    3) 
      echo 'To Do'
    ;;
    4)
      clear
      echo
      echo " Terminando Programa..."
      sleep 1
      clear
      break
    ;;

    *)
      echo
      echo " Opção inválida !!!"
      sleep 1
    ;;
  esac
done
