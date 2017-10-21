pragma solidity ^0.4.4;

/*
*   Contract to store patients social history records
*   Relates a private id with UN-ENCRYPTED social history records
*/

contract SocialHistory {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string socialHistoryRecord) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = socialHistoryRecord;
        }
    }

    function UpdateStore(string privId, string socialHistoryRecord) {
        if(keccak256(dataStore[privId]) == keccak256("")){
            revert();
        } else {
            dataStore[privId] = socialHistoryRecord;
        }
    }

    function RetrieveFromStore(string privId) returns (string) {
        return dataStore[privId];
    }
}