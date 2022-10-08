// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
-create a map which holds names
-create a kinda database using mapping and struct, incl title and author
-create mybook function (ownership verification using address) using nested map
*/
 contract mappings {
     mapping(uint256 => string) public name;

     constructor(){
     name[1] = "robbin";
     name[2] = "kene";

 }

 
mapping(uint256 => Book) public books;
 struct Book{
     string title;
     string author;
 }

 function addbooks(uint _id, string memory _title, string memory _author) public {
    books[_id] = Book (_title, _author);
 }

mapping(address => mapping(uint256 => Book)) public mybook;
 function addmybook(uint _id, string memory _title, string memory _author) public {
  mybook [msg.sender] [_id] = Book(_title, _author);
 }

    
 }
