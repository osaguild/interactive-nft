<template>
  <div id="app">
    <div id="canvas" v-bind:style="{backgroundColor: backgroundColor}">
      <div>TYPE A</div>
    </div>
  </div>
</template>

<script>
import { ethers } from "ethers";

export default {
  name: "App",
  data() {
    return {
      address: "0x833c9f7e5a70614081b8e11351544295d0b3ab62",
      abi: [
        "function getVoteCounts(address _owner) external view returns (uint256)",
      ],
      currentAccount: null,
      backgroundColor: null,
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

        const count = await Contract.getVoteCounts(this.currentAccount);

        if (count == 1) {
          this.backgroundColor = "lightskyblue";
        } else if (count == 2) {
          this.backgroundColor = "lightyellow";
        } else if (count >= 3) {
          this.backgroundColor = "lightpink";
        }
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
  text-align: center;
  font-size: 70px;
  font-family: sans-serif;
}
#canvas div {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
}
</style>
