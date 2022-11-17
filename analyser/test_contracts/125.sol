pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    function kill(uint256 n) public {
        uint256 tmp = -n;
        require(msg.sender == address(tmp)); // guard
        selfdestruct(msg.sender);
    }
}
