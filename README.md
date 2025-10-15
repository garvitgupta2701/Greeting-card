# Greeting Card with ETH Gifting

This repository contains the source code and deployment details for the **Greeting Card with ETH Gifting** smart contract, deployed on the **Flow EVM Testnet**.  
The contract allows anyone to send ETH gifts along with personalized on-chain greeting messages.

---

## Overview

The **Greeting Card with ETH Gifting** contract is a minimal, self-contained Solidity implementation with no external imports or constructor arguments. It enables users to:

- Send ETH with a message as a digital greeting card.
- Record all greetings permanently on-chain.
- Allow the contract owner to withdraw received ETH safely.
- Retrieve past greetings for display or analytics.

---

## Deployment Details

**Network:** Flow EVM Testnet  
**Contract Address:** `0xd9145CCE52D386f254917e481eB44e9943F39138`  
**Compiler Version:** Solidity 0.8.20  
**License:** MIT  

---

## Contract Functions

| Function | Visibility | Description |
|-----------|-------------|--------------|
| `sendGreeting(string message)` | `external payable` | Sends a greeting message with attached ETH. |
| `getGreeting(uint index)` | `external view` | Returns details of a specific greeting by index. |
| `greetingsCount()` | `external view` | Returns total number of greetings stored. |
| `recentGreetings(uint maxItems)` | `external view` | Returns a list of the most recent greetings. |
| `withdraw()` | `external` | Allows the owner to withdraw all ETH from the contract. |
| `contractBalance()` | `external view` | Returns the contract’s ETH balance. |
| `setOwner(address newOwner)` | `external` | Transfers contract ownership to another address. |

---

## Usage Instructions

### Sending a Greeting
To send a greeting message:
1. Call `sendGreeting("Your message here")`
2. Include a small ETH amount in the transaction (e.g., 0.01 ETH)

The message and sender details will be stored permanently on-chain.

### Reading Greetings
You can:
- Retrieve the total number of greetings using `greetingsCount()`
- Get details of a specific greeting using `getGreeting(index)`
- View the most recent messages with `recentGreetings(N)`

### Withdrawing ETH
Only the contract owner can call `withdraw()` to transfer all ETH from the contract to their wallet.

---

## Example (Remix or Script)

```solidity
// Send a greeting with ETH
sendGreeting("Wishing you all the best!")
// Value: 0.01 ETH
