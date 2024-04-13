const artifacts = require('truffle-artifacts');
const bet = artifacts.require("bet.sol");

module.exports = function(deployer) {
  deployer.deploy(bet);
};