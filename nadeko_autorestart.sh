#!/bin/sh

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

cd NadekoBot/src/NadekoBot
while (true)
do
	echo "Running NadekoBot with auto restart."
	dotnet run -c Release;
	echo "Sleeping 5 seconds..."
	sleep 5s;
done
echo "Done"

exit 0
