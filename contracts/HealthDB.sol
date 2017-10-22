pragma solidity ^0.4.4;

/*
*   Main Healthcare Database Contract
*   
*/


//Proxy Contracts!!!
contract PatientsProxy { //The patients proxy needs to be reengineered 
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
    function RetrieveFromStore(string privId) returns (bytes32);
}

contract ChronicMedicalConditionsProxy {
    function AddToStore(string privId, string chronicMedicalCondtionsRecord);
    function UpdateStore(string privId, string chronicMedicalCondtionsRecord);
    function RetrieveFromStore(string privId) returns (bytes32);
}

contract FamilyMedicalHistoryProxy {
    function AddToStore(string privId, string familyMedicalHistoryRecord);
    function UpdateStore(string privId, string familyMedicalHistoryRecord);
    function RetrieveFromStore(string privId) returns (bytes32);
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
    PatientsProxy patients = PatientsProxy(); //Needs Redone
    AddressesProxy addresses = AddressesProxy(); //Needs Testing
    InsuranceInfoProxy insuranceInfo = InsuranceInfoProxy(); //Needs Testing
    MedicalHistoryProxy medicalHistory = MedicalHistoryProxy(); //Needs Testing
    AllergiesProxy allergies = AllergiesProxy(); //Needs Testing
    ChronicMedicalConditionsProxy chronicMedicalConditions = ChronicMedicalConditionsProxy(); //Needs Testing
    FamilyMedicalHistoryProxy familyMedicalHistory = FamilyMedicalHistoryProxy(); //Needs Testing
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
    //Medical history will be sent to and stored on the blockchain unencrypted
    function UpdatePatientMedicalHistory(string privateId, string updatedPatientMedicalHistory) {
        medicalHistory.UpdateStore(privateId, updatedPatientMedicalHistory);
    }

    //Geta patient's medical history from the blockchain
    //Medical info will reach the front end unenctypted
    function GetPatientMedicalHistory(string privateId) returns (string) {
        return bytes32ToString(medicalHistory.RetrieveFromStore(privateId));
    }

    //Add a patient's allergy info to the blockchain, only to be called when adding a patient's allergy info for the first time
    //Allergy information will be sent to and stored on the blockchain unenctypted 
    function AddPatientAllergyInfo(string privateId, string patientAllergyInfo) {
        allergies.AddToStore(privateId, patientAllergyInfo);
    }

    //Update a patient's allergy info on the blockchain, only to be called when updating the allergy info of an existing patient
    //Allergy information will be sent to and stored on the blockchain unencrypted
    function UpdatePatientAllergyInfo(string privateId, string updatedPatientAllergyInfo) {
        allergies.UpdateStore(privateId, updatedPatientAllergyInfo);
    }

    //Get a patient's allergy info from the blockchain
    //Allergy info will reach the front end unencrypted
    function GetPatientAllergyInfo(string privateId) returns (string) {
        return bytes32ToString(allergies.RetrieveFromStore(privateId));
    }

    //Add a patient's chronic medical conditions to the blockchain, only to be called when adding a patient's chronic medical conditions for the first time
    //Chronic medical conditions will be sent to and stored on the blockchain unencrypted
    function AddPatientChronicMedicalConditions(string privateId, string patientChronicMecialConditions) {
        chronicMedicalConditions.AddToStore(privateId, patientChronicMecialConditions);
    }

    //Update a patient's chronic medical conditions on the blockchain, only to be called when updating the chronic medical conditions of an existing patient
    //Chronic medical conditions will be sent to and stored on the blockchain unencrypted
    function UpdatePatientChronicMedicalConditions(string privateId, string updatedPatientChronicMedicalConditions) {
        chronicMedicalConditions.UpdateStore(privateId, updatedPatientChronicMedicalConditions);
    }

    //Get a patients chronic medical conditions from the blockchain
    //Chronic medical conditions will reach the front end unencrypted
    function GetPatientChronicMedicalConditions(string privateId) returns (string) {
        return bytes32ToString(chronicMedicalConditions.RetrieveFromStore(privateId));
    }

    //Add a patient's family medical history to the blockchain, only to be called when adding a patient's family medical history to the blockchain for the first tiem
    //Family medical history will reach the front end unencrypted
    function AddPatientFamilyMedicalHistory(string publicId, string patientFamilyMedicalHistory) {
        familyMedicalHistory.AddToStore(publicId, patientFamilyMedicalHistory);
    }

    //Update a patient's family medical history on the blockchain, only to be called when updating the family medical history of an existing patient
    //Family medical history will be sent to and stored on the blockchain unencrypted
    function UpdatePatientFamilyMedicalHistory(string publicId, string updatedPatientFamilyMedicalHistory) {
        familyMedicalHistory.UpdateStore(publicId, updatedPatientFamilyMedicalHistory);
    }
    
    //Get a patient's family medical history from the blockchain
    //Family medical history will reach the front end unencrypted
    function GetPatientFamilyMedicalHistory(string publicId) returns (string) {
        return bytes32ToString(familyMedicalHistory.RetrieveFromStore(publicId));
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