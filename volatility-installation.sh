#!/bin/bash

search_dir=/
volatility_found=false

# Search for vol.py and suppress output with -q, storing the first result in file_path
file_path=$(grep -rl "vol.py" "$search_dir" --include="*.py" | head -n 1)

if [ -n "$file_path" ];
        then
                dir_path=$(dirname "$file_path")
                echo -e "\033[32mFound vol.py at: $file_path\033[0m"
                cd $dir_path
                python2 vol.py
                volatility_found=true
        else
                #\033[31m and \033[0m is used to give red color to the text (any other color can be used, search for that on >
                echo -e "\033[32mvolatility is not found\033[0m"
                        cd /opt
                        git clone  https://github.com/volatilityfoundation/volatility.git
                        echo -e "\033[32mvolatility is cloned at /opt directory\033[0m"
                        cd volatility
                        python2 vol.py
fi
# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}
# Function to check if a Python package is installed
python_package_installed() {
    python2 -c "import $1" 2>/dev/null
}
# Check if pip2 is installed
if which pip2 >/dev/null 2>&1; then
        echo -e "\033[35mpip2 is already install\033[0m"
else echo -e "\033[35mpip2 not found. Installing pip2...\033[0m"
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
    python2 get-pip.py
fi
# Check if setuptools is installed for pip2
if pip2 show setuptools >/dev/null 2>&1; then
    echo -e "\033[35msetuptools is already installed\033[0m"
else
    echo -e "\033[35msetuptools not found. Installing setuptools...\033[0m"
    pip2 install --upgrade setuptools
fi
# Check if python2-dev is installed
if dpkg -l | grep -q python2-dev; then
    echo -e "\033[35mpython2-dev is already installed.\033[0m"
else
    echo -e "\033[35mpython2-dev not found. Installing python2-dev...\033[0m"
    apt-get install python2-dev -y
fi
# Check if pycrypto is installed
if pip2 show pycrypto >/dev/null 2>&1; then
    echo -e "\033[35mpycrypto is already installed.\033[0m"
else
    echo -e "\033[35mpycrypto not found. Installing pycrypto...\033[0m"
    pip2 install pycrypto
fi
# Check if distorm3==3.4.4 is installed
if pip2 show distorm3 | grep -q "Version: 3.4.4"; then
    echo -e "\033[35mdistorm3 version 3.4.4 is already installed.\033[0m"
else
    echo -e "\033[35mdistorm3 version 3.4.4 not found. Installing distorm3...\033[0m"
    pip2 install distorm3==3.4.4
fi
# Check if Pillow is installed
if pip2 show Pillow >/dev/null 2>&1; then
    echo -e "\033[35mPillow is already installed.\033[0m"
else
    echo -e "\033[35mPillow not found. Installing Pillow...\033[0m"
    pip2 install Pillow
fi
# Check if Yara is installed
if dpkg -l | grep -q python2-yara; then
    echo -e "\033[35mYara is already installed.\033[0m"
else
    echo -e "\033[35mYara not found. Installing YARA...\033[0m"
    pip2 install yara-python==3.7.0
fi
python2 vol.py
if [ "$volatility_found" = true ]; then
    echo -e "\033[32mVolatility is already installed at $dir_path and you should be able to run it without errors.\033[0m"
else
    echo -e "\033[32mVolatility is installed at /opt/volatility\033[0m"
fi
