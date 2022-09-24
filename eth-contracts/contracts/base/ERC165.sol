// SPDX-License-Identifier: MIT
pragma solidity >0.4.25;

/// @title Base Contract that implements ERC165
/// @author ismaelbernal83@gmail.com
/// @notice Creates a standard method to publish and detect what interfaces a smart contract implements.
contract ERC165 {
       
    /********************************************************************************************/
    /*                                       CONSTANTS                                          */
    /********************************************************************************************/   
    bytes4 private constant _INTERFACE_ID_ERC165 = 0x01ffc9a7;
    // 0x01ffc9a7 === bytes4(keccak256('supportsInterface(bytes4)'))

    /********************************************************************************************/
    /*                                       STATE                                              */
    /********************************************************************************************/
    mapping(bytes4 => bool) private _supportedInterfaces;

    /********************************************************************************************/
    /*                                       CONSTRUCTOR                                        */
    /********************************************************************************************/
    constructor () public {
        _registerInterface(_INTERFACE_ID_ERC165);
    }

    /********************************************************************************************/
    /*                                   SMART CONTRACT FUNCTIONS                               */
    /********************************************************************************************/
    function _registerInterface(bytes4 interfaceId) internal {
        require(interfaceId != 0xffffffff);
        _supportedInterfaces[interfaceId] = true;
    }

    /********************************************************************************************/
    /*                                     UTILITY FUNCTIONS                                    */
    /********************************************************************************************/
    function supportsInterface(bytes4 interfaceId) external view returns (bool) {
        return _supportedInterfaces[interfaceId];
    }
}