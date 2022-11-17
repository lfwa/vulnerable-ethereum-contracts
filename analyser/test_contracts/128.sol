pragma solidity ^0.5.0;

// SAFE

contract Contract {
    address user;

    function taintUser1(address newUser) public {
        user = address(0xDEADBEEF);
    }

    function taintUser4(address newUser) public {
        user = newUser;
    }

    function kill(address usr) public {
        taintUser1(usr);
        require(msg.sender == user); // not a guard
        selfdestruct(msg.sender);
    }
}
