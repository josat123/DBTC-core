// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/DeflationaryBTC.sol";

contract DeflationaryBTC_Test is Test {
    DeflationaryBTC token;
    address user1 = address(0x1);
    address user2 = address(0x2);
    address owner;
    address recipient;

    function setUp() public {
        owner = address(this);
        recipient = makeAddr("recipient");
        token = new DeflationaryBTC(recipient);
        
        // Mint iniziale va a recipient, che è escluso dalla tassa?
        // No, nessuno è escluso, quindi anche questo trasferimento brucia
        // Meglio: dai direttamente i token a user1 e user2 senza trasferimenti
        
        // Soluzione: il contratto mint a recipient, poi recipient trasferisce
        // Ma dobbiamo tenere conto della tassa in questi trasferimenti iniziali
        
        // Registra il totalBurned iniziale
        vm.prank(recipient);
        token.transfer(user1, 1_000_000 * 10**18);
        
        vm.prank(recipient);
        token.transfer(user2, 1_000_000 * 10**18);
    }

    function testTransferWithTax() public {
        uint256 amount = 1000 * 10**18;
        uint256 expectedTax = (amount * token.TAX_BPS()) / token.BPS_DENOMINATOR(); // 10 token (1%)
        uint256 expectedReceived = amount - expectedTax; // 990 token
        
        // Registra lo stato prima
        uint256 burnedBefore = token.totalBurned();
        uint256 balanceBefore = token.balanceOf(user2);

        // Esegui il trasferimento
        vm.prank(user1);
        token.transfer(user2, amount);

        // Verifica dopo
        uint256 burnedAfter = token.totalBurned();
        uint256 balanceAfter = token.balanceOf(user2);
        uint256 received = balanceAfter - balanceBefore;
        uint256 burnedInTest = burnedAfter - burnedBefore;

        assertEq(received, expectedReceived, "Amount received should be amount - tax");
        assertEq(burnedInTest, expectedTax, "Burned in this test should equal tax");
    }

    function testBurnActive() public view {
        assertTrue(token.burnActive(), "Burn should be active initially");
    }
}