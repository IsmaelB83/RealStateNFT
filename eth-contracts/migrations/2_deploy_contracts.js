// Import artifacts 
const SquareVerifier = artifacts.require("./utils/SquareVerifier.sol");
const ERC721Mintable = artifacts.require("./ERC721Mintable.sol");
const ERC721MintableVerifier = artifacts.require("./ERC721MintableVerifier.sol");

module.exports = async (deployer) => {
    await deployer.deploy(ERC721Mintable, "ERC721Mintable", "ERC");
    await deployer.deploy(SquareVerifier);
    await deployer.deploy(ERC721MintableVerifier, SquareVerifier.address, "ERC721Mintable", "ERC");
};  