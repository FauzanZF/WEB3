// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

//jenis2 contract dalam solidity:
//public : semua bisa akses
//external : tidak dapat diakss internal, hanya eksternal
// internal: hanya contract ini dan contract derbing yang bisa akses 
// private : hanya bisa diakses di contract ini

//constructor akan dijalankan pertama di kontrak itu

contract Parent{
    uint private data;

    uint public info;

    constructor(){
        info = 10;
    }
    //pure untuk mengembalikan 1 kembalian
    function increment(uint a)private pure returns(uint) {return a + 1;}
    function setIncrement() public pure returns(uint) {return increment(2);}

    //public
    function updateData(uint a) public {data = a;}
    function getData() public view returns (uint ) {return data;}
    function compute(uint a, uint b) internal pure returns(uint){return a + b;}
}

//External Contract
contract External{
    function readData() public returns (uint){
        Parent c = new Parent();
        c.updateData(7);
        return c.getData();
    }
}

//inheritance = diwarisi
contract Baru is Parent{
    uint private result;
    Parent private c;

    constructor(){
        c = new Parent();
    }

    function getComputeResult() public {
        result = compute(3,5);
    }

    function getResult() public view returns(uint){return result;}
    function getDataBaru()public view returns(uint){return c.info();}
}