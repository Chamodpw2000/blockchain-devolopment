(async() => {
    const address = "0x93f8dddd876c7dBE3323723500e83E202A7C96CC"
    const abiArray = [
	{
		"inputs": [],
		"name": "myuint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyUint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];

    const contractInstance = new web3.eth.Contract(abiArray, address);

    console.log(await contractInstance.methods.myuint().call());

    let accounts = await web3.eth.getAccounts();
    let txResult = await contractInstance.methods.setMyUint(500).send({from:accounts[0]});
    console.log(await contractInstance.methods.myuint().call());
    console.log(txResult);


})()