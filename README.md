## Eviction Test 2

-- Question One --
# Color Bottle Game
Implement a Solidity algorithm for a color bottle arrangement game. The game:
Has 5 bottles of different colors in a sequence
Allows players 5 attempts to arrange bottles correctly
Informs players of correct arrangements after each attempt
Randomly shuffles bottles after 5 attempts
Prevents players from continuing if they win; requires a new game.
Takes player's attempted arrangement as input (5 integers: 1-5)
Returns number of correct arrangements
Use keccak256 and uint256 for random number generation.