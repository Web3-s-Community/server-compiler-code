// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {ForAndWhileLoops} from "../src/sol-012.sol";
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
        uint total;
        uint _n;
        _n = 7;

        for (uint i = 1; i <= _n; i++) {
            total += i;
        }
        assertEq(_contract.sum(_n), total);
    }
}
