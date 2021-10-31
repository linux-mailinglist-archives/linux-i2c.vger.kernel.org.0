Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40AAE440EBD
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Oct 2021 15:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhJaOIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 Oct 2021 10:08:37 -0400
Received: from mga09.intel.com ([134.134.136.24]:61152 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229662AbhJaOIg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 31 Oct 2021 10:08:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10153"; a="230745030"
X-IronPort-AV: E=Sophos;i="5.87,197,1631602800"; 
   d="gz'50?scan'50,208,50";a="230745030"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2021 07:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,197,1631602800"; 
   d="gz'50?scan'50,208,50";a="637562598"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2021 07:06:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 31 Oct 2021 07:06:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 31 Oct 2021 07:06:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 31 Oct 2021 07:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjjsXnJMCMfKVzE/mDY5HH3yp66IDWPI/PdpfiFNgCngVOKmEY2hKQcwco4EA0FQEdx79AiZfiSb6marqxT2JDPPDjztvK83LFoI3/Ioeklt62svzo8NCIgH90CO3aSMhOHuI7lpu8QV0b6+a7ylG836Q1Cz0iiGj7Gu3GNIyKrDBNPgsEpMIe6gIBpb68XqPmViLtpVR1dTOzNQkzKoa42VV20I/oW1of/cShABmcVAkbrvDSZ0tvqSVJvw5jWOSvGnVLuJLse44PKT52EouJLGBmWAi3cbNQZGgRCew+stT/RNXVR/gltzTPtnFcC9p03A8l46dIBSJZ7J/UkA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWSEek/skccgO2jqIkNfqZhef04YQEd3MX65fVnc3lc=;
 b=ZDdQH0b3m7xiMlavVhAh0CfvoKNeNVg4X+5dno2uFh2Ia/2HacUfxC6OW11skfwtqc6W2jleHQTLgCVdB0v8/l62gdScaQkOSgC6aThFtBTjLQ7R4kI4AbQXXhxzsOh4NONeruqmXclNW1p8bm4Fv59nbAF8fUABSiAvTW1C9mZMuAT0o0gu/tkN0lnRxJNpCNyhN7n8uyE2Ejhwx5t+yasFtaAztgpkwScA1wMIH7FGTfEGWOTvoEscCVALosK7uHJNUheSSDcwfbh4UEqIQpAe1a+ERW2OwIS9ibO8o+45ZUAeSSgddSzPbnAXwqrXeRi2GfacfL6G4E65RU+uRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWSEek/skccgO2jqIkNfqZhef04YQEd3MX65fVnc3lc=;
 b=Llqbcoi/0nWBkx3KwnQvFVYtSYY44WWFgrRJnctkBW0RsMGwrm2tqXch1gqgWAZbQnzTS8lm3rGBhqleSTxAsPS4vcQG38WfSJ/yZUuBDF7PKFLVV0FC+Z1J6FFpL+NAM5Ii2TC11/u7vwHO6LVr1XRmJf1XmuzgZ/tqBRMUBqQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5582.namprd11.prod.outlook.com (2603:10b6:a03:3aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Sun, 31 Oct
 2021 14:05:54 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::3455:d126:2541:7723%2]) with mapi id 15.20.4649.019; Sun, 31 Oct 2021
 14:05:54 +0000
Content-Type: multipart/mixed; boundary="------------FzaaxobyCNXn11cM6ChdT0CD"
Message-ID: <2df2406f-408b-1340-3f91-f545707a3278@intel.com>
Date:   Sun, 31 Oct 2021 22:05:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH v4] i2c: qcom-geni: Add support for GPI DMA
References: <202110292307.Kb4i0Jf1-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202110292307.Kb4i0Jf1-lkp@intel.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
CC:     <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
        <linux-arm-msm@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202110292307.Kb4i0Jf1-lkp@intel.com>
X-ClientProxiedBy: HK2PR0401CA0006.apcprd04.prod.outlook.com
 (2603:1096:202:2::16) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
MIME-Version: 1.0
Received: from [10.255.29.65] (192.198.142.13) by HK2PR0401CA0006.apcprd04.prod.outlook.com (2603:1096:202:2::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Sun, 31 Oct 2021 14:05:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bab9eef0-7ffd-48c7-3e78-08d99c778d8f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5582:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB55822ADF3ACC1DA668056060FB899@SJ0PR11MB5582.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3jujOkiPw8C/W5o68hEBOsfWPIBWuBCl52oHb25C5dTlMsmp7EEu0naSUkHi+MJtveA+TjrPT3Iueet6TGZrhPXAt9e8cwxPwYGY6n7NDz6w/df44E8xrb0LLqw6TlalB5/3v9vikMFMG3lapNc0zRwskIsicgvqpqArubXC3nv9nO1Sg7SvRyGY27knHGmFYvO0g1mefyKe7f8EMzoUgIGq5WeAF4Aw9PGDbZz966DY9B11UYjHk3JzuYz0KOJXHEIKVU/rY2E5DBHzUeBrY8k7I/LhMkAuFvwNzhAqS7XL1LFGgOVximOAbpqVMaBN/5RpPYupiBp0tCwanAbtGyDa0MLIFYTjvIxZl/NOprfw1IS5ysj639h6g36mT/BfM9nmpDyrB4ai7ZK1tQFlYW7+FopPaNGPV5Lq2bwBhS5pusviZpEZo16CIbH+P88vjdohqEpuQA0jCckuELza35FwCn8N0FteTQsS94CmDlhGF4XEfJKbt5TIdILX1gxPUr5Ye6s4tCLBWAvBHTiwIRGjf5a084TGQ6bO9GtV6UlSkuRa+sz1Ij9fFXXT6hDokGSq9JBYZ9f3TLKaidUQgsI6gmVJJBFn346wI+XMomBZ8lyplgWIkdbYHjVv90rM9gFoD1AWW7J4s75h3PpZtTp2NtgVXPn4+DxovAjWdYuvQrHS+phvDpSD5bXNGt+bRgtbZB5mNLNwvJTSaoG1N4NoVKwKonNflnvqtsgnVR7NtUsGT892HsOIQfNLPF4/9G+qQBQLTbSykk29G1eEDswbH0BUDYdnvQB1dHFIegw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4001150100001)(82960400001)(4326008)(38100700002)(33964004)(31686004)(2906002)(31696002)(6486002)(956004)(8936002)(36756003)(235185007)(86362001)(66946007)(5660300002)(8676002)(26005)(83380400001)(66476007)(66556008)(6666004)(186003)(966005)(508600001)(2616005)(7416002)(16576012)(316002)(110136005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm05eUN1QmtyUVNIVXgvMGVWaVNCd0JldURmR2cra21aeTEzKzcyb0JoK0E0?=
 =?utf-8?B?MzUwQ2RDMzRDeWJVaFA5Rk1UVHNkS2NoRzZyS2gxb3kwRThUZnQxWmRTUXgv?=
 =?utf-8?B?ZHIvT0E2RjI1OGF2UXM4TGhTZFpyS0xOcEVzb01RTXRJVXJ5NVRHMTIybElY?=
 =?utf-8?B?TkJ4amxCd0tKTXhIaC83SUltWDFtbDVJdWM5c0hjY21JdUNINHlIclhESG54?=
 =?utf-8?B?WFdkZlBJc3d6c3dmNEFudkRUbnNubFhYRG91cERtZW5Pd2ZFeVBXdi9sV0dJ?=
 =?utf-8?B?N0k4YWVGNFh1RElNNjN5VjZrcHFtc3JPMk9nYzY1V0dDSnh4aVZkN3paRE1F?=
 =?utf-8?B?VFRhZXpxbXZwNTJIT3psaWU4SnlBTVUvd2Y5NUlWRERRUzAzMFhVZERoaTZ5?=
 =?utf-8?B?NndKNWdwNHVVQjdPUUREc3NVT1FrYVdoMHA4ZGFvVlQzaFRFUm9IVWFlNXNr?=
 =?utf-8?B?K3lpazQ4a3VtbUk4b1NVQnBod1pZa2ZaWm9kUUVCSDg1RFJ2Q3hncGhkbWlE?=
 =?utf-8?B?VXYzS2poWkM2OTdpSEMzeHZDdTRBTlhUWTQ2U056MHI1ek00Zk1FdWtzMmNa?=
 =?utf-8?B?NWl4TUcwc054Q21iUHFvVGc2d0piR1MyL0tSWTBzU3dzcXZrYTFTZys2Wm41?=
 =?utf-8?B?WVM1emNsZE5mWWFWbUtnbStRdEh6bEZZWHF5TFhJQU1OaDVKOHZnb2RVQUgz?=
 =?utf-8?B?QW8vQkl2OC9BbThXaTJKNktweE5NdVpEMEh0Z3BYUkpRVG1HcTVObGpZcnkx?=
 =?utf-8?B?VnczMkZ4KytRNnNLQU9aK2tEWTVjeE5pcHZxSXUvVlRaQnlyNlZOaFpoMmh0?=
 =?utf-8?B?Skc2ZTlvOFAwYTZ0UDlxVCsybGFxY0dBTU8rUVdmOGxJaTllZVFWYkhzcENl?=
 =?utf-8?B?V2NlWnRzSWluMHhqTUdVNkFodjFTYmE4T1Zxa1pJUyt4M3Q5Y0xGSEt1NXF5?=
 =?utf-8?B?dlo2M0hLVDFnb3l5a0pLai9LTDE5QlZyWno1Z09wWU82Q3IyRjN3Q0dydGhy?=
 =?utf-8?B?UWZZbU16cnNuQUJnbFdYRnBIdXNRbzdXbFlzUnQrb3FJclhrU0RvVHhtRXUv?=
 =?utf-8?B?cHEyaEJTdkJPWk1RdWZvVlBqL2pSaXE2UDdHdEpBT2pJYWxjSlppT2NlZGt4?=
 =?utf-8?B?ZXhPSFdjdUlTT2JzemJmUHpJUC9yQ2pZWjlCSExSdFVvTVI5b3FPZnRMZncv?=
 =?utf-8?B?Y3pnUm9JSGswUFBzNUVyRUs2V0U2K2JFVHZ2aDQ4VnowSHJFZDg3RTRUeFZR?=
 =?utf-8?B?YlZMVUhjZDVURmxJRnpUQ2ZtSHhERzNlOVZ5N0NwUjVzdFVvZ0x4c3orY1hC?=
 =?utf-8?B?T3V1WklnTDRuZkdqb3RBMXdwUzAxKzQvMW84bTBOWDhEK005LzNwS010bWc3?=
 =?utf-8?B?U3BTdjBsY2ExenpiK3IzczZNU3JsaC9JZ05tblFkaXJKSEMxWG9hVnR3VEFG?=
 =?utf-8?B?bUR0SDU1QjJPYVdveDA3NnpSR3NnN0VNdjRORlZDcWtDdU8yc2padzQ0cnRk?=
 =?utf-8?B?eDRwam5GaTN4YkVTSFVFblovejV5RHlhdFIzYlp1RGdyTEhmWkFNdTJFS2Fm?=
 =?utf-8?B?MVIvVnNCdm1TRjdyalN4dVh6dXNLcnpNUmZ6S1N0OTdwL3JxRlcwSzZ6cXRk?=
 =?utf-8?B?V2tSbFVCTFBLWGxPQlRXTy9wS3JDakZrcXJZOFNqYXZBdmhhbHI0cWZLV2tL?=
 =?utf-8?B?QVVhbWFUaGc3dkFEWTFIYzMwV3RyK0ZONFhPUGNRNGRIcUVLeUZVOTZEeWhY?=
 =?utf-8?B?UWxISUVnREVucElpMFZ5cldvM1FSUkFUK0dkU0JKRXpab25GOGdvWnczRG9X?=
 =?utf-8?B?REJwQmpVU3RWaWJiYUVWV0YvbUVUQUM4RWs2TUtLSWltS0pWMG1XWmhWbENF?=
 =?utf-8?B?MkZiNXYvdkJESEZZTkhOem5KTEdxaUIyQ0s0TllJa3hyYWxoczcrMzN1M29H?=
 =?utf-8?B?QXlDa2p6bXdaUkNLWnlvM3AyK1RBMWsvWThxNElKY0toNG5FSWZTOGpnWkl2?=
 =?utf-8?B?QWhXS2NZalUxRVdiY1BaVi9kdXpkU3BPa0s3akw1a0diZmZsbWZ1WUVJYmVi?=
 =?utf-8?B?Wi9VTlpiR1hoYUtJTm9qZlZweEhiREdlK3dYdlBzdjFkVXlWejVEQWZrNUZB?=
 =?utf-8?B?KzE1c2pQTExOK2NQcC90Sm5mbGdpd1FjWTZsWC9QU0lmaXVyN0k2Zld0enVN?=
 =?utf-8?Q?CPhAh10IC7nvrgI9qqGIFDU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bab9eef0-7ffd-48c7-3e78-08d99c778d8f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2021 14:05:54.3535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEU4exjdoTl1QgexN9e9Cw/CAobqgDTcBLJFuoYwJ/7LA2Aq04j++NWqGiObWV17klSOuGcEwQ1yVd57ZtPZTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5582
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--------------FzaaxobyCNXn11cM6ChdT0CD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vinod,

Thanks for your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.15-rc7 next-20211029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vinod-Koul/i2c-qcom-geni-Add-support-for-GPI-DMA/20211019-140347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: riscv-randconfig-c006-20211028 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db7568a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install riscv cross compiling tool for clang build
         # apt-get install binutils-riscv64-linux-gnu
         # https://github.com/0day-ci/linux/commit/8244d69587ec2d94d34a75f5a3865d250e6880c7
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Vinod-Koul/i2c-qcom-geni-Add-support-for-GPI-DMA/20211019-140347
         git checkout 8244d69587ec2d94d34a75f5a3865d250e6880c7
         # save the attached .config to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/i2c/busses/i2c-qcom-geni.c:508:8: warning: Value stored to 'dma_buf' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
            void *dma_buf = &buf;
                  ^~~~~~~   ~~~~

vim +/dma_buf +508 drivers/i2c/busses/i2c-qcom-geni.c

8244d69587ec2d9 Vinod Koul 2021-10-19  501
8244d69587ec2d9 Vinod Koul 2021-10-19  502  static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
8244d69587ec2d9 Vinod Koul 2021-10-19  503  			   struct dma_slave_config *config, dma_addr_t *dma_addr_p,
8244d69587ec2d9 Vinod Koul 2021-10-19  504  			   void **buf, unsigned int op, struct dma_chan *dma_chan)
8244d69587ec2d9 Vinod Koul 2021-10-19  505  {
8244d69587ec2d9 Vinod Koul 2021-10-19  506  	struct gpi_i2c_config *peripheral;
8244d69587ec2d9 Vinod Koul 2021-10-19  507  	unsigned int flags;
8244d69587ec2d9 Vinod Koul 2021-10-19 @508  	void *dma_buf = &buf;
8244d69587ec2d9 Vinod Koul 2021-10-19  509  	dma_addr_t addr;
8244d69587ec2d9 Vinod Koul 2021-10-19  510  	enum dma_data_direction map_dirn;
8244d69587ec2d9 Vinod Koul 2021-10-19  511  	enum dma_transfer_direction dma_dirn;
8244d69587ec2d9 Vinod Koul 2021-10-19  512  	struct dma_async_tx_descriptor *desc;
8244d69587ec2d9 Vinod Koul 2021-10-19  513  	int ret;
8244d69587ec2d9 Vinod Koul 2021-10-19  514
8244d69587ec2d9 Vinod Koul 2021-10-19  515  	peripheral = config->peripheral_config;
8244d69587ec2d9 Vinod Koul 2021-10-19  516
8244d69587ec2d9 Vinod Koul 2021-10-19  517  	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
8244d69587ec2d9 Vinod Koul 2021-10-19  518  	if (!dma_buf)
8244d69587ec2d9 Vinod Koul 2021-10-19  519  		return -ENOMEM;
8244d69587ec2d9 Vinod Koul 2021-10-19  520
8244d69587ec2d9 Vinod Koul 2021-10-19  521  	if (op == I2C_WRITE)
8244d69587ec2d9 Vinod Koul 2021-10-19  522  		map_dirn = DMA_TO_DEVICE;
8244d69587ec2d9 Vinod Koul 2021-10-19  523  	else
8244d69587ec2d9 Vinod Koul 2021-10-19  524  		map_dirn = DMA_FROM_DEVICE;
8244d69587ec2d9 Vinod Koul 2021-10-19  525
8244d69587ec2d9 Vinod Koul 2021-10-19  526  	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
8244d69587ec2d9 Vinod Koul 2021-10-19  527  	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
8244d69587ec2d9 Vinod Koul 2021-10-19  528  		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
8244d69587ec2d9 Vinod Koul 2021-10-19  529  		return -ENOMEM;
8244d69587ec2d9 Vinod Koul 2021-10-19  530  	}
8244d69587ec2d9 Vinod Koul 2021-10-19  531
8244d69587ec2d9 Vinod Koul 2021-10-19  532  	peripheral->rx_len = msg->len;
8244d69587ec2d9 Vinod Koul 2021-10-19  533  	peripheral->op = op;
8244d69587ec2d9 Vinod Koul 2021-10-19  534
8244d69587ec2d9 Vinod Koul 2021-10-19  535  	ret = dmaengine_slave_config(dma_chan, config);
8244d69587ec2d9 Vinod Koul 2021-10-19  536  	if (ret) {
8244d69587ec2d9 Vinod Koul 2021-10-19  537  		dev_err(gi2c->se.dev, "dma config error: %d for op:%d\n", ret, op);
8244d69587ec2d9 Vinod Koul 2021-10-19  538  		goto err_config;
8244d69587ec2d9 Vinod Koul 2021-10-19  539  	}
8244d69587ec2d9 Vinod Koul 2021-10-19  540
8244d69587ec2d9 Vinod Koul 2021-10-19  541  	peripheral->set_config =  false;
8244d69587ec2d9 Vinod Koul 2021-10-19  542  	peripheral->multi_msg = true;
8244d69587ec2d9 Vinod Koul 2021-10-19  543  	flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
8244d69587ec2d9 Vinod Koul 2021-10-19  544
8244d69587ec2d9 Vinod Koul 2021-10-19  545  	if (op == I2C_WRITE)
8244d69587ec2d9 Vinod Koul 2021-10-19  546  		dma_dirn = DMA_MEM_TO_DEV;
8244d69587ec2d9 Vinod Koul 2021-10-19  547  	else
8244d69587ec2d9 Vinod Koul 2021-10-19  548  		dma_dirn = DMA_DEV_TO_MEM;
8244d69587ec2d9 Vinod Koul 2021-10-19  549
8244d69587ec2d9 Vinod Koul 2021-10-19  550  	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
8244d69587ec2d9 Vinod Koul 2021-10-19  551  	if (!desc) {
8244d69587ec2d9 Vinod Koul 2021-10-19  552  		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
8244d69587ec2d9 Vinod Koul 2021-10-19  553  		ret = -EIO;
8244d69587ec2d9 Vinod Koul 2021-10-19  554  		goto err_config;
8244d69587ec2d9 Vinod Koul 2021-10-19  555  	}
8244d69587ec2d9 Vinod Koul 2021-10-19  556
8244d69587ec2d9 Vinod Koul 2021-10-19  557  	desc->callback_result = i2c_gsi_cb_result;
8244d69587ec2d9 Vinod Koul 2021-10-19  558  	desc->callback_param = gi2c;
8244d69587ec2d9 Vinod Koul 2021-10-19  559
8244d69587ec2d9 Vinod Koul 2021-10-19  560  	dmaengine_submit(desc);
8244d69587ec2d9 Vinod Koul 2021-10-19  561  	*dma_addr_p = addr;
8244d69587ec2d9 Vinod Koul 2021-10-19  562
8244d69587ec2d9 Vinod Koul 2021-10-19  563  	return 0;
8244d69587ec2d9 Vinod Koul 2021-10-19  564
8244d69587ec2d9 Vinod Koul 2021-10-19  565  err_config:
8244d69587ec2d9 Vinod Koul 2021-10-19  566  	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
8244d69587ec2d9 Vinod Koul 2021-10-19  567  	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
8244d69587ec2d9 Vinod Koul 2021-10-19  568  	return ret;
8244d69587ec2d9 Vinod Koul 2021-10-19  569  }
8244d69587ec2d9 Vinod Koul 2021-10-19  570

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--------------FzaaxobyCNXn11cM6ChdT0CD
Content-Type: application/gzip; name=".config.gz"
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
VLFGAgA=

--------------FzaaxobyCNXn11cM6ChdT0CD--
