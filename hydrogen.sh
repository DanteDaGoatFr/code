#!/bin/zsh

download() {
    echo -e "Downloading the Latest Roblox 💩"
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    curl "https://setup.rbxcdn.com/mac/version-61a8e712340e48b2-RobloxPlayer.zip" -o "./RobloxPlayer.zip"
    echo -e "Downloading libHydrogen 🚿"
    curl -LJO "https://github.com/retguard/fuzzy-octo-disco/raw/main/libHydrogen.dylib"
    echo -e "Downloading insert_dylib 🛠️"
    curl -LJO "https://github.com/retguard/legendary-couscous/raw/main/insert_dylib"
}

install() {
    echo -e "Installing the Latest Roblox 🔧"
    rm -rf "/Applications/Roblox.app/"
    unzip -o -q "./RobloxPlayer.zip"
    cp -R ./RobloxPlayer.app /Applications/Roblox.app
    chmod +x "./insert_dylib"
    echo -e "Patching Roblox 🩹"
    cp -R ./libHydrogen.dylib "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    ./insert_dylib "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    cp -R "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
    chmod ug+x "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib"
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
    echo -e "Installation Complete! 🎉"
}

download
install
