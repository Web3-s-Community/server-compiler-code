// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/sol-008.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
// forge test --match-path foundry/test/sol-008.t.sol -vvvvv
contract CounterTest is Test {
    Counter public _contract;

    function setUp() public {
        _contract = new Counter();
    }

    function testFuncInc() public {
        _contract.inc();
        assertEq(_contract.count(), 1);
    }

    function testFuncDec() public {
        _contract.inc();
        assertEq(_contract.count(), 1);
        _contract.dec();
        assertEq(_contract.count(), 0);
    }
}
