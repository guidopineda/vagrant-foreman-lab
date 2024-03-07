# Create a directory to hold the virtual environment
mkdir ~/ansible-virtualenv

# Change into the newly created directory
cd ~/ansible-virtualenv

# Create a virtual environment named 'myansibleenv' using Python3's venv module
python3 -m venv myansibleenv

# Activate the virtual environment
source myansibleenv/bin/activate

# Upgrade pip to the latest version within the virtual environment
python3 -m pip install --upgrade pip

# Install the 'wheel' package, which is a built-package format for Python
pip install wheel

# Install Ansible within the virtual environment
pip install ansible

# Install requests module

pip3 install requests