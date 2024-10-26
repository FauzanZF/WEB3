// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28 ;

//inheritance dalam solidity ada:
//single inheritance        orangtua => anak                     Mewarisi dari satu kontrak.
//multilevel inheritance    nenek => orangtua  => anak           Mewarisi dari kontrak yang juga merupakan turunan dari kontrak lain.
//hierarhial inheritance    orangtua => anak1, anak2             Mewarisi di mana satu kontrak induk diwarisi oleh beberapa kontrak anak
//multiple inheritance      orangtua1, orangtua2 => anak         Mewarisi dari beberapa kontrak.

contract A {
    uint internal a;

    function getA(uint _value) external {
        a = _value;
    }
}

contract B {
    uint internal b;

    function getB(uint _value) external {
        b = _value;
    }
}

//beda dengan sebelumnya, is lebih dari satu
contract C is A,B {
    function getValueOfSum() external view returns(uint){
        return a + b;
    }
}

contract caller {
    C contractC = new C();

    function warisan() public returns(uint){
        contractC.getA(10);
        contractC.getB(20);

        return contractC.getValueOfSum();
    }
}