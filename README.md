# 🎁 Greeting Card with ETH Gifting 💌

A simple and heartwarming Ethereum smart contract that lets anyone **send ETH gifts along with a personal greeting message** — like a digital greeting card that holds real value!  

This contract is **fully self-contained**, has **no imports or input constructors**, and is ideal for learning, demos, and personal projects.

---

## 🌟 Features

- 💬 **Send a Greeting + ETH Gift** — Anyone can send a message with some ETH.
- 📜 **All Greetings Stored On-Chain** — Messages are permanently recorded in the blockchain.
- 💰 **Safe Owner Withdrawals** — Contract owner can withdraw the accumulated ETH.
- 🔒 **No Reentrancy Vulnerabilities** — Simple and secure withdrawal logic.
- ⚙️ **No External Imports or Constructors** — Works standalone, deployable on Remix or any EVM chain.

---

## 🧠 Smart Contract Overview

### Contract Name
`GreetingCardWithGifts`

### Core Functions

| Function | Description |
|-----------|--------------|
| `sendGreeting(string message)` | Send a greeting message along with some ETH. |
| `getGreeting(uint index)` | Fetch a specific greeting by its index. |
| `greetingsCount()` | Returns the total number of greetings. |
| `recentGreetings(uint maxItems)` | Returns the most recent N greetings (for UI display). |
| `withdraw()` | Allows only the owner to withdraw the contract’s ETH balance. |
| `contractBalance()` | View current ETH balance of the contract. |
| `setOwner(address newOwner)` | Transfer contract ownership to another address. |

---

## 🚀 Deployment Steps (via Remix)

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file named `GreetingCardWithGifts.sol`.
3. Paste the contract code inside.
4. Compile using **Solidity v0.8.20** or higher.
5. Deploy under the **"Injected Provider - MetaMask"** environment.
6. After deployment:
   - Click **sendGreeting** → enter your message → send ETH.
   - View greetings via **getGreeting** or **recentGreetings**.

---

## 💌 Example Flow

| Action | Result |
|--------|---------|
| User A sends 0.01 ETH + message “Happy Birthday!” | A new greeting is saved on-chain |
| User B sends 0.02 ETH + “Wishing you success!” | Stored as a separate record |
| Owner calls `withdraw()` | All accumulated ETH is safely transferred to owner’s wallet |

---

## 🧾 Example Transaction

```solidity
// Example
sendGreeting("You're amazing!") 
// with value: 0.01 ETH
