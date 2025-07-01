// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract SampleContractPayble {
    string public myString = "Hellow World";

    function updateString(string memory _newString) public payable {
        if(msg.value == 1){
        myString = _newString;
        }else{
            payable(msg.sender).transfer(msg.value);
        }
        
    }
}

