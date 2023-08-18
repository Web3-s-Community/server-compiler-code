// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Foo} from "../src/Foo.sol";


contract FooTest {
  Foo foo;

  // The state of the contract gets reset before each
  // test is run, with the `setUp()` function being called
  // each time after deployment. Think of this like a JavaScript
  // `beforeEach` block
  function setUp() public {
    foo = new Foo();
  }

  // A simple unit test
  function testDouble() public {
    require(foo.x() == 1);
    foo.double();
    require(foo.x() == 2);
  }

  // A failing unit test (function name starts with `testFail`)
  function testFailDouble() public {
    require(foo.x() == 1);
    foo.double();
    require(foo.x() == 4);
  }
}