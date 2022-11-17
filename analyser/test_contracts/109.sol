pragma solidity ^0.5.0;

// SAFE

contract Contract {
    function foo(uint256 x) public returns (uint256) {
        return 1;
    }

    function kill() public payable {
        uint256 n = msg.value;
        n = foo(n);
        require(msg.sender == address(n)); // guard since x is overwritten.
        selfdestruct(msg.sender);
    }
}
