// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Election {
    uint256 public totalVotes; // by standard 256 bits = 32 bytes. So you can use just uint or uint256
    uint256 public blankVotes; // 32 bytes
    address payable public owner; // 20 bytes

    mapping(uint => uint256) public cadidateVoteCount;
    mapping(address => bool) public voters;

    event Vote(address indexed _voter);

    constructor() payable {
        owner = payable(msg.sender);
        cadidateVoteCount[70] = 0;
        cadidateVoteCount[71] = 0;
        cadidateVoteCount[72] = 0;
    }

    function vote(uint _candidateId) public {       
        require(msg.sender != owner, "Owner can't vote");         
        require(!voters[msg.sender], "You have already voted");
        voters[msg.sender] = true;
        totalVotes += 1;
        if(_candidateId == 70 || _candidateId == 71 || _candidateId == 72) {
            cadidateVoteCount[_candidateId] += 1;
            return;
        }
        blankVotes += 1;
    }
}
