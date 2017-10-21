var ConvertLib = artifacts.require("./ConvertLib.sol");
var Patients = artifacts.require("./Patients.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  //deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(Patients);
};
