var Patients = artifacts.require("./Patients.sol");
var InsuranceInfo = artifacts.require("./InsuranceInfo.sol");
var Addresses = artifacts.require("./Addresses.sol");
var Allergies = artifacts.require("./Allergies.sol");
var MedicalHistory = artifacts.require("./MedicalHistory.sol");
var ChronicMedicalConditions = artifacts.require("./ChronicMedicalConditions.sol");
var FamilyMedicalHistory = artifacts.require("./FamilyMedicalHistory.sol");
var SocialHistory = artifacts.require("./SocialHistory.sol");
var LabResults = artifacts.require("./LabResults.sol");


module.exports = function(deployer) {
  deployer.deploy(Patients);
  deployer.deploy(InsuranceInfo);
  deployer.deploy(Addresses);
  deployer.deploy(Allergies);
  deployer.deploy(MedicalHistory);
  deployer.deploy(ChronicMedicalConditions);
  deployer.deploy(FamilyMedicalHistory);
  deployer.deploy(SocialHistory);
  deployer.deploy(LabResults);
};
