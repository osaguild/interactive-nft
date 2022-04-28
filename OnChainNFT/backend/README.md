# on chain nft back end

## set up
- `truffle init`
- `truffle create contract OnChainNFT`
- `npm init`
- `npm install @openzeppelin/contracts`


## compile and deploy
- `truffle develop`
- `compile`

## sample script
- mint
  - OnChainNFT.deployed().then(instance=>{instance.mint("001").then(res=>{console.log(res)})})
- vote
  - OnChainNFT.deployed().then(instance=>{instance.vote(accounts[0],{from:accounts[1]}).then(res=>{console.log(res)})})
- get voters
  - OnChainNFT.deployed().then(instance=>{instance.getVoteCounts(accounts[0]).then(res=>{console.log(res.toString())})})
