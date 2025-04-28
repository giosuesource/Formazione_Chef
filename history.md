SERVER 
dnf update && dnf upgrade                                                                                 
dnf install wget                                                                                          
dnf install libxcrypt-compat                                                                              
wget https://packages.chef.io/files/stable/chef-server/15.10.33/el/8/chef-server-core-15.10.33-1.el8.x86_6                                                                                                           
rpm -Uvh chef-server-core-15.10.33-1.el8.x86_64.rpm                                                  
chef-server-ctl reconfigure                                                                               
chef-server-ctl status                                                                                    
chef-server-ctl reconfigure                                                                                                                                                                                       
chef-server-ctl user-create giosue Giosuè Manzo giosue.manzo@sourcesense.com ‘ciaociao01.’ --filename ~/myuser.pem                                                                                                         
chef-server-ctl org-create dev “Devops” --association_user giosue --filename ~/myorg-validator.pem        
cat myorg-validator.pem                                                                                   
cat myuser.pem                                                                                            
cat myorg-validator.pem                                                                                   

WORK 
dnf update && dnf upgrade                                                                                 
dnf install 
dnf install libxcrypt-compat                                                                              
wget https://packages.chef.io/files/stable/chef-workstation/25.2.1075/el/8/chef-workstation-25.2.1075-1.el8.x86_64.rpm                                                                                                     
rpm -Uvh chef-workstation-25.2.1075-1.el8.x86_64.rpm                                                 
mkdir -p ~/chef-repo/.chef                                                                                
vi ~/chef-repo/.chef/config.rb                                                                            
knife client list                                                                                         
cd ~/chef-repo/.chef/                                                                                     
vi myorg-validator.pem                                                                                    
vi myuser.pem                                                                                             
knife client list                                                                                         
knife ssl fetch                                                                                           
knife client list                                                                                         
vi config.rb                                                                                              
knife client list                                                                                         
cd trusted_certs/chserver.crt                                                                             
cat trusted_certs/chserver.crt                                                                            
vi /etc/hosts                                                                                             
vi config.rb
cd                                                                                      
cd /etc/                                                                                
mkdir chef                                                                              
cd chef/                                                                                
knife client create primonodo -u myorg-validator -k /etc/chef/myorg-validator.pem -d "client per primonodo" -f /etc/chef client.pem
cd                                                                                      
mkdir -p ~/chef-repo/cookbooks                                                          
cd ~/chef-repo/cookbooks                                                                                                                    
chef generate cookbook primo_cookbook                                                   
cd 
vim recipes/default.rb                                                                  
vi recipes/default.rb                                                                   
vi metadata.rb                                                                
vi Policyfile.rb
knife node run_list add primonodo 'recipe[primo_cookbook::default]'
chef install
knife cookbook upload primo_cookbook                                                                                      

CLIENT
dnf update && dnf upgrade                                                                                                           
dnf install wget                                                                                                                    
dnf install libxcrypt-compat                                                                                                        
wget https://packages.chef.io/files/stable/chef/18.7.3/el/8/chef-18.7.3-1.el8.x86_64.rpm                                            
rpm -Uvh chef-18.7.3-1.el8.x86_64.rpm                                                                                          
dnf install chef-18.7.3-1.el8.x86_64.rpm                                                                                            
cd /etc/chef/                                                                                                                       
ls                                                                                                                                  
vi myorg-validator.pem                                                                                                              
vi client.rb                                                                                                                        
chef-client                                                                                                                         
knife ssl fetch                                                                                                                     
cd trusted_certs/                                                                                                                   
ls                                                                                                                                  
vi chserver.crt                                                                                                                     
chef-client                                                                                                                         
cd /etc/chef                                                                                                                        
ls                                                                                                                                  
vi /etc/hosts                                                                                                                       
vi client.rb                                                                                                                        
chef-client                                                                                                                         
cat /etc/chef/client.rb                                                                                                             
vi /etc/chef/client.rb                                                                                                              
chef-client                                                                                                                         
ls /etc/chef/client.pem                                                                                                             
cd /etc/chef/                                                                                                                       
ls                                                                                                                                  
pwd                                                                                                                                 
chef-client -j /etc/chef/client.rb --validation-client-name myorg-validator --validation-key /etc/chef/myorg-validator.pem          
chef-client   
