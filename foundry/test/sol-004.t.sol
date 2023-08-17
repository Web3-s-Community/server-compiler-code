// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {StateVariables} from "../src/sol-004.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
contract StateVariablesTest is Test {
    StateVariables public _contract;

    function setUp() public {
        _contract = new StateVariables();
    }

    function testResetNum() public {
        _contract.setNum(123);
        _contract.resetNum();

        assertEq(_contract.num(), 0);
    }

    function testGetNumPlusOne() public {
        assertEq(_contract.getNumPlusOne(), 1);
    }
}
