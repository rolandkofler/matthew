pragma solidity ^0.4.4;

/**
 * ## Mattew - a contract for increasing "whaleth"
 * 
 * The rich get richer, 
 * the WHALE get WHALER
 * ╭━━━━━━━━╮┏━╮╭━┓
 * ┃┈┈┈┈┈┈┈┈┃╰╮╰╯╭╯
 * ┃╰╯┈┈┈┈┈┈╰╮╰╮╭╯┈
 * ┣━━╯┈┈┈┈┈┈╰━╯┃┈┈
 * ╰━━━━━━━━━━━━╯┈┈
 * 
 * In sociology, the Matthew effect (or accumulated advantage) 
 * is the phenomenon where "the rich get richer and the poor get poorer. 
 * - https://en.wikipedia.org/wiki/Matthew_effect 
 *
 * This contract helps with this process by rewarding the richest player.
 *
 * ### Description 
 * 
 * 1. A player sends ether to the contract address
 * 2a. If the amount is too low it fails
 * 2b. If the amount at least +1 ETH is higher than the STAKE
 *      and send within PERIOD since the last pay-in
 *      then the sender receives the last STAKE but pays in his STAKE.
 *      
 *                      
 *                      1ΞΞΞΞΞΞΞΞΞ*Period over
 *              1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
 *           2ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ      1ΞΞΞΞΞΞΞΞΞ*Period over
 *           ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ  1ΞΞΞΞΞΞΞΞΞΞΞΞΞ
 *      1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ1ΞΞΞΞΞ...
 * 
 *      Figure: The STAKE gets higher until nobody pays in for > PERIOD
 * 
 * 2c. If the grace PERIOD is over and nobody increased the STAKE, 
 *      the last STAKE wins all the Ether
 * 3. Contract gets destroyed Experiment over.
 * 
 **/
 
contract Mattew {
    address whale;
    uint256 stake;
    uint256 blockheight;
    uint256 constant BLOCKS_PER_DAY= 86400 * 15;
    uint256 constant PERIOD = 10 minutes; //BLOCKS_PER_DAY;
    
    event MattewWon(address winner, uint value,  uint blocknumber);
    event StakeIncreased(address staker, uint value, uint blocknumber);
    
    function Mattew(){
        setFacts();
    }
    
    function setFacts() private {
        stake = msg.value;
        blockheight = block.number;
        whale = msg.sender;
    }
    
    /// The rich get richer, the wale get waler
    function () payable{
        if (block.number - PERIOD > blockheight){
            bool isSuccess = msg.sender.send(msg.value + stake);
            MattewWon(msg.sender, stake, block.number);
            setFacts();
            return;
            
        }else{
            
            if (msg.value < stake + 1 ether) throw;
            bool isOtherSuccess = whale.send(stake);
            setFacts();
            StakeIncreased(whale, stake, blockheight);
        }
    }
    
    function getStake() public constant returns(uint){
        return stake;
    }
    
    function getBlocksTillMattew() public constant returns(uint){
        if (blockheight + PERIOD > block.number)
            return blockheight + PERIOD - block.number;
        else
            return 0;
    }
}
