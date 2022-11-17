pragma solidity ^0.5.0;

// SAFE

contract Contract {
    uint256 owner;
    uint256 user;

    function mix() public {
        owner = owner + user;
    }

    function kill() public {
        require(msg.sender == address(owner)); // guard
        selfdestruct(msg.sender);
    }
}
