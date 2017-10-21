pragma solidity ^0.4.4;


/*--
Patient JSON Structure
    {
        name: bytes32,
        privateID: bytes32,
        dob: bytes32,
        streetAddress: {
            streetL1: bytes32,
            streetL2; bytes32,
            city: bytes32,
            state: bytes32,
            zip: bytes32,
        },
        insuranceInfo: {
            company: bytes32,
            idNum: bytes32,
            group: bytes32,
            plan: bytes32,
            rxBIN: bytes32,
            rxPCN: bytes32,
            rxGroup: bytes32,
            copayment: bytes32
        }
    }
*/


contract Patients {
    //Patient Struct
    struct Patient {
        string privateID;
        string name;
        string dob;
    }

    uint uId = 96768;

    mapping(string => Patient) patients;



    function CreateNewPatient(string name, string dob) returns (string) {
        uId++;
        string memory pubId = bytes32ToString(keccak256(uId + 259118));
        patients[pubId] = Patient(bytes32ToString(keccak256(uId + 354989)), name, dob);
        return pubId;
    } 


    function GetPatient(string patientPubId) returns (string, string, string) {
        Patient memory p = patients[patientPubId];
        return (p.privateID, p.name, p.dob);
    }

    function bytes32ToString(bytes32 x) constant returns (string) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }
}