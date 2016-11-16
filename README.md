## Mattew - a contract for increasing "whaleth"

The rich get richer, 
the WHALE get WHALER
╭━━━━━━━━╮┏━╮╭━┓
┃┈┈┈┈┈┈┈┈┃╰╮╰╯╭╯
┃╰╯┈┈┈┈┈┈╰╮╰╮╭╯┈
┣━━╯┈┈┈┈┈┈╰━╯┃┈┈
╰━━━━━━━━━━━━╯┈┈

In sociology, the Matthew effect (or accumulated advantage) 
is the phenomenon where "the rich get richer and the poor get poorer. 
- https://en.wikipedia.org/wiki/Matthew_effect 

This contract helps with this process by rewarding the richest player.

### Description 

1. A player sends ether to the contract address
2a. If the amount is too low it fails
2b. If the amount at least +1 ETH is higher than the STAKE
     and send within PERIOD since the last pay-in
     then the sender receives the last STAKE but pays in his STAKE.
     
                     
                     1ΞΞΞΞΞΞΞΞΞ*Period over
             1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ
          2ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ      1ΞΞΞΞΞΞΞΞΞ*Period over
          ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ  1ΞΞΞΞΞΞΞΞΞΞΞΞΞ
     1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ1ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ1ΞΞΞΞΞ...

     Figure: The STAKE gets higher until nobody pays in for > PERIOD

2c. If the grace PERIOD is over and nobody increased the STAKE, 
     the last STAKE wins all the Ether, except one.
3. This one Ether is the basis for a new round. GOTO 1.
