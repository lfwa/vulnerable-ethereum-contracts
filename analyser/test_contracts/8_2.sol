pragma solidity ^0.5.0;

// the contract is safe
// the output of your analyzer should be Safe
contract Contract {
  int y;
  address owner;
  function foo(int x) public {
    y = x;  // y becomes trusted after seeing the guard
    if(msg.sender == owner) {  // guard
      // ...
    }
  }
}
