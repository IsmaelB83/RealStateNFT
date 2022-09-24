// Import artifacts 
const SquareVerifier = artifacts.require("./utils/SquareVerifier.sol");
const RealEstateNFT = artifacts.require("./RealEstateNFT.sol");
const RealEstateNFTVerifier = artifacts.require("./RealEstateNFTVerifier.sol");

module.exports = async (deployer) => {
    await deployer.deploy(RealEstateNFT, "RealEstateNFT", "REN");
    await deployer.deploy(SquareVerifier);
    await deployer.deploy(RealEstateNFTVerifier, SquareVerifier.address, "RealEstateNFT", "REN");
};  