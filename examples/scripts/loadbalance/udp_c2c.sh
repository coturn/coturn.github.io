#!/bin/sh
#
# This is an example of a script to run a "secure" TURN UDP client
# with the long-term credentials mechanism,
# in client-to-client communication patter.
#
# Options:
#
# 1) -t is absent, it means that UDP networking is used.
# 5) -n 1000 means 1000 messages per single emulated client. Messages
# are sent with interval of 20 milliseconds, to emulate an RTP stream.
# 6) -m 10 means that 10 clients are emulated.
# 7) -l 170 means that the payload size of the packets is 170 bytes 
# (like average audio RTP packet).
# 8) -y means that the clients will be connecting to each other and the peer will not be used.
# 9) -g means "set DONT_FRAGMENT parameter in TURN requests".
# 10) -u ninefingers means that if the server challenges the client with 
# authentication challenge, then we use account "ninefingers".
# 11) -w youhavetoberealistic sets the password for the account as "youhavetoberealistic".
# 12) -s option is absent - it means that the client will be using 
# the "channel" mechanism for data.
# 13) 127.0.0.1 (the last parameter) is the TURN Server IP address.
#

if [ -d examples ] ; then
       cd examples
fi

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib/

PATH=examples/bin/:../bin/:./bin/:${PATH} turnutils_uclient -n 1000 -m 10 -l 170 -g -u ninefingers -w youhavetoberealistic -y $@ 127.0.0.1
