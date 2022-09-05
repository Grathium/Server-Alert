#!/bin/bash

failedDataPoints=0

# check if the server is up
# return 0 if the server is running, 1 if it is not
checkUp() {
	ping -c 1 192.168.1.12 &> /dev/null && echo 0 || echo 1;
}

resetAlert() {
	# echo "Resetting Alert";
	if [ -f ./alertSent.tmp ]; then
        	rm ./alertSent.tmp;
	fi

	failedDataPoints=0
}

sendAlert() {
	echo "Sending alert to user...";
	# notify-send "[192.168.1.12] PiHole Server Unreachable...";
	cat ./alertTemplate.txt  | mail -s "[ALERT] Server 192.168.1.12/24 (pi.hole/) not responding..." email@domain.com;
	echo "1" > ./alertSent.tmp;
}

createAlert() {
	# echo "Could not contact server...";

	if [[ "$failedDataPoints" == 4 ]]; then
		if [ ! -f ./alertSent.tmp ]; then
			sendAlert;
		fi
	fi

	(( failedDataPoints++ ));
	printf "Server Failed %s Data Points", $failedDataPoints;
}

while true; do
	isDown=$(checkUp);
	
	if [[ "$isDown" == 0  ]]; then
		resetAlert;
	else
		createAlert;
	fi

	sleep 3;
done
