# Udacity Blockchain Capstone
The capstone will build upon the knowledge gained in the course in order to build a decentralized housing product. 

## Requirements
Truffle v5.4.29 (core: 5.4.29)
Solidity - 0.5.2 (solc-js)
Node v16.17.0
Web3.js v1.5.3

## Collection in Opensea
https://testnets.opensea.io/collection/erc721mintable-h4bduynm7e

Token 100 is sold from account 0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836 to account 0x99fb0Ab83f638Af30B3433f1F785a4E34903832D
See transaction information here: https://goerli.etherscan.io/tx/0xb58fa724334e24c85921f08bedf1bfd4da9d4565e827517dba5aaf2f2ef29c84

## Download, install and compile contracts

```
~/Desktop/code/blockchain/git clone https://github.com/IsmaelB83/RealStateNFT

~/Desktop/code/blockchain/RealStateNFT/npm install

~/Desktop/code/blockchain/RealStateNFT/truffle compile

Compiling your contracts...
===========================
> Compiling ./contracts/ERC721Mintable.sol
> Compiling ./contracts/Migrations.sol
> Compiling ./contracts/SolnSquareVerifier.sol
> Compiling ./contracts/SquareVerifier.sol
> Compiling ./contracts/base/ERC165.sol
> Compiling ./contracts/base/ERC721.sol
> Compiling ./contracts/base/ERC721Enumerable.sol
> Compiling ./contracts/base/ERC721Metadata.sol
> Compiling ./contracts/base/Ownable.sol
> Compiling ./contracts/base/Pausable.sol
> Compiling ./contracts/utils/Oraclize.sol
> Compiling openzeppelin-solidity/contracts/drafts/Counters.sol
> Compiling openzeppelin-solidity/contracts/math/SafeMath.sol
> Compiling openzeppelin-solidity/contracts/token/ERC721/IERC721Receiver.sol
> Compiling openzeppelin-solidity/contracts/utils/Address.sol
> Artifacts written to /home/isma/Desktop/code/blockchain/RealEstateMarketplace/eth-contracts/build/contracts
> Compiled successfully using:
   - solc: 0.5.2+commit.1df8f40c.Emscripten.clang
```

## Testing
```
~/Desktop/code/blockchain/RealEstateMarketplace/eth-contracts/truffle test 

Compiling your contracts...
===========================
> Compiling ./contracts/ERC721Mintable.sol
> Compiling ./contracts/SolnSquareVerifier.sol
> Compiling ./contracts/SquareVerifier.sol
> Artifacts written to /tmp/test--85705-EOga5U3Ce9vL
> Compiled successfully using:
   - solc: 0.5.2+commit.1df8f40c.Emscripten.clang

  Contract: ERC721Mintable
    ✓ Minting working properly (595ms)
    ✓ Contract deployed properly
    ✓ Should return token uri
    ✓ Should return total supply
    ✓ Should return balance of tokens per account owner
    ✓ Should transfer token from one owner to another (59ms)
    ✓ Should fail when minting when address is not contract owner
    ✓ Mint to address work properly (77ms)
    ✓ Set approval allows a third party to transfer tokens (70ms)
    ✓ Set approval for specific token allows the approver to transfer the specified token (105ms)

  Contract: SolnSquareVerifier
    ✓ Add new solution to contract
    ✓ Test minting token with valid solution (75ms)

  Contract: SquareVerifier
    ✓ Verify with wrong proof (430ms)
    ✓ Verify with correct proof (423ms)
```
## Deployment

Smart contracts have been deployed on rinkeby first but then on goerly. This is due to opensea testnet does not allow rinkeby anymore (eth merge)

### Goerly deployment

```
Starting migrations...
======================
> Network name:    'goerly'
> Network id:      5
> Block gas limit: 30000000 (0x1c9c380)


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0xd79d8a50e8ff57f26f4bfa3b42c3d9a0a5b3f049464adbc90e6f23d2d458dacb
   > Blocks: 1            Seconds: 28
   > contract address:    0x4744Fe3DB6ef2964Cf68fb234EfF0C3942EEC2Da
   > block number:        7682779
   > block timestamp:     1664489400
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             0.169713223286015246
   > gas used:            236270 (0x39aee)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.0023627 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:           0.0023627 ETH


2_deploy_contracts.js
=====================

   Deploying 'ERC721Mintable'
   --------------------------
   > transaction hash:    0x2f64ae2de27f8c62aaf915b312286f3de0b4a5cb40f0135ae4c054d1d0a814a4
   > Blocks: 1            Seconds: 8
   > contract address:    0xB4Cbf4F7229A5Ae2c3E1d537ECd9Ccf9d5191471
   > block number:        7682782
   > block timestamp:     1664489436
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             0.134373503286015246
   > gas used:            3488204 (0x3539cc)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.03488204 ETH


   Deploying 'SquareVerifier'
   --------------------------
   > transaction hash:    0xe3919965b7d98591ae162fed141157082593fe906ed8962c9a51931356756f84
   > Blocks: 1            Seconds: 16
   > contract address:    0x4294eFc714bFe42b6B7C4dbC96f89C3eCBA60EBf
   > block number:        7682784
   > block timestamp:     1664489460
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             0.124257123286015246
   > gas used:            1011638 (0xf6fb6)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.01011638 ETH


   Deploying 'SolnSquareVerifier'
   ------------------------------
   > transaction hash:    0x385771ad01bc0a7e511b675203a5c9867d62ec0366a67e4ee19506c98b772212
   > Blocks: 1            Seconds: 8
   > contract address:    0x7bB6BdCA0B6AD3f94AF0bF8006501d0Fa5Ac784B
   > block number:        7682785
   > block timestamp:     1664489472
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             0.083556463286015246
   > gas used:            4070066 (0x3e1ab2)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.04070066 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.08569908 ETH


Summary
=======
> Total deployments:   4
> Final cost:          0.08806178 ETH
```

### Rinkeby deployment

```
~/Desktop/code/blockchain/RealStateNFT/truffle deploy --network rinkeby 

Starting migrations...
======================
> Network name:    'rinkeby'
> Network id:      4
> Block gas limit: 30000000 (0x1c9c380)


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0xb88b9fed1ca0c8ba505afbdcd6f6b25c59e6873d28d108e08178e996914dd4d7
   > Blocks: 0            Seconds: 12
   > contract address:    0x2280D23Ce937aE175710899FCdC270aca82577b6
   > block number:        11467040
   > block timestamp:     1664488951
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             1.130526456093813889
   > gas used:            236270 (0x39aee)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.0023627 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:           0.0023627 ETH


2_deploy_contracts.js
=====================

   Deploying 'ERC721Mintable'
   --------------------------
   > transaction hash:    0x6b20e35c959a606884820ed96a99a9080e3073a614a4eed0f878eed4da9508e5
   > Blocks: 0            Seconds: 8
   > contract address:    0x1cf1d3A41DCf1A8Fbde10C7B8cc0c8c213afbf64
   > block number:        11467042
   > block timestamp:     1664488981
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             1.095186736093813889
   > gas used:            3488204 (0x3539cc)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.03488204 ETH


   Deploying 'SquareVerifier'
   --------------------------
   > transaction hash:    0x2a30e49844d8cd6376d1686256feccea9221fe05f6ef74df5aa382f10806634b
   > Blocks: 0            Seconds: 8
   > contract address:    0x82DDEB12B5Bbb22d1F0fF2a589C64D63bB49B225
   > block number:        11467043
   > block timestamp:     1664488996
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             1.085070356093813889
   > gas used:            1011638 (0xf6fb6)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.01011638 ETH


   Deploying 'SolnSquareVerifier'
   ------------------------------
   > transaction hash:    0x65ae284e0045d14a7b0e2b48080f1688569110dc86305a6200b86dc9126793f5
   > Blocks: 0            Seconds: 8
   > contract address:    0x1AD00C9A181E8A48af9c6b971c6B812204F42eF2
   > block number:        11467044
   > block timestamp:     1664489011
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             1.044369696093813889
   > gas used:            4070066 (0x3e1ab2)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.04070066 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.08569908 ETH


Summary
=======
> Total deployments:   4
> Final cost:          0.08806178 ETH
```

## Project Resources
* [Remix - Solidity IDE](https://remix.ethereum.org/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Truffle Framework](https://truffleframework.com/)
* [Ganache - One Click Blockchain](https://truffleframework.com/ganache)
* [Open Zeppelin ](https://openzeppelin.org/)
* [Interactive zero knowledge 3-colorability demonstration](http://web.mit.edu/~ezyang/Public/graph/svg.html)
* [Docker](https://docs.docker.com/install/)
* [ZoKrates](https://github.com/Zokrates/ZoKrates)
