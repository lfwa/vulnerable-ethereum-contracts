pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    function kill(address n) public {
        address x = n;
        require(msg.sender == x); // not a guard
        selfdestruct(msg.sender);
    }
}
