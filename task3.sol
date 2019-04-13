pragma solidity >=0.5.1;

contract Storage {
    mapping(bytes32 => uint) uints;
    
    function setUint(bytes32 _key, uint256 _value) external {
        uints[_key] = _value;
    }
    
    function getUint(bytes32 _key) public view returns (uint) {
        return uints[_key];
    }
}


contract Score {
    Storage sInstance;
    bytes32 constant SCORE_KEY = keccak256('score');
    
    constructor (address _sAddress) public {
        sInstance = Storage(_sAddress);
    }
 
    function setScore(uint256 _score) external {
        sInstance.setUint(SCORE_KEY, _score);
    }
    
    function getScore() public view returns (uint) {
        return sInstance.getUint(SCORE_KEY);
    }
}