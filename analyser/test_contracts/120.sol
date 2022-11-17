pragma solidity ^0.5.0;

// SAFE

contract Contract {
    function foo(uint256 x) public returns (uint256) {
        if (x < 10) {
            return 0;
        } else {
            return 1;
        }
    }

    function kill(uint256 x) public {
        uint256 b = foo(x);
        require(msg.sender == address(b)); // guard
        selfdestruct(msg.sender);
    }
}
