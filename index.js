// Import .env file
require('dotenv').config();
// Node imports
const Web3 = require('web3');

// Proof from zokrates
const proof = require('./zokrates/code/square/proof.json');

// Connection to goerly
const { INFURA_SECRET, INFURA_KEY, PRIVATE_KEY, PUBLIC_KEY, CONTRACT_ADDRESS } = process.env;

console.log(INFURA_SECRET);

const GOERLY_CONNECTION = `https://:${INFURA_SECRET}@goerli.infura.io/v3/${INFURA_KEY}`;
const web3 = new Web3(GOERLY_CONNECTION);

// Contract
const artifact = require("./eth-contracts/build/contracts/SolnSquareVerifier.json");
const contract = new web3.eth.Contract(artifact.abi, CONTRACT_ADDRESS);
web3.eth.defaultAccount = PUBLIC_KEY;

contract.methods.symbol().call().then(console.log);
console.log(web3.eth.defaultAccount);

// Mint one token
async function main(tokenId) {

    const { a, b, c } = proof.proof;
    const { inputs } = proof;

    // Next nonce transaction
    const nonce = web3.eth.getTransactionCount(web3.eth.defaultAccount, 'latest');
    // Prepare transaction
    const tx = {
        'from': web3.eth.defaultAccount,
        'to': CONTRACT_ADDRESS,
        'nonce': nonce,
        'gas': 500000,
        'data': contract.methods.mintNewNFT(web3.eth.defaultAccount, tokenId, a, b, c, inputs).encodeABI()
    };
    // Send sign transaction
    web3.eth.accounts.signTransaction(tx, PRIVATE_KEY)
    .then(result => {
        web3.eth.sendSignedTransaction(result.rawTransaction, (error, tx) => {
            if (error)
                return console.log(`Error ${error}`);
            console.log(`Transaction sent without errorrs ${tx}`); 
        });
    })
}

// Mint tokenId 50
main(70);