// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    enum statuses{vacant, occupied}

    statuses public currentStatus;

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = statuses.vacant;
        }

    modifier onlyWhileVacant() {
        require(currentStatus == statuses.vacant, "already booked by someone");
        _;
    }

    modifier costs(uint256 _amount){
        require(msg.value > 0.4 ether, "you have to pay 0.4 ether");
        _;
    }

    function book()payable public onlyWhileVacant costs(0.4 ether){
        currentStatus = statuses.occupied;
    }
}
    
