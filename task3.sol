pragma solidity ^0.5.0;

contract Storage {
  bytes32 hash = keccak256("score");

  mapping(bytes32 => uint) uintStorage;

  function setScore(uint _score) external {
    uintStorage[hash] = _score;
  }

  function getScore() external view returns (uint) {
    return uintStorage[hash];
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
        return storageInstance.getScore();
    }
}


