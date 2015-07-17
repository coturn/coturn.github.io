#!/bin/sh
#
# This is an example of a script to run a "unsecure" TURN TCP client
# with TCP relay endpoints (RFC 6062).
# Options:
# 1) -T is present, it means that TCP networking is used with TCP relay endpoints.
# 5) -n 1000 means 1000 messages per single emulated client. Messages
# are sent with interval of 20 milliseconds, to emulate an RTP stream.
# 6) -m 10 means that 10 clients are emulated.
# 7) -l 170 means that the payload size of the packets is 170 bytes 
# (like average audio RTP packet).
# 8) -y means that the clients will connect to the 'neighbor' clients, no peer app will be used.
# 9) -g means "set DONT_FRAGMENT parameter in TURN requests".
# 10) ::1 (the last parameter) is the TURN Server IP address. We use IPv6 here
# to illustrate how the TURN Server convert the traffic from IPv6 to IPv4 and back.
#

if [ -d examples ] ; then
       cd examples
fi

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib/

PATH=examples/bin/:../bin:bin/:${PATH} turnutils_uclient -T -n 1000 -m 10 -l 170 -y -g $@ ::1

