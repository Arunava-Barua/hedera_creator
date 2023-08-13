// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AstraverseNFT is ERC721, Ownable {
    constructor() ERC721("AstraverseNFT", "ASTNFT") {}

    function mintNFT(address recipient, uint256 tokenId, string memory tokenURI) public onlyOwner {
        _mint(recipient, tokenId);
        _setTokenURI(tokenId, tokenURI);
    }

    function burnNFT(uint256 tokenId) public onlyOwner {
        require(_exists(tokenId), "Token does not exist");
        _burn(tokenId);
    }
}
