var Patients = artifacts.require("./Patients.sol");
var InsuranceInfo = artifacts.require("./InsuranceInfo.sol");
var Addresses = artifacts.require("./Addresses.sol");

module.exports = function(deployer) {
  deployer.deploy(Patients);
  deployer.deploy(InsuranceInfo);
  deployer.deploy(Addresses);
};
