The NETConf Server in this challenge is pretty submissive.
If you tell it strongly enough it will send it to you.
Model and Graphical representation attached

Command to run the challenge: `make launch_challenge CHALLENGE=4`

<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag

  rpcs:
    +---x give-me-the-flag
       +--ro output
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