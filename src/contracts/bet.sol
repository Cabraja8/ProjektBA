// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./Ownable.sol";
import "./ATM.sol";
import "./console.sol";

contract bet is ATM, Ownable {

    event NewBet(
        address addy, 
        uint amount, 
        Team teamBet
    );

    struct Bet {
        string name;
        address addy;
        uint amount;
        Team teamBet;
    }

    struct Team {
        string name;
        uint totalBetAmount;
    }

    Bet[] public bets;
    Team[] public teams;
    
    address payable conOwner;
    uint public totalBetMoney = 0;

    mapping (address => uint) public numBetsAddress;

    constructor() payable {
        conOwner = payable(msg.sender);
        teams.push(Team("Cloud9", 0)); 
        teams.push(Team("Fnatic", 0)); 
        teams.push(Team("Rogue", 0)); 
        teams.push(Team("G2 Esports", 0)); 
        teams.push(Team("T1", 0)); 
        teams.push(Team("Gen.G", 0)); 
        teams.push(Team("DWG KIA", 0)); 
        teams.push(Team("EDward Gaming", 0)); 
        teams.push(Team("Team Liquid", 0)); 
        teams.push(Team("TSM", 0)); 
        teams.push(Team("Invictus Gaming", 0)); 
        teams.push(Team("Team WE", 0)); 
        teams.push(Team("Misfits Gaming", 0)); 
        teams.push(Team("Schalke 04 Esports", 0)); 
        teams.push(Team("Origen", 0)); 
        teams.push(Team("Vitality", 0)); 
    }

    function createTeam(string memory _name) public {
        teams.push(Team(_name, 0));
    }

    function getTotalBetAmount(uint _teamId) public view returns (uint) {
        return teams[_teamId].totalBetAmount;
    }
    
    
    function createBet(string memory _name, uint _teamId) external payable {       
    require(msg.sender != conOwner, "Owner can't make a bet");
    require(numBetsAddress[msg.sender] == 0, "You have already placed a bet");
    require(_teamId < teams.length, "Invalid team ID");
    require(msg.value > 0.01 ether, "Bet more");

    deposit();

    bets.push(Bet(_name, msg.sender, msg.value, teams[_teamId]));

    teams[_teamId].totalBetAmount += msg.value;

    numBetsAddress[msg.sender]++;
    
    (bool sent, bytes memory data) = conOwner.call{value: msg.value}("");
    require(sent, "Failed to send Ether");

    totalBetMoney += msg.value;

    emit NewBet(msg.sender, msg.value, teams[_teamId]);
}

function teamWinDistribution(uint _teamId) public payable onlyOwner() {
    require(_teamId < teams.length, "Invalid team ID");

    deposit();
    uint div;

    for (uint i = 0; i < bets.length; i++) {
        if (keccak256(abi.encodePacked((bets[i].teamBet.name))) == keccak256(abi.encodePacked(teams[_teamId].name))) {
            address payable receiver = payable(bets[i].addy);
            div = (bets[i].amount * (10000 + (getTotalBetAmount(_teamId) * 10000 / totalBetMoney))) / 10000;

            (bool sent, bytes memory data) = receiver.call{value: div}("");
            require(sent, "Failed to send Ether");
        }
    }

    totalBetMoney = 0;

    for (uint i = 0; i < teams.length; i++) {
        teams[i].totalBetAmount = 0;
    }

    for (uint i = 0; i < bets.length; i++) {
        numBetsAddress[bets[i].addy] = 0;
    }
}
}