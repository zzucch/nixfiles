#!/usr/bin/env bash

case "$1" in
"up")
    sudo awg-quick up ~/.vpn_config/heiikimou.conf
    ;;
"down")
    sudo awg-quick down ~/.vpn_config/heiikimou.conf
    ;;
*)
    echo "Usage: vpn [up|down]"
    exit 1
    ;;
esac
