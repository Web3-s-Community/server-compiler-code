// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {DefaultValues} from "../src/sol-009.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
// forge test --match-path foundry/test/sol-009.t.sol -vvvvv
contract DefaultValuesTest is Test {
    DefaultValues public _contract;

    function setUp() public {
        _contract = new DefaultValues();
    }

    function testDefaultUint() public {
        assertEq(_contract.u(), 0);
    }

    function testDefaultBoolean() public {
        assertEq(_contract.b(), false);
    }
}
