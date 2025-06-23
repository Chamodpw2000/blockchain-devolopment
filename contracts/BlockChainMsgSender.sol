// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract BlockChainMsgSender {

    string text;
    uint  public changers;
  function viewtext() public returns(string memory) {
    changers++;
    return text;
  }

  function updateText(string memory _text) public {
    require(msg.sender==owner);
    text = _text;
  }

    address owner;
    constructor(){
        owner = msg.sender;
    }




}