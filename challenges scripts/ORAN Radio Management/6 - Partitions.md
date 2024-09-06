After an upgrade of O-DU, we need to know if the running partition of the O-RU is compatible.
The answer is the concatenation of the file names (separated by `_`) that are used in running partition of O-RU.
Format is `filename1_filename2_filename3...`
Ask th Netconf Server for validation, it will give you the flag.

Command to run the challenge: `make launch_oran_challenge CHALLENGE=6`