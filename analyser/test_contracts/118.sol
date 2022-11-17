pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    uint256 owner;
    uint256 user;

    function mix(uint256 x, uint256 y) public returns (uint256, uint256) {
        return (x, y);
    }

    function kill(uint256 x, uint256 y) public {
        (owner, user) = mix(x, y);
        require(msg.sender == address(owner));
        selfdestruct(msg.sender);
    }
}
