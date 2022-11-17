pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    function foo(uint256 x) public returns (uint256) {
        if (x < 10) {
            return x + 10;
        } else {
            return x - 10;
        }
    }

    function kill(uint256 x) public {
        uint256 b = foo(x);
        require(msg.sender == address(b)); // not a guard
        selfdestruct(msg.sender);
    }
}
