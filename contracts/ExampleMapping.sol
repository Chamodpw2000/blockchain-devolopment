// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;



contract ExampleMapping{
    mapping(uint => bool) public myMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    mapping(uint => mapping(uint => bool)) public uintUintBoolMapping;


    function setUintUintBoolMapping(uint _x, uint _y , bool _value) public {
        uintUintBoolMapping[_x][_y] = _value;
    }

    


}