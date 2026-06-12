// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public payer;
    address public recipient;
    uint256 public amount;

    constructor(address _recipient) {
        payer = msg.sender;
        recipient = _recipient;
    }

    function deposit() external payable {
        amount += msg.value;
    }

    function release() external {
        require(msg.sender == payer);
        payable(recipient).transfer(amount);
    }
}
