// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

    //adress = noRekeneing / id
    //smart contract memiliki address
    //ada 2 jenis address (biasa dan payable) sama2 32byte

    // adress payable 
    // send dan tranfer

//menampilkan address account
contract AddressContract{
 
    address public caller;

    function getCallerAddress() public returns(address){
        caller = msg.sender; //msg.sender adalah build in dari solidity

        return caller;
    } 
}

//cara lain yang lebih ringkas
contract CaraLain {

    function getCallerAddress1() public view returns (address caller){
        caller =  msg.sender;
    }
}

// Address Contract nya
contract CaraLain2{

    function getAddress() public view returns(address){
        address myAddress = address(this);
        return myAddress;
    }
}

//payable digunakan utk transaksi(send dan transfer) send mengembalikan boolean, tranfer utk memunculkan atau mengecualikan eksekusi
//contoh dibawah ini akan error karena smart contract harus memiliki saldo yang cukup untuk mengeksekusi address yang payable
//agar tidak error isilah saldo smart contract dengan fungsi receiveEther()
contract AddressPayable{

    //mengembalikan "erorr" jika saldo smart contract kurang
    function transferFund(address payable _address, uint nominal) public {
        _address.transfer(nominal);
    }

    //mengembalikan nilai false jika saldo smart contract kurang
    function sendFund(address payable _address, uint nominal) public returns(bool){
        bool success = _address.send(nominal);
         require(success, "Transfer failed");         // Jika gagal, revert transaction
        return success;                               // Mengembalikan true jika berhasil
    }


    //fungsi utk tambah saldo smart contract
    uint receivedAmount;
    function receiveEther() payable public {
        receivedAmount = msg.value;
    }
}