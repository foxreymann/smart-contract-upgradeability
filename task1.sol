pragma solidity ^0.5.0;

contract Score {

    uint public score;

    function setScore(uint _score) public {
      score = _score;
    }

    function getScore() public view returns (uint) {
        return score;
    }
}

contract ScoreV2 {

    uint public score;

    function setScore(uint _score) public {
      score = _score + 1;
    }

    function getScore() public view returns (uint) {
        return score;
    }
}
