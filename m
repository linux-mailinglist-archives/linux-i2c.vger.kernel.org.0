Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213746298BB
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbiKOMXI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238366AbiKOMWy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:22:54 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2082.outbound.protection.outlook.com [40.107.95.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B58826AEF;
        Tue, 15 Nov 2022 04:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ6KkZtDDVBhsG4+eOAV7stbaK4bdIhwlmfWmDz6BPxPohnZZK/XDbFWqN1MAHWnG4lX209YFKDcQc4UXGraipwrcU+BWBcopWJygaVP1gQigaf16UO6i8Tv4WWwWQxjsWFOtYV7C0zHUWUpQrKjqYFKUtupvm4xag1eFJtfOuFoCjTdlJI1fVBG8/pjOPdVkRN0O3HRGF3FhRB3KJ0xSaKOnD9K8jJ/WRjSgJBlceJyBlfUJGi2Ve0aQmNK50UN/ZwSLUwj3NRC5RlwoIWavWX63p0WEkj1khXhSijIZG1iTl+Bue/JHcCLVb9BgRamVW3toa7IuUPnooruJNT1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8u6KEdt9atabWBsncICVABIM5CG4PZfEqEsXeqyZaU=;
 b=OVPguL540tC6i3YvVpjwNDvzinZLFJAZyWUll9L6DBa6FuD9UrEwvpN5GM+UytC3x5WDhwLpSknRwpIh5mKC/2e9VTsc+qWM05pseqeZDcCjp5p6P6Bhnjzyies/bGO9NiPZbSnVdnCyexI/xofe0kIrIswTgmPgtfihiVXRArz3AnMYvNpMt5025oWAqMG2qbR8aHQB7roVl2OkE5uG+JCPdNPs9DmAakFAJOQWjJeK/pDwGU0QLVhISi74ENOU6qJPguykV0L3qlQEkgakleijlqCiZ1X4ltmuw7u1F2pewY/buHQFJfawU9RK/Ilyz5RkMiLwy5bi2c1r1baelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8u6KEdt9atabWBsncICVABIM5CG4PZfEqEsXeqyZaU=;
 b=EDe7NSGfbLaS7ffr/QXkl0hAJpJAPEJ/SqWlLX16PSHf20yok1FwVPB7YA6WT0T9m/CLaZdtZNVyh9aB0iGznvjaZAxnR5dn3p35rwLJCbBl0h4yHyKMkOi+ryJvKmo0nPvb2iLfV5NeCEymhGFMmEJz4yH3QEDlE/ZJ9JzDzRHa07KMrnduMlZ/IjyTHoiW/3jDC+A6gSEOAFSGmcooyHmbyH1/9zdS+z0bl4LII4+Zf802sP/8haNmerZJ6hyuPcXZ2fTkp0kJDhsd2828JP/TVmkYI7my5oD0a+jjP0CQeVc8tb5qmxGzQVnFz+SHUl9FLzhDRSLDvmy94/cCdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 12:22:23 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:22:23 +0000
Message-ID: <202a273f-4fdf-25ca-db1e-d1af81444cf5@nvidia.com>
Date:   Tue, 15 Nov 2022 12:22:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 11/13] phy: tegra: xusb: Add Tegra234 support
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
 <20221114124053.1873316-12-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-12-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0003.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::10) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecc1deb-7230-41d0-9c16-08dac7040c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vebODEWrA4bKny3dtiZPEFJB9uiHW3BM2nHMRBbgoU94dB1tATzth+8XDmQsMaBBDmMmoexzxKGRb14vESxsqomBobD5Rd/WBzcszIZWOpypHKd1vnGPeKv7elB+zeZlpaNxuQqkkxtz5spbXFyi9KZRtObCP+uKlpsdWNV0rxmzQxZ1XS8GxI+N3OCthDEHAGdyYLpe+T1XOlqhQLi09LgbIh46jc75A09t/aSZY5NR4UqELZK0g4IaTuWQ9QimbQ6ZdzcmtN88p9xtkUPU/iEHeCnuWaV+B8TmWvv08OIGG+HBbZOiNiaCp3XDUureGiKGy2cynXQRYMqo1cfpWCmugzgNsrHnxoBPOxt4uGcbFvbKOgGh3XHqfjO582WyHFGkMwUonfbXbhRW4XMMhVtxvm+FNy9gH2N8cq0z9Qnbrwo9gLyp7hUW6Ro1mY9SYwFR0tCdRZpW69XG1biCG7dauKuSjF04vaOMoE9/H4MmPnS5WBJdpmvCla3nQ6or0ImhKmSV0fBQlqCesnQKSeL8SC3EwZojg3acCinPlJVuAb5aPi+QTBjGlWEwkxHndapkSbwPWrqYe5fuLuPXh8jkKywKLUiM8u9/uG8q6mhQJoFRaSOgX9R8Vg8cPWh6bNVaq+M5yDaZ79a4lquFZkstbhQQtbeSDEOaT9Skk0m5jrEgpUHH2z7tm34vGsF+oEroPyGIAYcHZdv/qldyFSoxKWW/1XXkgnrRisaQtgxlZqeYD5SMG280eE4EoNbq0DkiK2RWa599S+iRMmexVBHHSyABxxSVHDJrgTuupLigEUCEJwv2H2c+wINcyNNw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(6636002)(316002)(66556008)(38100700002)(66476007)(5660300002)(7416002)(8936002)(66946007)(83380400001)(6506007)(53546011)(8676002)(41300700001)(4326008)(55236004)(26005)(2616005)(6512007)(6486002)(186003)(478600001)(86362001)(31696002)(921005)(6666004)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnhXZUNSVGI0ZWNPcDE5d3dubDhpY2tUN1F0ZDdXTFk3dkdhbzRxT3JsRWdN?=
 =?utf-8?B?TjVLNG5sSlRoa2dXT3ZWbFdlb2w1WDR2bm9leGg4cEsrUE5maGRaZGt2N0RB?=
 =?utf-8?B?aWNzSmpjWjVnYWxIM1pVbTRySURRUk42eEJoUXZEb2I2MWJ0VElVbk50SU5V?=
 =?utf-8?B?MjJjMXd5Z1RCaCsyRCtUb3VjcHlOcTFOaDBSeG4vZG9GbDZDUjRPUStqWDln?=
 =?utf-8?B?cEczakdISDUwbnNhMitYcExGU2k5YlcvTjRjOWh3aE9lbFl1VU1vZVBqc3ho?=
 =?utf-8?B?TlhLdVBkbUdmcE1sL2d6R2hoSWRzSDNWMFYwR2tGOUF4TnpEVFFsUjhmUlZt?=
 =?utf-8?B?M2ZNcDVkT0poczlUUnRaRGlyL2J0VVAyblowWDVUeHlCME1YeCtRSFkwQ2Qw?=
 =?utf-8?B?MXFHdXJ5L2tGM0QvdmtCdXdhejVsK25UcEMyRGd3clBxa0xTYitzT2pNRy9q?=
 =?utf-8?B?dmd5RFVtb2FEUkZrOGV3L0lvQUtWZ3doQWFSNVFiUmZSMnJ6M0F0dFRtVjFT?=
 =?utf-8?B?UjJESkh1T21kc0RmdnFVbEU2bEQ0cTZVbEphS0pWeGgyaFpWdnhSbm5DeTFQ?=
 =?utf-8?B?OHcxWjRjNXd4Mkt4Q0QzNHB2aUowK015SENjbCtUeTM3RnBueFFyMUc0MmtR?=
 =?utf-8?B?MWllNzBlN2p1bUlWclJzRitUcmNjQVNabjJLZDFaZFYxdDBxUUpMMzIyWTVF?=
 =?utf-8?B?V3B5dUJNejBrVkVKTms3TWw4R29lUDR6NnVJa2Nlc2JBV1FiMXNWRXNTTzhI?=
 =?utf-8?B?b0dOLzZ4WVNENExGTmRWVWF5Vmx3NW1qWlZOUkJjUkpEdnNheHoydWNNd054?=
 =?utf-8?B?dFJ1Q2ZZSlhKTmhudUxXc0lEM2UxQ01jejVaMmZxNlJ3MDdoNk4zRE44aFF6?=
 =?utf-8?B?QnpNTkplNUtQWDBkWHBjNTZFT0h0VVVMc3FBTDBabnl4aFAvQXg0bkZvVm5J?=
 =?utf-8?B?amo0V2Y5UEdkUXUyOUZvUC9CNUpJK1NpeWtvcnFybkNjTHYwdGJlU01zSHkz?=
 =?utf-8?B?YlpHVnAwekxLcm01Z0hXbXBnZThYRkZ2bnJSTHhEdTk3ck12cDZycHJCVE80?=
 =?utf-8?B?VzZIYjBOMkpDTzNuTk01VCtqRDJHTnoyLzBQeGFKbnRML2NEd0YxdzlTU3dr?=
 =?utf-8?B?SGxaYy9LdDE3ZU5uUy9GYitLS3lqOTNZc095Tm54WnFCLzFYVDl6Rk0wZzRL?=
 =?utf-8?B?QTdEZzV5Umltb2FtWkxiNXNnRHhZbXhrbEZLWW9zM21jOEp1ZVdkTGV0dFhn?=
 =?utf-8?B?YzM1RE1VYTYwRXBaU1gwdDBmU0wwN3o4aHZXQy9yN1NvZXFBQlFEQ1BTRG1Q?=
 =?utf-8?B?UytOLytqbFg4Q2l6MjVYTkRvc1lqclVaRlppZC9zNjFMVFVNcVZ2dkpvQmNo?=
 =?utf-8?B?Q3JZbXR1OTQvTEdCcXIrcFVtSTNnSnVTQSs2SmRtTlZ4OWFpVTF6NTlwWVhw?=
 =?utf-8?B?S2ZvZjBxZTBCOUl5WWl4a0RFdkdDaGNoTDNaaTBzeFNtY2QzUU5lN014Z1dr?=
 =?utf-8?B?SHg3V285RW05eVUxMURhcVVvS0JjVCtQQWdkMHpyTStEamlpdG1IeEpnS0dN?=
 =?utf-8?B?TGNzVmtiVWJEM0srTVhBMW15b1hnbkZNdlFDS2dmaDlDWVZQeVZQWGU2WkNG?=
 =?utf-8?B?NHV1YkRxSXpTdHpBa3pWMC9CRTRtc0NSbGNaOVFzL1dSbXROZ3UvazVKVFlw?=
 =?utf-8?B?cCt4NmVSWGMvM0tLUnhCMmdCME5iR1BjcXM0bjlkWkViQ0tDL0RRNEhPS0Zy?=
 =?utf-8?B?WVVxdDg3OWJnQjZNVWtua3dYcFpkMDQrYkNrRTNTR1E4K2xYSDE5aGY1dzBJ?=
 =?utf-8?B?SFFtbkl0TGVOVFJQajRYTnFCQkF0M3JqdFUyVTVXV1ZjU1hQY0R1SXUwaVBB?=
 =?utf-8?B?cVRrVG1OelM5WGNpMGllaFBDdHNLZDBTaThDSWZnOVcvMU95VVY3NzVSUC82?=
 =?utf-8?B?bWVxWmw1U052T09RYmFsNHlsQ1NJZ2FhZzd0ckJ2MlNZSnA2aUU1eTZ1ejVq?=
 =?utf-8?B?Q3JEdUt6eDR3TTFBbUlUbVI2LzdKOWZMV3hFUHd2VDhFMmNRTGZyMlo4b0ln?=
 =?utf-8?B?QllqbjVLN1lMQzBpeS9BNzZkRkNITzBCU1lFVm5ST3lJRDBxNDFWSWUrYnhS?=
 =?utf-8?B?b1Fqci9wcytrVGZiKzlZeC9oOGx1dzI3Y0JMQUhsQXZnRU83MjhXQmxSK0R4?=
 =?utf-8?B?WkE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecc1deb-7230-41d0-9c16-08dac7040c64
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:22:23.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEj1ZkbtS6RcbFbnHXm1ebrny2q0b4SHct92w7IqCZkV7dmfs+JUKhBbFO8594Uxtcs8JayYnqvV5TjMtL1SMA==
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
> Add support for the XUSB pad controller found on Tegra234 SoCs. It is
> mostly similar to the same IP found on Tegra194, because most of
> the Tegra234 XUSB PADCTL registers definition and programming sequence
> are the same as Tegra194, Tegra234 XUSB PADCTL can share the same
> driver with Tegra186 and Tegra194 XUSB PADCTL.
> 
> Introduce a new feature, USB2 HW tracking, for Tegra234.
> The feature is to enable HW periodical PAD tracking which measure
> and capture the electric parameters of USB2.0 PAD.
> 
> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Co-developed-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:remove atomic and the helper in padctl_readl_poll func.
>   drivers/phy/tegra/Makefile        |  1 +
>   drivers/phy/tegra/xusb-tegra186.c | 64 +++++++++++++++++++++++++++++--
>   drivers/phy/tegra/xusb.c          |  6 +++
>   drivers/phy/tegra/xusb.h          | 22 +++++++++++
>   4 files changed, 90 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
> index 89b84067cb4c..eeeea72de117 100644
> --- a/drivers/phy/tegra/Makefile
> +++ b/drivers/phy/tegra/Makefile
> @@ -7,4 +7,5 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
>   phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
>   obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> index f121b4ffbbfd..5ae3cea19c84 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -89,6 +89,11 @@
>   #define  USB2_TRK_START_TIMER(x)		(((x) & 0x7f) << 12)
>   #define  USB2_TRK_DONE_RESET_TIMER(x)		(((x) & 0x7f) << 19)
>   #define  USB2_PD_TRK				BIT(26)
> +#define  USB2_TRK_COMPLETED			BIT(31)
> +
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL2		0x28c
> +#define  USB2_TRK_HW_MODE			BIT(0)
> +#define  CYA_TRK_CODE_UPDATE_ON_IDLE		BIT(31)
>   
>   #define XUSB_PADCTL_HSIC_PADX_CTL0(x)		(0x300 + (x) * 0x20)
>   #define  HSIC_PD_TX_DATA0			BIT(1)
> @@ -609,9 +614,31 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
>   	value &= ~USB2_PD_TRK;
>   	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
>   
> -	udelay(100);
> +	if (padctl->soc->poll_trk_completed) {
> +		err = padctl_readl_poll(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1,
> +					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 100);
> +		if (err) {
> +			/* The failure with polling on trk complete will not
> +			 * cause the failure of powering on the bias pad.
> +			 */
> +			dev_warn(dev, "failed to poll USB2 trk completed: %d\n", err);
> +		}
>   
> -	clk_disable_unprepare(priv->usb2_trk_clk);
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +		value |= USB2_TRK_COMPLETED;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +	} else {
> +		udelay(100);
> +	}
> +
> +	if (padctl->soc->trk_hw_mode) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		value |= USB2_TRK_HW_MODE;
> +		value &= ~CYA_TRK_CODE_UPDATE_ON_IDLE;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +	} else {
> +		clk_disable_unprepare(priv->usb2_trk_clk);
> +	}
>   
>   	mutex_unlock(&padctl->lock);
>   }
> @@ -637,6 +664,13 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
>   	value |= USB2_PD_TRK;
>   	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
>   
> +	if (padctl->soc->trk_hw_mode) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		value &= ~USB2_TRK_HW_MODE;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		clk_disable_unprepare(priv->usb2_trk_clk);
> +	}
> +
>   	mutex_unlock(&padctl->lock);
>   }
>   
> @@ -1560,7 +1594,8 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
>   EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
>   #endif
>   
> -#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> +	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
>   static const char * const tegra194_xusb_padctl_supply_names[] = {
>   	"avdd-usb",
>   	"vclamp-usb",
> @@ -1616,8 +1651,31 @@ const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
>   	.supply_names = tegra194_xusb_padctl_supply_names,
>   	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
>   	.supports_gen2 = true,
> +	.poll_trk_completed = true,
>   };
>   EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
> +
> +const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
> +	.num_pads = ARRAY_SIZE(tegra194_pads),
> +	.pads = tegra194_pads,
> +	.ports = {
> +		.usb2 = {
> +			.ops = &tegra186_usb2_port_ops,
> +			.count = 4,
> +		},
> +		.usb3 = {
> +			.ops = &tegra186_usb3_port_ops,
> +			.count = 4,
> +		},
> +	},
> +	.ops = &tegra186_xusb_padctl_ops,
> +	.supply_names = tegra194_xusb_padctl_supply_names,
> +	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
> +	.supports_gen2 = true,
> +	.poll_trk_completed = true,
> +	.trk_hw_mode = true,
> +};
> +EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
>   #endif
>   
>   MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index dce45fbbd699..c2f160628552 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -71,6 +71,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
>   		.compatible = "nvidia,tegra194-xusb-padctl",
>   		.data = &tegra194_xusb_padctl_soc,
>   	},
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_234_SOC)
> +	{
> +		.compatible = "nvidia,tegra234-xusb-padctl",
> +		.data = &tegra234_xusb_padctl_soc,
> +	},
>   #endif
>   	{ }
>   };
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 8cfbbdbd6e0c..a21826c730d7 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -8,6 +8,7 @@
>   #define __PHY_TEGRA_XUSB_H
>   
>   #include <linux/io.h>
> +#include <linux/iopoll.h>
>   #include <linux/mutex.h>
>   #include <linux/workqueue.h>
>   
> @@ -433,6 +434,8 @@ struct tegra_xusb_padctl_soc {
>   	unsigned int num_supplies;
>   	bool supports_gen2;
>   	bool need_fake_usb3_port;
> +	bool poll_trk_completed;
> +	bool trk_hw_mode;
>   };
>   
>   struct tegra_xusb_padctl {
> @@ -475,6 +478,22 @@ static inline u32 padctl_readl(struct tegra_xusb_padctl *padctl,
>   	return value;
>   }
>   
> +static inline u32 padctl_readl_poll(struct tegra_xusb_padctl *padctl,
> +	unsigned long offset, u32 val, u32 mask, int us)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err = readl_poll_timeout(padctl->regs + offset, regval,
> +					 (regval & mask) == val, 1, us);
> +	if (err) {
> +		dev_err(padctl->dev, "%08lx poll timeout > %08x\n", offset,
> +			regval);
> +	}
> +
> +	return err;
> +}
> +
>   struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *padctl,
>   					     const char *name,
>   					     unsigned int index);
> @@ -491,5 +510,8 @@ extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
>   #if defined(CONFIG_ARCH_TEGRA_194_SOC)
>   extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
>   #endif
> +#if defined(CONFIG_ARCH_TEGRA_234_SOC)
> +extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
> +#endif
>   
>   #endif /* __PHY_TEGRA_XUSB_H */


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon
-- 
nvpublic
