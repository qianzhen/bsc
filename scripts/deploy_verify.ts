import { readFileSync } from "fs";
import { ethers,tenderly } from "hardhat";

//npx hardhat run scripts/deploy.ts --network tenderly 部署命令
async function main() {
    let Config = await ethers.deployContract("Config");
    Config = await Config.waitForDeployment();
    const address = await Config.getAddress();
    console.log("Config:", address);
    /*tenderly.verify({
        address: address,
        name:'Config',
    });*/

    /*const NETWORK_ID = 56;
    await tenderly.verifyMultiCompilerAPI({
      contracts: [
        {
          contractToVerify: "Config",
          sources: {
            "contracts/Config.sol": {
              name: "Config",
              code: readFileSync("contracts/Config.sol", "utf-8").toString(),
            },
          },
          // solidity format compiler with a little modification at libraries param
          compiler: {
            version: "0.8.20",
            settings: {
              optimizer: {
                enabled: true,
                runs: 200,
              },
              viaIR: true,
              evmVersion:"istanbul",
            },
          },
          networks: {
            [NETWORK_ID]: {
              address: address,
            },
          },
        },
      ],
    });*/
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
