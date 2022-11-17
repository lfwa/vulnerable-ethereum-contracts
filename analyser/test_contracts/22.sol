pragma solidity ^0.5.0;

contract Contract {
  uint x;

  function set(uint z) public {
    x = z;
  }


  function destroy() public payable {
    uint current = x; //tainted because of tainted field dependence
    require(address(0x00) == msg.sender); //guard
    selfdestruct(address(current)); //not safe
  }

}