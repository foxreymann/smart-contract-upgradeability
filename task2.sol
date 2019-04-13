pragma solidity >=0.5.1;

contract ScoreStorage {
    uint public score;
    
    function setScore(uint256 _score) external {
        score  = _score;
    }
}


contract Score {
    ScoreStorage ssInstance;
    
    constructor (address _ssAddress) public {
        ssInstance = ScoreStorage(_ssAddress);
    }
 
    function setScore(uint256 _score) external {
        ssInstance.setScore(_score);
    }
    
    function getScore() public view returns (uint) {
        return ssInstance.score();
    }
    
    function disable() external {
        ssInstance = ScoreStorage(address(0));
    }
}

contract ScoreV2 {
    ScoreStorage ssInstance;
    
    constructor (address _ssAddress) public {
        ssInstance = ScoreStorage(_ssAddress);
    }
 
    function setScore(uint256 _score) external {
        ssInstance.setScore(_score+1);
    }
    
    function getScore() public view returns (uint) {
        return ssInstance.score();
    }
}