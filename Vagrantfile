Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  
  # Máquina APACHE
  
  config.vm.define "apache" do |web|
    web.vm.hostname = "AngelHidalgoApache"
    web.vm.network "private_network", ip: "192.168.56.10"
    web.vm.network "forwarded_port", guest: 80, host: 8080
    web.vm.synced_folder "./app", "/var/www/html/app"
    web.vm.provision "shell", path: "provision_apache.sh"
  end
	# Máquina MYSQL
	
	config.vm.define "mysql" do |db|
    db.vm.hostname = "AngelHidalgoMysql"
    db.vm.network "private_network", ip: "192.168.56.20"
    db.vm.synced_folder "./app", "/tmp/app"
    db.vm.provision "shell", path: "provision_mysql.sh"
  end
end