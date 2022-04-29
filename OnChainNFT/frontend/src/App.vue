<template>
  <div id="app">
    <div id="canvas">
      <div id="count">{{ count }}</div>
    </div>
  </div>
</template>

<script>
import { ethers } from "ethers";

export default {
  name: "App",
  data() {
    return {
      address: "0x9970b41aA75530A92D96591D08fCa405acb62A09",
      abi: [
        "function getVoteCounts(address _owner) external view returns (uint256)",
      ],
      currentAccount: null,
      count: 0,
    };
  },
  mounted: async function () {
    await this.connectWallet();
    await this.getVoteCounts();
  },
  methods: {
    getVoteCounts: async function () {
      try {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const Contract = await new ethers.Contract(
          this.address,
          this.abi,
          provider
        );
        this.count = await Contract.getVoteCounts(this.currentAccount);
      } catch (error) {
        console.log("failed contract", error);
      }
    },
    connectWallet: async function () {
      try {
        if (!window.ethereum) {
          alert("you need metamask to use Dapp");
          return;
        }
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const accounts = await provider.send("eth_requestAccounts", []);
        console.log("Connected", accounts[0]);
        this.currentAccount = accounts[0];
      } catch (error) {
        console.log("reject your connection request", error);
      }
    },
  },
};
</script>

<style>
#canvas {
  position: fixed;
  top: 0;
  left: 0;
  z-index: -1;
  width: 420px;
  height: 420px;
  background-color: lightskyblue;
}
#count {
  position: absolute;
  display: block;
  top: 30%;
  left: 20%;
  right: 20%;
  height: 50px;
  border: none;
  text-align: center;
  background-color: lightcyan;
}
</style>
