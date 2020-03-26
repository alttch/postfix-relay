#!/bin/sh

[ -d /config ] && [ "$(ls -A /config)" ] && cp -vf /config/* /etc/postfix/
postmap /etc/postfix/aliases
[ -f /etc/postfix/virtual ] && postmap /etc/postfix/virtual
postfix start-fg
