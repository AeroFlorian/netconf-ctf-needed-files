The Netconf Server has scrappy objects it wants you to cleanup.
You can remove everything at once no need to pick it up :)

Yang Model and Graphical representation of the model attached

Command to run the challenge: `make launch_challenge CHALLENGE=10`

<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag
  +--rw flag-container
     +--rw objects-you-want-to-delete* [name]
     |  +--rw name    string
     +--ro flag?                         string
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

    list objects-you-want-to-delete
    {
        key "name";
        description "List of objects, delete it to get the flag";
        leaf name
        {
            type string;
            description "The name of the object";
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