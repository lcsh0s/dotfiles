#!/bin/bash

# Get the primary Wi-Fi interface (e.g., en0)
WIFI_INTERFACE=$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $2}')

# Check if the Wi-Fi hardware is powered on
WIFI_POWER=$(networksetup -getairportpower "$WIFI_INTERFACE" | awk '{print $4}')

if [ "$WIFI_POWER" == "Off" ]; then
	echo "off,,"
	exit 0
fi

# Get Wi-Fi details. Requires sudoers configuration for passwordless execution.
WDUTIL_INFO=$(sudo /usr/bin/wdutil info)

# Check the Primary IPv4 line in the NETWORK section to determine connection status.
if echo "$WDUTIL_INFO" | grep "Primary IPv4" | grep -q "None"; then
	echo "on,,"
else
	IP_ADDRESS=$(echo "$WDUTIL_INFO" | awk '/ IPv4 Address / {print $4}')
	SIGNAL_STRENGTH=$(echo "$WDUTIL_INFO" | grep "RSSI" | awk '{print $3}' | tr -d ' ')
	echo "connected,$IP_ADDRESS,$SIGNAL_STRENGTH"
fi
