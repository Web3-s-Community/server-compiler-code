// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {ValueTypes} from "../src/sol-002.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
contract ValueTypesTest is Test {
    ValueTypes public _contract;

    function setUp() public {
        _contract = new ValueTypes();
    }

    function testTypesBool() public {
        assertTrue(_contract.b());
    }

    function testTypesInt() public {
        assertLe(_contract.i(), 0);
    }

    function testTypesUint() public {
        assertEq(_contract.u(), 123);
    }

    function testTypesAddr() public {
        assertEq(_contract.addr(), 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }

    function testTypesBytes32() public {
        assertEq(_contract.b32(), 0x89c58ced8a9078bdef2bb60f22e58eeff7dbfed6c2dff3e7c508b629295926fa);
    }
}
