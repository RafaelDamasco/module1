// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
 
 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
 

 contract MyNFT is ERC721{
    uint256 public counter;
    
    string constant BAYC = "https://ipfs.io/ipfs/QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/";
    string constant DOODLES = "https://ipfs.io/ipfs/QmPMc4tcBsMqLRuCQtPmPe84bpSjrC3Ky7t3JWuHXYB4aS/";

    enum NFTMetadata { BAYC, DOODLES }
    NFTMetadata nftMetadata = NFTMetadata.BAYC;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        counter = 1;
    }

    function redeemNFT() external {
        _safeMint(msg.sender, counter);
        counter++;
    }

    function _baseURI() internal override view returns(string memory) {
        if (nftMetadata == NFTMetadata.BAYC) {
            return BAYC;
        } else if (nftMetadata == NFTMetadata.DOODLES){
            return DOODLES;
        } else {
            revert("Error...");
        }
    }

 }