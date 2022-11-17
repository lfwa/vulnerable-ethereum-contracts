pragma solidity ^0.5.0;
//test if "revert" end of a function introduces field taints

contract Contract {
  address payable owner;
  address payable x;

  function foo(address payable y) public {
  	x = y; //taint x temporarily
	require(y == msg.sender);
	x = owner;
  }
  function bar() public {
    selfdestruct(owner);    // safe
  }
}