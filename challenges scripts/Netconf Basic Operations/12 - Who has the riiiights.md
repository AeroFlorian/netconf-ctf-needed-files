The flag is in the state data of the Netconf Server.
However, it seems you don't have the right to read it.
​
​
Yang model and Graphical representation of the model attached
​
Command to run the challenge: `make launch_challenge CHALLENGE=12`
​
<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag
  +--rw flag-container
     +--ro flag?   string
````

</details>
​
<details>
  <summary>module-containing-flag.yang</summary>

````
module module-containing-flag {
    yang-version 1.1;
    namespace "urn:module-flag:1.0";
  prefix "module-flag";
​
  contact
    "florian.salaun@nokia.com";
​
  description
    "Basic model used for a CTF aiming at make people familiar with NETCONF";
​
  revision "2024-07-11" {
   description "Creation";
  }
​
  container flag-container
  {
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