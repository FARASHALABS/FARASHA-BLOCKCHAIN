pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";


import './FarashaCoin.sol';

contract FLBFoundation is Ownable {
  
  FarashaCoin public flb; // token Farasha
  address public flbAddress = 0xadb5230926c3f10f17FECd1974394E6296b1cE0E; // The address of FarashaCoin contract (mainnet)	
  address public foundation = 0x78786FAd2bb4cf3C99c8CEbD3bE5b91ADFB2D466; // address of the foundation Farasha
  uint256 public defrostTime;
  
  constructor() public {
    flb = FarashaCoin(flbAddress);	
    defrostTime = 1569276000; // tokens are frost until 24 September 2019
  }
  
  function sendToFoundation() public onlyOwner {
    require(now>=defrostTime);
    
    flb.transfer(foundation,flb.balanceOf(address(this)));
  
  }
	
  function emergency() public onlyOwner 
  { // In case of bug or emergency, resend all tokens to initial sender
	flb.transfer(owner,flb.balanceOf(address(this)));
  }

}
