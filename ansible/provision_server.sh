# Update System
# Use DNF to update all packages to their latest versions.
#sudo dnf update -y

# Enable the EPEL Repository
# Install EPEL repository for additional packages.
sudo dnf install epel-release -y

# Install Python Pip
# Install pip for Python 3 package management.
sudo dnf install python3-pip -y

# Install Python Virtual Environments with Pip
# Install 'virtualenv' for creating isolated Python environments.
pip3 install --user virtualenv
