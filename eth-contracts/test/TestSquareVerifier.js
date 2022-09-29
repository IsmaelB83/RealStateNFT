// Imports
const SquareVerifier = artifacts.require('SquareVerifier');

// Proof from zokrates
const proof = require('../../zokrates/code/square/proof.json');
   
// Test verification with incorrect proof
contract('SquareVerifier', accounts => {

    let contract;

    before('Prepare tests', async () => {
        contract = await SquareVerifier.deployed();
    })

    it('Verify with wrong proof', async function () {
        const { a, b } = proof.proof;
        const { inputs } = proof;
        assert.equal(await contract.verifyTx.call(a, b, a, inputs), false, 'Error in verifier. This proof shouldnt be accepted')
    })

    it('Verify with correct proof', async function () {
        const { a, b, c } = proof.proof;
        const { inputs } = proof;
        assert.equal(await contract.verifyTx.call(a, b, c, inputs), true, 'Error in verifier. This proof should be correct')
    })
})
