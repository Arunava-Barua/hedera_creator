// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract UserProfileContract is Ownable {
    using Strings for uint256;
    mapping(address => string) public userProfiles;

    function setProfile(string memory profileData) public {
        userProfiles[msg.sender] = profileData;
        emit ProfileUpdated(msg.sender, profileData);
    }

    function getProfile(address user) public view returns (string memory) {
        return userProfiles[user];
    }

    event ProfileUpdated(address indexed user, string indexed profileData);
}
