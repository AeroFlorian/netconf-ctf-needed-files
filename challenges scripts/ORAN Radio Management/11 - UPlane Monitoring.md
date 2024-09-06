When configuring the Uplane tunnels on Radio, O-DU also monitors the links using LoopBack Message mechanism [More Info Here](https://infocenter.nokia.com/public/7705SAR234R1A/index.jsp?topic=%2Fcom.nokia.oam-guide%2Floopback_xeth-l-ai9o99jjwc.html)
The answer is the number of those LoopBack Messages transmitted by the Radio on the following interface:
* Vlan Id 8
* EthernetInterface2

No need to modify the interfaces themselves, they are already created.
Ask the Netconf Server for validation, it will give you the flag

Command to run the challenge: `make launch_oran_challenge CHALLENGE=11`