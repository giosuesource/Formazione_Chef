#
# Cookbook:: primo_cookbook
# Recipe:: default
#
# Copyright:: 2025, The Authors, All Rights Reserved.
docker_service 'default' do
  install_method 'package'
  action [:create, :start]
end

docker_image 'jenkins/jenkins' do
  action :pull
end

docker_container 'eugeniocontainer' do
  repo 'jenkins/jenkins'
  volumes ['/var/run/docker.sock:/var/run/docker.sock']
  user 'root'
end
