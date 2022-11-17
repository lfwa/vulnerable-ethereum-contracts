pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    address user1;
    address user2;
    address user3;
    address user4;
    address user5;

    function taintUser1(address newUser) public {
        user1 = newUser;
    }

    function taintUser2() public {
        user2 = user1;
    }

    function taintUser3() public {
        user3 = user2;
    }

    function taintUser4() public {
        user4 = user3;
    }

    function taintUser5() public {
        user5 = user4;
    }

    function kill() public {
        require(msg.sender == user5); // not a guard
        selfdestruct(msg.sender);
    }
}
