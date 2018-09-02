pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";

contract FarashaCoin is StandardToken,BurnableToken {
  string public constant name = "Farasha";
  string public constant symbol = "FLB";
  uint8 public constant decimals = 18;

  uint256 public constant INITIAL_SUPPLY = 250000000 * (10 ** uint256(decimals)); // 250 Millions token remaining

  /**
   * @dev Constructor that gives msg.sender all of existing tokens.
   */
  constructor() public {
   // _mint(msg.sender, INITIAL_SUPPLY);
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    emit Transfer(address(0), msg.sender, INITIAL_SUPPLY); 
  }


}
