#!/usr/bin/bash
crunch 8 8 -f /usr/share/crunch/charset.lst mixalpha-numeric-all | pyrit -e $1 -f -passthrourg | cowpatty -d - -r $2 - $1
