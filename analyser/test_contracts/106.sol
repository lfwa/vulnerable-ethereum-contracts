pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    address payable owner;

    function foo(int256 n) public {
        if (n < 10) {
            // not a guard
            return; // escape guard
        }
        require(msg.sender == owner); // guard
    }

    function kill(int256 n) public {
        foo(n);
        selfdestruct(msg.sender);
    }
}
