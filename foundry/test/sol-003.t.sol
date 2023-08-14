// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {FunctionIntro} from "../src/sol-003.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
contract FunctionIntroTest is Test {
    FunctionIntro public _contract;

    function setUp() public {
        _contract = new FunctionIntro();
    }

    function testSubFunction() public {
        assertEq(_contract.sub(5, 4), 1);
        assertEq(_contract.sub(15, 4), 11);
        assertEq(_contract.sub(25, 13), 12);
    }
}
