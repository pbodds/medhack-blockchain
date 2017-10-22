pragma solidity ^0.4.4;

/*
*   Main Healthcare Database Contract
*   
*/


//Proxy Contracts!!!
contract PatientsProxy { //The patients proxy needs tobe reengineered 
    function CreateNewPatient(string name, string dob) returns (string);
    function GetPatient(string patientPubId) returns (string, string, string);
}

contract AddressesProxy {
    function AddToStore(string privId, string streetAddress);
    function UpdateStore(string privId, string streetAddress);
    function RetrieveFromStore(string privId) returns (bytes32);
}

contract InsuranceInfoProxy {
    function AddToStore(string privId, string insuranceInfo);
    function UpdateStore(string privId, string insuranceInfo);
    function RetrieveFromStore(string privId) returns (bytes32);
}

contract MedicalHistoryProxy {
    function AddToStore(string privId, string medicalHistoryRecord);
    function UpdateStore(string privId, string medicalHistoryRecord);
    function RetrieveFromStore(string privId) returns (bytes32);
}

contract AllergiesProxy {
    function AddToStore(string privId, string allergyList);
    function UpdateStore(string privId, string allergyList);
    function RetrieveFromStore(string privId) returns (string);
}

contract ChronicMedicalConditionsProxy {
    function AddToStore(string privId, string chronicMedicalCondtionsRecord);
    function UpdateStore(string privId, string chronicMedicalCondtionsRecord);
    function RetrieveFromStore(string privId) returns (string);
}

contract FamilyMedicalHistoryProxy {
    function AddToStore(string privId, string familyMedicalHistoryRecord);
    function UpdateStore(string privId, string familyMedicalHistoryRecord);
    function RetrieveFromStore(string privId) returns (string);
}

contract SocialHistoryProxy {
    function AddToStore(string privId, string socialHistoryRecord);
    function UpdateStore(string privId, string socialHistoryRecord);
    function RetrieveFromStore(string privId) returns (string);
}

contract PrescriptionsProxy {
    function AddToStore(string privId, string prescriptionRecord);
    function UpdateStore(string privId, string prescriptionRecord);
    function RetrieveFromStore(string privId) returns (string);
}

contract LabResultsProxy {
    function AddToStore(string privId, string labResultsRecord);
    function UpdateStore(string privId, string labResultsRecord);
    function RetrieveFromStore(string privId) returns (string);
}

contract HealthDB {
    PatientsProxy patients = PatientsProxy();
    AddressesProxy addresses = AddressesProxy();
    InsuranceInfoProxy insuranceInfo = InsuranceInfoProxy();
    MedicalHistoryProxy medicalHistory = MedicalHistoryProxy();
    AllergiesProxy allergies = AllergiesProxy();
    ChronicMedicalConditionsProxy chronicMedicalConditions = ChronicMedicalConditionsProxy();
    FamilyMedicalHistoryProxy familyMedicalHistory = FamilyMedicalHistoryProxy();
    SocialHistoryProxy socialHistory = SocialHistoryProxy();
    PrescriptionsProxy prescriptions = PrescriptionsProxy();
    LabResultsProxy labResults = LabResultsProxy();

    //--!!!---THIS HAS TO BE REENGINEERED FROM THE BEGINNING--!!!---
    function CreateNewPatientAccount(string name, string dob) returns (string) {
        return patients.CreateNewPatient(name, dob);
    }

    function GetPatientAccount(string publicId) returns (string, string, string) {
        return patients.GetPatient(publicId);
    }
    //--!!!---END THIS HAS TO BE REENGINEERED FROM THE BEGINNING--!!!---


    //Add a patient address to the blockchain, only to be called when adding a patient's address for the first time 
    //Address should be encrypted on the front end and should not exist unencrypted in any form on the blockchain
    function AddPatientAddress(string privateId, string patientAddress) {
        addresses.AddToStore(privateId, patientAddress);
    }

    //Update a patient address on the blockchain, only to be called when updating the address of an existing patient
    //Address should be encrypted on the front end and should not exist unencrypted in any form on the blockchain
    function UpdatePatientAddress(string privateId, string updatedPatientAddress) {
        addresses.UpdateStore(privateId, updatedPatientAddress);
    }

    //Get a patient's address from the blockchain
    //Address must be unencrypted with the patient's passphrase once it reaches the front end
    function GetPatientAddress(string privateId) returns (string) {
        return bytes32ToString(addresses.RetrieveFromStore(privateId));
    }

    //Add a patient's insurance info to the blockchain, only to be called when adding a patient's insurance info for the first time
    //Insurance info should be encrypted on the front end and should not exist unencrypted in any form on the blockchain
    function AddPatientInsuranceInfo(string privateId, string patientInsuranceInfo) {
        insuranceInfo.AddToStore(privateId, patientInsuranceInfo);
    }

    //Update a patient's insurance info on the blockchain, only to be called when updating the insurance info of an existing patient
    //Insurance info should be encrypted on the front end and should not exist unencrypted in any form on the blockchain
    function UpdatePatientInsuranceInfo(string privateId, string updatedPatientInsuranceInfo) {
        insuranceInfo.UpdateStore(privateId, updatedPatientInsuranceInfo);
    }

    //Get a patient's insurance info from the blockchain
    //Insurance info must be unencrypted with the patient's passphrase once it reaches the front end
    function GetPatientInsuranceInfo(string privateId) returns (string) {
        return bytes32ToString(insuranceInfo.RetrieveFromStore(privateId));
    }

    //Add a patient's medical history to the blockchain, only to be called when adding a patients medical history for the first time
    //Medical history will be sent to and stored on the blockchain unencrypted
    function AddPatientMedicalHistory(string privateId, string patientMedicalHistory) {
        medicalHistory.AddToStore(privateId, patientMedicalHistory);
    }

    //Update a patient's medical history on the blockchain, only to be called when updating the medical history of an existing patient
    //Medical history will be sent to ans stored on the blockchain unencrypted
    function UpdatePatientMedicalHistory(string privateId, string updatedPatientMedicalHistory) {
        medicalHistory.UpdateStore(privateId, updatedPatientMedicalHistory);
    }

    function GetPatientMedicalHistory(string privateId) returns (string){
        return bytes32ToString(medicalHistory.RetrieveFromStore(privateId));
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