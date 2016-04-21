get_container_ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

get_host_ip(){
  ip route  | head -n1 | awk '{print $3}'
}

get_machine_ip() {
  env | grep 'DOCKER_HOST' |head -n1 | awk -F ':' '{gsub(/\//,"", $2);print $2
}