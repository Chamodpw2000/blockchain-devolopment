// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleConstructor{
    address public myAddress;



    function setMyAddress(address _myAddress) public {
        myAddress = _myAddress;
    }


    function setMyAddressWithMsgSender() public {
        myAddress = msg.sender;
    }


    constructor()  {

        myAddress = msg.sender;
       
    }
}