// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract StartStopUpdateExample{
    receive() external payable { }

    function destroySmartContract() public {
        selfdestruct(payable(msg.sender)); // when destroying the smart contract all the remaining money moved to this account
    }
}