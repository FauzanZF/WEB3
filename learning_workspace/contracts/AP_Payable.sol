// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

//payable digunakan agar bisa transfer dan deposit
contract Payable {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    //deposit dari akun ke smart contract
    function deposit() public payable{

    }

    //mengecek balance smart contract
    function getAmount() public view returns (uint) {
        uint amount = address(this).balance;

        return amount;
    }

    //mengirim saldo dari smart contract ke akun
    function withdraw() public {
        uint amount = address(this).balance;

        (bool succes,) = owner.call{value: amount}("");
        require (succes, "Failed kirim eth ke owner");
    }

    //mengirim saldo dari akun ke akun lain
    function tranfer(address payable _to, uint _amount) public {
        (bool succes,) = _to.call{value: _amount}("");
        require(succes, "Failed kirim eth ke owner");
    }
}