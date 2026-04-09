# Decentralized Wireless Mesh (Althea-style)

A professional-grade implementation for decentralized internet infrastructure. This repository enables a "Mesh Economy" where routers negotiate bandwidth prices in real-time. Instead of a monthly subscription to a giant telecom, users pay their neighbors for the specific amount of data they relay, incentivizing the expansion of coverage into underserved areas.

## Core Features
* **Pay-per-Forward:** High-frequency micro-payments integrated into the routing protocol.
* **Price Competition:** Routers dynamically choose the cheapest path to the internet backbone.
* **Debt Management:** Logic to handle temporary offline states and settlement of bandwidth IOUs.
* **Flat Architecture:** Single-directory layout for the Router Registry, Billing Engine, and Peer Manager.

## Logic Flow
1. **Discovery:** A new router joins the mesh and identifies neighboring nodes.
2. **Negotiation:** The router queries neighbors for their price per Megabyte.
3. **Transmission:** As data packets are forwarded, the router "streams" micro-payments to the forwarding neighbor.
4. **Settlement:** If a neighbor provides a reliable, fast, and cheap connection, they earn the majority of the local network's revenue.

## Setup
1. `npm install`
2. Deploy `MeshBilling.sol`.
