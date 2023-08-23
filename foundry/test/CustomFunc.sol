// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// https://solidity-by-example.org/library/
// https://www.geeksforgeeks.org/solidity-libraries/

library Math {
    function sqrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        // else z = 0 (default value)
    }
}

// https://cryptomarketpool.com/libraries-in-solidity/
library FuzzRandom {
    // https://soliditytips.com/articles/generate-random-numbers-solidity/
    function generateRandomNumberMaxMin(address sender, uint256 seed, uint256 max, uint256 min)
        public
        view
        returns (uint256)
    {
        uint256 number = uint256(keccak256(abi.encodePacked(block.timestamp, sender, seed))) % max;
        return number > min ? number : min;
    }
}
