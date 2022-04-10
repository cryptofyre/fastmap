#!/bin/bash

echo "PREREQUISITES: figlet, curl, jq, lolcat"
echo "PLEASE INSTALL THESE BINARIES WITH YOUR PACKAGE MANAGER"
echo "NOTE: USE LOWER CASE FOR ALL INPUTS"

read -p "Press [ENTER] to start program"

echo ""

figlet -f slant "Netowrk Auditing\
 & Pinging Tool" | lolcat

read -p "Value of i: " increment
echo ""
echo "NOW THE PROGRAM WILL LOOP. PRESS CNTL+C TO QUIT"
echo ""

while [ $increment -lt 100 ]
do

	read -p ">>>  " prompt_input
	if [[ $prompt_input == "exit" ]] ; then
		echo "Exiting program"
		break
	elif [[ $prompt_input == "netmap" ]] ; then

		echo "Starting nmap module"
		read -p "Enter host+/subnet to scan>>> " ipsub_scanvar_0x1
		read -p "What type of scan do you want to do? (syn/port(tcp)/os/arp)>>> " scan_type_0x1

		if [[ $scan_type_0x1 == "port(tcp)" ]] ; then

			reap -p "Scan all TCP ports(y/n)>>> " scanyesnotcp

			if [[ $scanyesnotcp == "y" ]] ; then
				nmap -p0- -A -T4 -v $ipsub_scanvar_0x1
			else
				echo "scan cancelled"
			fi
		
		elif [[ $scan_type_0x1 == "arp" ]] ; then

			echo "Commencing arp scan of subnet"
			nmap -sn $ipsub_scanvar_0x1

		fi

	elif [[ $prompt_input == "help" ]] ; then
		echo "netmap: opens network mapping module"
		echo "ping: opens ping module"
		echo "fapi: opens fing api calling module"
		echo "exit: exits program"
	#read -p "Enter array values to query (with dot notation for jq[except for the first delimiter]): " array_header_0x1
	#curl -s $api_url1 | jq ".$array_header_0x1"

	
	fi

	let "increment=increment+1"

done

#read -p "API url with auth key: " api_url1
#echo "ENTERED API URL: $api_url1"

#ead -p "Display api raw data? (y/n): " rawdata_ask
#if [ $rawdata_ask == "n" ]
#then
#	echo "Not displaying raw data"
#else
#	curl -s $api_url1 | jq "."
#fi


