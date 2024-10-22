// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

contract Contoh{
    uint value;

    //setelan default constructor sudah public jadi tidak perlu ditulis "public"
    constructor() {
        value = 10;
    }

    function getValue() public view returns(uint){
        return value;
    }
}

//hanya beberapa address yg bisa akses
contract tokenSaya{
    int totalSupply ;

    address private owner =  0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//address paling awal

    constructor(int _totalSupply) {
        if(msg.sender == owner){
        totalSupply = _totalSupply;
      }
    }

    function getTotalSupply() public view returns(int){
        return totalSupply;
    }
}