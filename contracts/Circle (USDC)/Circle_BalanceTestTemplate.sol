// SPDX-License-Identifier: GPL-3.0-only

pragma solidity ^0.8.0;

import {AnteTest} from "../AnteTest.sol";
import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";

// ==INSTRUCTIONS==
// TODO 1. Rename the contract and file in the form Ante[Target][Token]BalanceAbove[Threshold]Test
// TODO 2. Update target protocol, tokenholder address, token, and balance threshold (marked with TODO)
// TODO 3. Replace instances of [TOKEN], [HOLDER], and [THRESHOLD] as needed

/// @title Checks $[TOKEN] balance in [HOLDER] remains >= [THRESHOLD]
/// @author Put your ETH address here
/// @notice Ante Test to check
// TODO Change AnteTokenBalanceTestTemplate to the filename of the test,
contract Circle_BalanceTestTemplate is AnteTest("[HOLDER] [TOKEN] balance remains >= [THRESHOLD]") {
    // TODO update tokenholder address and block explorer link
    // https://etherscan.io/address/0x55fe002aeff02f77364de339a1292923a15844b8
    address public constant HOLDER_ADDRESS = 0x55FE002aefF02F77364de339a1292923A15844B8;

    // TODO update token address and block explorer link
    // https://etherscan.io/address/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48
    IERC20Metadata public constant TOKEN = IERC20Metadata(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);

    // Will be set to desired token balance threshold
    uint256 public immutable thresholdBalance;

    constructor() {
        // TODO replace (1000 * 1000) with desired threshold
        thresholdBalance = (1000 * 1000) * (10**TOKEN.decimals());

        // TODO replace "Protocol" with target protocol/wallet/etc.
        protocolName = "Circle (USDC)";

        testedContracts = [address(TOKEN), HOLDER_ADDRESS];
    }

    /// @notice test to check if $[TOKEN] balance in [HOLDER] is >= [THRESHOLD]
    /// @return true if $[TOKEN] balance in [HOLDER] is >= [THRESHOLD]
    function checkTestPasses() public view override returns (bool) {
        return (TOKEN.balanceOf(HOLDER_ADDRESS) >= thresholdBalance);
    }
}
