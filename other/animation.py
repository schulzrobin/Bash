#! /usr/bin/python
# 18 / 03 / 2018
# basic loading animation msfconsole
# thanks :  stackoverflow.com
# modified by Hendriyawan
import time
import sys

while True:
	message = 'starting the metasploit framework...'
	for x in range(len(message)):
		sys.stdout.write('\r'+'[*] '+message[:x]+message[x:].capitalize())
		sys.stdout.flush()
		time.sleep(0.1)