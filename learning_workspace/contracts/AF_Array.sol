// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

 //array da yang fixed dan dynamic

contract FixedArray{
    //fixed
   function getDataArray() public pure returns (uint[5] memory){
    uint [5] memory namaArray = [uint(50), 60, 70, (80), 100];
    return namaArray;
  //return namaArray[1]; maka akan muncul 60

   }
}

contract FixedArray2{
    //stateVar
    uint[5] namaArray;

   function getDataArray() public returns (uint){//tidak pakai pure, pure digunakan saat memodifikasi nilai di lokal
    namaArray = [uint(50), 60, 70, 80, 100];
    return namaArray[1];

   }
}

contract DynamicArray{

    //mengisi array menggunakan inline
    uint[] data;

    function getData1() public returns (uint[] memory){
        data = [12, 34, 56, 7];

        return data;
    }


    //mengisi array menggunakan 'new'
    uint[] data2;

    function getData2() public returns(uint[] memory){
        data2 = new uint[](5);
        data2[0] = 10;
        data2[1] = 20;
        data2[2] = 30;
        data2[3] = 40;
        data2[4] = 50;

        return (data2);
    }
}


//property array dalam solidity ada length, push, pop dan lain2
//length
contract ArrayLength{
    uint[7] data;

    function array_example() public payable returns (uint[7] memory){
        data = [uint(10),20,30,40,50];
        return data;
    }

    function array_length() public returns(uint){
        uint x = data.length;
        return x;
    }
}

//push
contract pushArray{
    uint[] arr;

    function insert() public returns (uint[] memory){
        arr = [1,2,3];

        arr.push(4);
        arr.push(5);
    
        return arr;
    }
}

//pop
contract popArray{
    uint[] arr;
    function hapusSatu() public returns (uint[] memory){
        arr = [1, 2,3];
        arr.pop();

        return arr;
    }
}

//contoh yang lain yang lebih lengkap
contract AllExample {
    uint[] public dynamicArray; // Array dinamis di storage

    // Menambahkan elemen ke array
    function addElement(uint _value) public {
        dynamicArray.push(_value); // Menggunakan push
    }

    // Menghapus elemen terakhir dari array
    function removeLastElement() public {
        dynamicArray.pop(); // Menggunakan pop
    }

    // Mengambil panjang array
    function getArrayLength() public view returns (uint) {
        return dynamicArray.length; // Menggunakan length
    }

    // Menghapus elemen di indeks tertentu
    function deleteElement(uint _index) public {
        delete dynamicArray[_index]; // Menggunakan delete
    }
}