The answer you need to validate is a concatenation of two attributes of the O-RAN Radio:
- Its name
- Its serial number

The format is  `name_serial`. You have to ask for validation with an RPC as stated in the rules.

Command to run the challenge: `make launch_oran_challenge CHALLENGE=1`