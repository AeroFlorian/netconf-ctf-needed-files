As opposed to Challenge 1 - GETting started, this time you cannot dump the whole data.
There are two modules in the model

* One containing the flag
* One not containing the flag, and throws an error every time you want to get it

The flag is in the module containing the flag!
Models and Graphical representation of the models are available.

Command to run the challenge: `make launch_challenge CHALLENGE=2`

<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag
  +--rw flag-container
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

<details>
  <summary>module-not-containing-flag.yang.model</summary>

````
module: module-not-containing-flag
  +--rw no-flag-container
     +--ro no-flag?   string
````

</details>

<details>
  <summary>module-not-containing-flag.yang</summary>

````
module module-not-containing-flag {
    yang-version 1.1;
    namespace "urn:module-noflag:1.0";
  prefix "module-noflag";

  contact
    "florian.salaun@nokia.com";

  description
    "Basic model used for a CTF aiming at make people familiar with NETCONF";

  revision "2024-07-11" {
   description "Creation";
  }

  container no-flag-container
  {
      leaf no-flag
      {
          config false;
          type string;
          description "Not The flag";
      }
  }
}
````

</details>