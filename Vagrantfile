Vagrant.configure("2") do |config|

	config.vm.box = "ubuntu/trusty64"
	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
	config.vm.provider "virtualbox" do |vb|
		vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
        vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
	end

	config.vm.provision "shell", inline: <<-END
		apt-add-repository ppa:ansible/ansible
		apt-get -y autoremove
		apt-get update

		#
		# Install NTP, Python, Ansible, Ruby
		#
		apt-get install -y ntp python docker-py software-properties-common ansible ruby-full

		#
		# Install Terraform
		#
		wget -q https://releases.hashicorp.com/terraform/0.6.14/terraform_0.6.14_linux_amd64.zip
		mkdir -p /opt/terraform
		unzip -oq terraform_0.6.14_linux_amd64.zip -d /opt/terraform
		rm -f terraform_0.6.14_linux_amd64.zip
		echo "export PATH=$PATH:/opt/terraform" >> /etc/bash.bashrc

		apt-get -y autoremove

		cp /vagrant/deployMock /usr/local/bin
		chmod ugo+x /usr/local/bin/deployMock

		cd /vagrant
		terraform get
	END

end
