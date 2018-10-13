powershell_script 'Install IIS' do
    action :run
    code 'add-windowsfeature Web-Server'
end

service 'w3svc' do
    action [ :enable, :start ]
end

template 'c:\inetpub\wwwroot\Default.htm' do
    source 'Default.htm.erb'
    rights :read, 'Everyone'
end

#
# C:\chef\cookbooks\webserver\recipes\default.rb 
#

knife azure server create --azure-dns-name 'cbtest01' --azure-vm-name 'testserver01' 
    --azure-vm-size 'Small' --azure-storage-account 'portalvhdsxxxx' --bootstrap-protocol 'cloud-api' 
    --azure-source-image 'a699494373c04fc0bc8f2bb1389d6106__Windows-Server-2012-Datacenter-201411.01-en.us-127GB.vhd' 
    --azure-service-location 'Southeast Asia' --winrm-user azureuser --winrm-password 'myPassword123' 
    --tcp-endpoints 80,3389 --r 'recipe[webserver]'