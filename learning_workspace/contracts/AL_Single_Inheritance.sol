// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

//inheritance dalam solidity ada:
//single inheritance        orangtua => anak                     Mewarisi dari satu kontrak.
//multilevel inheritance    nenek => orangtua  => anak           Mewarisi dari kontrak yang juga merupakan turunan dari kontrak lain.
//hierarhial inheritance    orangtua => anak1, anak2             Mewarisi di mana satu kontrak induk diwarisi oleh beberapa kontrak anak
//multiple inheritance      orangtua1, orangtua2 => anak         Mewarisi dari beberapa kontrak.

//inheritance dasar
    contract OrangTua1{
        //state ini bisa diturunkan
        uint internal id;

        function setValue(uint _value) public {
            id = _value;
        }
    }

    //contract ini adalah contract turunan dari OrangTua
    contract anak is OrangTua1{
        function getValue() public view returns(uint){
            return id;
        }
    }


//single Inheritance
    contract OrangTua2{

        uint internal id;

        function setValue(uint _value) external {
            id = _value;
        }
    }

    contract anak2 is OrangTua2{
        function getValue() external view returns(uint){
            return id;
        }
    }

    contract caller2{
        anak2 saudara = new anak2();

        function warisan(uint _input) public returns(uint){
            saudara.setValue(_input);
            return saudara.getValue();
        }
    }


