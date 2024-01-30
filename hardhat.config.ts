import * as dotenv from "dotenv"; // Load .env file keyfile
import { HardhatUserConfig, task} from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-chai-matchers";

import * as tdly from "@tenderly/hardhat-tenderly";
tdly.setup({automaticVerifications:true});
dotenv.config();

const config: HardhatUserConfig = {
  solidity: {
    version:"0.8.20",
    settings: {
      optimizer:{
        enabled:true,
        runs: 200,
      },
      viaIR: true,
      evmVersion:"istanbul",
    }
  },
  networks: {
    tenderly: { //要么tenderly 要么devnet，默认的网络名是hardhat
      url : process.env.TenderlyRPC,
      chainId: 56,
    },
  },
  tenderly: {
    project:"pa",
    username: "qianzhen",
    privateVerification:true, //私有验证 必须的
  },
};

export default config;
