pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    address payable owner;

    function factorial(uint256 n) public returns (uint256) {
        if (n <= 0) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }

    function kill(uint256 n) public {
        address fact = address(factorial(n));
        if (msg.sender == fact) {
            // not a guard
        } else {
            // not a guard
        }
        selfdestruct(msg.sender);
    }
}
