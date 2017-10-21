pragma solidity ^0.4.4;

/*
*   Contract to store patients family medical history records
*   Relates a private id with UN-ENCRYPTED family medical history records
*/

contract FamilyMedicalHistory {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string familyMedicalHistoryRecord) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = familyMedicalHistoryRecord;
        }
    }

    function UpdateStore(string privId, string familyMedicalHistoryRecord) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = familyMedicalHistoryRecord;
        }
    }

    function RetrieveFromStore(string privId) returns (string) {
        return dataStore[privId];
    }
}