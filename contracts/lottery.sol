pragma solidity ^0.4.24;

contract Lotty {
    // 1. 管理员:负责开奖和提奖
    address public manager;
    // 2. 彩民池: address[] players
    address[] public players;
    // 3. 当前期数: round,每期结束后加一
    uint256 public round;

    constructor() public{
        manager = msg.sender;
    }

    // 实现投注函数
    // 1.每个人可以投多次
    function play() public payable{
        require(msg.value == 1 ether);
        // 2.把参与者加入到彩民池中
        players.push(msg.sender);
    }

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }
    
    function getPlayers() public view returns(address[]){
        return players;
    }

}