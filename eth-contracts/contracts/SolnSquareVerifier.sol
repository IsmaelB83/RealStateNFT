// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.6.0;

// Own imports
import "./ERC721Mintable.sol";
// External imports
import "./utils/SquareVerifier.sol";

// TODO define another contract named SolnSquareVerifier that inherits from your ERC721Mintable class
contract SolnSquareVerifier is ERC721Mintable {

    /********************************************************************************************/
    /*                                       STATE                                              */
    /********************************************************************************************/
    Verifier public verifierContract;

    // TODO define a solutions struct that can hold an index & an address
    struct Solution {
        uint index;
        address owner;
    }
    uint _countSolution = 0;

    // TODO define an array of the above struct
    mapping(bytes32 => Solution) private _mapSolution;                  
    // TODO define a mapping to store unique solutions submitted
    mapping(uint => bytes32) private _mapLookupSolution;                

    /********************************************************************************************/
    /*                                       EVENTS                                             */
    /********************************************************************************************/
    // TODO Create an event to emit when a solution is added
    event AddedSolutionEvent(address addressSolution);                  

    /********************************************************************************************/
    /*                                       CONSTRUCTOR                                        */
    /********************************************************************************************/
    constructor(address verifierAddress, string memory tokenName, string memory tokenSymbol) ERC721Mintable(tokenName, tokenSymbol) public {
        verifierContract = Verifier(verifierAddress);
    }

    function _getSolutionKey(uint[2] memory a, uint[2][2] memory b, uint[2] memory c, uint[2] memory input) private pure returns (bytes32) {
        return keccak256(abi.encodePacked(a,b,c,input));
    }

    /********************************************************************************************/
    /*                                     UTILITY FUNCTIONS                                    */
    /********************************************************************************************/
    function getSolutionInfoByCount(uint256 countSolution) public view returns (string memory) {
        bytes32 key = _mapLookupSolution[countSolution];
        string memory index = uint2str(_mapSolution[key].index);
        string memory owner = addressToString(_mapSolution[key].owner);
        return strConcat(
            " index : ", index, 
            " owner : ", owner);
    }

    function getOwnerByCount(uint256 countSolution) public view  returns (string memory) {
        bytes32 key = _mapLookupSolution[countSolution];
        string memory owner = addressToString(_mapSolution[key].owner);
        return owner;
    }

    function getIndexByCount(uint256 countSolution) public view returns (string memory) {
        bytes32 key = _mapLookupSolution[countSolution];
        string memory index = uint2str(_mapSolution[key].index);
        return index;
    }

    /********************************************************************************************/
    /*                                 SMART CONTRACT FUNCTIONS                                 */
    /********************************************************************************************/
    // TODO Create a function to add the solutions to the array and emit the event
    function addSolution(address owner, uint[2] memory a, uint[2][2] memory b, uint[2] memory c, uint[2] memory inputs) public {
        bytes32 solutionKey = _getSolutionKey(a,b,c,inputs);
        _countSolution = _countSolution.add(1);
        _mapSolution[solutionKey].owner = owner;
        _mapSolution[solutionKey].index = _countSolution;
        _mapLookupSolution[_countSolution] = solutionKey;
        emit AddedSolutionEvent(owner);
    }
    
    // TODO Create a function to mint new NFT only after the solution has been verified
    function mintNewNFT(address owner, uint256 tokenId, uint[2] memory a, uint[2][2] memory b, uint[2] memory c, uint[2] memory inputs) public {
        bytes32 solutionKey = _getSolutionKey(a,b,c,inputs);
        //  - make sure the solution is unique (has not been used before)
        require(_mapSolution[solutionKey].index == 0, strConcat("Already exist solution!", uint2str(_mapSolution[solutionKey].index)));
        //  - make sure you handle metadata as well as tokenSuplly
        require(verifierContract.verifyTx(a, b, c, inputs), "Solution isn't correct.");
        addSolution(owner, a, b, c, inputs);
        super.mint(owner, tokenId);
    }
}

contract Verifier {
    function verifyTx(uint[2] memory a, uint[2][2] memory b, uint[2] memory c, uint[2] memory input) public returns (bool r);
}