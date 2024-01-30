// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Config {
    address _owner;
    modifier onlyOwner() {
        require(_owner == msg.sender, "ow!");
        _;
    }

    address public Bot;
    uint public MaxTCost;
    uint public TransitLimit;
    uint public PathLimit;
    int public MevRate;

    constructor() {
        _owner              =   payable(msg.sender);
        MaxTCost = 20;
        TransitLimit = 30;
        PathLimit = 3;
        MevRate = 90;
        init();
    }

    function init() private {
        NotMevBot[0x13f4EA83D0bd40E75C8222255bc855a974568Dd4] = true; //pancake v3 smartRouter
        NotMevBot[0x3c11F6265Ddec22f4d049Dde480615735f451646] = true;
        NotMevBot[0xf625DF2BE53Cac287fFbaaCbE3A2E5B9d0994885] = true;
        NotMevBot[0x00000047bB99ea4D791bb749D970DE71EE0b1A34] = true;
        NotMevBot[0x10ED43C718714eb63d5aA57B78B54704E256024E] = true; //PancakeRouter
        NotMevBot[0x1111111254EEB25477B68fb85Ed929f73A960582] = true; //1inch

        FactoryFee[0x0Ed713989F421Ff6F702B2e4e1C93B1Bb9002119]= 700; //Grove 13
		FactoryFee[0x0841BD0B734E4F5853f0dD8d7Ea041c241fb0Da6]= 200; //APE  
		FactoryFee[0x0A376eE063184B444ff66a9a22AD91525285FE1C]= 200; //YieldFields
		FactoryFee[0x3e708FdbE3ADA63fc94F8F61811196f1302137AD]= 200; //Cafe
		FactoryFee[0x670f55c6284c629c23baE99F585e3f17E8b9FC31]= 200; //Panther 286
		FactoryFee[0x858E3312ed3A876947EA49d572A7C42DE08af7EE]= 200; //Biswap V2 3019
		FactoryFee[0xB42E3FE71b7E0673335b3331B3e1053BD9822570]= 200; //Wault
		FactoryFee[0xBCfCcbde45cE874adCB698cC183deBcF17952812]= 200; //Pancake 164476
		FactoryFee[0xdd538E4Fd1b69B7863E1F741213276A6Cf1EfB3B]= 200; //Cheese
		FactoryFee[0xEf06A959B7a722E52341e89D7E59EFdCEdEE5553]= 400; //Deca  1
		FactoryFee[0xaF042b1B77240063bc713B9357c39ABedec1b691]= 200; //Luchow 41
		FactoryFee[0x971A5f6Ef792bA565cdF61C904982419AA77989f]= 200; //Kokomo 24
		FactoryFee[0x590A402a8Fc80E23E6eA4f5a81674df66Fb689C5]= 200; //Bafi 13
		FactoryFee[0x8BA1a4C24DE655136DEd68410e222cCA80d43444]= 100; //Sphynx 52
		FactoryFee[0x936338AfD7d95CA3ec172c6C8f8a8B6a68fcCd5C]= 200; //Rizen  8
		FactoryFee[0xC3187EB9AB08eB845A12dA6A93c3Ab8655c5AF80]= 200; //Spark 38
		FactoryFee[0xEb4D933D56E5deF7B24F543766dD398f1DaFEEd5]= 200; //Anpans 28
		FactoryFee[0x79C342FddBBF376cA6B4EFAc7aaA457D6063F8Cb]= 170; //Winery 35
		FactoryFee[0xc35DADB65012eC5796536bD9864eD8773aBc74C4]= 300; //Sushi 2164
		FactoryFee[0x789A39AE5eE2dc6b1B8886b7AaF0e399e1E7Cad4]= 200; //Desire 52
		FactoryFee[0xAF3bA99201485E14472353a10dd7392845826314]= 200;//Cobra 46
		FactoryFee[0x6FCC6a77ee6F383395c630EEDe1EE928dFF4E331]= 200; //Thunder 33
		FactoryFee[0x43eBb0cb9bD53A3Ed928Dd662095aCE1cef92D19]= 200; //Definix 31
		FactoryFee[0xB0161Be4354C982B4DCFE8829EBd5aF9Bc9a639d]= 300; //Aoco 18
		FactoryFee[0x14a16D070D0b273574562180c84a875EAD1D35F2]= 200; //Shibcake 34
		FactoryFee[0xCBe7425662BF0edf164aBf12c881Ced6fdafE75E]= 200; //Slime 97
		FactoryFee[0xd76d8C2A7CA0a1609Aea0b9b5017B3F7782891bf]= 200; //OpenOcean 55
		FactoryFee[0x9A272d734c5a0d7d84E0a892e891a553e8066dce]= 300; //Fst 4155
		FactoryFee[0xd6715A8be3944ec72738F0BFDC739d48C3c29349]= 300; //Nomi 210
		FactoryFee[0x3CD1C46068dAEa5Ebb0d3f55F6915B10648062B8]= 300; //Mdex 2118
		FactoryFee[0x092EE062Baa0440B6df6BBb7Db7e66D8902bFdF7]= 300; //Shibance 40
		FactoryFee[0xd654CbF99F2907F06c88399AE123606121247D5C]= 300; //Jswap 482
		FactoryFee[0xB9fA84912FF2383a617d8b433E926Adf0Dd3FEa1]= 300; //Narwhal
		FactoryFee[0x4d67A875c3a20A792b9ADCa1C67EC7A71A54c881]= 300; //DefiswapV2
		FactoryFee[0x73D9F93D53505cB8C4c7f952ae42450d9E859D10]= 300;//DSG 156
		FactoryFee[0xe44584C03AA6ed0716D496CeaD7bC2920609F395]= 300;//LP-APPLE 1
		FactoryFee[0x0eb58E5c8aA63314ff5547289185cC4583DfCBD5]= 300;//Jet 178
		FactoryFee[0x4E66Fda7820c53C1a2F601F84918C375205Eac3E]= 300;//Twindex 101
		FactoryFee[0x1Ba94C0851D96b2c0a01382Bf895B5b25361CcB2]= 300; //Butter 35
		FactoryFee[0x7810D4B7bC4F7faee9deec3242238a39c4f1197d]= 300;//Swipe 40
		FactoryFee[0x01bF7C66c6BD861915CdaaE475042d3c4BaE16A7]= 300;//Bakery 2767
		FactoryFee[0xFa51B0746eb96deBC619Fd2EA88d5D8B43BD8230]= 300;//Intercrone 57
		FactoryFee[0xDB984fd8371d07db9cBf4A48Eb9676b09B12161D]= 300;//Box 44
		FactoryFee[0x6d8EDFf1B0a01F28516Eeee58EBF99FE977dB511]= 300;//Qiao
        FactoryFee[0x2c34577F8c582Ec919DCe9f5E94Cf1e83A814A1a]= 1000; //TRUTH
        FactoryFee[0x3AefE13269a7Ed7506664598C400F17902AD2635]= 1000; //Daylight
        FactoryFee[0x1e895bFe59E3A5103e8B7dA3897d1F2391476f3c]= 1000; //Dooar  大流动性
        FactoryFee[0x7B60EB6A0Db0DC1D40F3227A04Fbb0e941C22810]= 500; //ROBOCEX
        FactoryFee[0x918d7e714243F7d9d463C37e106235dCde294ffC]= 60; //StableX 77
        FactoryFee[0x71539D09D3890195dDa87A6198B98B75211b72F3]= 170; //SwapFish 16  
        FactoryFee[0x72d892a36EC529cB2b81430E8d73364aB78277f0]= 10; //Novation 1
        FactoryFee[0xc87B4D526767AD696306aba7fdcd860aCE427B0E]= 300; //Stobox 动态fee 流动性大
        FactoryFee[0x7897C32cbda1935e97c0B59F244747562D4d97c1]= 225; //BXH 
        FactoryFee[0xED13950fD0a2E10788E830e60CFA0D018125310e]= 240; //Oni
        FactoryFee[0xae52c26976E56e9f8829396489A4b7FfEbe8aAE9]= 100; //Many 51  
        FactoryFee[0xCC5414E7ce73B717A14e682e9899785A13002dB9]= 200; //Egon
		FactoryFee[0xDda79Ec4AF818D1e95F0A45B3E7e60461d5228cb]= 200; //PolkaBridgeAMM 
        FactoryFee[0x6a616606D9f3BaE02d215db5046b7D1030674622]= 200;  //Annex
		FactoryFee[0xC08f384fe79624b0fF6b7CeAd54F9540CC449D23]= 200; //Ghost
        FactoryFee[0x787557689775Df6791c729014C78ABAC6Cb8F632]= 100; //MilkTea
        FactoryFee[0x98957ab49b8bc9f7ddbCfD8BcC83728085ecb238]= 100; //RadioShack(RLP)
        FactoryFee[0x505504beb3638723684D9Ed3aC91E9E850d90De3]= 200;//Cobra 
        FactoryFee[0xC73d4eA4Aba8271B9ab09a17edeFf02313bB8f19]= 200;//WND
        FactoryFee[0x087E6071164e6FDC0d931ad38CB38DbFA64B081c]= 200; //Dank 27
        FactoryFee[0x147d1bAD12A5446ae8B6c623e19F22eFBd35b32F]= 200; //Bscc
        FactoryFee[0x2Af5c23798FEc8E433E11cce4A8822d95cD90565]= 200; //SMB 102
        FactoryFee[0x1730484cd33Fb46B22177f3Ffe8E002b4D7E3600]= 200; //Wire 
        FactoryFee[0xC2D8d27F3196D9989aBf366230a47384010440c0]= 200; //Coin 138
		FactoryFee[0xcA80652Bc0d0301263844352E70e4c3741cb8C91]= 200;//TOP100 
        FactoryFee[0x4136A450861f5CFE7E860Ce93e678Ad12158695C]= 200; //CST 61
        FactoryFee[0x19E5ebC005688466d11015e646Fa182621c1881e]= 200;//Saita
        FactoryFee[0x70eab9FAfEE9BFA372EbEe7B2B6CFF78b996f6df]= 200;//Pippi 
        FactoryFee[0xADfFd760F642b5305b0AbDa21cf956Dd836B5de5]= 200;//Chimpy 28
        FactoryFee[0x71f843BD057d2eE39AE52186a33c3aFD1124805A]= 200; //Unicornx
        FactoryFee[0x43c7772C6F360074c83534C8a0001af1b9010D7a]= 200;//BROWNSTAKING
        FactoryFee[0x69a3D7D0505988Bb9774Ba5696299a6375066612]= 200; //Satoshi 30
        FactoryFee[0x4750A965f72E09c434b7a40f1735144c983440D2]= 200;//Plearn 流动性大 
        FactoryFee[0xB836017ACf10b8A7c6c6C9e99eFE0f5B0250FC45]= 200;//Pad 134
        FactoryFee[0x78DBfA573c31EEE2d51f4dcd3E2693d7315B3a46]= 200; //Merrymen
        FactoryFee[0x6100af6980d35FDb119BECE4969fF6b68DA6e4ea]= 200;//Annex 流动性大 活跃
        FactoryFee[0x86407bEa2078ea5f5EB5A52B2caA963bC1F889Da]= 200; //Babyswap 1600
        FactoryFee[0xCBac17919f7aad11E623Af4FeA98B10B84802eAc]= 200;//Mochi 93
        FactoryFee[0x86A859773cf6df9C8117F20b0B950adA84e7644d]= 200;//Safe 81
        FactoryFee[0x4dC6048552e2DC6Eb1f82A783E859157d40FA193]= 200;//Ben 31 
        FactoryFee[0xf0bc2E21a76513aa7CC2730C7A1D6deE0790751f]= 200; //Knight 168
        FactoryFee[0xa236F603902030D87A7E9B09c27A6608619D3d14]= 200;//FarmLp 流动性大 
        FactoryFee[0x74d31C3Efd6050BAc241B5d1adB711836E8f620A]= 200;//Fiet 1
        FactoryFee[0x731d91Dd835330cb2BeeAFB9a1672e3177B7168f]= 200;//Ale 29
        FactoryFee[0x0EeF723EfB04BCCf88B530450c9Bd305D3a06F6f]= 200;//Ho
        FactoryFee[0x18e603b8DA00e70cEc53E62C8dBF133B38A5494e]= 200;//TZ-LP
        FactoryFee[0x184411227f47F614e49cfab277D0F3Bfc65D2316]= 200; //Wakanda 
        FactoryFee[0xC7a506ab3ac668EAb6bF9eCf971433D6CFeF05D9]= 200;//Alita 15 流动性大
        FactoryFee[0xe0636f192a88De6F1c9ed1a6A0F265C9775c8596]= 200;//Niob
		FactoryFee[0x780B2A0D1B55cCdcF672f12484Fcdbb545b6Ae2F]= 200;//PIXEL 
		FactoryFee[0xf22D62850ffA0a6D70D0CF8f2a3b5EC3509E04B0]= 200;//Lite 
		FactoryFee[0xb3456550C17128Ca7ebbcc47d4bE6cAe29D43853]= 200; //TIFI 
		FactoryFee[0x251912dE998ec91DFDf67EfBe032d6f4aB5EC485]= 200; //ShibaNova 94
		FactoryFee[0x6Cc587515137EE5b89EbD0B25Cc5Fc2b93015357]= 400; //Infinity 37
		FactoryFee[0x80908495143fF92fB497A937B681a1D44021Ec62]= 200;//Swappery
        FactoryFee[0x4f8bdc85E3eec5b9dE67097c3f59B6Db025d9986] = 300; //Joe
        FactoryFee[0x381fEfaDAB5466BFf0e8e96842e8e76A143E8F73] =300; //Ample
        FactoryFee[0xCe8fd65646F2a2a897755A1188C04aCe94D2B8D0] = 300; //BSC
        FactoryFee[0xE52cCf7B6cE4817449F2E6fA7efD7B567803E4b4] = 300; //Orion
        FactoryFee[0x553990F2CBA90272390f62C5BDb1681fFc899675] = 300; //Jul
        FactoryFee[0xaC653cE27E04C6ac565FD87F18128aD33ca03Ba2] = 300; //Thugswap
        FactoryFee[0x267c07A9e658cC9c6190D4cbAF26C5c8260e5eE1]= 300;  //STRACV2

        FactoryFee[0x984Da0774C0d90e054c3707f93863AfFF699B15D]= 300;//Oceanland
        FactoryFee[0x00877DA81120D37629F1eBce1A4cB8432bBD3788]= 300;//Eotcswap V2 没有开源 0x2811b4b051A22F31952B56CEEfCA6E227065a043
        FactoryFee[0xC6B7ee49D386bAe4FD501F2d2f8d18828F1f6285]= 4; //NomiswapStable 3个LP，是一种变种stable交换协议
    
        FactoryFee[0xf89e6CA06121B6d4370f4B196Ae458e8b969A011] = 300; //TODO:Frax
        FactoryFee[0x5De74546d3B86C8Df7FEEc30253865e1149818C8] = 300;//FireBird
        FactoryFee[0x1D9F43a6195054313ac1aE423B1f810f593b6ac1] = 200; //Squad Lp
        FactoryFee[0x06530550A48F990360DFD642d2132354A144F31d] = 300; //Empire
        FactoryFee[0x3657952d7bA5A0A4799809b5B6fdfF9ec5B46293] = 300; //Warden
        FactoryFee[0x31aFfd875e9f68cd6Cd12Cee8943566c9A4bBA13] = 300; //Elk
        FactoryFee[0x03879E2a3944FD601e7638DfCBC9253fb793b599] = 250; //Baryon
        FactoryFee[0x542b6524aBF0Bd47Dc191504E38400Ec14D0290C] = 300; //YoshiSwap
        FactoryFee[0x795802CB01A7Be4BE2f7f114B232A83B3ADce64a] = 300; //Biokript
        FactoryFee[0x4DcE5Bdb81B8D5EdB66cA1b8b2616A8E0Dd5f807] = 250; //Latte
        FactoryFee[0xEB10f4Fe2A57383215646b4aC0Da70F8EDc69D4F] = 100; //Leonicorn
        FactoryFee[0xCBac17919f7aad11E623Af4FeA98B10B84802eAc] = 200; //Mochi

        FactoryFee[0x3265CdE5843e02E35c45C4b9352d3C1c4a542Ff4] = 300;//DaoLp
    }

    function SetBot(address bot) public onlyOwner {
        Bot = bot;
    }

    function SetMaxTCost(uint cost) public onlyOwner {
        MaxTCost = cost;
    }

    function SetTransitLimit(uint tLimit) public onlyOwner {
        TransitLimit = tLimit;
    }

    function SetPathLimit(uint limit) public onlyOwner {
        PathLimit = limit;
    }

    function SetMevRate(int rate) public onlyOwner {
        MevRate = rate;
    }

    function GetConfig() public view returns (address,uint,uint,uint,int){
        return (Bot,MaxTCost,TransitLimit,PathLimit, MevRate);
    }

    mapping (address=>bool) private NotMevBot;

    function IsNotMev(address addr) public view returns (bool) {
        return NotMevBot[addr];
    }

    function SetNotMev(address addr) public onlyOwner {
        NotMevBot[addr] = true;
    }

    mapping(address=>uint) private FactoryFee;

    function SetFactoryFee(address fac,uint fee) public onlyOwner {
        FactoryFee[fac] = fee;
    }

    function GetFactoryFee(address fac) public view returns (uint) {
        return FactoryFee[fac];
    }
}