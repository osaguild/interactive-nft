const OnChainNFT = artifacts.require("OnChainNFT");
const Osaguild = artifacts.require("Osaguild");

module.exports = async function(deployer) {
  await deployer.deploy(Osaguild);
  await deployer.deploy(OnChainNFT);
};
