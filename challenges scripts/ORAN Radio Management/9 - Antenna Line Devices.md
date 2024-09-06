Antenna Line Devices are additional systems we can put between the Radio Module and its antenna. [More Info Here](https://customer.nokia.com/support/s/product2/antenna-systems/01t41000004g7IlAAI)
O-DU can send messages to calibrate those devices using the Radio M-Plane.
You need to send one message (payload can be whatever you want) to one ALD.
After you have done it, use RPC `did-i-do-right` from `validation` module to get the flag

Command to run the challenge: `make launch_oran_challenge CHALLENGE=9`