// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ModerationContract is Ownable {
    mapping(address => bool) public isModerator;

    function addModerator(address newModerator) public onlyOwner {
        isModerator[newModerator] = true;
        emit ModeratorAdded(newModerator);
    }

    function removeModerator(address moderator) public onlyOwner {
        isModerator[moderator] = false;
        emit ModeratorRemoved(moderator);
    }

    event ModeratorAdded(address indexed newModerator);
    event ModeratorRemoved(address indexed moderator);
}
