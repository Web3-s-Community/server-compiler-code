// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {IfElse} from "../src/sol-011.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
// forge test --match-path foundry/test/sol-011.t.sol -vvvvv
contract DefaultValuesTest is Test {
    IfElse public _contract;

    function setUp() public {
        _contract = new IfElse();
    }

    function testExercise_1_if_x_greater_0() public {
        assertEq(_contract.exercise_1(1), 1);
    }

    function testExercise_1_if_x_equal_0() public {
        assertEq(_contract.exercise_1(0), 0);
    }

    function testExercise_2_if_x_greater_0() public {
        assertEq(_contract.exercise_1(1), 1);
    }

    function testExercise_2_if_x_equal_0() public {
        assertEq(_contract.exercise_1(0), 0);
    }
}
