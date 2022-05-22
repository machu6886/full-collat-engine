// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

import "../../mocks/MockERC20.sol";

import "src/core/Grappa.sol";
import "../../../types/MarginAccountTypes.sol";

abstract contract Fixture is Test {
    Grappa internal grappa;

    MockERC20 internal usdc;

    address internal alice;
    address internal charlie;
    address internal bob;

    constructor() {
        usdc = new MockERC20("USDC", "USDC", 6);

        grappa = new Grappa();

        charlie = address(0xcccc);
        vm.label(charlie, "Charlie");

        bob = address(0xb00b);
        vm.label(bob, "Bob");

        alice = address(0xaaaa);
        vm.label(alice, "Alice");

        // make sure timestamp is not 0
        vm.warp(0xffff);

        usdc.mint(alice, 1000_000_000 * 1e6);
        usdc.mint(bob, 1000_000_000 * 1e6);
        usdc.mint(charlie, 1000_000_000 * 1e6);
    }
}
