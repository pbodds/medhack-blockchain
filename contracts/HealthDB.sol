pragma solidity ^0.4.4;

/*
*   Main Healthcare Database Contract
*   
*/


//Proxy Contracts!!!
contract PatientsProxy {
    function CreateNewPatient(string name, string dob) returns (string);
    function GetPatient(string patientPubId) returns (string, string, string);
}

contract AddressesProxy {
    function AddToStore(string privId, string streetAddress);
    function UpdateStore(string privId, string streetAddress);
    function RetrieveFromStore(string privId) returns (string);
}

contract InsuranceInfoProxy {
    function AddToStore(string privId, string insuranceInfo);
    function UpdateStore(string privId, string insuranceInfo);
    function RetrieveFromStore(string privId) returns (string);
}

contract MedicalHistoryProxy {
    function AddToStore(string privId, string medicalHistoryRecord);
    function UpdateStore(string privId, string medicalHistoryRecord);
    function RetrieveFromStore(string privId) returns (string);
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

    

}