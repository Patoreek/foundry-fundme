// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "../script/HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        console.log("ethUsdPriceFeed", ethUsdPriceFeed);
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        console.log("Deployed FundMe at address:", address(fundMe));

        vm.stopBroadcast();
        return fundMe;
    }
}
