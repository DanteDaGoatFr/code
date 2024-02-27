#!/bin/zsh

download() {
    echo -e "Downloading the Latest Roblox 💩"
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    curl "https://setup.rbxcdn.com/mac/version-5c432a880bfa4a65-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
}

inject_dylib() {
    echo -e "Injecting libHydrogen.dylib 🚀"
    cp -R ./libHydrogen.dylib "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    echo -e "Injection complete! 🎉"
}

run_with_injection() {
    echo -e "Running Roblox with Injection 💥"
    DYLD_INSERT_LIBRARIES=/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib /Applications/Roblox.app/Contents/MacOS/RobloxPlayer
}

download

inject_dylib

run_with_injection
