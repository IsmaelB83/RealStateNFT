// SPDX-License-Identifier: MIT
pragma solidity >0.4.25;

// Own Imports
import "./Pausable.sol";
import "./ERC165.sol";
// External Imports
import 'openzeppelin-solidity/contracts/utils/Address.sol';
import 'openzeppelin-solidity/contracts/drafts/Counters.sol';
import 'openzeppelin-solidity/contracts/math/SafeMath.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/IERC721Receiver.sol';


/// @title Base Contract that implements ERC721. This contract implements Pausable and ERC165
/// @author ismaelbernal83@gmail.com
/// @notice ERC-721 is an open standard that describes how to build non-fungible or unique tokens on the Ethereum blockchain
contract ERC721 is Pausable, ERC165 {

    /********************************************************************************************/
    /*                                       IMPORTS                                            */
    /********************************************************************************************/
    using SafeMath for uint256;
    using Address for address;
    using Counters for Counters.Counter;

    /********************************************************************************************/
    /*                                       CONSTANTS                                          */
    /********************************************************************************************/
    bytes4 private constant _ERC721_RECEIVED = 0x150b7a02;
    bytes4 private constant _INTERFACE_ID_ERC721 = 0x80ac58cd;

    /********************************************************************************************/
    /*                                       EVENTS                                             */
    /********************************************************************************************/
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);


    /********************************************************************************************/
    /*                                       STATE                                              */
    /********************************************************************************************/
    mapping (uint256 => address) private _tokenOwner;                               // Mapping from token id to owner
    mapping (uint256 => address) private _tokenApprovals;                           // Mapping from token id to approved address
    mapping (address => Counters.Counter) private _ownedTokensCount;                // Mapping from owner to number of owned token
    mapping (address => mapping (address => bool)) private _operatorApprovals;      // Mapping from owner to operator approvals

    /********************************************************************************************/
    /*                                       CONSTRUCTOR                                        */
    /********************************************************************************************/
    constructor () public {
        _registerInterface(_INTERFACE_ID_ERC721);
    }

    /********************************************************************************************/
    /*                                       MODIFIERS                                          */
    /********************************************************************************************/
    modifier requireOwner(uint256 tokenId) {
        require(msg.sender == ownerOf(tokenId), "Not token owner");
        _;
    }

    /********************************************************************************************/
    /*                                     UTILITY FUNCTIONS                                    */
    /********************************************************************************************/
    function balanceOf(address owner) public view returns (uint256) {
        return _ownedTokensCount[owner].current();
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        require(_tokenOwner[tokenId] != address(0), "Token doest not exist");
        return _tokenOwner[tokenId];
    }

    function getApproved(uint256 tokenId) public view returns (address) {
        return _tokenApprovals[tokenId];
    }

    /**
     * @dev Tells whether an operator is approved by a given owner
     * @param owner owner address which you want to query the approval of
     * @param operator operator address which you want to query the approval of
     * @return bool whether the given operator is approved by the given owner
     */
    function isApprovedForAll(address owner, address operator) public view returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    /********************************************************************************************/
    /*                                   SMART CONTRACT FUNCTIONS                               */
    /********************************************************************************************/
    function approve(address to, uint256 tokenId) public {
        address owner = ownerOf(tokenId);
        require(owner != to, "To address is already the owner of tokenId");
        require(owner == msg.sender || isApprovedForAll(owner, msg.sender), "Sender is not approved as owner of tokenId");
        _tokenApprovals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }

    /**
     * @dev Sets or unsets the approval of a given operator
     * An operator is allowed to transfer all tokens of the sender on their behalf
     * @param to operator address to set the approval
     * @param approved representing the status of the approval to be set
     */
    function setApprovalForAll(address to, bool approved) public {
        require(to != msg.sender);
        _operatorApprovals[msg.sender][to] = approved;
        emit ApprovalForAll(msg.sender, to, approved);
    }
    
    function transferFrom(address from, address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender, tokenId));
        _transferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public {
        safeTransferFrom(from, to, tokenId, "");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public {
        transferFrom(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, _data));
    }

    /********************************************************************************************/
    /*                                     INTERNAL FUNCTIONS                                   */
    /********************************************************************************************/
    /**
     * @dev Returns whether the specified token exists
     * @param tokenId uint256 ID of the token to query the existence of
     * @return bool whether the token exists
     */
    function _exists(uint256 tokenId) internal view returns (bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    /**
     * @dev Returns whether the given spender can transfer a given token ID
     * @param spender address of the spender to query
     * @param tokenId uint256 ID of the token to be transferred
     * @return bool whether the msg.sender is approved for the given token ID,
     * is an operator of the owner, or is the owner of the token
     */
    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view returns (bool) {
        require(_tokenOwner[tokenId] != address(0), "Token does not exist");
        address owner = ownerOf(tokenId);
        return (spender == owner || getApproved(tokenId) == spender || isApprovedForAll(owner, spender));
    }

    // @dev Internal function to mint a new token
    // TIP: remember the functions to use for Counters. you can refresh yourself with the link above
    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "To address is not valid");
        require(_tokenOwner[tokenId] == address(0), "Token already exists");
        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to].increment();
        emit Transfer(address(0), to, tokenId);
    }

    // @dev Internal function to transfer ownership of a given token ID to another address.
    // TIP: remember the functions to use for Counters. you can refresh yourself with the link above
    function _transferFrom(address from, address to, uint256 tokenId) internal {
        require(to != address(0), "Not a valid to address");
        _clearApproval(tokenId);
        _ownedTokensCount[from].decrement();
        _ownedTokensCount[to].increment();
        _tokenOwner[tokenId] = to;
        emit Transfer(from, to, tokenId);
    }

    /**
     * @dev Internal function to invoke `onERC721Received` on a target address
     * The call is not executed if the target address is not a contract
     * @param from address representing the previous owner of the given token ID
     * @param to target address that will receive the tokens
     * @param tokenId uint256 ID of the token to be transferred
     * @param _data bytes optional data to send along with the call
     * @return bool whether the call correctly returned the expected magic value
     */
    function _checkOnERC721Received(address from, address to, uint256 tokenId, bytes memory _data) internal returns (bool) {
        if (!to.isContract()) {
            return true;
        }
        bytes4 retval = IERC721Receiver(to).onERC721Received(msg.sender, from, tokenId, _data);
        return (retval == _ERC721_RECEIVED);
    }

    // @dev Private function to clear current approval of a given token ID
    function _clearApproval(uint256 tokenId) private {
        if (_tokenApprovals[tokenId] != address(0)) {
            _tokenApprovals[tokenId] = address(0);
        }
    }
}