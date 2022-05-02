// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./Osaguild.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/Counters.sol";

contract OnChainNFT {
    using Counters for Counters.Counter;

    // owner's vote counts list
    mapping(address => Counters.Counter) private _voteCounts;

    // vote to owner
    function vote(address _owner) external {
        _voteCounts[_owner].increment();
    }

    function getVoteCounts(address _owner) external view returns (uint256) {
        uint256 voteCounts = _voteCounts[_owner].current();
        return voteCounts;
    }
}
