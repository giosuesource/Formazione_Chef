# Aggiornamento della lista dei pacchetti

execute 'apt-get update' do
  command 'apt-get update'
  action :run
end

docker_service 'default' do
  install_method 'script'
  action [:create, :start]
end

docker_image 'jenkins/jenkins' do
  action :pull
end

docker_container 'eugeniocontainer' do
  repo 'jenkins/jenkins'
#  port '1234:1234'
#  command "nc -ll -p 1234 -e /bin/cat"
  volumes ['/var/run/docker.sock:/var/run/docker.sock']
  user 'root'
end

