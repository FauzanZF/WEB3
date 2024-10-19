// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

//lokasi dimana data variable harus disimpan
//lokasi data mempengaruhi gass fee

//jenis2 lokasi data: 
// storage : permanen; berada di state dan di dalam fungsi2; gass lumayan mahal
// memory : sementara; lebih murah
// calldata : tidak dapat dimodifikasi, tidak konsisten; lokasi default parameter
// stack : tidak dapat dimodifikasi, tidak konsisten;

contract DataLocation {
    //storage
    uint stateStorage;
    // uint storage stateStorageSaya; akan error

    //memory
    function kalkulasi(uint a, uint b) public pure returns (uint hasil){
        return a + b ;
        //var lokal dengan tipe nilai disimpan ke memory
    }
}

contract Location {
    //storage
    bool isReady;

    function iniFungsi() public view  {
        //values akan disimpan di memory karena di lokal variable
        bool isOke = true;
     // bool memory isOke; akan error
        uint number = 123 ;
        address akun = address(0);

         // hiraukan kode dibawah ini, karena dibuat agar tidak ada peringatan error karena local var tidak digunakan
        if (isOke) {
            number = 456;
            akun = msg.sender;
        }
    }
    
}

contract Local {
    uint public stateVariable = 10;
    uint stateVariable2 = 20;

    function iniFungsi() public returns (uint){
        stateVariable = stateVariable2;
        stateVariable2 = 30;//tidak langsung merubah statevariable line 14
        return stateVariable; //20
    }
}

contract contoh1 {
    uint  stateVar = 10;
    function iniFungsi() public returns (uint) {
        uint localVar = 20; //memory 
        stateVar = localVar;//merubah stateVar
        localVar = 40;//tidak mampu menjangkau stateVar

        return stateVar;//20 
    }
}

contract contoh2 {
    uint stateVar = 10;//storage

    function iniFungsi() public returns (uint){
        uint localVar = 20;//memory

        localVar = stateVar;
        stateVar = 40; //tidak berpengaruh

        return localVar;
    }
}

//khusus bertipe array/referenceType harus menambahkan 'memory' sebelum nama variable
contract L3 {
    function iniFungsi() public pure returns(uint[] memory, uint[] memory){
        uint[] memory localMemoryArray1 = new uint[](3);

        localMemoryArray1[0] = 4;
        localMemoryArray1[1] = 5;
        localMemoryArray1[2] = 6;

        uint[] memory localMemoryArray2 = localMemoryArray1;
        localMemoryArray1[0] = 10;//typeReference tidak dapat menyalin, tetapi tipe values bisa menyalin

        return(localMemoryArray1, localMemoryArray2);
        
    }

    function iniValue() public pure returns (uint){
        uint localVar1 = 10;
        uint localVar2 = 20;

        localVar1 = localVar2;
        localVar1 = 40;

        return localVar1; //20
        
    }
}
