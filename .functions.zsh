function take() {
  mkdir -p $@ && cd ${@:$#}
}

function cheat() {
  curl cht.sh/$1
}
