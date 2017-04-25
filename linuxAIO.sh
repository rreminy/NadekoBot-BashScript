#!/bin/sh
echo "Welcome to NadekoBot."

while true
do
	# Menu options
	echo "====================="
	echo "DreamBot Menu Options"
	echo "====================="
	echo "1: Download Dev Build (Latest)"
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
			echo "Downloading NadekoBot, please wait."
			export BRANCH=dev
			curl -L https://github.com/rreminy/NadekoBot-BashScript/raw/master/nadeko_installer.sh | sh
			echo "NadekoBot Latest Build downloaded."
			;;
		2)
			echo "Running Nadeko Normally, if you are running this to check Nadeko, use .die command on discord to stop Nadeko."
			curl -L https://github.com/rreminy/NadekoBot-BashScript/raw/master/nadeko_run.sh | sh
			echo "Welcome back to NadekoBot."
			;;
		3)
			echo "Running Nadeko with Auto Restart you will have to close the session to stop the auto restart."
			curl -L https://github.com/rreminy/NadekoBot-BashScript/raw/master/NadekoAutoRestartAndUpdate.sh | sh
			echo "Welcome back to NadekoBot."
			;;
		4)
			echo "Getting the Auto-Installer for Debian/Ubuntu"
			curl -L https://github.com/rreminy/NadekoBot-BashScript/raw/master/nadekoautoinstaller.sh | sh
			echo "Welcome back..."
			;;
		5)
			echo "Okay, let's begin creating a new credentials.json file."
			echo "Please read JSON Explanations in the guide..."
			while true
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
		6)
			echo "Exiting."
			break
			;;
		*)
			echo "Invalid menu option"
			;;
	esac
	echo ""
done