pragma solidity ^0.5.0;

// SAFE

contract Contract {
    function kill() public {
        selfdestruct(address(0));
    }
}
