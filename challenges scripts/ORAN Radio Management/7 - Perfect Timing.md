In order to configure its UPlane channels, O-DU needs to align perfectly in a very precise timing window.
The answer is `A_B`, where:
* `A` is the maximum time it takes for UPlane data between entry of the Radio Fronthaul and its Antenna in downlink
* `B` is the minimum time it takes for data between entry of the Radio Fronthaul and its Antenna in uplink

As those timings vary for each bandwidth and subcarrier spacing, we'll take the data for bandwidth `20Mhs` and SCS `15Khz`

Ask the Netconf Server for validation, it will give you the flag

Command to run the challenge: `make launch_oran_challenge CHALLENGE=7`