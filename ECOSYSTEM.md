# 🌐 DBTC Ecosystem – Deployed Contracts

## 📍 Mainnet (Ethereum L1)

| Contract | Address | Description |
|----------|---------|-------------|
| **DeflationaryBTC** | `0xe972BbB8bB357418131951CcEaec9d8A5993bea2` | Main token |
| **DBTC Distributor** | `0x428685F1c10a0ea7BAcB14C0E0938Ea8EcCdAb5D` | Multisig vesting |
| **Universal Bridge (L1)** | `0xe8681d55585FcDA6a4a39c9a59f39b63fbBa88e8` | Bridge to L2 |

## 📍 Polygon PoS (L2)

| Contract | Address | Description |
|----------|---------|-------------|
| **Universal Bridge (L2)** | `0x0Ef6a63a16fB21dD8398183a154596953Ce4E835` | Bridge from L1 |
| **WrappedDBTC** | `0x5Ea83b4c928Aa4055D02592f3AFE0fE87318598D` | Bridged token on Polygon |

## 🔄 Cross-Chain Flow

Ethereum L1 → Universal Bridge L1 → Universal Bridge L2 → WrappedDBTC on Polygon
Ethereum L1 ← Universal Bridge L1 ← Universal Bridge L2 ← WrappedDBTC on Polygon

text

## 🛠️ In Development

| Component | Status |
|-----------|--------|
| **Staking Contract** | In progress |
| **Trading Spot Contract** | Under review |
| **Frontend Interface** | Planned |

## ✅ Verified Contracts

- [Etherscan L1](https://etherscan.io/address/0xe972BbB8bB357418131951CcEaec9d8A5993bea2)
- [Polygonscan](https://polygonscan.com/address/0x5Ea83b4c928Aa4055D02592f3AFE0fE87318598D)
