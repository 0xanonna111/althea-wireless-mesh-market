const hre = require("hardhat");

async function main() {
  const Mesh = await hre.ethers.getContractFactory("MeshBilling");
  const mesh = await Mesh.deploy();

  await mesh.waitForDeployment();
  console.log("Mesh Billing Engine deployed to:", await mesh.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
