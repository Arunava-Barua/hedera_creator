// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract MetaverseInteractionContract is Ownable {
    mapping(address => uint256) public eventTickets;

    function purchaseTicket(uint256 eventId) public payable {
        require(msg.value > 0, "Insufficient payment");
        eventTickets[msg.sender] += 1;
        emit TicketPurchased(msg.sender, eventId);
    }

    function redeemTicket(uint256 eventId) public onlyOwner {
        require(eventTickets[msg.sender] > 0, "No tickets to redeem");
        eventTickets[msg.sender] -= 1;
        emit TicketRedeemed(msg.sender, eventId);
        payable(msg.sender).transfer(ethAmount);
    }

    event TicketPurchased(address indexed buyer, uint256 indexed eventId);
    event TicketRedeemed(address indexed redeemer, uint256 indexed eventId);
}
