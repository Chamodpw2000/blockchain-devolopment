// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;



contract WalletProject {

    address payable owner;
    uint funds;
    mapping (address => bool) allowance;

    function setAllowance(address _address , bool _allowance) public  {
        require(msg.sender==owner);
        allowance[_address] =  _allowance;
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable {

        funds += msg.value;

     }


    //  function spendMoney(address payable  _address , uint _amount) public payable {


    //     require(msg.sender == owner || allowance[msg.sender],"You Are Not Authorized To Do This Action");
    //     require(address(this).balance >= _amount , "No Enough Balance To Perform This Transaction");
    //     _address.transfer(_amount);



        
    //  }

    function spendMoney(address payable _to , uint _amount, bytes memory _payload) public  returns(bytes memory){
        require(msg.sender == owner , "Unauthorized");
        (bool success,  bytes memory returnData ) = _to.call{value:_amount}(_payload);
        require(success,"Aborting Not Successfull");
        return returnData;
    }


}