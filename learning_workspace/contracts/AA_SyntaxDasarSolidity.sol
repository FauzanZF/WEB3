// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;


//hello world!
contract HelloWorld {
    string public message;

    constructor() {
        message = "Hello, World!";
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}

//basic syntax
contract BasicSyntax{
    uint storedData;

    //melakukan set data
    function set(uint x) public {
        storedData = x ;
    }

    //menampilkan data
    function get() public view returns (uint) {
        return storedData ;
    }
}