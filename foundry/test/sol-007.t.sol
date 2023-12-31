// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {ViewAndPureFunctions} from "../src/sol-007.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
// forge test --match-path foundry/test/sol-007.t.sol -vvvvv
contract ViewAndPureFunctionsTest is Test {
    ViewAndPureFunctions public _contract;

    function setUp() public {
        _contract = new ViewAndPureFunctions();
    }

    function testAddToNum() public {
        assertEq(_contract.addToNum(5), 5);
        assertEq(_contract.addToNum(13), 13);
    }

    function testFuncAdd() public {
        assertEq(_contract.add(5, 10), 15);
        assertEq(_contract.add(12, 1), 13);
        assertEq(_contract.add(7, 8), 15);
    }
}
