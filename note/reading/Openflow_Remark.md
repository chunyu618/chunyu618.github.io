# **OpenFlow: Enabling Innovation in Campus Networks**

### The Need For Programmable Nwtworks



### The Openflow Switch

* **Basic Idea**

	* Using the concept of flow-tables that exist in modern siwtches and routers for implemant of firewall, NAT, QoS and so on.
	* Open protocol to program the flow-tables in different switches and router.
	* The datapath of an OpenFlow Switch consists of a Flow Table, and an action associated with each flow entry. 

* **An OpenFlow Switch consists of at least three parts**

	* A flow table
	* A security channel to controller
	* Openflow protocol

* **Two types of switch**

	* Dedicated OpenFlow switches 

		A dumb datapath element that forwards packets between ports, as defined by a remote control process.

	* OpenFlow-enabled switches 

		Commercial switches or routers enhanced with Openflow features.

* **Flow**

	* Flows are broadly defined, and are limited only by the capabilities of the particular implementation of the Flow Table.
	* For example, a flow could be a TCP connection, or all packets from the particular address, or all packets with the same VLAN tag.

* **Flow Table**

	An entry in the Flow-Table has three fields

	* Packet header that define the flow. Or packet header that will be "matched"
	* Action that defined how the packets will be processed
	* Statistics that keeps track for each flow 

* **Action**

	Each flow-entry has a simple action associated with it.

	* Forward
	* Send to controller
	* Drop
	* Forward through the switch’s nor- mal processing pipeline. (Optional for Openflow-enabled switch)

* **Additional features**

	In addition to the four basic actions, there are some other actions that may help.

	*  Rewrite the header.
	* Map the flow / packet to priority classes.
	* and so on...

* Controllers

	* A controller add or remove flow-entry from the flow-tables of switches.
	* Enable to isolate experimental traffic from the production network.