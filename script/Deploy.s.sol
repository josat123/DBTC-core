// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {DeflationaryBTC} from "../src/DeflationaryBTC.sol";

contract Deploy is Script {
    function run() external {
        address recipient = vm.envAddress("RECIPIENT");
        vm.startBroadcast();
        new DeflationaryBTC(recipient);
        vm.stopBroadcast();
    }
}