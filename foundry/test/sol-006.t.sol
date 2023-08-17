// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {GlobalVariables} from "../src/sol-006.sol";

// https://book.getfoundry.sh/reference/ds-test#asserting
// https://github.com/dabit3/foundry-cheatsheet#testing
// forge test --match-path foundry/test/sol-006.t.sol -vvvvv
contract GlobalVariablesTest is Test {
    GlobalVariables public _contract;
    bytes32 internal nextUser = keccak256(abi.encodePacked("web3 School User Address"));

    function setUp() public {
        _contract = new GlobalVariables();
    }

    function testReturnSender() public {
        address payable sender = payable(address(uint160(uint256(nextUser))));
        vm.prank(sender);
        // console2.log(_contract.returnSender());
        assertEq(_contract.returnSender(), sender);
    }
}
