pragma solidity ^0.4.4;

/*
*   Contract to store addresses for patients
*   Relates a private id with ENCRYPTED addresses
*/

contract Addresses {    
    mapping(string => string) dataStore;

    function AddToStore(string privId, string address) {
        if(keccak256(dataStore[privId]) != keccak256("")){
            revert();
        } else {
            dataStore[privId] = address;
        }
    }

    function RetrieveFromStore(string privId) returns (string) {
        return dataStore[privId];
    }
}