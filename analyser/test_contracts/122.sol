pragma solidity ^0.5.0;

// SAFE

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

    function kill() public {
        taintUser1(address(0xDEADBEEF));
        require(msg.sender == user); // guard
        selfdestruct(msg.sender);
    }
}
