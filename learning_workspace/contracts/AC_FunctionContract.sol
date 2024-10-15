// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;


contract HelloWorld{
    //struktur
    //fun + namaFun + kurung + access modifier + pure + return + bentukKembalian + memory=state var(sementara)
    // pure(mengembalikan 1 kali saja )
    function cetakHello() public pure returns(string memory){
        return 'Hello World';
    }
}

//function ini tanpa pure yaitu menggunakan local var
contract Penjumlahan{
    uint hasil;

    function tambah(uint a, uint b)public {
        //local
        uint temp = a + b;
        hasil = temp;
    }
    function getHasil() public view returns(uint){
        return hasil;
    }
}

//payable memungkinkan contract menerima ether
contract PayableContract{
    uint receivedAmount;

    //menerima ether dari value
    function reeivedEther() payable public{
        receivedAmount = msg.value;
    }
    //view untuk menampilkan
    function getTotalAmount()public view returns(uint){
       return receivedAmount;
    }

    //overload memungkinkan nama function sama tetapi parameternya harus beda. tidak boleh ada "return"
    function tambah(uint a, uint b) public pure returns(uint hasil){
        hasil = a + b;
    }
    function tambah(uint a, uint b, uint c) public pure returns(uint hasil){
        hasil = a + b + c;
    }

}
