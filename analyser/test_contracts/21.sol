pragma solidity ^0.5.0;

contract Contract {
  uint x;
  uint y;


  function destroy(address payable beneficiary) public payable {
    if(beneficiary == msg.sender){
    } else {
    	require(msg.sender == address(0x0));
    	x = msg.value + y;
    }
    require(address(x) == msg.sender); //guard
    selfdestruct(beneficiary); //safe
  }

}
