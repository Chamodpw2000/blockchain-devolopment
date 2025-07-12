// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract MyContract {

    uint public myuint = 123;
     function setMyUint(uint newUint) public {
        myuint = newUint;
     }

}