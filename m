Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68076298CA
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238406AbiKOMXx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:23:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238306AbiKOMX1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:23:27 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B7227CC4;
        Tue, 15 Nov 2022 04:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMOSC9dlSlrKC4zy/d8wBPYP4tXppOuCSSJJBsZfQjm+8ZFF8KTK8Sy1AxDzMOAdjNrmP9ARR3oh4d7BLCM8GLtaN9c2GEIH6vwJqYkJGgPpfkeHtfyQCVGSK45Bx8upr0tqk2ua1j6oVUB7qf2vhMCOxY5FZYpCam5wQYT9YvQzbO0V5RquxbKHYmwb5CO/sSOXvhs9x8tMv1m4SQVpVDxCACQET+tydO5jAMOUQALnvYclSJy4EGGe9g+JoXGhO/mhPQQnLxFqZf224LtVn3nhAEL4J4pA5cL+hF22UaOC26OAZytkXmTCmXAX9Q0pYnMColCc7GzEUwHSrpITFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZBd/dwH4P1Hhl/nCszYKCTwo+l/o77SgHkO6HI0kQg=;
 b=ag2dI43lUp5uDMqhacosJzmCQvZNEUjfdgfKDPQ8Itc3WWWIH4tZLh8ByJ+2AzNGpGfrtwllVCoxOKgLV7BDfyF06wxtLQh6EAttvffxJb/RN4IzHcnke5Z80OV8daBoZjm5nOmXJsLxB4/HJKY75bvKLZnPgpwtoyKZTGNzYSsDEoNRfLg4qdTrTtDzoErjAWcs2YAN3xdVtTkiDWCkWFXj5Covzf7QgzAX9AiHn6FUjC55O+suAGH/CvtyTMOe7WU7tCDGOo/pC1p8+JrpMER1Vzv1ALqTgolum2R0OJGux7KHBgK6cc/27xe8C+lIluUKOlgpq6JJ8TgsuIKtuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZBd/dwH4P1Hhl/nCszYKCTwo+l/o77SgHkO6HI0kQg=;
 b=FunFqT3YEm93cgJ6D7w1/gmWer+08nCNbFkjp2I6SZQ2XJU2aPKW8Lm+HcrPtffe7SVa8vSGTr2MQH6wHFFVPTHsYzoxZkJudtRbUCG/xZBAMsA9z3u8FJu7QcitX4NOWDoPGyMBw+kGoQVvDPK0ZwO05bJvgf0A897GRj/oF8kyuWLYQhT6xVhfoU+V2fQJGg77cum1OUHnRznQpHVnL2zvjTSmGSyBwS3bUct8XRxjq95I2kIUrmBvVDQTVDoDbNnWYXsyL09FfWy8kSQ+vJcVDwLH0Ia/rnEtA6zIz5VotGtcgSuNUgaGpDyl6eatOt64jbK4eH4MDEuZeyKMDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 12:23:19 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:23:19 +0000
Message-ID: <b2eb2dc4-3b80-8d48-0e91-34939395898a@nvidia.com>
Date:   Tue, 15 Nov 2022 12:23:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 13/13] usb: gadget: tegra-xudc: Add Tegra234 support
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-14-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-14-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0004.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::9) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: bb37baa2-d2b5-4391-e400-08dac7042e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUIxfLNpbXGyKj/6wwhGfQj0uJW5oDZTPuDBQnry2m5Ldc4TMWLHgpKvkiIICMzNvvCZuTUMdiI8orjC9l78e/SB/Ykw9EIP8yPnrLzF4lKGtyMJy8aPAiLV2JHoKT28EJNlVfMWZDnB0qlSzb4oBdmH0Aujn3tTTfEhqlyauOC+15+r288fyodSWEcoXe0c7QgpSEX9ySC+YVKqp63pHGSgXBa7iDQG4uKCpDyF+/+u/Q1O15HDQijSVxdsemSa1b7tWPRVsgMnXxhcOm0c1C9b05zrHsrKvUfN3N3rArBxtI1cYGH1apUxQhy4kfR6ugIi1/+VWwenUKxv9g5VkJMSJgmvIsyJ6NrNcg0xt8zcIE8bo0onwLbxF6TgJi+od+b0nBFJItxF+BWrrFzAJ1PAT3z0OQ5smKw3+ESvEN3csLxkZWhswsyL2SkvokIQDoSP2KRzp6u+SnzzOVg9XDPIlu1xTMhQINZrBcbiFRgYW+TQj2KAkMhpv5K5WmZbgWhuENKRR+LBretoteqsbN+ngGYntvqJSkM3s3AYoFo09XjRjPMP3HjkxGaTaGIHWr0EiTSaZh5YK93FCSBs8mTPXjrCKBxDxureAOLaP1K8I0xP05N/Md4NjSxvP8bXHQpbEGAIThQdWyHqDuvPd9yf9WpRI16hGvnnkAOrmxrAVlObMalmdieDMEd4ZgOKuJ+U6Zs2xU83eE8JVv22jlSctrIM/OB8+juTBl8rQ5tpjJpIcn6wjriDr++qz4xrGZQEQDDwtaUEmeDikmXWcSmqoajRLOAceIuucDGQ0dXEXjm+wW1NPhZMLuB2p3VU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(6636002)(316002)(66556008)(38100700002)(66476007)(5660300002)(7416002)(8936002)(66946007)(83380400001)(6506007)(53546011)(8676002)(41300700001)(4326008)(55236004)(26005)(2616005)(6512007)(6486002)(186003)(478600001)(86362001)(31696002)(921005)(6666004)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFFlbWVzT1hhVkN6L0ZnalZiY0NxcmZYaEpDOExDdnJoSG1EKzIwR3ZsSUE4?=
 =?utf-8?B?T0ZLYVdSTFo1Vk9UemhOcSsvMHNKTU53MnhLSGNiU3RSbkNZQXgvN1V0SWRH?=
 =?utf-8?B?UmYvRUcveTNsVDY3dHNRSzl5UFZFdmJpQjNPVUN2aWJBT3hyWS9Fd0RidnFR?=
 =?utf-8?B?MGFreDNwWjdBM05ldWJHc3VrR3MwNDlCcTdNZCs5cURDVXdYOVlwaHZxSHdY?=
 =?utf-8?B?dGFrM3picVhYWnRGWXNOV1d6ejZZT1lNUUNSYnZJOXVjczRlSFFiYjN0Unkx?=
 =?utf-8?B?R1BIaWVyWlJUVGVGb3lzV1V3UkJ5SmZpUzZMK0ZVdDB0T1c4QmE5bUtuVHpP?=
 =?utf-8?B?UXQyRzF6ckJMNWZDZHdRKzVTaTNkVkhIRG1RTnpmVEtRUm16OHBNUzVyM2J5?=
 =?utf-8?B?bTdrR28zdFB0eTZZdzRUbGRxZHNYZmwwbkY5M3FuTHJBbStiRHVGOEgyYlFF?=
 =?utf-8?B?V3Y2cmxVNlBtYXVVNE84RjNETjlGWi84SStSeUFoY214bHZUNFc1RmxKNTVt?=
 =?utf-8?B?MFRvdWpEcFdvbzFkNXM4Mm1yQ2R1UlJLeHdkL0tGYlhRdnJndm1VTmtoRlBr?=
 =?utf-8?B?QzBlUGM2bktUS242dUNPZ3JoODZoUGU0T1pnNWF0NGx1ZEJQUGVCMnV2aHpY?=
 =?utf-8?B?TUkxVTFBZmswdkpZQkxOTlFSbkFPclM0ekZHK0d3OVZETnQ3Nk84MHVXR1pR?=
 =?utf-8?B?VWNudnk4MkYwMHZ4dFlIVWRWVC84SURmOE8veFZBOVIrVnNVOHZweUpPeFlM?=
 =?utf-8?B?N1huOWdwMTkvVXhUR2NtQ09pOTQ1TmNpMWFuOWVBdWhpTmNPRjNLdlg0dC9z?=
 =?utf-8?B?MnB2dDg4bk8vV3oxR3g3RnZLMWpTOHVoL0xsRFpuSnQ0Mm5oaElEdjZPNzRC?=
 =?utf-8?B?K0JkbHBGTGc5am1FRzcyMllRcmxVb1dUUXRGUmJLM00zOGxkbnB2NFE3NGlR?=
 =?utf-8?B?R204RlN1clV6N2tSVkdnc2lGRWF2dTh0cFZsVllSR2xnbENTaWczNm92QmVD?=
 =?utf-8?B?K2ZGZmcwVk9kMFRhSUl4cm92aWJSV0lMcnNNS1hXZk1WSUZmT1FxS3lpVVpY?=
 =?utf-8?B?WkJEckRzeVhXeXlmS1hjeXZTVzZwaTZWS2RSQzc5ZjhDc1RicnZPMDJEUDRv?=
 =?utf-8?B?LzNxazJKMFlGT2d3L2dIZFBUNk5waHhtTCt4VlMyVit6OGc4V0gzY3Bkczht?=
 =?utf-8?B?KzAvQi9NNTcyTjVwMllqQlJRSS9ZN0FTdDNqSC9ZaC9qSnFEU3lId2padTFv?=
 =?utf-8?B?anhwbmEzaDVhVHROM3NFWFZza3JnUjNEOGlrNGsrN2lFUTB1VVlXTWxtOEdh?=
 =?utf-8?B?dmFIckZJdUlZWGdIMVdPYWNEOFFrRXBPelZ0OXZDWWxpMGp1czV2K0JTeVFN?=
 =?utf-8?B?S2daajRyNlczU1JXYTRmeURHSmVpV200TUdKQVJIUGtlVUV2ZjNlVHpnVUQ4?=
 =?utf-8?B?MUZoM3FRUlZoNUJWL1JURFJHVWxwcEQyZjk2OVBONUpIUHNhNW9DMitaQUpL?=
 =?utf-8?B?a0RTTVIwZkJtcGFrRWR1Um8zdTJVQys2UEtMU3B6b1gxd2NFb2hmMmM0TVB4?=
 =?utf-8?B?dHM4UTN0UWx3ZE1uQmZiaUtoMHJIbXllczV2K01MOUNtNm5UeFhxZU1XRnFu?=
 =?utf-8?B?bW4yYVJ1YWdQTXVubnZGZElBUTdNbTIzQzk4ZUVvb202UmhHSUIzd3pKbTZh?=
 =?utf-8?B?SHB6VFIvMGV3cTE4V2tuekQxaXpKMmFpdEJma2M5R3dSckR2QXhQYzhuSFdL?=
 =?utf-8?B?blJzQWcvNytmNXRQOExkTW5tT3VRbU90dE1tRmdBQnhRT3ZMRUk1Q2gvRXVH?=
 =?utf-8?B?ODNPbVdHS0I5c3JKV3Rsb2MzdFowK3FtbHZLN0tCazI0SHo3R0Nad0ZFbkxs?=
 =?utf-8?B?TXNlN3AyRUFxMWhnTTJZdTJDZHUwbzJRcndxTVdIWGdvSldCL0UrSitBSFd4?=
 =?utf-8?B?aHNra0NyTHhGaTJqSjNPRWlWRHhUTFFGbFJObC85ZElwK2xwZUtSeStFbGpL?=
 =?utf-8?B?MmhaV2xHWlNwbjdzZmRxM3Z3ZlZieTdTajA0RGxRaWloS042c2J2UjNLUEpR?=
 =?utf-8?B?eWgrakp1NlUvZityVFM2T2pCckRMTlpoTGc1Mm0waHlZZTl2akxqZ3doM09k?=
 =?utf-8?B?c3NXazk3TVFRK21CT3d1ZHRJMGFNand2dlZDTS9LUnFaSGFLb1pJV0FoRzVE?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb37baa2-d2b5-4391-e400-08dac7042e04
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:23:19.4715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PscnvBNgz1pUowGsPQ7MpyGcBD+mPfbtijpaC+7DSxB2/oLzLtmb+9FkyWVbro+zEVVe5gb2ypVL9BbpSlZOBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4525
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 14/11/2022 12:40, Wayne Chang wrote:
> From: Sing-Han Chen <singhanc@nvidia.com>
> 
> This commit adds support for XUSB device mode controller support on
> Tegra234 SoC. This is very similar to the existing Tegra194 XUDC.
> 
> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:nothing has changed
>   drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index 76919d7570d2..ff697190469b 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -3660,6 +3660,19 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
>   	.has_ipfs = false,
>   };
>   
> +static struct tegra_xudc_soc tegra234_xudc_soc_data = {
> +	.clock_names = tegra186_xudc_clock_names,
> +	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
> +	.num_phys = 4,
> +	.u1_enable = true,
> +	.u2_enable = true,
> +	.lpm_enable = true,
> +	.invalid_seq_num = false,
> +	.pls_quirk = false,
> +	.port_reset_quirk = false,
> +	.has_ipfs = false,
> +};
> +
>   static const struct of_device_id tegra_xudc_of_match[] = {
>   	{
>   		.compatible = "nvidia,tegra210-xudc",
> @@ -3673,6 +3686,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
>   		.compatible = "nvidia,tegra194-xudc",
>   		.data = &tegra194_xudc_soc_data
>   	},
> +	{
> +		.compatible = "nvidia,tegra234-xudc",
> +		.data = &tegra234_xudc_soc_data
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon
-- 
nvpublic
