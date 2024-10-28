// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

abstract contract Abstract {
    function getAngka(uint a, uint b) public virtual;

    function hitung() public view virtual returns (uint);
}

contract Hitung is Abstract {
    
    uint panjang;
    uint lebar;

    function getAngka(uint a, uint b) public override {
        panjang = a;
        lebar = b;
    }

    function hitung() public view override returns (uint) {
        return panjang * lebar;
    }
}
