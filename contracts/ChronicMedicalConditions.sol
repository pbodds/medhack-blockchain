pragma solidity ^0.4.4;

/*
*   Contract to store patients chronic medical conditions
*   Relates a private id with UN-ENCRYPTED chronic medical condition records
*/

contract ChronicMedicalConditions {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string chronicMedicalCondtionsRecord) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = chronicMedicalCondtionsRecord;
        }
    }

    function UpdateStore(string privId, string chronicMedicalCondtionsRecord) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = chronicMedicalCondtionsRecord;
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