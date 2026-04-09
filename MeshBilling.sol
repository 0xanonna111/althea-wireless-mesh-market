// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title MeshBilling
 * @dev Manages micro-payment settlements between mesh nodes.
 */
contract MeshBilling is ReentrancyGuard {
    struct Node {
        address wallet;
        uint256 pricePerMB; // In Wei
        bool active;
    }

    mapping(address => Node) public nodes;
    mapping(address => uint256) public balances;

    event NodeRegistered(address indexed node, uint256 price);
    event PaymentSettled(address indexed from, address indexed to, uint256 amount);

    /**
     * @dev Register a router in the billing system.
     */
    function registerNode(uint256 _price) external {
        nodes[msg.sender] = Node(msg.sender, _price, true);
        emit NodeRegistered(msg.sender, _price);
    }

    /**
     * @dev Deposit funds to pay for data forwarding.
     */
    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    /**
     * @dev Settles bandwidth debt between peers. 
     * In production, this is called via signed off-chain state updates.
     */
    function settleDebt(address _provider, uint256 _amount) external nonReentrant {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        balances[msg.sender] -= _amount;
        payable(_provider).transfer(_amount);
        
        emit PaymentSettled(msg.sender, _provider, _amount);
    }
}
