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
        require(msg.sender == address(factorial(10))); // not a guard
        selfdestruct(msg.sender);
    }
}
