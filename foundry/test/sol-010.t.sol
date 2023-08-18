// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Constants} from "../src/sol-010.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
// forge test --match-path foundry/test/sol-009.t.sol -vvvvv
contract DefaultValuesTest is Test {
    Constants public _contract;

    function setUp() public {
        _contract = new Constants();
    }

    function testMyUnit() public {
        assertEq(_contract.MY_UINT(), 123);
    }
}
