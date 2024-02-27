#!/bin/zsh

download() {
    echo -e "Downloading the Latest Roblox 💩"
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    curl "https://setup.rbxcdn.com/mac/version-5c432a880bfa4a65-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
}

install_with_hydrogen() {
    echo -e "Installing the Latest Roblox with Hydrogen 🔧"
    rm -rf "/Applications/Roblox.app/"
    unzip -o -q "./RobloxPlayer.zip"
    cp -R ./RobloxPlayer.app /Applications/Roblox.app
    chmod +x "./insert_dylib"
    echo -e "Patching Roblox with Hydrogen 🩹"
    cp -R ./libHydrogen.dylib "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    ./insert_dylib "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    cp -R "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
    chmod ug+x "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" 
    echo -e "Installation with Hydrogen Complete! 🎉"
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
install_with_hydrogen
inject_dylib
run_with_injection
