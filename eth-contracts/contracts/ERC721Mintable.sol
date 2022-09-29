// SPDX-License-Identifier: MIT
pragma solidity >0.4.25;

// Own Imports
import "./base/ERC721Metadata.sol";

// CustomERC721Token contract that inherits from the ERC721Metadata contract
contract ERC721Mintable is ERC721Metadata {
    
    // Calls super constructor
    constructor(string memory name, string memory symbol, string memory baseTokenURI) ERC721Metadata(name, symbol, baseTokenURI) public {
    }

    // Public mint only for contract owner to mint tokens to specified address
    function mint(address to, uint256 tokenId) public onlyOwner whenNotPaused returns(bool){
        super._mint(to, tokenId);
        setTokenURI(tokenId);
    }
}