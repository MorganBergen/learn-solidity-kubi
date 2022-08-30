/*

The following contract implements the most primitive form of a cryptocurrency.
The contract allows only its reactor to create new coins.
Anyone can send coins to each other without a need to registering with a username and password, all you need is an Ethereum keypair.

*/

// SPDX-License-Identifier:  GPL-3.0
pragma solidity ^0.8.4;

contract Coin {
    // keyword public declares minter as a public member state/variable which can be viewed by anyone.
    // accessible from other contracts
    address public minter;
    mapping(address => uint256) public balances;

    // Events allow clients to react to specific contract changes you declare
    event Sent(address from, address to, uint256 amount);

    // Coin becomes constructed when the contract is deployed.
    constructor() {
        minter = msg.sender;
    }

    // sends an amount of newly created coins to an address, but can only be called by the contract creator.
    function mint(address receiver, uint256 amount) public {
        // asserting that an amount of newly created coins to an address
        require(msg.sender == minter);

        // increment the balance of the receiver by the amount of coins
        balances[receiver] += amount;
    }

    // Errors allow you to provide informtion about why an operation failed.  They are returned to the caller of the function.
    error InsufficientBalance(uint256 request, uint256 available);

    // what is error?  is it a data type?  or does it work analagous to an assert statement?
}