const artifacts = require('truffle-artifacts');
const Migrations = artifacts.require("Migrations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};