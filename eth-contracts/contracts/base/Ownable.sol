// SPDX-License-Identifier: MIT
pragma solidity >0.4.25;

/// @title Base Contract that implements ownable functionality
/// @author ismaelbernal83@gmail.com
/// @notice Implements ownership functionality to derived contracts as well as transfer ownership
contract Ownable {

    /********************************************************************************************/
    /*                                       STATE                                              */
    /********************************************************************************************/
    address private _owner;
    
    /********************************************************************************************/
    /*                                       EVENTS                                             */
    /********************************************************************************************/
    event OwnershipTransferred(address newOwner);

    /********************************************************************************************/
    /*                                       MODIFIERS                                          */
    /********************************************************************************************/
    modifier onlyOwner() {
        require(msg.sender == _owner, "Only owner is allowed to call this method");
        _;
    }

    /********************************************************************************************/
    /*                                       CONSTRUCTOR                                        */
    /********************************************************************************************/
    constructor() internal {
        _owner = msg.sender;
    }

    /********************************************************************************************/
    /*                                     SMART CONTRACT FUNCTIONS                             */
    /********************************************************************************************/
    function transferOwnership(address newOwner) public onlyOwner {
        require(msg.sender != address(0), "Not a proper address");
        require(msg.sender == tx.origin, "Not an external owned address");
        _owner = newOwner;
        emit OwnershipTransferred(newOwner);
    }

    /********************************************************************************************/
    /*                                     UTILITY FUNCTIONS                                    */
    /********************************************************************************************/
    function isOwner() external view returns (bool) {
        if (msg.sender == _owner) {
            return true;    
        }
        return false;
    }
}