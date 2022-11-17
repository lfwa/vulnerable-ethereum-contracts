pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    function kill(uint256 n) public {
        assert(msg.sender == address(n)); // not a guard
        selfdestruct(msg.sender);
    }
}
