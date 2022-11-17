pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    function foo(address n) public returns (address) {
        return n;
    }

    function kill(address n) public {
        require(msg.sender == foo(n)); // not a guard
        selfdestruct(msg.sender);
    }
}
