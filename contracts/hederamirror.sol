// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MirrorNodesContract {
    mapping(uint256 => bytes32) private transactionHistory;

    event TransactionLogged(uint256 indexed transactionId, bytes32 dataHash);

    // Function to log transaction data
    function logTransaction(uint256 transactionId, bytes32 dataHash) external {
        require(msg.sender == platformAdmin, "Only platform admin can log transactions");
        
        transactionHistory[transactionId] = dataHash;
        emit TransactionLogged(transactionId, dataHash);
    }

    function getTransactionData(uint256 transactionId) external view returns (bytes32) {
        return transactionHistory[transactionId];
    }

    
    address private platformAdmin;

    constructor() {
        platformAdmin = msg.sender; // Set the platform admin during contract deployment
    }
}
