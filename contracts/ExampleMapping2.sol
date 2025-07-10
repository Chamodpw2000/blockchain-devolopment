// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleMappingWithdrawls {


    mapping(address => uint) public balance;



    function sendMoney(address _address , uint _amount) public payable {
        balance[_address] += _amount;
    }

    function sendMoneyToMyAccount(uint _amount) public payable {

        balance[msg.sender] += _amount;

    }





    function getBalance() public view returns (uint) {
        return balance[msg.sender];   
    }

    function geBalanceFromAddress (address _address) public view returns (uint){

        return balance[_address];
    }



    function withdrawAllMoney(address payable _to) public {
        uint balanceToSendOut =  balance[msg.sender];
  
        balance[msg.sender]= 0;
              _to.transfer(balanceToSendOut);
    }

    function withdrawMoney(uint _amount)  public {

        if(balance[msg.sender] < _amount){
            return;
        }

         payable(msg.sender).transfer(_amount);



    }



}