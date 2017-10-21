pragma solidity ^0.4.4;

/*
*   Contract to store patients lab results
*   Relates a private id with UN-ENCRYPTED lab results
*/

contract LabResults {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string labResultsRecord) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = labResultsRecord;
        }
    }

    function UpdateStore(string privId, string labResultsRecord) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = labResultsRecord;
        }
    }

    function RetrieveFromStore(string privId) returns (string) {
        return dataStore[privId];
    }
}