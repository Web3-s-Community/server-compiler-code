// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {LocalVariables} from "../src/sol-005.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
contract LocalVariablesTest is Test {
    LocalVariables public _contract;

    function setUp() public {
        _contract = new LocalVariables();
    }

    function testMul() public {
        assertEq(_contract.mul(), 15241383936);
    }
}
