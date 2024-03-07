# Update System
# This command updates all installed packages and their dependencies to the latest versions.
#sudo dnf update -y

# Set up EPEL
# Install the Extra Packages for Enterprise Linux (EPEL) repository, providing additional software for Enterprise Linux.
sudo dnf install -y epel-release

# Add Foreman and Puppet Repositories
# Install the Puppet 7 repository for Enterprise Linux 8.
sudo dnf -y install https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
# Install the Foreman release package to enable the Foreman repository.
sudo dnf -y install https://yum.theforeman.org/releases/3.9/el8/x86_64/foreman-release.rpm
# Enable the Foreman module stream.
sudo dnf -y module enable foreman:el8
# Install the Foreman installer package.
sudo dnf -y install foreman-installer
# Update the /etc/hosts file to include the local domain name, improving resolution for local services.
sudo sh -c 'echo -e "127.0.0.1 foreman.local\n192.168.55.154 foreman.local foreman" > /etc/hosts'
# Run the Foreman installer with initial admin username and password specified.
sudo foreman-installer --foreman-initial-admin-username=admin --foreman-initial-admin-password=redhat

# Set-up firewall
# These commands configure the system's firewall to allow traffic on HTTP and HTTPS standard ports, and ports used by Foreman, Puppet, and other services.
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --add-port=69/tcp # TFTP
sudo firewall-cmd --permanent --add-port=67-69/udp # DHCP and TFTP
sudo firewall-cmd --permanent --add-port=53/tcp # DNS
sudo firewall-cmd --permanent --add-port=53/udp # DNS
sudo firewall-cmd --permanent --add-port=8443/tcp # Foreman Smart Proxy
sudo firewall-cmd --permanent --add-port=8140/tcp # Puppet

# Reload the firewall settings to apply the changes made above.
sudo systemctl restart firewalld.service
