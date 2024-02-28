#!/bin/bash

# Download insert_dylib
echo "Downloading insert_dylib 🛠️"
curl -LO "https://github.com/retguard/legendary-couscous/raw/main/insert_dylib"

# Make insert_dylib executable
chmod +x insert_dylib

# Insert libHydrogen.dylib into Roblox
echo "Inserting libHydrogen.dylib into Roblox 🩹"
./insert_dylib "/path/to/libHydrogen.dylib" "/path/to/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig

echo "Insertion complete! 🎉"
