#!/bin/sh

echo "NadekoBot 1.0"
echo "Mirai was here."

cd NadekoBot/src/NadekoBot
echo "Running NadekoBot. Please wait."
dotnet run --configuration Release
echo "Done"

exit 0
