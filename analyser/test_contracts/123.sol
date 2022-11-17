pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    address user;

    function taintUser1(address newUser) public {
        taintUser2(newUser);
    }

    function taintUser2(address newUser) public {
        taintUser3(newUser);
    }

    function taintUser3(address newUser) public {
        taintUser4(newUser);
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
