// Imports
const truffleAssert = require('truffle-assertions');
// Own imports
const ERC721Mintable = artifacts.require('ERC721Mintable');


contract('ERC721Mintable', accounts => {

    const contract_owner = accounts[0];
    const account_one = accounts[1];
    const account_two = accounts[2];
    const account_three = accounts[3];
    const account_four = accounts[4];
    const account_five = accounts[5];
    const baseTokenURI = "https://erc721mintable-ibernal.s3.amazonaws.com/";
    const tokensIds = [10, 20, 30, 40, 50, 60, 70, 80];
    let contract;

    before('Prepare tests', async () => {
        contract = await ERC721Mintable.deployed();
    })

    it('Minting working properly', async () => {    
        for (let i = 0; i < tokensIds.length; i++) { 
            await contract.mint(accounts[0], tokensIds[i], {from: accounts[0]}); 
        }
        assert.equal((await contract.tokensOfOwner(contract_owner)).length, tokensIds.length);
    })
 
    it('Contract deployed properly', async () => {
        assert.equal(await contract.name(), "ERC721Mintable");
        assert.equal(await contract.symbol(), "REN");
        assert.equal(await contract.baseTokenURI(), baseTokenURI);
        console.log(await contract.baseTokenURI());
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

