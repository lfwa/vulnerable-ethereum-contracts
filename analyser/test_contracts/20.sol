pragma solidity ^0.5.0;

// the contract is vulnerable
// the output of your analyzer should be Tainted
contract Contract {
  address payable user;


  function changeOwner(address payable newOwner) public {
    require(msg.sender == user); // guard
    selfdestruct(newOwner); //safe
  }

}
