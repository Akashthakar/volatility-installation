# Volatility Installation and Setup Script

This is an automated Bash script designed to help users install and configure **Volatility**, a popular memory forensics tool, on their Linux systems. The script checks for existing installations of Volatility and its dependencies, and if not found, it will download and install Volatility, along with the necessary Python 2.7 packages.

## Features

- **Automatic Volatility Installation**: The script clones the Volatility repository from GitHub and sets it up on your system.
- **Dependency Management**: It ensures that all required dependencies (e.g., `pip2`, `setuptools`, `python2-dev`, `pycrypto`, `distorm3`, `Pillow`) are installed before running Volatility.
- **Error Handling**: The script checks if Volatility is already installed and only installs missing dependencies when necessary.
- **Customizable Search Directory**: You can specify a search directory to look for `vol.py`, and the script will execute it if found.

## Prerequisites

- **Linux-based OS**: This script has been designed for Linux distributions.
- **Python 2.7**: Volatility relies on Python 2.7, so it must be installed before running this script.
- **Root Privileges**: Some actions (e.g., cloning to `/opt`, installing dependencies) require root access, so you may need `sudo` privileges.

## Installation

To use this script, follow these steps:

### 1. Clone the Repository

Clone this repository to your local machine using Git:
<pre>git clone https://github.com/your-username/volatility-setup.git
cd volatility-setup</pre>

### 2. Make the Script Executable

Change the permissions of the script to make it executable:

<pre> chmod +x volatility-setup.sh </pre>

### 3. Run the Script

Run the script to automatically check and install Volatility and its dependencies:
<pre>
sudo ./volatility-setup.sh
</pre>
**The script will:**

- Search for vol.py on your system.
- If Volatility is not found, it will clone the repository into /opt/volatility and run it.
- It will check if dependencies like pip2, setuptools, python2-dev, pycrypto, distorm3, and Pillow are installed. If not, the script will install them.

### 3. Verify Installation

Once the script finishes, you can verify that Volatility is installed and running by navigating to /opt/volatility and running:

<pre>
cd /opt/volatility
python2 vol.py
</pre>

If everything is set up correctly, it should show the Volatility help message.

## Customization

- **Search Directory**: You can modify the search_dir variable in the script to specify where you want the script to search for vol.py.
- **Dependencies**: If you want to add or remove dependencies, you can edit the dependency-checking section of the script.

## Dependencies

The script checks and installs the following dependencies if they are not already installed:

- pip2 (Python 2.7 package manager)
- setuptools (Python package for easy installation of other packages)
- python2-dev (Python development files for building C extensions)
- pycrypto (Python library for cryptography)
- distorm3==3.4.4 (Python disassembler)
- Pillow (Python Imaging Library, forked for Python 2)
