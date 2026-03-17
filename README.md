markdown
# 🔥 DBTC – Deflationary Bitcoin Token

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Solidity](https://img.shields.io/badge/Solidity-0.8.20-blue)](https://soliditylang.org/)
[![Foundry](https://img.shields.io/badge/Built%20with-Foundry-FFDB1C)](https://book.getfoundry.sh/)
[![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen)](https://github.com/josat123/DBTC-core/actions)
[![OpenZeppelin](https://img.shields.io/badge/OpenZeppelin-5.2.0-blue)](https://docs.openzeppelin.com/contracts/5.x/)
[![Website](https://img.shields.io/badge/Website-deflationarybtc.org-blue?style=flat&logo=google-chrome&logoColor=white)](https://deflationarybtc.org)

## 📖 Overview

DBTC is a deflationary ERC20 token with an integrated burn mechanism. It starts with an initial supply of **250,000,000 DBTC** and burns 1% of every transaction until it reaches the final supply of **21,000,000 DBTC** – a **91.6% reduction**.

Inspired by Bitcoin's scarcity model, DBTC incentivizes long-term holding and creates automatic deflationary pressure: the more the token is traded, the faster it becomes scarce.

---

## 📊 Tokenomics

| Parameter | Value |
|-----------|-------|
| **Initial Supply** | 250,000,000 DBTC |
| **Final Supply** | 21,000,000 DBTC 🔥 |
| **Total Reduction** | -91.6% |
| **Transaction Tax** | 1% (100 bps) |
| **Tax Destination** | 100% burned until target |
| **Standard** | ERC20, ERC20Permit, ERC1363 |
| **Network** | Ethereum, Polygon, BSC, L2s |

### 🔥 Burn Mechanism
The tax applies to **all transfers, with no exclusions**. Burning stops automatically when the total supply reaches 21M. After the target, the tax can be redirected to staking rewards and treasury.

```solidity
// Example: transfer of 1000 DBTC
// Tax: 10 DBTC burned
// Received: 990 DBTC
📍 Deployed Contract
Network	Address
L1 (Ethereum/Mainnet)	0xe972BbB8bB357418131951CcEaec9d8A5993bea2
🔧 Initial Distribution (managed by DBTC-distributor)
Allocation	%	DBTC	Vesting
Team & Founder	30%	75,000,000	12 months cliff + 24 months linear
Community & Staking	25%	62,500,000	48 months linear
Initial Liquidity	20%	50,000,000	LP locked 12 months
Marketing & Partnership	10%	25,000,000	6 months cliff + 12 months linear
Ecosystem Fund	10%	25,000,000	24 months cliff + 48 months linear
Airdrop	5%	12,500,000	3 months linear
Total: 250,000,000 DBTC

🛠️ Technology Stack
Solidity 0.8.20

OpenZeppelin 5.2.0 (ERC20, ERC20Permit, ERC1363, Ownable2Step, Pausable, ReentrancyGuard)

Foundry (testing, deployment, build)

EVM Paris (compatible with all major chains)

🚀 Quick Start
bash
# Clone the repository
git clone https://github.com/josat123/DBTC-core.git
cd DBTC-core

# Install dependencies
forge install

# Compile
forge build

# Run tests
forge test

# Deploy to testnet (e.g., Amoy)
forge script script/Deploy.s.sol --rpc-url amoy --broadcast --verify
📁 Contract Structure
solidity
contract DeflationaryBTC is ERC20, ERC20Permit, ERC1363, Ownable2Step, Pausable, ReentrancyGuard {
    uint256 public constant INITIAL_SUPPLY = 250_000_000 * 10**18;
    uint256 public constant FINAL_SUPPLY = 21_000_000 * 10**18;
    uint256 public constant TAX_BPS = 100;  // 1%
    
    bool public burnActive;
    uint256 public totalBurned;
    
    function _update(address from, address to, uint256 value) internal override;
    function burn(uint256 amount) external nonReentrant;
    function getBurnStatus() external view returns (bool active, uint256 remainingToBurn, uint256 totalSupply_);
    function getNetAmount(uint256 grossAmount) external view returns (uint256);
    function pause() external onlyOwner;
    function unpause() external onlyOwner;
}
🔐 Security Features
No tax exclusions – full transparency

No post-deploy minting – fixed initial supply

Ownable2Step – two-step ownership transfer

Pausable – emergency stop mechanism

ReentrancyGuard – protection against reentrancy attacks

ERC20Permit – gasless approvals

ERC1363 – transferAndCall for advanced interactions

📄 License
MIT © 2026 DBTC Team
