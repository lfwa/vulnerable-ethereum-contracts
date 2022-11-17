pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    uint256 owner;
    uint256 user;

    function mix(uint256 x, uint256 y) public {
        owner = x;
        user = y;
    }

    function kill() public {
        require(msg.sender == address(owner)); // not a guard
        require(msg.sender == address(user)); // not a guard
        selfdestruct(msg.sender);
    }
}
