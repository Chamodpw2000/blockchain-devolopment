// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount){
        from = _from;
        amount = _amount;
    }


}



contract Wallet {
    PaymentReceived public payment;
    function payContract() public payable {
        payment = new PaymentReceived(msg.sender,msg.value);
    }
}


contract Wallet2 {
    struct PaymentReceivedStruct {
        address from;
        uint amount;
    }
PaymentReceivedStruct public payment;
    function payContract() public payable {
        //payment = PaymentReceviewStruct(msg.sender , msg.value);
        payment.from = msg.sender;
        payment.amount = msg.value;

        

    }
}





