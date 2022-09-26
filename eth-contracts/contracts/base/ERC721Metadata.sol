// SPDX-License-Identifier: MIT
pragma solidity >0.4.25;

// Own Imports
import "./ERC721Enumerable.sol";
import "../utils/Oraclize.sol";

/// @title Implements metadata information on ERC721
/// @author ismaelbernal83@gmail.com
/// @notice Implmenets metadata functions to help marketplace to display our NFTs
contract ERC721Metadata is ERC721Enumerable, usingOraclize {
    
    /********************************************************************************************/
    /*                                       CONSTANTS                                          *
    /********************************************************************************************/
    bytes4 private constant _INTERFACE_ID_ERC721_METADATA = 0x5b5e139f;

    /********************************************************************************************/
    /*                                       STATE                                              */
    /********************************************************************************************/
    string private _name;
    string private _symbol;
    string private _baseTokenURI;
    mapping(uint256 => string) private _tokenURIs;

    /********************************************************************************************/
    /*                                       CONSTRUCTOR                                        *
    /********************************************************************************************/
    constructor (string memory name, string memory symbol, string memory baseTokenURI) public {
        _name = name;
        _symbol = symbol;
        _baseTokenURI = baseTokenURI;
        _registerInterface(_INTERFACE_ID_ERC721_METADATA);
    }

    /********************************************************************************************/
    /*                                     UTILITY FUNCTIONS                                    */
    /********************************************************************************************/
    function name() external view returns(string memory) {
        return _name;
    }

    function symbol() external view returns(string memory) {
        return _symbol;
    }
    
    function baseTokenURI() external view returns(string memory) {
        return _baseTokenURI;
    }
    
    function tokenURI(uint256 tokenId) external view returns(string memory) {
        require(_exists(tokenId));
        return _tokenURIs[tokenId];
    }

    // TODO: Create an internal function to set the tokenURI of a specified tokenId
    // It should be the _baseTokenURI + the tokenId in string form
    // TIP #1: use strConcat() from the imported oraclizeAPI lib to set the complete token URI
    // TIP #2: you can also use uint2str() to convert a uint to a string
    // see https://github.com/oraclize/ethereum-api/blob/master/oraclizeAPI_0.5.sol for strConcat()
    function setTokenURI(uint256 tokenId) internal {
        // require the token exists before setting
        require(_exists(tokenId), "Token does not exist");
        _tokenURIs[tokenId] = strConcat(_baseTokenURI, uint2str(tokenId));
    }
}
