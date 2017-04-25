#!/bin/sh
choice=5

while :
do
	echo "Nadeko with Auto Restart"
	echo "========================"
	echo "1. Auto Restart only"
	echo "2. Auto Restart and Update"
	echo "3. Exit"
	echo "------------------------"
	echo -n "Choose menu option: "
	read choice

	case $choice in
		[12])
			while :
			do
				if [ $choice -eq 2 ]
				then
					echo "Updating NadekoBot, please wait."
					export BRANCH=dev
					curl -L https://github.com/rreminy/NadekoBot-BashScript/raw/master/nadeko_installer.sh | sh
					echo "NadekoBot updated."
				fi
				curl -L https://github.com/rreminy/NadekoBot-BashScript/raw/master/nadeko_run.sh | sh
				echo "Sleeping 5 seconds"
				sleep 5
			done
			;;
		[3xX])
			echo "Returning to main menu"
			break
			;;
		*)
			;;
	esac
done

exit 0