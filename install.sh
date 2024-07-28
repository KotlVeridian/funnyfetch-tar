command_exists() {
    command -v "$1" >/dev/null 2>&1
}


install_package() {
    if command_exists apt-get; then
        sudo apt-get update
        sudo apt-get install -y "$1"
    elif command_exists pacman; then
        sudo pacman -Syu --noconfirm "$1"
    elif command_exists dnf; then
        sudo dnf install -y "$1"
    elif command_exists yum; then
        sudo yum install -y "$1"
    elif command_exists zypper; then
        sudo zypper install -y "$1"
    elif command_exists apk; then
        sudo apk add "$1"
    else
        echo "Error: No supported package manager found."
        exit 1
    fi
}

if ! command_exists git; then
    echo "git is not installed. Please install git"
    exit 1
fi

if ! command_exists make; then
    echo "make is not installed. Please install make"
fi

git clone https://github.com/whatdidyouexpect/funnyfetch || {
    echo "Failed to clone the repository. Exiting."
    exit 1
}

cd funnyfetch || {
    echo "Failed to change directory. Exiting."
    exit 1
}


sudo make install || {
    echo "Failed to run 'make install'. Check for errors."
    exit 1
}

sudo rm -fdr funnyfetch/

echo "Installation completed successfully."
