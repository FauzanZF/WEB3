// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

contract VariableTypes{
    //state variable adalah variabel yang disimpan secara permanen di blockchain
    //menyimpan nilai hasil penjumlahan
    uint sum;

    //local variable adalah variabel yang hanya ada selama eksekusi fungsi
    function tambah(uint num1, uint num2) public {
        //local var
        uint temp = num1 + num2;

        sum = temp;
    }

    //menampilkan hasil
    function getHasil()public view returns(uint){
        return sum;
    }
}

//tipe-tipe data
contract Types {
    bool public valid = true;
    int32 public angkaInt = -32;
    uint public angkaUint = 1; //uint tidak bisa berniliai negatif
    uint32 public ui_data = 14_10_2024;

    uint8 result;
    function tambah() public {
        result = 3.5 + 1.5;
    }

    //bytes 1 sampai 32. jika ingin lebih bisa memakai string. tetapi bytes gas nya lebih sedikit
    bytes1 public huruf = "A";
    string public kalimat = "ini adalah string"; 

    //enum
    enum jobs {programer, analys, security}
    function getEnum() public pure returns (jobs){
        return jobs.analys;
    }

}