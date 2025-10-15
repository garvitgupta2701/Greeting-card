// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GreetingCardWithGifts {
    // Owner (deployer) can withdraw accumulated ETH
    address public owner;

    // Reentrancy guard (simple)
    bool private locked;

    struct Greeting {
        address sender;
        uint256 amount;    // wei
        string message;    // greeting text
        uint256 timestamp;
    }

    Greeting[] private greetings;

    event GreetingSent(address indexed sender, uint256 amount, uint256 index, uint256 timestamp);
    event Withdraw(address indexed by, uint256 amount);

    // no constructor parameters
    constructor() {
        owner = msg.sender;
        locked = false;
    }

    // send a greeting + ETH gift
    // requires msg.value > 0 (must send some ETH)
    // no external imports used
    function sendGreeting(string calldata message) external payable {
        require(msg.value > 0, "Send some ETH as a gift");
        Greeting memory g = Greeting({
            sender: msg.sender,
            amount: msg.value,
            message: message,
            timestamp: block.timestamp
        });
        greetings.push(g);
        emit GreetingSent(msg.sender, msg.value, greetings.length - 1, block.timestamp);
    }

    // read how many greetings have been stored
    function greetingsCount() external view returns (uint256) {
        return greetings.length;
    }

    // fetch one greeting by index (0..greetingsCount()-1)
    function getGreeting(uint256 index) external view returns (
        address sender,
        uint256 amount,
        string memory message,
        uint256 timestamp
    ) {
        require(index < greetings.length, "Index out of range");
        Greeting storage g = greetings[index];
        return (g.sender, g.amount, g.message, g.timestamp);
    }

    // fetch recent N greetings (up to available). Useful for UIs to show last messages.
    // returns arrays for minimal ABI complexity.
    function recentGreetings(uint256 maxItems) external view returns (
        address[] memory senders,
        uint256[] memory amounts,
        string[] memory messages,
        uint256[] memory timestamps
    ) {
        uint256 total = greetings.length;
        if (maxItems == 0) {
            maxItems = 1;
        }
        uint256 count = maxItems;
        if (count > total) {
            count = total;
        }

        senders = new address[](count);
        amounts = new uint256[](count);
        messages = new string[](count);
        timestamps = new uint256[](count);

        // return last `count` greetings (most recent first)
        for (uint256 i = 0; i < count; i++) {
            Greeting storage g = greetings[total - 1 - i];
            senders[i] = g.sender;
            amounts[i] = g.amount;
            messages[i] = g.message;
            timestamps[i] = g.timestamp;
        }
    }

    // owner withdraws all ETH
    function withdraw() external {
        require(msg.sender == owner, "Only owner");
        require(!locked, "Reentrant");
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds");

        locked = true;
        (bool ok, ) = payable(owner).call{value: balance}("");
        locked = false;
        require(ok, "Transfer failed");
        emit Withdraw(owner, balance);
    }

    // retrieve contract balance (for transparency)
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // allow owner to change ownership if desired
    function setOwner(address newOwner) external {
        require(msg.sender == owner, "Only owner");
        require(newOwner != address(0), "Zero address");
        owner = newOwner;
    }
}

