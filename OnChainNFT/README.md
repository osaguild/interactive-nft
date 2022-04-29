# on chain nft

## spec
- it has three types that are type a, b and c.
  - you can mint the nft by specifying the type
- the background of the nft depends on owner's vote counts
  - zero votes becomes white
  - one votes becomes blue
  - two votes becomes yello
  - over three votes becomes red

## set up
- `truffle init`
- `truffle create contract OnChainNFT`
- `npm init`
- `npm install @openzeppelin/contracts`

## compile and deploy
- `truffle develop`
- `compile`
- `migrate`

## sample script
- mint
  - OnChainNFT.deployed().then(instance=>{instance.mint("001").then(res=>{console.log(res)})})
- vote
  - OnChainNFT.deployed().then(instance=>{instance.vote(accounts[0],{from:accounts[1]}).then(res=>{console.log(res)})})
- get voters
  - OnChainNFT.deployed().then(instance=>{instance.getVoteCounts(accounts[0]).then(res=>{console.log(res.toString())})})