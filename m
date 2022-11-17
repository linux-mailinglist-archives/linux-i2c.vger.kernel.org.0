Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1BB62E567
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 20:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234820AbiKQTp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 14:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbiKQTp4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 14:45:56 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7DA87571;
        Thu, 17 Nov 2022 11:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1j7kV3LsGSE5jMlUt9ilw72UedKaH8gDheN4l5GVR969XTClir5kuQodOC1Q7TNcu0Ji5cF0duOd1S3cmAiwp2RgTgSKJdMOx3q7hGvwjUi/dEUPU5eW0W9BTEgT2LaVW8HyVRnVv9t6WXxRcwx1wo79Y47uJlBVxu29gDq1JGTieA3uNlaZmb1xX34ruSNmhd+1+w6RSWLfBlPrUIjujGmDbRcM/s0pR0WnKZkSSbjP0rmqlDWbJmu1AdzsgitnPzpIGaAzNL1iW2nmZeCBwMeY6IrtNjn3Ojv0VsT/KpEmvmjmGoMMxKoGYu+ZPpJ4HlUe92VnIq+1mV52WR46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHlfI3t3q8wdOnP5PFCsQdD32FzXuPfxzW228c4MZcs=;
 b=AMsyjNM4lyVGEsb+ttlgS3TuHjkKzd7qnLvCjMXOVYTTmkYbRsoJKbbZk8qAEpog+3V7VZAs0YsGm0NSGS5J86oCjnFJDhFMbp6uLRsGfpJV8gJ/JrVq2To7bbzX6oRfK52VgaqWrT3ozviPUCTE71aEniPkJ9JJN2XK6v6r+xL5+88by2xUYczy0cRq0aGRkoe/EDZVKc6OK8hys6jUOa1lLNiPw+n7PQ/0XwnIkbHOBRJmnefPHS+RftC2GMZ7qu7WBvRZhsQsXe4kDnia71ftZuf10KtfgNvqZHJ8dn0IQzGzZtLiBeIv+xgc/P5Rl5zNXvjEbLP5eLjERUsksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHlfI3t3q8wdOnP5PFCsQdD32FzXuPfxzW228c4MZcs=;
 b=CGLuAPUaPhR6HLsRrXbxUG6oPFe9cvK+xhDFv+a1NWUbVFNACJMB5gzPbT2k64715yXObzV0mvpy/lh/fRd0vcf/pmpzI/dSL0kna0AqIq4psnpuiWGdsi8QUJju6pDqdJ+QX7IeBIuc7csyn2RzB6l4HRDccrYRcXIAooygB4eqgayGfWm8kXr6taeGBuxsthMtWzwIG5pIB9hjAjNz08Wn6HBiTluwlJWz/67YBxIouSY9mZXhnvhzfnoz/AQENAaIL8F88AfcXF47nmKT/2/s0pz+OdM4D8x0BcxXIdc2/K0c4X18fZyExggvfeR5KVFLBnYIfKDwo1KIYdChTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 IA0PR12MB7651.namprd12.prod.outlook.com (2603:10b6:208:435::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.19; Thu, 17 Nov 2022 19:45:53 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 19:45:53 +0000
Message-ID: <13b3d55d-29ac-1efa-fcf2-f3b7661ba199@nvidia.com>
Date:   Thu, 17 Nov 2022 19:45:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 06/13] usb: typec: ucsi_ccg: Add cypress,firmware-build
 as a well-known regex
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
 <20221114124053.1873316-7-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-7-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0149.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::17) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|IA0PR12MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 14aea69b-bed5-4b46-f66c-08dac8d455e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TTydaFPYGvF9z4fOzmDbZZvxO17/meDVEOnIL5qAZiCUYcOyiAvLXCLgyRyiNYtvvR89KEwarPPf4yr773MB+3aZrp+32EKWj9lRwMrFPW8ZLxd4tBEs7fyDPc+fG2ATUdZ456wy6VxC117Ivt4GpA9xQ+yXG88+YBd/QV0C8XJ/Ke4+ickcuFiqdtW9iBZdHj5akI8Q47n9DUpGfMXX2pX8mRTIUJazrmMU0F3y3AYj5FAalertbpnFOrNJmPg8yztvcTLg3kTxvgLRWLZx2a6sx4kCudOzODiz6G56HfnUjlc0NN/keAci6DpQWM49SIzDDjUxgJdNQhMSXPxPppLwRrEHKcdDg5rWgBDX5eYPP5jP860AHVlCw7hUcZFGY9QxyiSloEJYelK7x5cExDlwdtxhigQYN2QmLyKqN6EBarbtyd5akY2SJwAWmKLDUaJ8RVZV2z6UmJpV3feMWQhuxiyPI2kyy00ALeiUWA7esZhzY1Gi0nBI3bcoqqiV0ZzwL4r2T+UjeKVUlxCSnBIFXMKdC9UGHzVGfu/InFvmUDTNcquTYXZArcl72GSbjUwuEo9EfoSDywcW9Tfg5ZK+RH6LPoRNf6RUJgEnLyaKbN0VaUr4Okukd5g6sBR/6hcBoF+cS22iUGZviW9x/fjffGrcO0xNbNriMN5tB1ixtfTpITyF/nUo9Fx/tDOxClsjKertexQikjGnfVczryWf8jvkTEF9+x8G6FQbs2w56PZ8eYPHxYMGy/pRdh47
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199015)(2616005)(38100700002)(66476007)(66556008)(66946007)(8676002)(4326008)(478600001)(186003)(6486002)(53546011)(6506007)(6636002)(55236004)(6512007)(26005)(6666004)(36756003)(86362001)(316002)(31696002)(31686004)(2906002)(921005)(8936002)(41300700001)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RBODhjU1hPQ20zSkVWNnJNUG5FQzlQSVRJODNkb3E0UWJrZUlYTCtwT0h2?=
 =?utf-8?B?YmNmdDJ3UlljVGQ0TUY0c3hKbko4NCtteFI2RXd0OFBZMFpTN1lqYkxiVzdm?=
 =?utf-8?B?UnZDNFV2Sk9NMnlsVjU5VGU2ZHpLUFVLZzNURWdnR2VDRnA4YnZOV2RkS09h?=
 =?utf-8?B?TjJJN085SzFveDdmVkhiN2o0V3lDMGFNRGZWVVNpdGM3NW0vb2s0ODZHOTZB?=
 =?utf-8?B?RkZoWm9hUXdjbVZOb2JOM0g2eXhaWVBKeVFWRXFuQ3NUZEJoMGNrc3FhVWRL?=
 =?utf-8?B?aWt6WitYNng3TVUyMzVmeGpSbEtVOHRQRnF3ZXB5YlR6d3lkOTlBbmdTcDE5?=
 =?utf-8?B?VjloUmdlOWtHVHFjZ3RxOFdjeTlOS1U0eXhjUjJZeE1BV3JnWWtrUmIvaFc4?=
 =?utf-8?B?aXpmc3VlVUVwL0xDNTBtWHBXUTNORE9TWHcwV2hvUmk2TFR6Rk1pM24wQzhy?=
 =?utf-8?B?UjNCSlRhd0UvQy84Z2Y1b0plQ2NYU0RJT1VtdldvVGlqUnRpK3daWFgwcnNi?=
 =?utf-8?B?MmUzNWIxc01UMnJsUCtpMmwrMXhVR0syeGtSc0dEdG1YUVhYS1J2Mm5ybldZ?=
 =?utf-8?B?S2dCOC9NaEFWWGkwdnlvbC81TWxuMGNOZ0hSU3BvTHQ2NitOaDAxb0o0Ykh4?=
 =?utf-8?B?RDRqVzRlRkJUL3lpRmNjNnJjdkVaOTJreXJPWTJXT0p1TTJ5b3RCRVpESTRG?=
 =?utf-8?B?RTZ2TTlKUVJ6N3kyZE41MzFuOU5XTktyTWlFODNzYkdMdEFzcVdsQWh2TUNi?=
 =?utf-8?B?MGRiSDYvOE14a1NBeFpkbHI5d2pXMUxENjhORlRpQWMwZ255dFRSK0JkQ2sv?=
 =?utf-8?B?QmJxK0dFc21UM2JsMHNpWFFiN0NOZ3p0ejBGa0N4aUxZNjE3bFRrRTB2eDVE?=
 =?utf-8?B?eGhka0gvUy94M0lYT0w0VkVRYXZWRXlWLzdqekhXRXM1cEdxb0tqcnQ2clNx?=
 =?utf-8?B?TjFZYlR0ODhBMGFjU29ZeFFPUDlycm4ySDRpMUpjY21uM1VlSmtiZnF5aXFv?=
 =?utf-8?B?RmFyejBoWmpzUHpGbFdJWnI3T3JmNm9aMWlSOVB6ZWVuSk9kNUIwVzhpaTQ0?=
 =?utf-8?B?YTFnWittM1NDdGFMNW5CZ3VCTTZSZEVhRVc2SUZmRU9ybkdrMmxtTytlWnBr?=
 =?utf-8?B?SmZpU0ZTTCtUSGRUbE1Oc1V4WmVESnFRUVd1QmNKU3pQLzRsZjVJY1ZaNVFM?=
 =?utf-8?B?dTdzZS9pN3ZNQ2s2UHYzN0ZmQ0lsWS93QXdTYzBhVzlLKzFxc2pTeTBLbUpI?=
 =?utf-8?B?dGpSUVVndWFxNFlaemxpV1RjUDEwNXc0eGthTmg1VFdKdGxQVE9Ca3lQNnZG?=
 =?utf-8?B?MFh3SG13YWJEcmFrejJCdG44VlB5RUs0NG9YQktGSGpUYUJKVmh2N2JHTklm?=
 =?utf-8?B?TVRlK240ckhacDV1eGpvMXdsdkJPNXg4SzZlMk52cTk0OVB3bS90cTdEY2lW?=
 =?utf-8?B?b0p6c1RtYnlXd2gxM3dwNmh3SFVlMStKSGhPSFU3em15bWlZVmNFcEVLcGRB?=
 =?utf-8?B?dTRlcklUelRBNjN5eUtSMmI5TlBWaXFnOUtjYkhYMmxwcDJsaEc4ZURVVmx3?=
 =?utf-8?B?dzZjUGI0VzFOdXdHc1R2WHBKYzREY2NSZVd2QzJLN0JnR2lUNjZmSWNRc2hN?=
 =?utf-8?B?dUtiaDRyWnA5blVQejkwZ2lFT0tWQkowZ0tpZERKT0xwY3NNOXZCVHJDejJS?=
 =?utf-8?B?NHFaczNaUGcwc2pXWU15K1dhM2NvaFZwSG44Z21iVGUyQUdTdlN2Q1JNdE5Q?=
 =?utf-8?B?NUVXcUI3R3JzMC9QQTQ2MVNFOHkzVUpKYlpVeHVtNmtJVnAyZnYxK0Q3UEdr?=
 =?utf-8?B?T0s1QnprT2k4YVFoUlpzMkE2UzNiSjVyNk9VOC9MYTY4S2Y2Q2JOVkFIRVQ3?=
 =?utf-8?B?c2Q0V2ZrRUJsejFTYUtYQ0Q0Ri9UeFhTY0d4SE91SkNUK2xScURoNDdvcWxS?=
 =?utf-8?B?Ulh3dFl2QjZFTnNQb25WL1p4YmVmN2tnYmdMc004QzFIOW5WazBQcTQvTzlR?=
 =?utf-8?B?K3FQandhWXZUK0hWTGgrQTBaWVFlU0FsekFLSDJVQ3VYT3Z2L1M0UU5DTldx?=
 =?utf-8?B?cUFPUEd6cWQ3S1RGMDZqSVhrcmpEcktYQ1c4OVI1S1AxeWhwMERyalZ2RzdI?=
 =?utf-8?B?Tjc2KzhCdzBLeVMxNVh2WHNJbXcvVGNYdXhBZCs4UzFwUVc5RmNYeDgzaHEr?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14aea69b-bed5-4b46-f66c-08dac8d455e2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 19:45:52.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzPFcOSQ/j8t5r3Nc2IXIZUFdh3bqCc/69I9SGBgaeDzEDP8RiUyDQbSY4JdLGJUGTXT+Z5UDmQLZ8qsshz09g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7651
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
> ccgx is refer to the cypress cypd4226 typec controller.
> add cypress,firmware-build as a well-known regex.
> 
> 16-bit value is not sufficient for descriptiva names.
> Using string instead of u16 to make it more descriptive.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> V2 -> V3:nothing has changed
> V1 -> V2:new change added for adding cypress,firmware-build
>   drivers/usb/typec/ucsi/ucsi_ccg.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 139707a2f3d6..e412a457bbfc 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1343,6 +1343,7 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>   {
>   	struct device *dev = &client->dev;
>   	struct ucsi_ccg *uc;
> +	const char *of_fw_build;
>   	int status;
>   
>   	uc = devm_kzalloc(dev, sizeof(*uc), GFP_KERNEL);
> @@ -1363,6 +1364,17 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>   	if (status)
>   		dev_err(uc->dev, "failed to get FW build information\n");
>   
> +	status = device_property_read_string(dev, "cypress,firmware-build",
> +					  &of_fw_build);
> +	if (!status) {
> +		if (!strcmp(of_fw_build, "nvidia,jetson-agx-xavier"))
> +			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
> +		else if (!strcmp(of_fw_build, "nvidia,gpu"))
> +			uc->fw_build = CCG_FW_BUILD_NVIDIA;
> +	} else {
> +		dev_err(uc->dev, "failed to get FW build information\n");
> +	}
> +

Instead of having the 'else' clause above, we should just ...

  if (!uc->fw_build)
          dev_err(uc->dev, "failed to get FW build information\n");

It is possible that status == 0, but the fw_build is not 
recognised/supported and so 'uc->fw_build' is not set.

Jon

-- 
nvpublic
