#!/bin/sh
root=$(pwd)

nadeko_run()
{
	cd "$root/NadekoBot"
	dotnet restore
	dotnet build --configuration Release
	
	echo "Running NadekoBot..."
	cd "$root/NadekoBot/src/NadekoBot"
	dotnet run --configuration Release
	echo "Done"
	cd -
}

nadeko_installer()
{
	echo "Downloading NadekoBot $1 branch..."
	rm -f ./nadeko_installer.sh && wget https://github.com/rreminy/NadekoBot-BashScript/raw/master/nadeko_installer.sh && chmod 755 nadeko_installer.sh && ./nadeko_installer.sh $1
	echo "Done"
}

nadeko_autorestart()
{
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
						nadeko_installer 1.4
					fi
					nadeko_run
					echo "Sleeping 5 seconds..."
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
}

nadeko_prerequisites()
{
	echo "Downloading NadekoBot prerequisites..."
	rm -f ./nadeko_prerequisites.sh wget https://github.com/rreminy/NadekoBot-BashScript/raw/master/nadeko_prerequisites.sh && chmod 755 nadeko_prerequisites.sh && ./nadeko_prerequisites.sh
	echo "Done"
}


echo "Welcome to NadekoBot."

while :
do
	# Menu options
	echo "====================="
	echo "DreamBot Menu Options"
	echo "====================="
	echo "1: Download & Install / Update NadekoBot"
	echo "2: Run Nadeko (Normally)"
	echo "3: Run Nadeko with Auto Restart (Run Nadeko normally before using this.)"
	echo "4: Auto-Install Prerequisites (For Ubuntu, Debian and CentOS)"
	echo "5: Set up credentials.json (If you have downloaded NadekoBot already.)"
	echo "6: Exit"
	echo "---------------------"
	echo -n "Choose menu option: "
	read choice
	echo ""
	
	case $choice in
		1)
			nadeko_installer 1.4
			;;
		2)
			nadeko_run
			;;
		3)
			nadeko_autorestart
			;;
		4)
			nadeko_prerequisites
			;;
		5)
			echo "Okay, let's begin creating a new credentials.json file."
			echo "Please read JSON Explanations in the guide..."
			while :
			do
				echo -n "Are you ready to continue? (Y/N): "
				read yn
				case $yn in
					[Yy])
						rm -f "NadekoBot/src/NadekoBot/credentials.json.old"
						mv "NadekoBot/src/NadekoBot/credentials.json" "NadekoBot/src/NadekoBot/credentials.json.old"

						echo -n "Please enter your bot client ID: "
						read clientid
						echo "Alright saved \'$clientid\' as your client ID."
						echo ""

						echo -n "Please enter your bot ID \(should be same as your client ID\): "
						read botid
						echo "Alright saved \'$botid\' as your Bot ID."
						echo ""

						echo -n "Please enter your bot token \(It is not bot secret, it should be ~59 characters long.\): "
						read token
						echo "Alright saved \'$token\' as your bot\'s token."
						echo ""

						echo -n "Please enter your own ID \(Refer to the guide, it will be bot\'s owner ID.\): "
						read ownerid
						echo "Alright saved \'$ownerid\' as owner\'s ID."
						echo ""

						echo -n "Please enter Google API key \(Refer to the guide.\): "
						read googleapi
						echo "Alright saved \'$googleapi\' as your bot\'s Google API Key."
						echo ""

						echo -n "Please enter LoL API Key or Just Press [Enter Key] to skip. \(optional\) \(Refer to the JSON Explanations guide.\): "
						read lolapikey
						echo "Alright saved \'$lolapikey\'"
						echo ""

						echo -n "Please enter Mashape Key or Just Press [Enter Key] to skip. \(optional\) \(Refer to the JSON Explanations guide.\): "
						read mashapekey
						echo "Alright saved \'$mashapekey\'"
						echo ""

						echo -n "Please enter Osu API Key or Just Press [Enter Key] to skip. \(optional\) \(Refer to the JSON Explanations guide.\): "
						read osu
						echo "Alright saved \'$osu\'"
						echo ""

						echo -n "Please enter SoundCloud Client Id or Just Press [Enter Key] to skip. \(optional\) \(Refer to the JSON Explanations guide.\): "
						read scid
						echo "Alright saved \'$scid\'"
						echo ""

						echo "Resulting credentials.json file"
						echo "==============================="
						(
							echo "{"
							echo "  \"ClientId\": $clientid,"
							echo "  \"BotId\": $botid,"
							echo "  \"Token\": \"$token\","
							echo "  \"OwnerIds\": ["
							echo "    $ownerid"
							echo "  ],"
							echo "  \"LoLApiKey\": \"$lolapikey\","
							echo "  \"GoogleApiKey\": \"$googleapi\","
							echo "  \"MashapeKey\": \"$mashapekey\","
							echo "  \"OsuApiKey\": \"$osu\","
							echo "  \"SoundCloudClientId\": \"$scid\","
							echo "  \"Db\": null,"
							echo "  \"TotalShards\": 1"
							echo "}"
						) | tee NadekoBot/src/NadekoBot/credentials.json
						echo "-------------------------------"
						echo "Saved to: NadekoBot/src/NadekoBot/credentials.json"
						echo "Credentials setup completed."
						;;
					[Nn])
						echo "Cancelled."
						break
						;;
					*)
						echo "Please answer \"Y\" or \"N\""
						;;
				esac
			done
			;;
		[6xX])
			echo "Exiting."
			break
			;;
		*)
			echo "Invalid menu option"
			;;
	esac
	echo ""
done

exit 0