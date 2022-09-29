// Imports
const truffleAssert = require('truffle-assertions');
const SolnSquareVerifier = artifacts.require("SolnSquareVerifier");

// Proof from zokrates
const proof = require('../../zokrates/code/square/proof.json');

// Test
contract("SolnSquareVerifier", accounts => {

    let contract;

    before('Prepare tests', async function () {
        contract = await SolnSquareVerifier.deployed();
    });

    it("Add new solution to contract", async function () {
        const { a, b, c } = proof.proof;
        const { inputs } = proof;
        let tx = await contract.addSolution(accounts[0], a, b, c, inputs);
        truffleAssert.eventEmitted(tx, 'AddedSolutionEvent', ev => (true));
    });

    it("Test minting token with valid solution", async function () {
        const { a, b, c } = proof.proof;
        const { inputs } = proof;
        await contract.mintNewNFT(accounts[0], 2, a, b, c, inputs);            
        assert.equal((await contract.totalSupply.call()).toNumber(), 1, "Error minting token");
    });
});