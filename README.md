# Udacity Blockchain Capstone
The capstone will build upon the knowledge gained in the course in order to build a decentralized housing product. 

## Requirements
Truffle v5.4.29 (core: 5.4.29)
Solidity - 0.5.2 (solc-js)
Node v16.17.0
Web3.js v1.5.3

## Download, install and compile contracts
```
~/Desktop/code/blockchain/git clone https://github.com/IsmaelB83/RealStateNFT

~/Desktop/code/blockchain/RealStateNFT/npm install

~/Desktop/code/blockchain/RealStateNFT/truffle compile

```

## Deployment

Deployment on rinkey network:

```
truffle deploy --network rinkeby

Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.


Starting migrations...
======================
> Network name:    'rinkeby'
> Network id:      4
> Block gas limit: 29970649 (0x1c950d9)


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0xc7d33e0037d3068c7ed8685f8ffbe352c94cee603f1f5f564bb1c02afae89523
   > Blocks: 2            Seconds: 16
   > contract address:    0xBC5c867867B4E618BF05f40c3967De52FA33e3c4
   > block number:        11455195
   > block timestamp:     1664309766
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             1.176419436093813889
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
   > transaction hash:    0x38b26926a9a95795059815d4191878f829b32f1d34e245153e4e159d47e4bb3d
   > Blocks: 0            Seconds: 8
   > contract address:    0x84B58BD2A61D8F698F93882a1c77B1F2f13bd01a
   > block number:        11455197
   > block timestamp:     1664309796
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             1.141089346093813889
   > gas used:            3487241 (0x353609)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.03487241 ETH


   Deploying 'SquareVerifier'
   --------------------------
   > transaction hash:    0x4375dbd1a8a99ebb9183c66e203938110e22bb9eb6eb2841c8b619ecc1377a93
   > Blocks: 0            Seconds: 8
   > contract address:    0x112275C321B6A56442ea4b7C0E93C34e65263Ac4
   > block number:        11455198
   > block timestamp:     1664309811
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             1.130972966093813889
   > gas used:            1011638 (0xf6fb6)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.01011638 ETH


   Deploying 'ERC721MintableVerifier'
   ----------------------------------
   > transaction hash:    0x5f21b05a4edae0c6f5f0ea859d755da7d6eff0cb8512af9d3a1d25757940740a
   > Blocks: 1            Seconds: 12
   > contract address:    0x536AaC184F8b97c074ad4259B0C6021c00E02f30
   > block number:        11455199
   > block timestamp:     1664309826
   > account:             0x91f8A34a3De20f8E5A6BD42f0D0d1278B3693836
   > balance:             1.088480416093813889
   > gas used:            4249255 (0x40d6a7)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.04249255 ETH

   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.08748134 ETH

Summary
=======
> Total deployments:   4
> Final cost:          0.08984404 ETH

```

## Testing
```
~/Desktop/code/blockchain/RealEstateMarketplace/eth-contracts/truffle test 

Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.


  Contract: ERC721Mintable
    ✔ Minting working properly (1165ms)
    ✔ Contract deployed properly
    ✔ Should return token uri (83ms)
    ✔ Should return total supply
    ✔ Should return balance of tokens per account owner
    ✔ Should transfer token from one owner to another (90ms)
    ✔ Should fail when minting when address is not contract owner (160ms)
    ✔ Mint to address work properly (150ms)
    ✔ Set approval allows a third party to transfer tokens (148ms)
    ✔ Set approval for specific token allows the approver to transfer the specified token (173ms)
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
