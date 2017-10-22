pragma solidity ^0.4.4;

/*
*   Contract to store addresses for patients
*   Relates a private id with ENCRYPTED addresses
*/

contract Addresses {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string streetAddress) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = streetAddress;
        }
    }

    function UpdateStore(string privId, string streetAddress) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = streetAddress;
        }
    }

    function RetrieveFromStore(string privId) returns (bytes32) {
        return stringToBytes32(dataStore[privId]);
    }

    function stringToBytes32(string memory source) returns (bytes32 result) {
        assembly {
            result := mload(add(source, 32))
        }
    }
}