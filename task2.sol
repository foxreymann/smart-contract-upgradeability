pragma solidity ^0.5.0;

contract Storage {
  uint public score;

  function setScore(uint256 _score) public {
    score = _score;
  }
}

contract Score {
    Storage storageInstance;

    constructor(address _storageAddress) public {
      storageInstance = Storage(_storageAddress);
    }

    function setScore(uint _score) public {
      storageInstance.setScore(_score);
    }

    function getScore() public view returns (uint) {
        return storageInstance.score();
    }
}

