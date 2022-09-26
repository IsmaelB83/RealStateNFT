// SPDX-License-Identifier: MIT
pragma solidity >0.4.25;

// Own Imports
import "./base/ERC721Metadata.sol";

//  TODO's: Create CustomERC721Token contract that inherits from the ERC721Metadata contract. You can name this contract as you please
contract ERC721Mintable is ERC721Metadata {
    
    //  1) Pass in appropriate values for the inherited ERC721Metadata contract
    //      - make the base token uri: https://s3-us-west-2.amazonaws.com/udacity-blockchain/capstone/
    constructor(string memory name, string memory symbol) ERC721Metadata(name, symbol, "https://s3-us-west-2.amazonaws.com/udacity-blockchain/capstone/") public {
    }

    //  2) create a public mint() that does the following:
    //  -can only be executed by the contract owner
    //  -takes in a 'to' address, tokenId as parameters
    //  -returns a true boolean upon completion of the function
    //  -calls the superclass mint and setTokenURI functions
    function mint(address to, uint256 tokenId) public onlyOwner whenNotPaused returns(bool){
        super._mint(to, tokenId);
        setTokenURI(tokenId);
    }
}



