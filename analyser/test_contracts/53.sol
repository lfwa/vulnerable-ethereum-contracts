pragma solidity ^0.5.0;

// SAFE

contract Contract {
    address payable owner;

    function factorial(uint256 n) public returns (uint256) {
        if (n <= 0) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }

    function kill() public {
        address fact = address(factorial(0));
        if (msg.sender == fact) {
            // guard
        } else {
            // guard
        }
        selfdestruct(msg.sender);
    }
}
