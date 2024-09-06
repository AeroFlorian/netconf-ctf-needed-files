The Netconf Server really wants you to have the flag.
It tries to send it to you periodically, but you'll get it only if you listen!
Model and Graphical Representation of the model are attached

Command to run the challenge: `make launch_challenge CHALLENGE=5`

<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag

  notifications:
    +---n here-is-the-flag-take-it
       +--ro flag?   string
````

</details>

<details>
  <summary>module-containing-flag.yang</summary>

````
module module-containing-flag {
    yang-version 1.1;
    namespace "urn:module-flag:1.0";
  prefix "module-flag";

  contact
    "florian.salaun@nokia.com";

  description
    "Basic model used for a CTF aiming at make people familiar with NETCONF";

  revision "2024-07-11" {
   description "Creation";
  }

  notification here-is-the-flag-take-it {
      leaf flag {
        type string;
        description "The flag";
      }
      description "Notification sent periodically containing the flag";
  }
}
````

</details>