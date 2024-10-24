// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

//inheritance dalam solidity ada:
//single inheritance        orangtua => anak                     Mewarisi dari satu kontrak.
//multilevel inheritance    nenek => orangtua  => anak           Mewarisi dari kontrak yang juga merupakan turunan dari kontrak lain.
//hierarhial inheritance    orangtua => anak1, anak2             Mewarisi di mana satu kontrak induk diwarisi oleh beberapa kontrak anak
//multiple inheritance      orangtua1, orangtua2 => anak         Mewarisi dari beberapa kontrak.

contract A {
    function getAValue() external pure returns (string memory){
        return "Contract A dipanggil";
    }
}

contract B is A {
    function getBValue() external pure returns (string memory){
        return "Contract A dipanggil";
    }
}

contract C is B {
    function getCValue() external pure returns (string memory){
        return "Contract A dipanggil";
    }
}

contract caller {
    C contractC = new C();

    function warisan() public view returns(string memory, string memory, string memory){
        return (contractC.getAValue(), contractC.getBValue(), contractC.getCValue());
    }
}