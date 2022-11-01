Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04989614DFB
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 16:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbiKAPMv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 11:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiKAPMa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 11:12:30 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1027644D;
        Tue,  1 Nov 2022 08:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxAsJxsXoiy/s7DI8NkCJHlo/1TDprzLgqFFzsDILvXL4/8KROc4ATKBiWKbmIxGBY3MDZ3rbhfSw4BSpfPkYecESa48hBnI5gvsSTd4+US8M9TjA81X5xvBgwfhs8XP4FCSkSLC9L5E9LKbtsujj4CYs3f1oiA7VdU4RJ5/pLWQvstcctTwUoRxiQ+yz6uUrzUbIMzjNDz2zpoJXoq2fcOL3TlEQxdtBFGYhwfbb4MO1GgAUGkuW3yo4lig/H+J0ozbLPdy0AGGZxT9uXJvPVpY3drVkeAzFqRO1dzPxxrF5Li8rEByNE+/ZCjOjRgpxjw8Nox1bNdhjhBtP02u0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAQUSBdIqz4bSjDwo+D/8BvA0iTEwjdtMqWhn8WaO9E=;
 b=C5IrGiFkB08p45B/kjKqovT/zb4Iwq55/WMO6EpeXA+23oAK+bXcpOEGYHtwynwYpp5IPQszlMyJieQkwLgDjQyiXEU1YHY2NQVmFRuXsYpP5D74CTtZx6+RN6TT8PTdYrYS+aaxARiQTBOvLVwrQ+YkFFdGbfUBjIi4t4xRPo1qgWiA33soieYe+A7wmz+XRSFCmzpNo3P5qIOHmbQKK7VS+AAUG59DmbHq8SSIHfXFiuy5/AaMkEmMDyh/i/1zestdtPG+Lcc4R8i9HdR2CZKURRJZRSCMKYQof+yYUlAx2jjPP/M21T/r78Nbiky0w604YLi5aWviu7aqvjzanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAQUSBdIqz4bSjDwo+D/8BvA0iTEwjdtMqWhn8WaO9E=;
 b=WdylXnbPNQEJxiA8HwPBAw5Kt5hiG0cw89imKwc89DR0AUPDlo3pKVYZH2DRbsLC/JoaceqoPWchMN8ZOUsdSc77gz6uvMwWAMNh4iisi3GHypamyRGz1pC8oNMLPQVCo2KL0Jd+RWhv5MX47qaTukmjKyHnuaxtELZE9xOabxSyHMsj19LsqLdIiIf6B5TLu763ioN2ybtkmhSLJChzDJylQLBW6Vyj7+50Ay6zpSHKTqL0P9P5JRXvfxIOnM1kJnzkEljXXJmhK93IVTl+9eZFKzhN09pJ274ZPg4o16SvpsJ6tnag/uMRrWRcLur5W/O2mfWWjeLJMcaMKUEdug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 IA1PR12MB7566.namprd12.prod.outlook.com (2603:10b6:208:42e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 1 Nov
 2022 15:07:47 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::d749:2439:e6ae:5840]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::d749:2439:e6ae:5840%4]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 15:07:47 +0000
Message-ID: <e63e9d49-318f-93ae-178f-93a7023538c1@nvidia.com>
Date:   Tue, 1 Nov 2022 15:07:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 07/11] i2c: nvidia-gpu: Replace ccgx to well-known regex
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com, kishon@ti.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-8-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221024074128.1113554-8-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|IA1PR12MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: f2be2e74-c8fe-4d3a-b61c-08dabc1ad598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAoQvapIJ70RIZfqh4lSdQgr/3glMrSs2fqzcLcqwCCpPtvOfCe0raDeZYGfXzAj0vV2cs+sh85WJvI92Ue8m3j2RMT62YPHTgX2nZHLshkksCHFs5wwbTy24bnYo8Uf3iuTAKoSEaUdKODd3EHLpvd+usALvrt4HnUTVIuyTzOASAOWc1P+yzF0m4lVxc8KZH/Q9tw95inFgJOMmGFFeEa/elC01K294o4Nkn52FRhEGcr1UIM0V8SBDdUV1b1WbvG+OV0NPKvkZgjckckFmv0dCW6R9RHzog00Sg/P8UZ7t/hqAfg6/+8O9GY5SfgZNLEJsjDUI/3r4BuVWPBmqEw1rMwxhSuoZz8gGWgzSOp9k0jLRGkQ/YM2Ed9+Q7W3C05X9sCtp0/Td3G3EQMRPRgG8E7Dg59DkHUDCDCzqUWgWTK29VreeXmYaY64TJnKJqZFtdC/EQevGnD+kR7tEomTDHP7BVx5IDhx0Xk49j/aDuMA/l4HEBalmFyWGL9DUXplwE0lcKdfY2TAIjm5n0pXY0dJ6tnhcEQ8cTYhSY7tnKXXTZsHClcD/RaqOcyPFsYO+VwIVo+GqrgXZHGTd34yP2wic0YI/W+nlg506US8NTtmqbh0e/VhE0CvFeZ8gKMa9C+6f7R0VbrbStJrIwAiSx3DbfgDvpGzYZYkWpKgKeIBtLMvNHWLwdpFffPIWcMcyKQf9QyC5+3qq1GBUGI3kQLGtRC8myjQ3SBmhf49qk2txBQOiLE0eaUCB7R//M/Pj0dRYEwP2/npoQ2pejfyLjG/Bn1JOlAEbd5xgDB5u1jJZ80IllK6cH7yKQ0L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199015)(38100700002)(2616005)(53546011)(921005)(4326008)(55236004)(478600001)(31696002)(6666004)(86362001)(316002)(36756003)(6506007)(66476007)(6636002)(8676002)(66556008)(66946007)(31686004)(186003)(2906002)(83380400001)(8936002)(6486002)(7416002)(26005)(5660300002)(41300700001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3dMbUpyK29WL05ZK1ZlRktZbW9ua3J6Skpaa2JYeG5NSVhpTndTWnd3WUV5?=
 =?utf-8?B?YVl6OVBFbUVYOStqSkUxLzlVRDhwZXZrMTlVOU5DTkdZd1ZDZE9VRDgzVE1j?=
 =?utf-8?B?SUxLWEhNZHhHbHY1ek9MQTlhSGFJV0tDdGZUSEpReS95ZllFQ24rYVkzV2tp?=
 =?utf-8?B?Tzh2UzhaNmpMeEQrVkptSTBtazBiZTRmWk81V2pyYzFqcE5NUUc5T2Z4RFA5?=
 =?utf-8?B?RU0rYmJ1dDJrbDhzSVhVV0dxanRMVUt2K1luYzhoNTRPVXg5Y1gzYmdMNjNn?=
 =?utf-8?B?SDA2Q081d1hGQ0h5QW9BOGIwUU9EemQyYXNSRjgwSWQrVnltME5HVWIzcmx5?=
 =?utf-8?B?Q1poTW9LZWhNQkUvai8zUG5NQXcrTUhVL3hpN0FZekhqcEdHRTJSbWlhd2Jo?=
 =?utf-8?B?Y1NnTDdLTkpxdGlMeFBVR2MrUzQvNVFMd0c4bmsvUGZtb2ViUE1JdUZyUWU5?=
 =?utf-8?B?UWZLTEsrUkFTalhHU0UrdlZmby8yZWZpcjBhdDVTZmhrcmQ3ZFlTTW81Z1Vv?=
 =?utf-8?B?U2ZwcnVYME9WR0lLeXBCVy8vVkk4ZkRZVGZMVTluNm84Qml0NWhmWjAvWFB2?=
 =?utf-8?B?NlBzaUJ4WDAyRzZrcmNjeFJSSk5BOTBDNXpIU1ZoSmlLUmU4QVVQalMwQWhx?=
 =?utf-8?B?WmxJcVltbFhYSGx0Ui9vMEZIWVA3ajh6ZENhNGlxeWdyeHladUlyTGlucVhY?=
 =?utf-8?B?STg5Tlh3Z3A1Z3RaYU1TTFBvR2x3MklVVVFFS2kvMnlCL0hLQlNKa0RNdG5r?=
 =?utf-8?B?QUhpbmpyelZSOVhuYldnbUNNc1Y0ZVBtbDRNaHhhbHpSSFp5bU5rdWFsTzlw?=
 =?utf-8?B?c3BqU1ZYQVB6emJTWVQ1TTFiVjc5RjhPWVJTZk5mQjkzdkJwUTZLZGxjVUM2?=
 =?utf-8?B?N0N2Qms1SFpMVXV2K2FTTXdFdUpORVdxbCtSNUY4TGVMc0pTOFE3VmxHSnRM?=
 =?utf-8?B?L0Y1bFNyREUrTEJRNmxLU1pBWDFUNlQwaStqcUxXL1U2ekgzTmhhektwQklQ?=
 =?utf-8?B?UW1HYU5CaDB6YXljNG9pa2lwdHJhTCt3OWo5Mlg3ejNGbGFGOUpkdGErTVpK?=
 =?utf-8?B?MjBJVDc5cUo1Q3RjMU5KR0ZqQUtPbS92WEZxOHNoeEptN1B2a3lYamZTYnE3?=
 =?utf-8?B?VUoyR3NZb3kzQmxjekRMVW5ybkNwSHB4NFZLdjhERlNVcEdkeS9oVzZNNTQ1?=
 =?utf-8?B?Y2VkdFpmK01Da29mTmRleXBmR1dtbi8yUS9NdEhLMVU3Ty9RY3U0OS9XZDUw?=
 =?utf-8?B?Wmp2WUdrMDNvK0RjSTZNQTBaeWU2dGNkVDd5TThNRitYeGRJK2RpL0hVL0ky?=
 =?utf-8?B?NFlONkZFRkd4OHJVUVp3clV1MFNqTTM3RXRTckpBY1R1VnpRRklDNDdMeGtu?=
 =?utf-8?B?aHhUV1NsTWkwOWM0NXFLZGM0cUMxQjVoZHAzTE90U3RDR3RMZ1J4TXdFcVpC?=
 =?utf-8?B?eGp6UFI2MkxqZlZrT0pMUUtEcjVnVlVmaFBXMTRERUdWRDZVTE0wMHJMclpx?=
 =?utf-8?B?UUlqREdoK250NHhlR2hOem1RcTlsUkl6TXd5NVM4SVNnQitlV2xWNzEybnZW?=
 =?utf-8?B?N3pBZmJVejgzbFl2SCtNdGsycUdCNXl1NFBMMlBHeW51Wmhoalk4KzVLTVdV?=
 =?utf-8?B?Rk8xVE9tQXQzMmd0aEhLd3pxQk9TMEZhbVk3NzVtQU54b0MycDlvZjNUWmoy?=
 =?utf-8?B?K1Z5N0NYUzZDdHhuZjFhbVpKc0V0NmpNVWtHRVlFbEJLSHpyb1hHR2g5MlhZ?=
 =?utf-8?B?UWlUbHZaNFpvZUY0eG45ZC9tQ3NZUHVGU3U5d01VVDVEekNPTHBOQmJveG5w?=
 =?utf-8?B?cmVnQU9lZGxmVXdvSldtUFRWdFh4ejhPT2p5NjNWbG03bjdyMWprZEVUS2NP?=
 =?utf-8?B?RnpvdWlQeDd2SGN1UTJxNUkrMXgxVHh6M0pGTVRJcTNqMERpV2IvanZ1WXVK?=
 =?utf-8?B?NnBpc2w2Q1o5MDlxMlBIQXdlOXZCSmVQZ0dKcm1FdFFUT0dvdFRENnRuRVcv?=
 =?utf-8?B?S1cyTGFzMVMxano4bWZyTTN4OERrWkhML2d1RndDZHJtck9RMXVsdDJFbE4v?=
 =?utf-8?B?M0ZKZGVLUVBmZ1YyczlmTFBHR0xyV05aQUhIenVEMVdkQXhuY3NQaGtOMldy?=
 =?utf-8?B?REZaOWYrY05JL2FhaXFVSjdCQzVZUDRxelN5T1JISzJIMDk5ZFF2U1QrbmxL?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2be2e74-c8fe-4d3a-b61c-08dabc1ad598
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 15:07:47.1457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKjDvmP0k3cu6vZ/+XkVfnox+SsDhI7DUthRv8/OsD9kTvEGCsT8vtlnBWAW36qSXDGQ1wSmkzWWNu26QQl7hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 24/10/2022 08:41, Wayne Chang wrote:
> ccgx is refer to the cypress cypd4226 typec controller.
> Replace ccgx to well-known regex "cypress".
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 12e330cd7635..0934f8ad7f49 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -260,7 +260,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>   
>   static const struct property_entry ccgx_props[] = {
>   	/* Use FW built for NVIDIA (nv) only */
> -	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
> +	PROPERTY_ENTRY_U16("cypress,firmware-build", ('n' << 8) | 'v'),
>   	{ }
>   };
>   


Could we change this to be PROPERTY_ENTRY_STRING instead of 
PROPERTY_ENTRY_U16? The benefit of this would be to allow us to use a 
proper string identifier in device-tree for the Tegra devices which is 
more flexible and descriptive.

So given that this is for NVIDIA GPUs, we could simply make this ...

  PROPERTY_ENTRY_STRING("cypress,firmware-build", "nvidia,gpu"),

Then in the ucsi_ccg.c driver, when we read the device property 
"cypress,firmware-build", if it is 'nvidia,gpu' then we set the 
uc->fw_build variable to CCG_FW_BUILD_NVIDIA.

Jon

-- 
nvpublic
