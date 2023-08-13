// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TokenContract.sol"; 

contract PaymentContract {
    TokenContract public tokenContract; 
    constructor(address _tokenContractAddress) {
        tokenContract = TokenContract(_tokenContractAddress);
    }

    function purchaseTokens() external payable {
        uint256 tokenAmount = msg.value * 100; // 1 Ether = 100 tokens (for example)
        tokenContract.transfer(msg.sender, tokenAmount);
    }

    function makePayment(uint256 amount) external {
        require(tokenContract.balanceOf(msg.sender) >= amount, "Insufficient balance");
        tokenContract.transferFrom(msg.sender, address(this), amount);
      
    }

    function withdrawTokens(uint256 amount) external {
        require(msg.sender == owner(), "Only the owner can withdraw");
        tokenContract.transfer(msg.sender, amount);
    }

    function withdrawEther(uint256 amount) external {
        require(msg.sender == owner(), "Only the owner can withdraw");
        payable(msg.sender).transfer(amount);
    }

    function getContractTokenBalance() external view returns (uint256) {
        return tokenContract.balanceOf(address(this));
    }

    function getContractEtherBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
