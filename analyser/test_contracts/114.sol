pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    uint256 owner;

    function mix(uint256 n) public {
        owner = owner + n;
    }

    function kill() public {
        require(msg.sender == address(owner)); // not a guard
        selfdestruct(msg.sender);
    }
}
