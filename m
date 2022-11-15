Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B23062989D
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbiKOMT7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238049AbiKOMTe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:19:34 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBA9240A1;
        Tue, 15 Nov 2022 04:19:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMnojyQXjsAkd2smToO9cvJ7yMpIqsjiIDmik7KeE7c19CYESUu72CxfpYWaG32r1pH8v8UG8IHC2I1ul0sFuFk2QaKX6BpKhD7TNIlsfDyp7ImCYcHSTcu7c441xu6IVDDUP5Bi2HwU4dsrD78GY3W/sRfkJB0nwor2CCM7Y+tZcsDIPg3Ss29DjM+d/m1GW2D3/YxgbQBqt/bTmknazqIXZuqMNAyt+2EplYqXNyGTfA3CoaTDBmxwVi2i8KurdrVkPXAVplLXQvItF+xd/dHYbZIdBWIa99EL9ASNwGB3mKG69OoyKWih/J2u0GoouvsPRQmW+VptJODUerxTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKBA6AY35CY1EJRWovkaIEgPb5ZFm5P+ejZS/Jx3X2g=;
 b=B96t9o6HoaKE4rkBpA6K1EqArxp+kkkjhgeyrZPV03LqHjdd7IODA92TSz2Qh9xhCRThFtS1vfwsMtJtu0W4OJS9bVzVfco3W9KYVc8C2y3iiwUxkHmtZOJJV84KNegm+t+l6dVormEBOcjP2hs4LF1l8V5F+07gna1KrcmnxoHbGw+gc4EA4qeEW0PNmGuK+b7JNknR2OKhfxuwTnvyw/w8ChxjQ4tUBEqpjRV8slxZfAAvUQZ3aKtZmyKvbDAO8uxCPeOO8ZM/+Lnt5vSuONBywHCsBX3Zw85857cTCPhurMuhLAfiKyaBXEazHDQrKNtHNF3pIAbppwXSQsH9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKBA6AY35CY1EJRWovkaIEgPb5ZFm5P+ejZS/Jx3X2g=;
 b=HT9iJn4VSCzYDKfRwXbrlShDWtyI+1hloAC8XjtXOFLUMkf9bBen95lJgrIcREppGO0qq/E/7N5CKbySppN6BesER+bPv8Wk9CM3wqrPOkZrHD/FbJCYCio8Ka78aZAwj9h6vDHxCTBiO68T11GmO/iF2VS3bNb2HNu5sZmbRTEQd0dLu9vQJambKO2mAt9U3DAsKndSJ7d6xwAVPtrekPF6QoI6H6KeHyndDaT8dAl/jNSiy5ZBr0swNR7MtAuZw4zUzhGpclVLl3v3IcGUbGr7GGam3DGwki/Nj7reGD7IrmOU7CH0eQsZPcTHyNTx09zsxYSTrcWBGRbHZxfxlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA0PR12MB4525.namprd12.prod.outlook.com (2603:10b6:806:92::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Tue, 15 Nov 2022 12:19:31 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:19:31 +0000
Message-ID: <b6057b1b-229d-7350-91f3-d26be0e5090e@nvidia.com>
Date:   Tue, 15 Nov 2022 12:19:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 10/13] phy: tegra: xusb: Disable trk clk when not in
 use
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
 <20221114124053.1873316-11-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-11-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA0PR12MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: a55a5845-2f10-4859-f459-08dac703a5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lz2wSQeMfK7+FEg6DVHiqZ/1xU3AIH4UCaI1XRIl70AeJA/5n9tpVT3jC5MLY9a1vGOHkU0EAT5Giu2Tb3rarGFiLfECPo/eHyABL4yjQ+Q/YrsFEH2xguGC/EgRo0kBz3jDbu5bDw/fghCq072qqaA47bDEtV+Mf0NVnNM/6aoTXN/5eu+GqYKJBoWNeEEEBOxlA+aYCHstbPa4W1TAf72XKrXCthFabMZm7joMlC5PurTE3Qy4nkmb4P5o0NvcfhoPG4tGTTh8DmUvrtYh79TWdaRT4AemKwI8QjBeDByPf8CXNXP/MqDLevK3R8FxY+Dnkb0fGwGLGZLW6ETjVJIXomvgx4BF0OyT8eaaSlDOV9yhhssxT7x+G5fsBidFXJxC7f8yXCXcAq/JIL/M3V2FjXgfNr6HlpIwVYsnPxmfPak+64cA2w/wg2tHjZb8VSNwvKwt4zfGyI9lv4Xhnd+mQXcdGrTExapGVkW46qB3/x2z3AwWfYXUXdwF2w1YsExyrpu88iGT8ttYCgWQYNpsFNYtU8W107/PMV7oN6rGYDlkDUDb/69GcPKDddda/LYFm1qr3cb6pNodlaxCuMXbAMUJPaSwmkNrgSbVpWfxRybI8yJHVUyTBPbqyWWPRgxr1H5b2W+yRvs0fogoL5noMqXNmDu8wZ1DasX8yLGSeYZVGBwTd41fcrRyMT+z7TBNSc73c1ixARzqSc9dsNsVm+MIzXVyCKEaWP9FB5Xh4FTCGrjmfsTJXSfG9a81bo90xH/T8R+sA5qJYXO/XgZEOPYQedy3Z3vfJ9inJZX9lWhRrNmUyHp4zb2WpGd0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199015)(6636002)(316002)(66556008)(38100700002)(66476007)(5660300002)(7416002)(8936002)(66946007)(83380400001)(6506007)(53546011)(8676002)(41300700001)(4326008)(55236004)(26005)(2616005)(6512007)(6486002)(186003)(478600001)(86362001)(31696002)(921005)(6666004)(31686004)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmRseVRneEJ2YVdhMUNod0dYWVNKSUZWNk9kaFNQWmFWSVF1bVdud09pT29v?=
 =?utf-8?B?a1JmbjVvRFdlaGY2WFZ3UHNWNGlpdDJ0SU00YTJNSyt2RVNGclZZRDFLZUp3?=
 =?utf-8?B?RTlRT1o0WlVSWXJ2VGRKSVY5TXM0SGJ4cVFWYXZWcHNERFgybUVJbDFaS2Rm?=
 =?utf-8?B?b2o4N3hicXBYSmVqaFloOVBndytTalcyRVlFUEJDeWZ6cWhIR2lEQXFHNzNs?=
 =?utf-8?B?QmFHZ21uUzcrbHBoVXpuaHFwZkw1S2lFNndneDUralF6MTg3Sndhc2lWVCtK?=
 =?utf-8?B?TGNUTE5ncU5nQ2RzTEpGTysrZDFsZ2tFTUZ3REN6bXVuTnlzRk96RFRkalUw?=
 =?utf-8?B?bjB5VXI1WmRjcTVnYUdKUXV4TkI1dWhaS3lhUndXTlQ1YWV3NWNsNWNXVXdR?=
 =?utf-8?B?cW5lUjhqRnVkZlpBMDFxU2R4c3E2NTl0Q0ptb1VhSG5GWCtoV0YzZWRuYisr?=
 =?utf-8?B?UDM3eitTZDRjYmVJbUR0MHhpK3BVaStaQmNWK2lhMTU4V3pkVDV4OUtCZHZ0?=
 =?utf-8?B?ZEZiMjlWWnhIUlhvY2ttU0RuN29VamtaNDRVQ0YyRmtuWFBxYTRhS1dBVllx?=
 =?utf-8?B?NG9DNkRkQmxiU1pPWDRLY3dMbm9BM20rRHRmcFdGNUgzaVNQSWE3Z1d0andX?=
 =?utf-8?B?Zmxpek1wRFVxaU81S29PYzlkSGVleHRRNkFpc1FBWk1ZRitLcXVXSXVPcndJ?=
 =?utf-8?B?Q1FIaGQwOEpMTnNvd3pvTjVrT3RqTTlZblJ5TnhPdFozd1ZFMzY2M3hTYnFR?=
 =?utf-8?B?eDZIcEthWjdIQy9wK0ZpNEdSUEptb0lpSnZFVWtOekxlQ1lZbjVqMk8zbGli?=
 =?utf-8?B?cUI5RkxCUEp2VENlL01QeE14WHVuellsTmVqdzNXa2lMMEZOUWhUR0ZpRkVa?=
 =?utf-8?B?cUNESW5DeHE1MXVzR05aVkNJRi82aSs5OWlGL21vc2FEOTlxdzEreUZHTThk?=
 =?utf-8?B?R2Vzd01jVHRIcWJGOU5IWm42bWhIaHRYbHh5SFljRDY3d2hBQU45QXNQaEdV?=
 =?utf-8?B?b2hUUEkyNFJXeGp1RW83V2d6N0RsRGlycWJyTzhJMVYwMm5TMEdFcFV3Q29M?=
 =?utf-8?B?N0tLRC9sVUQwQmlEd2xBeTNuZ2Vpc3ZQempRNG50c3d2cHpLdjVsN05wazFk?=
 =?utf-8?B?cnhIb0l1dVNoYTQrU3plOHdHd05GMVFnRC9DeGZmMEJCNlZ3V2tzN0VGNGox?=
 =?utf-8?B?VGIreUhPbjkrVEMyZmxOVW1hZDVkZmlwZEZ1MFlkZ1pvdTk2Z1ozbURjMGRm?=
 =?utf-8?B?VUg2M29wTW1IYmNYdXFSUEtxdmRtSy96MG9McnpJa2ZIUDEraWE3K05mZjZy?=
 =?utf-8?B?dHpkallXNWowNmpYYTVzUGFWbGdOdktMUW5hMGRHbDhCTVZlelVCQ3YybHNn?=
 =?utf-8?B?UC9kNUl2clliekowQ1JkRVJtVkZEM0ZRcTljanl2MWMrN2RKQzhWYXllWndh?=
 =?utf-8?B?YlUrYnducVpXeXg3Z2ovY1IzQjd5Z2FwUVR0cm1VNEViaDBUNmRuRkUxNGVx?=
 =?utf-8?B?VUQ1Z2ZxODBXdlEwZncyRFJuKzdxd2p6S2JNYTNFQ1NHemd3NEk4RFdtOHdk?=
 =?utf-8?B?WVFYZ0NKc3h0SmFBVDNHT3J6L1A3M3BodnZSQ0lnSVZ3SVRMOER0WUlYaVJi?=
 =?utf-8?B?Zmxsa1hLeWxUcU1GdEV0Z0dCWG9kRWhwTWV5ZmVpb3VIZndXckprNWhYbCtp?=
 =?utf-8?B?Q0tyUHVDeldrT2k3MSs4dVJXRDJJRG40Q0NsNURab1BJK0xVNUE1U3RQYmdx?=
 =?utf-8?B?WlRCUWhibjV3RG1zQ0p4eWdQZG01Vnhic0NyVkpseU5QNGpBZmQ1K2krOVZ2?=
 =?utf-8?B?QXk0SjVWVDNtaitjeVRFajFYN0ZnVTFRTGsvbERIMDVFaVJncGhIbWdQZGs4?=
 =?utf-8?B?MnM1UTFIZzNaV1F2YTZiMUo5V2EvaVg1amxCVTQ0Z1N0dUlIL0pKK05IaktP?=
 =?utf-8?B?T2l1bnluZjFVQVpDL3diVk9rRldsM1lPQnlUelhpWFhTYWFMbTlZODByaDRx?=
 =?utf-8?B?b0ppWTlaWUxqd0ZKblY3WHhlbWIyYnl4USthcEI1ZkMxOSszeFA4QlViT0FJ?=
 =?utf-8?B?K25hVXJKQVYweEphVFQvWXdMclhwWjV1TFNPY3RXOGwzcURrSXNLd0NaNkow?=
 =?utf-8?B?Y2dZRjhUZkhiZzlRL2sydGU3eDZTSXJjY1JBcEdNaWk0S0VPK0lzSjVSejlM?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55a5845-2f10-4859-f459-08dac703a5bc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:19:30.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHcgqEZxrRzXhIMeRxAlDXdN2KECw/DX4TlUo/TmsXF7CzrXptTehDpeuQWMdott0pD8uqV2+Fxe0XVdMQJgZQ==
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
> Pad tracking is a one-time calibration for Tegra186 and Tegra194.
> Clk should be disabled after calibration.
> 
> Disable clk after calibration.
> While at it add 100us delay for HW recording the calibration value.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:update the commit message.
>   drivers/phy/tegra/xusb-tegra186.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> index 0996ede63387..f121b4ffbbfd 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -609,6 +609,10 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
>   	value &= ~USB2_PD_TRK;
>   	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
>   
> +	udelay(100);
> +
> +	clk_disable_unprepare(priv->usb2_trk_clk);
> +
>   	mutex_unlock(&padctl->lock);
>   }
>   
> @@ -633,8 +637,6 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
>   	value |= USB2_PD_TRK;
>   	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
>   
> -	clk_disable_unprepare(priv->usb2_trk_clk);
> -
>   	mutex_unlock(&padctl->lock);
>   }
>   


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
