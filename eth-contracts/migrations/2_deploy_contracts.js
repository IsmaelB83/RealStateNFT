// Import artifacts 
const ERC721Mintable = artifacts.require("./ERC721Mintable.sol");
const SquareVerifier = artifacts.require("./SquareVerifier.sol");
const SolnSquareVerifier = artifacts.require("./SolnSquareVerifier.sol");

module.exports = async (deployer) => {
    await deployer.deploy(ERC721Mintable, "ERC721Mintable", "REN", "https://erc721mintable-ibernal.s3.amazonaws.com/");
    await deployer.deploy(SquareVerifier);
    await deployer.deploy(SolnSquareVerifier, SquareVerifier.address, "ERC721Mintable", "REN", "https://erc721mintable-ibernal.s3.amazonaws.com/");
};