// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleUint {
    uint256 public myUint; // 0 - (2^256)-1
    uint8 public myUint8 = 254; //255 is maximum
    int public myInt = -10;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementUint() public {

        unchecked{
    myUint--;
        } //  if in a unchecked block if integer exceed the limit not throw error and roll back to edge values
    
    }

    function incrementUint8() public{
        myUint8++; // if try to increment more than 255 throws an error
    }

    function incrementInt() public {
        myInt++;
    }
}