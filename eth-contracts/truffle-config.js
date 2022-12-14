// Import .env file
require('dotenv').config();
// Node imports
const HDWalletProvider = require("@truffle/hdwallet-provider")

// Constants
const { INFURA_SECRET, INFURA_KEY, MNEMONIC } = process.env;
const RINKEBY_CONNECTION = `https://:${INFURA_SECRET}@rinkeby.infura.io/v3/${INFURA_KEY}`;
const GOERLY_CONNECTION = `https://:${INFURA_SECRET}@goerli.infura.io/v3/${INFURA_KEY}`;

module.exports = {

    contracts_build_directory: "./build/contracts",

    networks: {
        development: {
            network_id: '*',
            host: "127.0.0.1",          
            port: 8545,
        },
        rinkeby: {
            provider: () => new HDWalletProvider(MNEMONIC, RINKEBY_CONNECTION),
            network_id: 4,
            gas: 4500000,
            gasPrice: 10000000000
        },
        goerly: {
            provider: () => new HDWalletProvider(MNEMONIC, GOERLY_CONNECTION),
            network_id: '5',
            gas: 4465030,
            gasPrice: 10000000000,
        }
    },

    mocha: {
        timeout: 100000
    },

    compilers: {
        solc: {
            version: "0.5.2"
        }
    }
}

