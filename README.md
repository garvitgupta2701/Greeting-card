# Greeting Card with ETH Gifting

This contract allows users to send ETH gifts along with short greeting messages stored permanently on-chain.  
It is deployed on the **Flow EVM Testnet** at address:  
`0xd9145CCE52D386f254917e481eB44e9943F39138`

Anyone can send a greeting using `sendGreeting(string message)` with an ETH value attached.  
Each greeting stores the sender’s address, message, amount, and timestamp.  
The contract owner can withdraw all received ETH using the `withdraw()` function.  

Key read functions include `getGreeting(index)`, `greetingsCount()`, and `recentGreetings(n)` for fetching stored messages.  
No imports, no constructor arguments, and a built-in reentrancy guard make it lightweight and secure.  

Test and interact using [Flow EVM Testnet Explorer](https://evm-testnet.flowscan.io).  
Compiler: Solidity 0.8.20 | License: MIT  
Author: Garvit Gupta
