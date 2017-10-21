pragma solidity ^0.4.4;

/*
*   Contract to store prescriptions given to patients
*   Relates a private id with UN-ENCRYPTED prescreption records
*/

contract Prescriptions {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string prescriptionRecord) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = prescriptionRecord;
        }
    }

    function UpdateStore(string privId, string prescriptionRecord) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = prescriptionRecord;
        }
    }

    function RetrieveFromStore(string privId) returns (string) {
        return dataStore[privId];
    }
}