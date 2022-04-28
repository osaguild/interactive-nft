// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract OnChainNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address[] private _owners;
    mapping(address => Counters.Counter) private _voteCounts;

    constructor() ERC721("on chanin token", "OCT") {}

    function mint(string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        _owners.push(msg.sender);

        return newItemId;
    }

    function vote(address _to) external {
        _voteCounts[_to].increment();
    }

    function getVoteCounts(address _owner)
        external
        view
        returns (uint256)
    {
        uint256 voteCounts = _voteCounts[_owner].current();

        return voteCounts;
    }
}
