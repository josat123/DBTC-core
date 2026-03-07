markdown
# 🔥 DBTC – Deflationary Bitcoin Token

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Solidity](https://img.shields.io/badge/Solidity-0.8.20-blue)](https://soliditylang.org/)
[![Foundry](https://img.shields.io/badge/Built%20with-Foundry-FFDB1C)](https://book.getfoundry.sh/)
[![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen)](https://github.com/josat123/DBTC-core/actions)
[![OpenZeppelin](https://img.shields.io/badge/OpenZeppelin-5.2.0-blue)](https://docs.openzeppelin.com/contracts/5.x/)
[![Polygon](https://img.shields.io/badge/Network-Polygon%20|%20Ethereum%20|%20BSC-purple)](https://polygon.technology/)

## 📖 Whitepaper

DBTC è un token ERC20 deflazionistico con meccanismo di burn integrato. Nasce con **250.000.000 DBTC** e brucia l'1% di ogni transazione fino a raggiungere l'offerta finale di **21.000.000 DBTC** – una riduzione del **91,6%**.

Ispirato al modello di scarsità di Bitcoin, DBTC incentiva la detenzione a lungo termine e crea pressione deflazionistica automatica: più il token viene scambiato, più velocemente diventa scarso.

---

## 📊 Tokenomics

| Parametro | Valore |
|-----------|--------|
| **Offerta iniziale** | 250.000.000 DBTC |
| **Offerta finale** | 21.000.000 DBTC 🔥 |
| **Riduzione totale** | -91,6% |
| **Tassa sulle transazioni** | 1% (100 bps) |
| **Destinazione tassa** | 100% bruciata fino al target |
| **Standard** | ERC20, ERC20Permit, ERC1363 |
| **Network** | Ethereum, Polygon, BSC, L2 |

### 📈 Meccanismo di burn
La tassa si applica a **tutti i trasferimenti, senza esclusioni**. Il burn si ferma automaticamente quando la supply totale raggiunge 21M. Dopo il target, la tassa potrà essere reindirizzata a staking rewards e treasury.

```solidity
// Esempio: trasferimento di 1000 DBTC
// Tassa: 10 DBTC bruciati
// Ricevuto: 990 DBTC
🔧 Distribuzione iniziale (da implementare con DBTC-distributor)
Destinazione	%	DBTC	Vesting
Team & Founder	30%	75.000.000	12 mesi cliff + 24 mesi lineare
Community & Staking	25%	62.500.000	48 mesi lineare
Liquidità iniziale	20%	50.000.000	LP bloccati 12 mesi
Marketing & Partnership	10%	25.000.000	6 mesi cliff + 12 mesi lineare
Ecosystem Fund	10%	25.000.000	24 mesi cliff + 48 mesi lineare
Airdrop	5%	12.500.000	3 mesi lineare
Totale: 250.000.000 DBTC

🛠️ Tecnologie
Solidity 0.8.20

OpenZeppelin 5.2.0 (ERC20, ERC20Permit, ERC1363, Ownable2Step, Pausable, ReentrancyGuard)

Foundry (test, deploy, build)

EVM Paris (compatibile con tutte le chain principali)

🚀 Quick Start
bash
# Clona il repository
git clone https://github.com/josat123/DBTC-core.git
cd DBTC-core

# Installa le dipendenze
forge install

# Compila
forge build

# Esegui i test
forge test

# Deploy su testnet (es. Amoy)
forge script script/Deploy.s.sol --rpc-url amoy --broadcast --verify
📁 Struttura del contratto
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
🔐 Sicurezza
Nessuna esclusione dalla tassa – trasparenza totale

Nessun mint post-deploy – supply fissa iniziale

Ownable2Step – trasferimento proprietà in due step

Pausable – emergenze gestibili

ReentrancyGuard – protezione da attacchi

ERC20Permit – approvazioni gasless

ERC1363 – transferAndCall per interazioni avanzate

📄 Whitepaper completo
Il whitepaper dettagliato è disponibile nella cartella /whitepaper.

📬 Contatti
GitHub: @josat123

Repository: DBTC-core

Prossimo: DBTC-distributor (in arrivo)

⚖️ License
MIT © 2025 DBTC Team

