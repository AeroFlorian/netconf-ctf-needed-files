O-DU had its software upgraded. Unfortunately, it is not compatible with the version of the O-RU.
The O-DU package contains an upgrade package for the radio:  `MyBrandNewSoftware.zip`. (The package does not really exist, just use this name plainly in your RPCs)
You need to send multiple RPCs to have it installed on Radio side.

For each step, no need to wait for any notification.
After finishing the installation, no need to reset the Radio, just ask `did-i-do-right` from `validation` module.

Command to run the challenge: `make launch_oran_challenge CHALLENGE=10`