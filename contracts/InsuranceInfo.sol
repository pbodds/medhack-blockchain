pragma solidity ^0.4.4;

/*
*   Contract to store insurance information for patients
*   Relates a private id with ENCRYPTED insurance information
*/

contract InsuranceInfo {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string insuranceInfo) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = insuranceInfo;
        }
    }

    function UpdateStore(string privId, string insuranceInfo) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = insuranceInfo;
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