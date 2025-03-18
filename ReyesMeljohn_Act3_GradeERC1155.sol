// Reyes Meljohn
// WD - 401

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GradesNFT is ERC1155 {
    uint256 public constant EXCELLENT = 1;
    uint256 public constant VERY_GOOD = 2;
    uint256 public constant GOOD = 3;
    uint256 public constant FAIR = 4;
    uint256 public constant POOR = 5;

    mapping(uint256 => string) public gradeNames;

    constructor(string memory uri) ERC1155(uri) {
        gradeNames[EXCELLENT] = "EXCELLENT";
        gradeNames[VERY_GOOD] = "VERY GOOD";
        gradeNames[GOOD] = "GOOD";
        gradeNames[FAIR] = "FAIR";
        gradeNames[POOR] = "POOR";
    }

    function mintGradeNFT(address student, uint256 score) public {
        uint256 gradeId;

        if (score >= 90 && score <= 100) {
            gradeId = EXCELLENT;
        } else if (score >= 81 && score < 90) {
            gradeId = VERY_GOOD;
        } else if (score >= 75 && score < 81) {
            gradeId = GOOD;
        } else if (score >= 71 && score < 75) {
            gradeId = FAIR;
        } else {
            gradeId = POOR;
        }

        _mint(student, gradeId, 1, "");
    }

    function getGradeName(uint256 tokenId) public view returns (string memory) {
        return gradeNames[tokenId];
    }
}