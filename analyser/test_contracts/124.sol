pragma solidity ^0.5.0;

// SAFE

contract Contract {
    uint256 owner;

    function negate() public {
        owner = -owner;
    }

    function kill() public {
        negate();
        require(msg.sender == address(owner)); // guard
        selfdestruct(msg.sender);
    }
}
