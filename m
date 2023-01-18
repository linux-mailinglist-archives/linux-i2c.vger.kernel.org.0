Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B05671F3E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 15:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjARORU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 09:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbjAROQk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 09:16:40 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3AC5248
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 05:57:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cy78TMJYwaZU71bufv96WVDmdK1FC1xp2LxDusCwIHD2zeJj0hys3Gw2mTTGGBweKUAIBQCeZomi8jqxamrKVqbLdytF3T7q62wEfu7S9AL3ve5E/p0A+YwutntYNH2Kp5ojqbPN5/W9Iv1DxNORhmOtfkOlL17MwAQ3PM+HSPG8e+nSS1VRzCwuqPaQWoDujC02Jfc0cmL1Rp5DBQW1hELVX9LfPXMZUAs1n9IROz64B81/LolwEmLGOgWU6JDS4Ua4MmesqHo3DHjfojozKONBTIxcs8FtlSZ5gVSs0ZGQFNzOeiyyTS/NfqmxhC0QD1FYx1/chas8hjsPLXCjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpbKoyZDMXYOtiPo24gmTpPE/6cxrQsiDktEhRlKlFU=;
 b=Gakw6Lm5AZ1yx8unz+UK4nl5FoRxzNN5borht8iG4vfII3LTjWQKaMzMxfl3+awkEuvAjYPSIEjVvS2a4dTePmaFolhRtCRn4pO+vVHj2U+HDFG0PK57bQDjqWFpGt0Usk+aymsbstN6SsMdap7GlxiDCGf3QkdN7fEK3UDlnKAc4NRjzFyY5TyDRZ3Egflu9pAOwEv9b9ddWqvTsBGkReXr8IEKIhevGOAF24pKD9yyh2Ljht0p/9PZN6S4fKhz+DWaZ1+LOrwX2gZtsSx4r5Tr0TdH2UPxDFbXDOG3a3AZffzPdp92DQL1ZdcZJRJcRaE/LDlcJV85wS4ReR+FOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpbKoyZDMXYOtiPo24gmTpPE/6cxrQsiDktEhRlKlFU=;
 b=y0aG4y4mKI9P/KsWZgeR67g4WG/JYQVb8uCHuHEPB1qOpCJkuaGUynHY05zhb1Rewe/D5aa4wDj5L3azUSDmCXGJ3qGNiOso91RgOGLiAdvNdn9SXMte4xkNwcsKcM5Iikg5o4KesCCQQXqoNDo8KsuIMBbpEncNszN19KXRdo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA0PR12MB7750.namprd12.prod.outlook.com (2603:10b6:208:431::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 13:57:15 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0%9]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 13:57:15 +0000
Message-ID: <dbdc2d2a-8fcd-8667-3088-ca730212c162@amd.com>
Date:   Wed, 18 Jan 2023 19:27:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] i2c: designware: add a new bit check for IC_CON
 control
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20230117122801.1605176-1-Shyam-sundar.S-k@amd.com>
 <Y8a54u1ipywtTIlH@smile.fi.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Y8a54u1ipywtTIlH@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA0PR12MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: c05a4a19-1fb5-478c-decd-08daf95be80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utssTTVF407SpeAObDm/v9yMENvc5pMivhVQQALw+9LBh12mlsqXUv8gYe9gDjuLZ7aZd4R7W5a1gzKgyUYK4t6Kvkibtp/DB2/3R5MsOk++pfW+EWSUWM0am/BvhpUgrdYul56pVHRMoQoumZRo15aQpCeO7m3B/RuCpTWRndbdQxvDPWs2d3ka64/lKTDQni2uRgQuKR0qZ3BkMVrgJ8vA98zyawkB17SfhGqlGSiM5wf+KOqMw9+o+NrlO2GXyuCb9wfVq39K54uMQWOfCFV4kW4McsBE5fBryzwAapERKSPDNu6gbP5BUzozqw1RKNJ5IPmSGxw7NkeWiV5pvjth99u/z28kkdY7EbFwu62qpv764R+iBHBHozSxqeTqdTPYzNwhkcuYx86nXIIS6hw1o+O7UKmOgpyghix3L2/qoFPY3hO6DhIcSsC4nxftq3GcskiL4b5mGtpzj/CIpiOm7atm15yQzK5rqgWGLADN0xo4NqCUvZ0xxezkqGHPEIMWDcc1K3cDc4AOqM8iUG4BZg+r3PWXiG3qcO526kG8b5u6H3FghRm128Xl1MjbgwRdsqLv+3SgGPm0Dw0P+zmCl0zNiFPHnFK05bFJKfm0uqw3h+V8aphvm+AjGlAU6A6Px+XaeVqhWv6rEhAGUW8Kw39QvkVP33MMfo0jRXEjkEWRHOK8923wvH4cWLfABi5xsQ+ydbQ98WT2Qfo2RPvb9bpggdZfkCZEGQbY8U8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199015)(31686004)(36756003)(38100700002)(6916009)(86362001)(8936002)(66476007)(66556008)(31696002)(66946007)(2906002)(4326008)(5660300002)(8676002)(83380400001)(54906003)(6666004)(6486002)(316002)(478600001)(41300700001)(26005)(2616005)(53546011)(6506007)(186003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGV0TVJQcGVKQWh6VDV4UjhWcnBlcUl1eGNFWFhqRW9mZlhmOURUd0RoRzBP?=
 =?utf-8?B?czRHSk5yanNJZ1BqMlpic1VDRU9mU1VVNFppR0I0SEhFM213eUNnYUFUdy9k?=
 =?utf-8?B?MnRtd2JxejIrOWNHNVpQcVBhanVER2kvcGQwd1Y0T0ZJMkE3VnpVYS9qZUhz?=
 =?utf-8?B?V1lreHdtT0wraUd3UnlicENvTVRpM0tlVkZ5eDdaVEhWbHVTNHpoT3Z3em9F?=
 =?utf-8?B?dDlnRUJ2VzJGSXdPNEtOdjdpRkVLdTAxeC9zNFNvYm5YcDRvcS9BR2NOeGRS?=
 =?utf-8?B?cmdNOVRrZldhR2JHcFVBZDRhbXNlZUFTdTd2RlZnV0VRaU5LOVdPaWtyMnJI?=
 =?utf-8?B?K245ektXR3VKQStJRmNXVTAxQnFLaVVGS00yQkZYS3lyYzZOdUJnSVMxalhX?=
 =?utf-8?B?MjRxVmo1WWwzZ1U1bzRqSDR0eHIyaHlua2NNZEJKWmJDMjJ4ZG9sMHdaWGNN?=
 =?utf-8?B?Q1k2UWZhSksxam94Vm1OT3VoT01wSlNxVWNJOGFla25rRzZ0eksrdmtoNmdJ?=
 =?utf-8?B?Rm02OFFQUkpUT2wydUZCMUJTQ0pUM05uODc5M2Ztc3M1dWF1WWcvL0svcW01?=
 =?utf-8?B?aHFKdE1QenRpY21tWSsrSlhoRHFQamV3WTg0clBzbmdITFBTQWpkZWNkQStZ?=
 =?utf-8?B?eVdKUDVMSUVuOEN1WVJNNkMyanllZ0g0U0xRRHBwcFMzWGozMHpabTVzQmIx?=
 =?utf-8?B?WEdmdkhtOGtLWUwwVGUwMnFUd3hGajgzSFN0ZHgrTmE2MU9mK1Z2NnIzQVly?=
 =?utf-8?B?Q1dGWGxjeWt0ck4wbitUVGFHNC9HZjdTYW1GZGZLM1cyalh3dTREempLQ1Y4?=
 =?utf-8?B?Uk43eTNRemhCTzhJK2hHUGJBNG9pTHM4bll0NjQ5UkYrZjRRa01xeEdva3BG?=
 =?utf-8?B?S0ptZGRJN3hEem1oS1JXNnBlUG5Rbk91MlhrUFFsdllKUzZVeXp2cnBHelFm?=
 =?utf-8?B?cUI5dEtjWFlzZFY1MHlnK2kxQ0hEREZ5Y1gyajFvNXRydVhlN0VmTGQxaVBZ?=
 =?utf-8?B?ZmlaTXIzL1lsK1RPMVpNbjJVbkliZ0R1OVpqRTl0RzJIWjlGMnNpanVFYTIw?=
 =?utf-8?B?RG1qWFpMK3dNbVYrUGZzY3R5eUZiSW9RNEsyOFBKQTlUckZkRzh3NUlYY3NG?=
 =?utf-8?B?My9qdVNaUFJrcnNaYzFpczI1c1hMazhzY0dPaGlLOXRIRUxOR3cySExEc3pU?=
 =?utf-8?B?aFBVdmlzeGVhQ0ZNTEtFRUpRQ2huN2pGekhObHd0d1VHWUhPVFJ0NVg4amdF?=
 =?utf-8?B?Z2JnOXhVbndCN0sxMDZQVTBQOTdYKzJlblJZM29NaitYdStyYjNDU0ZGUXNn?=
 =?utf-8?B?ZjJ3WGYrK1lMRFF1Z2JoYUxqMFJ3QmNFd056UEdDZFZpOFhwbWdJTVh5UHp2?=
 =?utf-8?B?UDNpTnhCdDI4YU80Yk11N0J3YmNBMk8ybFJxeTRFanlyRnhaZ1d6ZzNObEk0?=
 =?utf-8?B?Z3ViWXVJZDlyK1pGMEhoVlFqZk9YejZUenc1dHc3RWVGZm9SV3dKSVNKWXJ2?=
 =?utf-8?B?cEp0V1NSandHdEsvVEpSOXpGL1VLNnJZRjNLY1hOcGM1R1BjZVlCeXI5UGs5?=
 =?utf-8?B?Yk14Uy9aUjVBd1BWODRHN21GT2dJN1RrdzQ1TE0rYWdSVDdZRnZlYm9BM1FU?=
 =?utf-8?B?cUpUYTRJbjl5NmdUV0R2ekxmdk5DQk5PMzB4Snlodm55bHJ5UmhmUzZlK0Nl?=
 =?utf-8?B?dkJXR1MySkNIK3V2SWg3YlpOUW5mWG9UbiswZnFBSGxMTnF6VmZwYjhxbTIy?=
 =?utf-8?B?dllXN2RaVklkZlZEMm1xclFBUndRT1lsdWNabW1ubTBOdk44R0NOU25XeWFS?=
 =?utf-8?B?NjJNT1llalBHUGNPdjd2UjM0TnpickpUdEFQZU9tOWZOeDREWDNpZlNWMUR3?=
 =?utf-8?B?emx6SE1BOGxlRVFwblEzVmhwUlk1QUswWjBlOGV6K0s3cUl6eU45amNCWk9x?=
 =?utf-8?B?K3dpUUw4OU4xdy9kRTVrZXFZL1lPdk1DYWFEazFHS0VOZ2pDcCtreTRxSUlj?=
 =?utf-8?B?cXc1cTdIdGk3VTdxK215em1LRjU3SWZqeWg2dzhLUjBOSzk2WGR4TndTWFRV?=
 =?utf-8?B?NnVRRFYyNlNSbHFRdXlQalhNYmlGdUVGZVBBSWJ5eGEvNTdDR1N5TXlmeHZx?=
 =?utf-8?Q?ogxCjBUjr6U9jdkPmD7bGPm96?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05a4a19-1fb5-478c-decd-08daf95be80e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 13:57:15.7913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZT/mk4uEptU0jh2jQQo+fKaFwOhD0uJWV4pjhVFgg2o4DGdv01vfcqFQ3zSVrty9bN7ZrAoDmRA05osyQbIrbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7750
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/17/2023 8:38 PM, Andy Shevchenko wrote:
> On Tue, Jan 17, 2023 at 05:58:01PM +0530, Shyam Sundar S K wrote:
>> On some AMD platforms, based on the new designware datasheet,
>> BIOS sets the BIT(11) within the IC_CON register to advertise
>> the "bus clear feature capability".
>>
>> AMD/Designware datasheet says:
>>
>> Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
>> Description: In Master mode:
>> - 1'b1: Bus Clear Feature is enabled.
>> - 1'b0: Bus Clear Feature is Disabled.
>> In Slave mode, this register bit is not applicable.
>>
>> On AMD platform designs:
>> 1. BIOS programs the BUS_CLEAR_FEATURE_CTRL and enables the detection
>> of SCL/SDA stuck low.
>> 2. Whenever the stuck low is detected, the SMU FW shall do the bus
>> recovery procedure.
>>
>> Currently, the way in which the "master_cfg" is built in the driver, it
>> overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
>> cannot initiate the bus recovery if the stuck low is detected.
>>
>> Hence add a check in i2c_dw_configure_master() that if the BIOS
>> advertises the bus clear feature, let driver not ignore it and
>> adapt accordingly.
> 
> ...
> 
>> +	ic_con = ioread32(dev->base + DW_IC_CON);
> 
> Any particular reason why regmap_read() can't be used?

Yes. init_regmap() happens at a later stage in dw_i2c_plat_probe() and
i2c_dw_configure() gets called first.

So dev->map will not be initialized to use regmap_read().

In order to use regmap_read() instead of ioread32() in this case, we
have to defer calling i2c_dw_configure()

Something like this.

--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -311,8 +311,6 @@ static int dw_i2c_plat_probe(struct platform_device
*pdev)
        if (ret)
                goto exit_reset;

-       i2c_dw_configure(dev);
-
        /* Optional interface clock */
        dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
        if (IS_ERR(dev->pclk)) {
@@ -378,6 +376,7 @@ static int dw_i2c_plat_probe(struct platform_device
*pdev)
        if (ret)
                goto exit_probe;

+       i2c_dw_configure(dev);
        return ret;

 exit_probe:


What are your thoughts? Should I send a patch to reorder the call flow?

Thanks,
Shyam
