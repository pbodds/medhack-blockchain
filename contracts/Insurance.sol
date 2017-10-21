pragma solidity ^0.4.4;

/*
*   Contract to store insurance information for patients
*   Relates a private id with ENCRYPTED insurance information
*/

contract Insurance {
    struct InsuranceInfo {
        string company,
        string idNum,
        string group,
        string plan,
        string rxBIN,
        string rxPCN,
        string rxGroup,
        string copayment
    }

    mapping(string => InsuranceInfo) store;

    function AddToScore(string privId, string company, string idNum, string group, string plan, string rxBIN, string rxPCN, string rxGroup, string copayment) returns (bool) {
        return true;
    }

    function RetrieveFromStore(string privId) returns (string, string, string, string, string, string, string, string) {
        InsuranceInfo memory storeVal = store[privId];
        return (storeVal.company, storeVal.idNum, storeVal.group, storeVal.plan, storeVal.rxBIN, storeVal.rxPCN, storeVal.rxGroup, storeVal.copayment);
    }
}