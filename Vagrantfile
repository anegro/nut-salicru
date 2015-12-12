# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Utilizar plugin vagrant-cachier si está disponible
  if Vagrant.has_plugin?("vagrant-cachier")
    #config.cache.scope = :box
  end

  
  # Definir máquinas virtuales mediante bloques
  def servers
    # |nodename, nodeip, nodebox, nodeprimary|
    yield "nut-master",  "172.31.0.10", "debian/wheezy64", true
    yield "nut-slave",   "172.31.0.11", "ubuntu/trusty64"
    #yield "nut-slave2",   "172.31.0.12", "debian/wheezy64"
  end


  # Configuración para servidores que usen NUT (maestros y esclavos)
  servers do |nodename, nodeip, nodebox, nodeprimary|

    config.vm.define nodename, primary: nodeprimary do |machine|
      machine.vm.hostname = nodename
      machine.vm.box = nodebox
      machine.vm.network :private_network, ip: nodeip, :netmask => "255.255.0.0"
      # machine.vm.synced_folder "data", "/vagrant_data"
  
      machine.vm.provider :virtualbox do |vb|
        # Nombre con el que aparece en VirtualBox
        vb.name = nodename
        vb.memory = 512
        #vb.cpus = 2
        #vb.gui = true
      end
    end

  end # servers

end # configure

