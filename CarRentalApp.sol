// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This is a backend of a car rental Dapp 

//create a struct with renter parameters antd then integrate with mapping
contract CarRentalApp{
    address owner;

     constructor(){
         owner = msg.sender;
     }

struct Renter {
    address payable walletaddress;
    string firstname;
    string lastname;
    bool canrent;
    bool active;
    uint due;
    uint balance;
    uint StartTime;
    uint EndTime;

 }

mapping (address => Renter) public renters;

//Create a function to add renter
function addRenter (address payable walletaddress, string memory firstname, string memory lastname, bool canrent, bool active, uint due,uint balance, uint start,uint end ) public {
 renters[walletaddress] = Renter  (walletaddress, firstname, lastname, canrent, active, due, balance, start, end);
}
//create a function to checkout/book
function checkout(address walletaddress)public{
    require(renters[walletaddress].due == 0, "you have pending balance");
    require(renters[walletaddress].canrent == true, "you cannot rent the car now");
    renters[walletaddress].active = true;
    renters[walletaddress].StartTime = block.timestamp;
}
//create a function to checkin
function checkin (address walletaddress)public{
    require(renters[walletaddress].active = true);
    renters[walletaddress].EndTime = block.timestamp;
    renters[walletaddress].active = false;
  
}
//create a function to track renter timespan (total time of bike usage)
function renterTimespan(uint StartTime, uint EndTime) public pure returns(uint){
    return StartTime - EndTime;
}
//create a function to set the due function
function getTotalDuration(address walletAddress)public view returns(uint){
    require(renters[walletAddress].active == false, "car is currently checked out.");
    uint timespan = renterTimespan(renters[walletAddress].StartTime, renters[walletAddress].EndTime);
    uint timespanInMinutes = timespan / 60;
    return timespanInMinutes;}

//create a function to check can/cannot rent
function canRent(address walletaddress) public view returns(bool){
    return renters[walletaddress].canrent;
}
//create a function to deposit funds
function deposit(address walletaddress) payable public{
    renters[walletaddress].balance += msg.value;
}
//create a function to make payments
function makePayment(address walletaddress) payable public{
    require(renters[walletaddress].due > 0,"you do not have due" );
    require(renters[walletaddress].balance > msg.value, "you don't have enough funds to proceed");
    renters[walletaddress].due = 0;
    renters[walletaddress].canrent = true;
    renters[walletaddress].StartTime = 0;
    renters[walletaddress].EndTime = 0;
    renters[walletaddress].balance = msg.value;
}

 }
