pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    function kill(uint256 n) public {
        selfdestruct(address(n));
    }
}
