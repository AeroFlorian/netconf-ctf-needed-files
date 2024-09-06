For this challenge the flag is still in the state data of the NETCONF Server.
However, the server will give it to you only if you ask!
To do that, you need to change its configuration data before asking again.
Model and Graphical representation of module-containing-flag are attached.

Command to run the challenge: `make launch_challenge CHALLENGE=3`

<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag
  +--rw flag-container
     +--rw set-me-to-get-the-flag?   boolean
     +--ro flag?                     string
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

  container flag-container
  {

      leaf set-me-to-get-the-flag
      {
          type boolean;
          description "Set me to true to get the flag";
      }

      leaf flag
      {
          config false;
          type string;
          description "The flag";
      }
  }
}
````

</details>