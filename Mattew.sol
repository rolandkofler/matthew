pragma solidity ^0.4.4;

// ## Mattew - a contract for increasing "whaleth"
// README: https://github.com/rolandkofler/mattew
// MIT LICENSE 2016 Roland Kofler, thanks to Crul for testing

contract Mattew {
    address owner;
    address whale;
    uint256 blockheight;
    uint256 period = 5; //BLOCKS_PER_DAY;
    uint constant DELTA = 0.1 ether;
    bool mustBeDestroyed = false;
    uint newPeriod = 5;
    
    event MattewWon(string msg, address winner, uint value,  uint blocknumber);
    event StakeIncreased(string msg, address staker, uint value, uint blocknumber);
    
    function Mattew(){
        owner = msg.sender;
        setFacts();
    }
    
    function setFacts() private {
        period = newPeriod;
        blockheight = block.number;
        whale = msg.sender;
    }
    
    /// The rich get richer, the whale get whaler
    function () payable{
        if (block.number - period >= blockheight){
            bool isSuccess = whale.send(this.balance - DELTA);
            MattewWon("Mattew won", whale, this.balance, block.number);
            setFacts();
            if (mustBeDestroyed) selfdestruct(whale); 
            return;
            
        }else{
            
            if (msg.value < this.balance + DELTA) throw;
            bool isOtherSuccess = msg.sender.send(this.balance);
            setFacts();
            StakeIncreased("stake increased", whale, this.balance, blockheight);
        }
    }
    
    // better safe than sorry
    function destroyWhenRoundOver() onlyOwner{
        mustBeDestroyed = true;
    }
    
    // next round we set a new staking perioud
    function setNewPeriod(uint _newPeriod) onlyOwner{
        newPeriod = _newPeriod;
    }
    
    function getPeriod() constant returns (uint){
        period;
    }
    
    //how long until a Mattew wins?
    function getBlocksTillMattew() public constant returns(uint){
        if (blockheight + period > block.number)
            return blockheight + period - block.number;
        else
            return 0;
    }
    
    modifier onlyOwner(){
        if (msg.sender != owner) throw;
        _;
    }
}
