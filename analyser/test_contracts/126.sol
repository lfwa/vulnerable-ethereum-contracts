pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    address payable user;
    address payable owner;

    function registerUser(address payable newUser) public {
        user = newUser;
    }

    function kill(address payable newUser) public {
        registerUser(newUser);
        owner = user;
        require(msg.sender == owner); // not a guard
        selfdestruct(msg.sender);
    }
}
