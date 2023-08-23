// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {FuzzRandom} from "./CustomFunc.sol";

// forge test --match-path foundry/test/FoundryRandom.t.sol
contract FoundryRandomTest is Test {
    function setUp() public {
        // solhint-disable-previous-line no-empty-blocks
    }

    function testRandomNumber(address sender, uint256 seed) public {
        uint256 number = FuzzRandom.generateRandomNumberMaxMin(sender, seed, 10, 5);
        assertEq(number, number);
        // console2.log(sender);
        // console2.log(seed);
        emit log_uint(number);
    }
}
