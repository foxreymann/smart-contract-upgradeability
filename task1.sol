pragma solidity >=0.5.1;


contract Score {
    uint256 public score;

    function setScore(uint256 _score) external {
        score  = _score;
    }
    
    function getScore() public view returns (uint) {
        return score;
    }
}


contract ScoreV2 {
    uint256 public score;

    function setScore(uint256 _score) external {
        score  = _score + 1;
    }
    
     function getScore() public view returns (uint) {
        return score;
    }
}
