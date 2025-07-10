// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;


contract MappingStructExample {

struct Transaction{
    uint ammount;
    uint timestamp;
}


struct Balance {
    uint totalBalance;
    uint numDeposits;
    mapping(uint => Transaction) deposits;
    uint numWithdrawals;
    mapping (uint => Transaction) withdrowals;
}

mapping (address=>Balance) public balances;

function getDepositNum(address _from , uint _numDeposit) public view returns (Transaction memory){
    return balances[_from].deposits[_numDeposit];
}


function getWithdrawlsNum(address _from , uint _numWithdrawls) public view returns (Transaction memory){
    return balances[_from].withdrowals[_numWithdrawls];
}

function depositMoney() public payable {

balances[msg.sender].totalBalance += msg.value;
Transaction memory deposit = Transaction(msg.value, block.timestamp);
balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
balances[msg.sender].numDeposits ++;
}

function withdrawMoney() public payable {
    balances[msg.sender].totalBalance -= msg.value;
    Transaction memory withdrawal   = Transaction(msg.value, block.timestamp);
    balances[msg.sender].withdrowals[balances[msg.sender].numWithdrawals] = withdrawal;
    balances[msg.sender].numDeposits ++;
    balances[msg.sender].numWithdrawals ++;

}

}