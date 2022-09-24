// SPDX-License-Identifier: MIT
pragma solidity >0.4.25;

import "./Ownable.sol";

/// @title Base Contract that implements pausable functionality
/// @author ismaelbernal83@gmail.com
/// @notice Allows derived contract to implement pausable functionalities and corresponding modfiers to control contract is not paused
contract Pausable is Ownable {

    /********************************************************************************************/
    /*                                       STATE                                              */
    /********************************************************************************************/
    bool private _paused;

    /********************************************************************************************/
    /*                                       EVENTS                                             */
    /********************************************************************************************/
    event ContractPaused(address origin);
    event ContractUnpaused(address origin);

    /********************************************************************************************/
    /*                                       MODIFIERS                                          */
    /********************************************************************************************/
    modifier whenNotPaused() {
        require(_paused == false, "Contract is paused");
        _;
    }

    modifier whenPaused() {
        require(_paused == true, "Contract is not paused");
        _;
    }

    /********************************************************************************************/
    /*                                       CONSTRUCTOR                                        */
    /********************************************************************************************/
    constructor() internal {
        _paused = false;
    }

    /********************************************************************************************/
    /*                                   SMART CONTRACT FUNCTIONS                               */
    /********************************************************************************************/
    function setPause () public onlyOwner whenNotPaused {
        _paused = true;
        emit ContractPaused(msg.sender);
    }

    function setUnpause () public onlyOwner whenPaused {
        _paused = false;
        emit ContractPaused(msg.sender);
    }
}
