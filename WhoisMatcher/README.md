#WhoisMatcher.sh
#####Capture a specific section of whois data if a given string is present.

#Description 
Perform whois lookup for each IP address available in the input file (input_file) and
look for a given pattern (patern_to_match) in the whois data. If match is found,
print line of whois data that matches third parameter (patern_to_capture).

If third parameter is empty, print "inetnum\|NetRange" which is the IP range in Whois data.

#Usage Examples 
```
WhoisMatcher.sh input_file patern_to_match patern_to_capture
```
```
WhoisMatcher.sh ip_list.txt CompanyName
```
```
WhoisMatcher.sh ip_list.txt CompanyName NetRange
```

#License 
Copyright 2016, Ayoma Gayan Wijethunga <ayoma@ayomaonline.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License at <http://www.gnu.org/licenses/> for
more details.

#Revision history:
2016-04-23  Created
