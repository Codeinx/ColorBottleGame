// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ColorBottleGame {
    uint256[5] public correctArrangement;
    uint256[5] public playerAttempt;
    uint256 public attemptsLeft = 5;
    bool public gameOver = false;

    
    event AttemptResult(uint256 correctPositions, uint256 attemptsLeft);

    constructor() {
        for (uint256 i = 0; i < 5; i++) {
            correctArrangement[i] = (uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, i))) % 5) + 1;
        }
    }

    function newAttempt(uint256[5] memory _attempt) public {
        require(!gameOver, "Game is over. Start a new game.");
        require(attemptsLeft > 0, "No attempts left. Start a new game.");

        playerAttempt = _attempt;

        uint256 correctPositions = 0;
        for (uint256 i = 0; i < 5; i++) {
            if (playerAttempt[i] == correctArrangement[i]) {
                correctPositions++;
            }
        }

        emit AttemptResult(correctPositions, attemptsLeft);
        attemptsLeft--;

        if (correctPositions == 5) {
            gameOver = true;
        }

        if (attemptsLeft == 0 && !gameOver) {
            shuffle();
        }
    }

    function shuffle() private {
        for (uint256 i = 0; i < 5; i++) {
            correctArrangement[i] = (uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, i))) % 5) + 1;
        }
    }

    function startNewGame() public {
        // Reset the game state
        attemptsLeft = 5;
        gameOver = false;

        shuffle();
    }
    function getCorrectArrangement() public view returns (uint256[5] memory) {
        return correctArrangement;
    }
}