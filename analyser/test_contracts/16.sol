pragma solidity ^0.5.0;

contract Contract {
  address payable owner;
  function foo(int x) public {
    if(x < 5) {                  // not guard
      require(msg.sender == owner); //guard
      owner = msg.sender;
    }
    selfdestruct(owner);
  }
}