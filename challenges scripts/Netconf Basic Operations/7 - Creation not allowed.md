Same as challenge 3, you need to ask for the flag by changing the running configuration.
This time, you only have the right to update items already present!!

Model and Graphical Representation of the model are attached

Command to run the challenge: `make launch_challenge CHALLENGE=7`

<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag
  +--rw flag-container
     +--rw objects-to-modify* [name]
     |  +--rw name                      string
     |  +--rw set-me-to-get-the-flag?   boolean
     +--ro flag?                string
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
    list objects-to-modify
    {
        key "name";
        description "List of objects, set 2 objects to get the flag";
        leaf name
        {
            type string;
            description "The name of the object";
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