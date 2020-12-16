## Network Broadcast Storm

#### What is a Broadcast packet

* There are three types of network packet: broadcast, multicast and unicast.
* Broadcast packets are usually sent by a node that wants others attenetion its existence.
* Layer 2 broadcast packet with destination address FF-FF-FF-FF-FF-FF, while layer 3 with 255.255.255.255. 

#### What is a Broadcast Storm

* A high number of broadcast packets within a short period of time.
* A Broadcast Storm can overwhelm switches and end devices as they are trying to process the flood of packets.
* Cause link congestion

#### Causes of Broadcast Storm

1. DHCP requests
2. Big broadcast domain

#### Ways to Reduce Broadcast Storm

1. Storm control allows you to limit broadcast packets.
2. Split up broadcast domain.
3. How often ARP table are emptied.
4. Switches have hardware failure.
5. Network loop. 

#### Reference

&emsp;1. https://www.auvik.com/franklymsp/blog/broadcast-storms/

