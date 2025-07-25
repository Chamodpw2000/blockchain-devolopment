//SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

abstract contract ERC20 {

    function transferFrom(address _from , address _to, uint _value) public virtual returns (bool success);
    function decimals() public virtual view returns(uint8);

}


contract TokenSale {
    uint tokenPriceInWei = 1 ether;

    ERC20 token;

    address tokenOwner;

    constructor(address _token){
        tokenOwner = msg.sender;
        token = ERC20(_token);
    }

    function purchaseACoffee() public payable {
        require(msg.value >= tokenPriceInWei, "Not Enough money sent");
        uint tokensToTransfer = msg.value / tokenPriceInWei;
        uint reminder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokensToTransfer* 10 ** token.decimals());
        payable(msg.sender).transfer(reminder);

    }




}