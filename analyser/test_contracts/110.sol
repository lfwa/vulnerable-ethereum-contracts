pragma solidity ^0.5.0;

// SAFE

contract Contract {
    function kill() public {
        assert(msg.sender == address(0xDEADBEEF)); // guard
        selfdestruct(msg.sender);
    }
}
