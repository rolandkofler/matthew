> WARNING: While the whale looks friendly, Mattew is nasty animal. Because of human [Loss Aversion](https://en.wikipedia.org/wiki/Loss_aversion), people might play higher and higher stakes. THIS IS AN EXPERIMENT IN BEHAVIORAL ECONOMICS. Do not stake Ether you will miss later! THIS CONTRACT IS NOT SECURE. BY USING IT YOU AGREE THAT ANY RISK IS ON YOU.

## Mattew - a contract for increasing "whaleth"
The rich get richer,  
the WHALE get WHALER  
```
╭━━━━━━━━╮┏━╮╭━┓
┃┈┈┈┈┈┈┈┈┃╰╮╰╯╭╯
┃╰╯┈┈┈┈┈┈╰╮╰╮╭╯┈
┣━━╯┈┈┈┈┈┈╰━╯┃┈┈
╰━━━━━━━━━━━━╯┈┈
```
> In sociology, the Matthew effect (or accumulated advantage) 
is the phenomenon where "the rich get richer and the poor get poorer. 
--https://en.wikipedia.org/wiki/Matthew_effect 

This contract helps with this process by rewarding the richest player.

### Description 

1. A player sends ether to the contract address
2. Flow:
  1. If the amount is too low it fails  
  2. If the amount at least +1 ETH is higher than the STAKE and send within PERIOD since the last pay-in then the sender receives the last STAKE but pays in his STAKE.
     ```     
         
                          1ΞΞΞΞΞΞΞΞΞ*Period over
                  1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
               2ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ      1ΞΞΞΞΞΞΞΞΞ*Period over
               ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ  1ΞΞΞΞΞΞΞΞΞΞΞΞΞ
          1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ1ΞΞΞΞΞ...
     ```
     Figure: The STAKE gets higher until nobody pays in for > PERIOD

  3. If the grace PERIOD is over and nobody increased the STAKE, the last STAKE wins all the Ether, except one.  
3. This one Ether is the basis for a new round. GOTO 1.
