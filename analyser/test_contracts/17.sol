pragma solidity ^0.5.0;
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
  	       if(msg.sender == address(0x1)){ //a guard
	       		     E(msg.value);
		} else {
		       x = owner;
		}
  	 } else {
	   	E(msg.value);
    	   	require(x == owner); //a guard in trace A, B, C, D

  	}
  }

  function E(uint x) public payable {
  	  x = x + 1;

  }
}