const OnChainNFT = artifacts.require("OnChainNFT");

module.exports = async function(deployer) {
  await deployer.deploy(OnChainNFT);
};
