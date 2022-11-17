pragma solidity ^0.5.0;
//an example where not using nesting level 4 would make a difference: the execution of D for trace (A, B, C, D) and (A, B, C, D, D) would be the same in that case, causing D's input to be labelled as "not dependent on msg.sender" (because it doesn't in A, B, C, D, D) and consequently required(x == owner) is not considered a guard, rendering the selfdestruct in A vulnerable.

contract Contract {
  address payable owner;
  function A() public {
  	B(msg.sender);
	selfdestruct(msg.sender); //Safe
  }
  function B(address payable x) public {
  	C(x);
  }
  function C(address payable x) public {
  	 D(x);
  }
  function D(address payable x) public payable {
  	 if(msg.value <= 10){ //not a guard
  	       require(msg.sender == address(0x1)); //a guard
	       D(address(msg.value));
  	 } else {
    	   	require(x == owner); //a guard in trace A, B, C, D

  	}
  }
}