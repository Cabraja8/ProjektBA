// eslint-disable-next-line no-undef
const bet = artifacts.require("bet");

module.exports = function(deployer) {
  deployer.deploy(bet);
};