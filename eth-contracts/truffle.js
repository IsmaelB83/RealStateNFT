const HDWallet = require('truffle-hdwallet-provider');
//const HDWalletProvider = require('truffle-hdwallet-provider');
//const fs = require('fs');
//const mnemonic = fs.readFileSync(".secret").toString().trim();
//const infuraKey = fs.readFileSync(".infura-key").toString().trim();


module.exports = {
    /**
     * Networks define how you connect to your ethereum client and let you set the
     * defaults web3 uses to send transactions. If you don't specify one truffle
     * will spin up a development blockchain for you on port 9545 when you
     * run `develop` or `test`. You can ask a truffle command to use a specific
     * network from the command line, e.g
     *
     * $ truffle test --network <network-name>
     */

    networks: {
        development: {
            host: "127.0.0.1",          // Localhost (default: none)
            port: 8545,                 // Standard Ethereum port (default: none)
            network_id: "*", 
            gasPrice: 10000000, 
            gasLimit: 3141592000000     // Any network (default: none)
        },
        rinkeby: {
            provider: function() { 
            	return new HDWallet(mnemonic, infuraKey, 0); 
	    },
            skipDryRun: true,
            network_id: 4,
            gas: 6900000,
            gasPrice: 10000000000
        }
    },

    mocha: {
        timeout: 100000
    },

    // Configure your compilers
    compilers: {
        solc: {
        //version: ">=0.4.2",    // Fetch exact version from solc-bin (default: truffle's version)
        version: "0.5.2",    // Fetch exact version from solc-bin (default: truffle's version)
        // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
        // settings: {          // See the solidity docs for advice about optimization and evmVersion
        //  optimizer: {
        //    enabled: false,
        //    runs: 200
        //  },
        //  evmVersion: "byzantium"
        // }
        }
    }
}

