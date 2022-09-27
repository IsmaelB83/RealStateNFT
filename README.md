# Udacity Blockchain Capstone
The capstone will build upon the knowledge gained in the course in order to build a decentralized housing product. 

## Download, install and compile contracts
```
~/Desktop/code/blockchain/git clone https://github.com/IsmaelB83/RealStateNFT

~/Desktop/code/blockchain/RealStateNFT/npm install

~/Desktop/code/blockchain/RealStateNFT/truffle compile

```

## Deployment

```
~/Desktop/code/blockchain/RealEstateMarketplace/eth-contracts/truffle deploy

Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.


Starting migrations...
======================
> Network name:    'development'
> Network id:      1664222401401
> Block gas limit: 6721975 (0x6691b7)


2_deploy_contracts.js
=====================

   Deploying 'ERC721Mintable'
   --------------------------
   > transaction hash:    0x2cc564ea86b24f3195890bf5b47c335118ba3f6b9bef2cfafd4e6274642040bb
   > Blocks: 0            Seconds: 0
   > contract address:    0xC1FDe150e6b7b1DAb423439fF307cF77d4855513
   > block number:        165
   > block timestamp:     1664308829
   > account:             0x99fb0Ab83f638Af30B3433f1F785a4E34903832D
   > balance:             99.99893430212
   > gas used:            3474041 (0x350279)
   > gas price:           0.01 gwei
   > value sent:          0 ETH
   > total cost:          0.00003474041 ETH


   Deploying 'SquareVerifier'
   --------------------------
   > transaction hash:    0xd15535d52785324920477a3f889785993a008db2798211714a00cc673a2569fc
   > Blocks: 0            Seconds: 0
   > contract address:    0x26D855baBe360691461c4f7F111bfab29fFAEeE8
   > block number:        166
   > block timestamp:     1664308829
   > account:             0x99fb0Ab83f638Af30B3433f1F785a4E34903832D
   > balance:             99.99892418574
   > gas used:            1011638 (0xf6fb6)
   > gas price:           0.01 gwei
   > value sent:          0 ETH
   > total cost:          0.00001011638 ETH


   Deploying 'ERC721MintableVerifier'
   ----------------------------------
   > transaction hash:    0x9b018e1328ef35d1f4057631b80b5412aca558e5edfc8857dfa27970a49824a0
   > Blocks: 0            Seconds: 0
   > contract address:    0x0bD6c3512E58237233F04439898838f296D0013e
   > block number:        167
   > block timestamp:     1664308829
   > account:             0x99fb0Ab83f638Af30B3433f1F785a4E34903832D
   > balance:             99.99888185219
   > gas used:            4233355 (0x40988b)
   > gas price:           0.01 gwei
   > value sent:          0 ETH
   > total cost:          0.00004233355 ETH

   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:       0.00008719034 ETH

Summary
=======
> Total deployments:   3
> Final cost:          0.00008719034 ETH
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
