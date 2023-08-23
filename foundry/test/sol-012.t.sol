// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {ForAndWhileLoops} from "../src/sol-012.sol";

import {FuzzRandom} from "./CustomFunc.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
// forge test --match-path foundry/test/sol-012.t.sol -vvvvv
contract DefaultValuesTest is Test {
    ForAndWhileLoops public _contract;

    function setUp() public {
        _contract = new ForAndWhileLoops();
    }

    function testSum_equal_0() public {
        assertEq(_contract.sum(0), 0);
    }

    function testSum_greater_0() public {
        uint256 total;
        uint256 _n = 7;

        for (uint256 i = 1; i <= _n; i++) {
            total += i;
        }
        assertEq(_contract.sum(_n), total);
    }

    function testSumFuzzTesting(address sender, uint256 seed) public {
        uint256 total;
        uint256 _n = FuzzRandom.generateRandomNumberMaxMin(sender, seed, 10, 5);

        for (uint256 i = 1; i <= _n; i++) {
            total += i;
        }
        assertEq(_contract.sum(_n), total);
    }
}
