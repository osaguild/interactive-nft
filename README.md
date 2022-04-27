# interactive-nft
test code and tips for interactive nft on open sea

## what is interactive nft?
- not static nft like image file
- interactive means clickable and 

## steps to create interactive nft
- create metamask account
- get eth on Rinkby network
- connect metamask to [opensea testnet](https://testnets.opensea.io/)
- create opensea collection
- create interactive nft
- upload interactive nft to pinata
- create metadata for token uri
- upload metadata to opensea via contract

# project1. first interactive nft

## development
- contract: `./FirstNFT/contracts/Osaguild.sol`
- nft: `./FirstNFT/nft/index.html`
- token uri: `./FirstNFT/nft/tokenURI.json`
- image: `./FirstNFT/nft/opensea.002.png`

## upload nft
- upload `index.html` and `opensea.002.png` to pinata as interactive nft
- add upload file uri to `tokenURI.json`
- upload `tokenURI.json` to pinata

## deploy
- deploy `Osaguild.sol` on remix
- mint nft setting `tokenURI.json` uri as tokenURI

## check nft
- open [opensea testnet](https://testnets.opensea.io/account) and check your collection


# tips

## how to get eth on rinkeby
- access [rinkeby faucet](https://www.rinkeby.io/#faucet)
- tweet your address and copy tweet link paste it in the input field
- click `give me ether` and chose amount of ether
- some time rinkeby faucet does not work, then you can use [chain link](https://faucets.chain.link/rinkeby)
- visit chain link and set address and check `0.1 test ETH`
- click `send request`
- check your wollet and get 0.1 eth

## how to upload nft to pinata
- open [pinata](https://app.pinata.cloud/)
- click `upload`
- choose file
- set name like `FirstNFT`
- click `upload`

## how to deploy contract on remix
- open [remix](https://remix.ethereum.org/)
- create new contract like `Osaguild.sol`
- select `solidity compiler` menu and compile contract
- select `deploy & run transactions` menu and connect metamask
- click `deploy`
- contract is deployed

## how to mint on remix
- deploy contract on remix
- select `deploy & run transactions` menu
- check `deployed contracts` menu and find mint function
- input parameter and click button like `mint`
- nft is minted