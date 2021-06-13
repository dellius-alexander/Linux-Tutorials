#!/usr/bin/env bash
# xclip autocompletions
# See: man xclip
###########################################################
have xclip &&
_xclip_complete()
{
local cur prev

COMPREPLY=()
cur=${COMP_WORDS[COMP_CWORD]}
prev=${COMP_WORDS[COMP_CWORD-1]}

if [ $COMP_CWORD -eq 1 ]; then
COMPREPLY=( $(compgen -W "-3 -4 -6 -B -C -c cypher -F ssh_config -i identity_file -l limit -o ssh_option" -- $cur) )
elif [ $COMP_CWORD -eq 2 ]; then
    case "$prev" in
        '-selection')
        COMPREPLY=( $(compgen -W "primary secondary clipboard" -- $cur) )
        ;;
        -d | -display)
        COMPREPLY=( $(compgen -W "$(hostname -I | awk '{print $1}')$DISPLAY" -- $cur) )
        ;;
        *)
        ;;
    esac
fi

return 0
} &&
complete -F _xclip_complete xclip
server {
  listen 443 ssl;
  set $forward_scheme https;
  set $server         "10.0.0.1";
  set $port           8001;
listen [::]:443;


  server_name router.dellius.app;
  ssl_certificate    /data/nginx/dellius.app/dellius.app.cer
  ssl_certicate_key  /data/nginx/dellius.app/dellius.app.key
  ssl_protocols      TLSv1 TLSv1.1 TLSv1.2;
  ssl_cyphers  	     HIGH:!aNULL:!md5

