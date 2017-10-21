var Patients = artifacts.require("./Patients.sol");
var Insurance = artifacts.require("./Insurance.sol");

module.exports = function(deployer) {
  deployer.deploy(Patients);
  deployer.deploy(Insurance);

};
