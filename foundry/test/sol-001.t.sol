// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {HelloWorld} from "../src/sol-001.sol";

contract HelloWorldTest is Test {
    HelloWorld public _contract;

    function setUp() public {
        _contract = new HelloWorld();
    }

    function testVariableGreetEqualHelloWorld() public {
        assertEq(_contract.greet(), "Hello World");
    }
}
