Vagrant.configure("2") do |config|

  
  # Original CentOS 7 VM
  config.vm.define "centos7" do |centos7|
    centos7.vm.box = "centos/7"
    centos7.vm.network "private_network", ip: "192.168.55.151"
	centos7.vm.hostname = "centos7.local"
    centos7.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
    end
  end
  
  # Additional CentOS 7 VM
  config.vm.define "centos7_2" do |centos7_2|
    centos7_2.vm.box = "centos/7"
    centos7_2.vm.network "private_network", ip: "192.168.55.152"
	centos7_2.vm.hostname = "centos7-2.local"
    centos7_2.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
    end
  end

  # AlmaLinux 9 VM - Ansible Server
  config.vm.define "almalinux9" do |almalinux9|
    almalinux9.vm.box = "almalinux/9"
    almalinux9.vm.network "private_network", ip: "192.168.55.153"
	almalinux9.vm.hostname = "ansible.local"
    almalinux9.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
    end
	almalinux9.vm.provision "shell", path: "ansible/provision_server.sh"
	almalinux9.vm.provision "shell", path: "ansible/ansible_install.sh"
	almalinux9.vm.provision "file", source: "ansible/inventory", destination: "/home/vagrant/ansible-virtualenv/inventory"
	
  end
  

  # CentOS Stream 8 VM - Foreman Server
  config.vm.define "centosstream8" do |centosstream8|
    centosstream8.vm.box = "generic/centos8s"
    centosstream8.vm.network "private_network", ip: "192.168.55.154"
	centosstream8.vm.hostname = "foreman.local"
    centosstream8.vm.provider "virtualbox" do |vb|
      vb.memory = 4096 # Recommended for Foreman
    end
	
	centosstream8.vm.provision "shell", path: "foreman/foreman_provisioning.sh"
	
	end

end
