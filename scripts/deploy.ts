import { ethers } from "hardhat";
import { string } from "hardhat/internal/core/params/argumentTypes";
import { Contract } from "hardhat/internal/hardhat-network/stack-traces/model";

//npx hardhat run scripts/deploy.ts --network tenderly 部署命令
async function main() {
    const Config = await ethers.deployContract("Config");
    await Config.waitForDeployment();
    const cfgAddr = await Config.getAddress();
    console.log("Config:", cfgAddr);
    const SafeMath = await ethers.deployContract("SafeMath");
    await SafeMath.waitForDeployment();
    let smAddr = await SafeMath.getAddress();
    console.log("SafeMath:", smAddr);
    const UniV2 = await ethers.deployContract("UniV2",[],{
      libraries: {
        SafeMath: smAddr,
      },
    });
    await UniV2.waitForDeployment();
    const uniV2Addr = await UniV2.getAddress();
    console.log("UniV2Lib:", uniV2Addr);

    let arbR = await ethers.deployContract("ArbR",[cfgAddr], {
      libraries: {
        SafeMath: smAddr,
        UniV2: uniV2Addr,
      },
    });
    await arbR.waitForDeployment();
    let arbRAddr = await arbR.getAddress();
    console.log("ArbR", arbRAddr);

    let xRouter = await ethers.deployContract("XRouter",[arbRAddr], {
      libraries: {
        SafeMath: await SafeMath.getAddress(),
      },
    })
    let xRouterAddr = await xRouter.getAddress();
    console.log("XRouter:", xRouterAddr);
    await Config.SetBot(xRouterAddr);
    let owner;
    [owner] =await ethers.getSigners();
    console.log("Owner:", owner.address,"SafeMath:", smAddr,"XRouter:", xRouterAddr, "ArbR:", arbRAddr, "Config:", await arbR.config());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
