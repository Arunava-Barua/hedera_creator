// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GovernanceContract is Ownable {
    IERC20 public token;
    mapping(address => bool) public hasVoted;
    uint256 public totalVotes;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function vote(bool decision) public {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        totalVotes += 1;

        if (decision) {
            // Execute platform upgrade or change
        }

        emit VoteCast(msg.sender, decision);
    }

    event VoteCast(address indexed voter, bool indexed decision);
}
