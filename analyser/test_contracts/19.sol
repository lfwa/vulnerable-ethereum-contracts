pragma solidity ^0.5.0;

// the contract is vulnerable
// the output of your analyzer should be Tainted
contract Contract {
  address payable user;
  address payable owner;

  function registerUser() public {
    user = msg.sender;
  }

  function changeOwner(address payable newOwner) public {
    address payable x;
    if(msg.sender == newOwner){
    	x = user;
    } else {
      	x = newOwner;
    }
    owner = x;
  }

  function kill() public {
    selfdestruct(owner); // vulnerable
  }
}
