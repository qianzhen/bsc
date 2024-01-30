import { ethers } from "hardhat";
import { string } from "hardhat/internal/core/params/argumentTypes";
import * as fs from 'fs';

require("dotenv").config();

async function deployLibrary2(envData:string|undefined,libName:string):Promise<string> {
    if (envData === undefined) {
        let Lib = await ethers.deployContract(libName);
        Lib = await Lib.waitForDeployment();
        const addr = await Lib.getAddress();
        fs.appendFileSync('.env', `${libName}=${addr}\n`);
        return addr;
    } else {
        return envData;
    }
}

describe("ArbR", function () {
    before(async function () {
      this.timeout(10*60*1000);//60s
      await deployLibrary2(process.env.Config,"Config");
    });
  
    describe("GetPairInfo", function () {
      it("GetPairInfo", async function () {
        console.log("Ok");
      })
    });
  });











