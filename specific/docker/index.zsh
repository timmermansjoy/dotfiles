function docker_cleanup_containers {
  docker ps -a | grep Exited | cut -d ' ' -f 1 | xargs docker rm
}


alias dup="docker-compose up -d --build"
alias ddown="docker-compose down"
alias drun="docker-compose run --rm"
alias dclean="docker_cleanup_containers"
