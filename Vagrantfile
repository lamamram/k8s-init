## Toute commande doit-ere exécution dans le répertoire contenant le Vagrantfile
# vagrant up
# vagrant halt
# vagrant destroy
# vagrant global-config
#----------------------
# vagrant ssh [NAME|ID]

Vagrant.configure(2) do |config|
  [
    ["k8s.formation.lan", "8192", "4", "debian/bookworm64"],
  ].each do |vmname,mem,cpu,os|
    config.vm.define "#{vmname}" do |machine|

      machine.vm.provider "virtualbox" do |v|
        v.memory = "#{mem}"
        v.cpus = "#{cpu}"
        v.name = "#{vmname}"
        v.customize ["modifyvm", :id, "--ioapic", "on"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      machine.vm.box = "#{os}"
      machine.vm.hostname = "#{vmname}"
      machine.vm.network "private_network",
        ip: "192.168.50.4",
        virtualbox__intnet: "kind_network"
      machine.ssh.insert_key = false
      machine.vm.provision "file", source: "kind-install", destination: "$HOME/kind-install"
      machine.vm.provision "shell", 
        path: "install_docker.sh",
        reboot: true
      machine.vm.provision "shell", 
        path: "install_kind.sh",
        privileged: false
    end
  end
end
