The Netconf Server wants you to add an object and it will give you the flag in exchange.
But what object? Read the YANG model attached to find out!

Command to run the challenge: `make launch_challenge CHALLENGE=8`

<details>
  <summary>module-containing-flag.yang.model</summary>

````
module: module-containing-flag
  +--rw flag-container
     +--rw objects-to-set
     |  +--rw objects* [name]
     |     +--rw name                      string
     |     +--rw set-one-of-this*          string
     |     +--rw set-me-to-get-the-flag?   boolean
     +--ro flag?             string
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

  typedef leaf-list-enum
  {
    type enumeration
    {
        enum one;
        enum two;
        enum three;
    }
  }

  grouping object-grouping
  {
      leaf-list set-one-of-this
      {
          type string;
          description "Set one of these values to get the flag";
      }
      leaf set-me-to-get-the-flag
      {
          type boolean;
          description "Set me to true to get the flag";
      }
  }


  container flag-container
  {
    container objects-to-set {
      list objects
      {
          key "name";
          description "List of objects, set one to get the flag";
          leaf name
          {
              type string;
              description "The name of the object";
          }
          uses object-grouping;
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