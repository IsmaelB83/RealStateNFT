// Imports
const expect = require('chai').expect;
const { assert } = require('chai');
const truffleAssert = require('truffle-assertions');
const ERC721Mintable = artifacts.require('ERC721Mintable');


// Available Accounts
// ==================
// account[0]   -  0x99fb0Ab83f638Af30B3433f1F785a4E34903832D
// account[1]   -  0x5dD7a0e663A6C7d0508416854e44E9acF6937Eee
// account[2]   -  0xE46666E8D2c9EE0F6170938298bBF349613f454C
// account[3]   -  0x667643664B481fB801e351D6ffBA3D88CA6ea77d
// account[4]   -  0xacb1A249f046143A7DF900408eaeACe296CF84C1
// account[5]   -  0xAe76E4EA4Ca4A609cf39bcA850792714C032C762
// account[6]   -  0x4abc37C1CeDf3d5Ca3f15122a30585c824fb55a9
// account[7]   -  0xB3da9b85551D41d1adCBb718F3b6c8b6DC6fe980
// account[8]   -  0x6656a2Ca68Ef6a7F53EEFE45d92916132F4f44db
// account[9]   -  0xC9b569a4246F8Ea8662B0a795A0562a2a9F8e5dd
// account[10]  -  0xF1FE089069dF35C2cE9aF63cA04d9a479ab88C98
// account[11]  -  0x5Fed1ee0BaeFbB1D76719f21632aEE7360DCcf94
// account[12]  -  0x71F0b0b5C13DB51099678C0608269663748B0c5f

contract('ERC721Mintable', accounts => {

    const contract_owner = accounts[0];
    const account_one = accounts[1];
    const account_two = accounts[2];
    const account_three = accounts[3];
    const account_four = accounts[4];
    const account_five = accounts[5];
    const baseTokenURI = "https://s3-us-west-2.amazonaws.com/udacity-blockchain/capstone/";
    const tokensIds = [10, 20, 30, 40, 50, 60, 70, 80];
    let contract;

    before('Prepare tests', async () => {
        contract = await ERC721Mintable.deployed();
    })

    it('Minting working properly', async () => {    
        for (let i = 0; i < tokensIds.length; i++) {
            await contract.mint(contract_owner, tokensIds[i], {from: contract_owner});
        }
        assert.equal((await contract.tokensOfOwner(contract_owner)).length, tokensIds.length);
    })
 
    it('Contract deployed properly', async () => {
        assert.equal(await contract.name(), "ERC721Mintable");
        assert.equal(await contract.symbol(), "ERC");
        assert.equal(await contract.baseTokenURI(), baseTokenURI);
    })

    it('Should return token uri', async () => { 
        for (let i = 0; i < tokensIds.length - 1; i++) {
            assert.equal(await contract.tokenURI(tokensIds[3]), `${baseTokenURI}${tokensIds[3]}`);
        }
    })

    it('Should return total supply', async () => { 
        assert.equal(Number(await contract.totalSupply()), tokensIds.length);
    })

    it('Should return balance of tokens per account owner', async () => { 
        assert.equal(Number(await contract.balanceOf(contract_owner)), tokensIds.length);
    })

    it('Should transfer token from one owner to another', async () => { 
        try {
            let tx = await contract.transferFrom(contract_owner, account_one, tokensIds[0]);
            truffleAssert.eventEmitted(tx, 'Transfer', (ev) => {
                return ev.to == account_one;
            });
            assert.equal(await contract.ownerOf(tokensIds[0]), account_one);
        } catch (error) {          
            console.log(error)
        }
    })

    it('Should fail when minting when address is not contract owner', async () => { 
        let flagError = false;
        try {
            await contract.mint(account_one, 100, {from: account_one});
        } catch (error) {
            flagError = true;
        }
        assert.equal(flagError, true, "NFT Minted not by contract owner");
    })

    it('Mint to address work properly', async () => {
        await contract.mint(account_one, 100, { from: contract_owner });
        assert.equal(await contract.ownerOf(100), account_one);
    })

    it('Set approval allows a third party to transfer tokens', async() => {
        await contract.setApprovalForAll(account_two, true, {from: account_one});
        await contract.transferFrom(account_one, account_three, 100, {from: account_two});
        assert.equal(await contract.ownerOf(100), account_three);
    })

    it('Set approval for specific token allows the approver to transfer the specified token', async() => {
        let errorFlag = false;
        try {
            await contract.transferFrom(contract_owner, account_five, 80, {from: account_four});
        } catch (error) {
            errorFlag = true;
        }
        assert.equal(errorFlag, true, "Without approval a third party cannot transfer external tokens")
        await contract.approve(account_four, 80, {from: contract_owner});
        await contract.transferFrom(contract_owner, account_five, 80, {from: account_four});
        assert.equal(await contract.ownerOf(80), account_five);
    })
});

