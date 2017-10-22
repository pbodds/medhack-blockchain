pragma solidity ^0.4.4;

/*
*   Contract to store medications utilized by patients
*   Relates a private id with UN-ENCRYPTED allergy lists
*/

contract Allergies {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string allergyList) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = allergyList;
        }
    }

    function UpdateStore(string privId, string allergyList) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = allergyList;
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