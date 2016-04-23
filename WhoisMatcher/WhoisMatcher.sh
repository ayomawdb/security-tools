#!/bin/bash
# ---------------------------------------------------------------------------
# WhoisMatcher.sh - Capture a specific section of whois data if a given 
# string is present.

# Copyright 2016, Ayoma Gayan Wijethunga <ayoma@ayomaonline.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.

# Usage: WhoisMatcher.sh input_file patern_to_match patern_to_capture

# Revision history:
# 2016-04-23  Created
# ---------------------------------------------------------------------------

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Usage : Capture a specific section of whois data if a given string is present."
	echo "        "
	echo "        Perform whois lookup for each IP address available in the input file (input_file) and "
	echo "        look for a given pattern (patern_to_match) in the whois data. If match is found,"
	echo "        print line of whois data that matches third parameter (patern_to_capture)."
	echo "        "
	echo "        If third parameter is empty, print \"inetnum\|NetRange\" which is the IP range in Whois data."
	echo "        "
	echo "Example : WhoisMatcher.sh input_file patern_to_match patern_to_capture"
	echo "Example : WhoisMatcher.sh ip_list.txt CompanyName"
	echo "Example : WhoisMatcher.sh ip_list.txt CompanyName NetRange"
	exit;
fi

while IFS='' read -r line || [[ -n "$line" ]]; do
	whoisOutput=$(whois $line)
	if echo $whoisOutput | grep -q $2; then
		if [ -z "$3" ]; then
			echo "$whoisOutput" | grep 'inetnum\|NetRange'
		else
			echo "$whoisOutput" | grep '$3'
		fi
	fi
done < "$1"
