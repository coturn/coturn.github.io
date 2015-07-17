#!/bin/sh
#
# This is an example of a script to run a "unsecure" TURN UDP client.
# Options:
# 0) -D means "mandatory padding", like pjnath does;
# 1) -t is absent, it means that UDP networking is used.
# 5) -n 1000 means 1000 messages per single emulated client. Messages
# are sent with interval of 20 milliseconds, to emulate an RTP stream.
# 6) -m 10 means that 10 clients are emulated.
# 7) -l 171 means that the payload size of the packets is 171 bytes 
# (like average audio RTP packet).
# 8) -e 127.0.0.1 means that the clients will use peer address 127.0.0.1.
# 9) -g means "set DONT_FRAGMENT parameter in TURN requests".
# 10) -s option is absent - it means that the client will be using 
# the "channel" mechanism for data.
# 11) -X means that IPv4 relay address is requested.
# 12) 127.0.0.1 (the last parameter) is the TURN Server IP address. We use IPv4 here
# to illustrate how the TURN Server convert the traffic from IPv6 to IPv4 and back.
#

if [ -d examples ] ; then
       cd examples
fi

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib/

PATH=examples/bin/:../bin/:bin/:${PATH} turnutils_uclient -D -n 1000 -m 10 -l 171 -e 127.0.0.1 -g -X $@ 127.0.0.1

