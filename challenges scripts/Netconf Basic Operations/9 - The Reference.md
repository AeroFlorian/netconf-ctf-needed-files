Going deeper into YANG concepts.
You need to create a specific object to get the flag.
However, there is a twist! The object has to be connected to another one :)
Read the YANG model to find out!

Command to run the challenge: `make launch_challenge CHALLENGE=9`

<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag
  +--rw flag-container
     +--rw objects-already-created* [name]
     |  +--rw name    string
     +--rw objects-to-create* [name]
     |  +--rw name                      string
     |  +--rw points-to                 -> /flag-container/objects-already-created/name
     |  +--rw set-me-to-get-the-flag?   boolean
     +--ro flag?                      string
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

    list objects-already-created
    {
        key "name";
        description "List of objects that are already present";
        leaf name
        {
            type string;
            description "The name of the object";
        }
    }

    list objects-to-create
    {
        key "name";
        description "List of objects, set one to get the flag";
        leaf name
        {
            type string;
            description "The name of the object";
        }

        leaf points-to
        {
            type leafref {
                path "/flag-container/objects-already-created/name";
            }
            description "Points to another object";
            mandatory true;
        }

        leaf set-me-to-get-the-flag
        {
            type boolean;
            description "Set me to true to get the flag";
        }
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