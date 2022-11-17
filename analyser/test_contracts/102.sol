pragma solidity ^0.5.0;

// TAINTED

contract Contract {
    address payable owner;
    address user1;
    address user2;

    function foo(address newUser) public {
        user1 = newUser;
    }

    function kill() public {
        user2 = user1;
        address tmpUser = user2;
        require(msg.sender == owner || tmpUser == address(0xDEADBEEF));
        selfdestruct(msg.sender);
    }
}
