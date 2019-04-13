pragma solidity >=0.5.1;


contract Proxy {
    bytes32 private constant IMPL_POS = keccak256("com.foxreymann.proxy.implementation");

    function setImplementation(address _impl) public {
        bytes32 local = IMPL_POS;
        assembly {
            sstore(local, _impl)
        }
    }
    
    function implementation() private view returns(address impl) {
        bytes32 local = IMPL_POS;
        assembly {
            impl := sload(local)
        }
    }

    function () external {
        address localImpl = implementation();
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, localImpl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }

}


contract ScoreStorage {

    uint256 public score;

}

contract Score is ScoreStorage {

    function setScore(uint256 _score) public {
        score = _score;
    }
}

contract ScoreV2 is ScoreStorage {

    function setScore(uint256 _score) public {
        score = _score + 1;
    }
}