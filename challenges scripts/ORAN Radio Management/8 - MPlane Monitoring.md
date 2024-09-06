O-DU needs to keep the radio alive over Management Plane  by sending a periodic RPC. If it does not send it in time, the radio restarts.
(In our case we will keep the Radio running)
You need to send this RPC and after ask for validation with RPC `did-i-do-right`from `validation` module. If you sent to proper RPC, then it will give you the flag.

Command to run the challenge: `make launch_oran_challenge CHALLENGE=8`