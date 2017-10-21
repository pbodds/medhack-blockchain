pragma solidity ^0.4.4;

/*
*   Contract to store patients medical history record
*   Relates a private id with UN-ENCRYPTED medical history records
*/

contract MedicalHistory {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string medicalHistoryRecord) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = medicalHistoryRecord;
        }
    }

    function UpdateStore(string privId, string medicalHistoryRecord) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = medicalHistoryRecord;
        }
    }

    function RetrieveFromStore(string privId) returns (string) {
        return dataStore[privId];
    }
}