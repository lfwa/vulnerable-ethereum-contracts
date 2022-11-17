pragma solidity ^0.5.0;

// SAFE

contract Contract {
    address payable owner;
    address payable x;

    function foo1(address payable y) public {
        x = y;
    }

    function foo2() public {
        require(msg.sender == owner); // guard
        owner = x;
        selfdestruct(msg.sender);
    }

    function foo3() public {
        selfdestruct(owner); // vulnerable
    }
}
