// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@hashgraph/hedera-eth-contracts";


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


import "@hashgraph/hedera-eth-contracts";

contract HederaTokenContract {
    IHederaToken public tokenContract;
    address public admin;

    event TransactionValidated(address indexed user, uint256 amount);

    constructor(address _tokenContract) {
        tokenContract = IHederaToken(_tokenContract);
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    function setAdmin(address newAdmin) external onlyAdmin {
        admin = newAdmin;
    }

    function validateTransaction(address user, uint256 amount) external onlyAdmin {
        // Call the token contract to validate the transaction
        require(tokenContract.balanceOf(user) >= amount, "Insufficient balance");
        
        // Perform additional validation logic if needed
        
        emit TransactionValidated(user, amount);
    }
}

}
