pragma solidity ^0.4.4;

/*
*   Contract to store medications utilized by patients
*   Relates a private id with UN-ENCRYPTED medication records
*/

contract Addresses {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string medicationRecord) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = medicationRecord;
        }
    }

    function UpdateStore(string privId, string medicationRecord) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = medicationRecord;
        }
    }

    function RetrieveFromStore(string privId) returns (string) {
        return dataStore[privId];
    }
}