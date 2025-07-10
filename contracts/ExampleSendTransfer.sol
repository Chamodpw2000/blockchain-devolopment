// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;


contract Sender {

    receive() external payable { }

    function withdawTransfer(address payable _to) public {
       _to.transfer(10);
    }

    function withdrawSend(address payable _to) public {
         bool isSent = _to.send(10);
         require(isSent,"Sending funds unsuccessful");
    }



}



contract ReceverNoAction {
    function balance() public view returns(uint) {
        return address(this).balance;
    }


    receive() external payable { }
}




contract ReceiverAction {
    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value;
     }

     function balance() public view returns(uint){
        return address(this).balance;
     }
}