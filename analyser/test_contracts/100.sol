pragma solidity ^0.5.0;

// SAFE

contract Contract {
    address payable user;
    address payable owner;

    function registerUser() public {
        user = msg.sender;
    }

    function kill() public {
        registerUser();
        owner = user;
        require(msg.sender == owner); // not a guard
        selfdestruct(msg.sender);
    }
}
