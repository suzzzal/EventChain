
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SubSentryNFT is ERC721, Ownable {

    constructor() ERC721("SubSentryNFT", "SSNFT") Ownable(msg.sender) {}

    // deposit = mint nft
    function deposit(address to, uint256 tokenId) external onlyOwner {
        require(to != address(0), "invalid address");
        _mint(to, tokenId);
    }

    // withdraw = transfer nft back to contract owner
    function withdraw(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "not token owner");
        _transfer(msg.sender, owner(), tokenId);
    }

    // get number of nfts owned by an address
    function getBalance(address user) external view returns (uint256) {
        return balanceOf(user);
    }
}
