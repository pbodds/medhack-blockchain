var Patients = artifacts.require("./Patients.sol");
var InsuranceInfo = artifacts.require("./InsuranceInfo.sol");
var Addresses = artifacts.require("./Addresses.sol");
var Medications = artifacts.require("./Medications.sol");
var Allergies = artifacts.require("./Allergies.sol");


module.exports = function(deployer) {
  deployer.deploy(Patients);
  deployer.deploy(InsuranceInfo);
  deployer.deploy(Addresses);
  deployer.deploy(Medications);
  deployer.deploy(Allergies);
};
