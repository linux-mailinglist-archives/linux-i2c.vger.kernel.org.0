Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D86C629878
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Nov 2022 13:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237069AbiKOMRT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Nov 2022 07:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiKOMRQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Nov 2022 07:17:16 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2050.outbound.protection.outlook.com [40.107.212.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF2C1FF8E;
        Tue, 15 Nov 2022 04:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfnibN/JTNRddDlFwCGwPr5I6eHPea7LdsnS8LDz3nElsq94X/unDYd1pYXd/uXUAN6gKgPJu4Fx2CBKCjrMsKsw6iX6XOomxaW5yO5eFaBNVdcaBqp+BvGgfdkZzPT/Cc9lzmws97XP4HHTdSlRL+3w0lm6l4mneTUWWAVgySarMtuUs0g/zaiLdVmQfr8+0NVBJVDmiQVDmM/tHgGZytkesI1T436RKgxMLdzJvLPA+k0MRu9Xq1oc+ve2wPSu40JkQoYIwV0PAk/VFI6cEILdLd61t9dGSO9htzthFgJgfRJWiSAtn+jNvvB0LT9dpe9mtR+aOWSb0ylzIHVv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HInlLSZY9oPU+oC1UAEiW+CqGfTeT4BaHU5Bh0KFbkw=;
 b=SDlygoBH7KJNuxdfwDBGTGLbdRRHYSjBq+c6GWAB0bZDLbeBpSYIo7rz5vJ591CqVrEuHTKDLZk7a1YratW+9m9WSkMtHn9Pzkqxidxl+GKr3+KwPcmUFtLnDn0cKmChQT2tHVLyRyHSGdaBHwn3IAFpasTIoK0sF5U4YAWTRL3uBAI0Xuin9CJrbo1noXcINTZpLk2/Ab3c8LyMhsA4/rWAM0BsyEeBmDnBlqr/nii/dBc0DHB+6OB2/yw3LYqB8REUlI3j0SNQgk6b+TQw67ZLS2nWGmTjZzYKWERifz5Pq2oYjIenGovYp/EzvF4sfZ2jzvzxHkAFaXqqPIzmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HInlLSZY9oPU+oC1UAEiW+CqGfTeT4BaHU5Bh0KFbkw=;
 b=sKRYLIM22T5epl9qPFuArta2xea8e3IXywSjyFLkGty4rv99nA3RQH5MtQu2BRXS+7aNDp9YMzNJ6heCxoLkEta8H472ur4xjcmBSo6H1jcDVzsgNdwQDIwFgNPZrJRLZuoL0JRn/X7ToWSPDD0FfuITIrUmKlWMg6dYbU1hXk8hGfMGHn3iWCQyG+0o73qIlcNolFf3N/boXXmNs0hpG9aFaVybGC7dJ2zM1jMaTz99RDpxHsj98CYSqtcJeeOrgkA2qmlOEN2UCiAUuo/rS9oPRP2Wd1Xd1mU1xogiL4NGDb3WY44fITRCY/T6NmxyMxXyEP8gZ4IB5GbkGNmPLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN9PR12MB5036.namprd12.prod.outlook.com (2603:10b6:408:135::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.18; Tue, 15 Nov 2022 12:17:11 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 12:17:11 +0000
Message-ID: <b12b57ba-6b81-792e-cee8-e3e0c6d88066@nvidia.com>
Date:   Tue, 15 Nov 2022 12:17:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 04/13] arm64: tegra: Enable XUSB host and device on
 Jetson AGX Orin
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
 <20221114124053.1873316-5-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-5-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BN9PR12MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: c39c76a4-219e-48bf-be15-08dac70352cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpIHYgSjLDDKafkkPnl+SKfe7cgMn6pRrUk7+xVOTouwj4QnKIpEECzakAgFwWZA0JKlq5EFF8P0tf66OVxsh8hliqNBp/ZLdvHSZ+PFjkrz4HahOhnDVkE1cYqXHRlTjwlC+gZCriTtwSQ0OJdrxLLbNEFDrGvyK3xT6cJNguo94RwWKBHsOOfbyJstxD8bnB/tQpxXpZTTuHF8CH46qNHWecm34sxPWvi4kHwnsSu73IV5KckJMzJqyoiK+hS3wiXgCArt4KfCqCez98Yy4ej4WGmu/iqlvlJqWytHRn4fZJQy5tNdhnE/i6UfcvASv3p/MuGeohdhpSo8Kv6WspusucJtGK0uWs0xOBYrFPhSXp3kRXG678MgTaGh5EHZ2JLovKzwCPZ8uQ3AngTGthFLk1ZAJssx7+qaNqXCYfXgljNQTNPdyiPzNF/jfELO6istRPeBk4Cv1zQk3kn7TIHQyEGcniS38O6ZIbbIUx/8MeT7aJxrgBcnEm8hmCK56tjqnu3OBDhVLyJOIuZoOP+YTCRFheJZJP8L78+3pOZIKRJdz3a3Cpx2mE90iTfgKydOvxj+Y7XZJ/MUH/wfoKiRXmlW8ryYxPvhblgk6T3jxS4Lq2irqEkDU+Kpx64F6CIGRahNG3CM3S7qBcLEiMdgzGN/9JCbWfvwo9wSD9chierwpGM7hyVndc+xs7ssOSAlTd03QkAoWEV7dBsrRs7aH+ay6VV/xrOedQBvsUNWSwmjhfZktsV6iQKSf8PoRKvxUIRjgCNtbEIYpdtei1B+/TEdt1cqZ8FfqCOZ7LDTuzvihgROx6Zv1FfvFwcdX6x3uT0E1A6/rCc1PIVh8XdM13ltVpRvwdoZNB22tvNdrKnAu705YTrWihwcMtacYkWlB5RAmzRcVAp8I0muWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199015)(6666004)(31686004)(966005)(6486002)(478600001)(6636002)(316002)(66946007)(55236004)(66556008)(26005)(53546011)(6512007)(8676002)(66476007)(36756003)(4326008)(41300700001)(2616005)(8936002)(186003)(5660300002)(921005)(38100700002)(7416002)(30864003)(83380400001)(6506007)(86362001)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9zdDRqdTdFcGVCT3V1STRoSmJuakFGRnhLTzJOWmFEZFVITEFCM24waXpS?=
 =?utf-8?B?UTlKcXYxQ3J6bERRUnpGUHhMRGtiMkNvZUd0V1dna1FVWGpRK2pJNkdhaUtt?=
 =?utf-8?B?T3F5ektMYW9UYnBtWWkrU0RpMW5zSW1hWjduZFZsU3NXQXhOVlo5RlNVUW1K?=
 =?utf-8?B?dFlraC9qeU5uM2oyc2lWWHcyQUVpOXByVnNhYnN1SDJoZ0VvZ2xpTGJTVFEz?=
 =?utf-8?B?Wk82S2tMNmJVVWNQRmJoOWF2N2ZQNU84TGRPNUR0RVNJVmJhWFhOYmFjcVgv?=
 =?utf-8?B?YkxzT2Jsd01nbkJQMUNWUW9RSEpLTVlBT3hQWlVibkdPTXllS0FyRmc0YXZX?=
 =?utf-8?B?Q0ZhbDA2bHk4cG40OFh3blNkT2VkbjNPNk5Pelk4R0RrNUFNaGxxY0dNQUQ3?=
 =?utf-8?B?YjNYQ21jcmpTWnBINGZkRFFJcTVXTW51WFJoVElzTkpEZzBwOStTQUN3UWF1?=
 =?utf-8?B?akxhd2xma3RTM01GN2pJajdPM2tRRjg0aEgxNEZmOG1LZk1DS2Z1QVN6Smdx?=
 =?utf-8?B?c3J1MDhBWmpiMWd4MVVsWHVpMTg1QUlMVG90aVFNd3hUSUlHWjVVWkk2RWVO?=
 =?utf-8?B?Q1V3TTdONjNYbjhDSjhZS21nVGdGczg1VUtWSHRUUnZzaUJEMWZ4TjFzMitJ?=
 =?utf-8?B?M0RldW14M1JKeXFSTU0yOHRuNzM0aG1veXA0S0lUUG1KOFE2aGJUdW9pdkhK?=
 =?utf-8?B?UUtQNXVVa2hRc2oyVGsrMzJNdDdOYW5ZN1ZZQWE1L05SODFmQ2tFUnMydWd3?=
 =?utf-8?B?K1NuYi94NlY1ZVBSNGZpN1NGT1djRytqbktsdWJUbkNoNFRydEczR1NjQWZD?=
 =?utf-8?B?RVAxd0l2elptTDVnNEJodUpJVERxSVRobCs2bTByV3Q1Q1lHSzhMeVRyK3Zk?=
 =?utf-8?B?c28xSFJtK0NTdGRReHRtQWptbkFMeW1MYXZtWkhPRUN5TGt1NTRiLzJ2MG1S?=
 =?utf-8?B?ODB6N0JYM0FEcjVVMHZLSG1Ick1yY3FNcHRDOG1Jb2czNUQ4Y21lWnRzbjhI?=
 =?utf-8?B?VzMzdHpZb2kyQXRWeFFjcXkzc2hRcG42S1pIZlZwMXdVd1l3Z3VrUUtYQUEx?=
 =?utf-8?B?a1lZUW5WTlZDUjVrY1IwSDdLN2ExdlUzREhQSXN2dW9tS0lIQUVnVGVBR1pt?=
 =?utf-8?B?blc4d0ZpSTRsTXF5WWIyeWdmNjZrdHpwMFh3V1NEdDNkLzhFZzcwMlZFRlVm?=
 =?utf-8?B?UzBWcjJvY2M3Rm0wTm96OEZDZm9Fd0g2dHpld0s5N25XdVMyejNYY2lJdjJO?=
 =?utf-8?B?S0NXSThNaTJjTmZVNks4Rk12Q2psc0Z3YUtvZDh1M1NGcEhsdFMybnVKOVJO?=
 =?utf-8?B?UUlaSUlqT04vRTBrUG44dVVvbS82clBGeEJGTjRwTU5hK1dqMjZiYjBlVXY5?=
 =?utf-8?B?ZW5uWGhwcmFPUk00NVdaZElvYlFmY1VWL2pvYjlpZG5HTG5qdkNEMFBTVXBl?=
 =?utf-8?B?ZloydGs2MDBqc3BVT0pic3NuOU9QcFpSZTNYeXUzL3d5VnRqQzUwUnVqbFpx?=
 =?utf-8?B?d01DRHdMV1ZTWFZIVW1GSEVpbXZjVW5jYnlTc0lvMzlNUFBTTU9RaHVjQ2Rh?=
 =?utf-8?B?a0p4UmgwdmVQQ1JRL1hkSmtFbFhwV2FvOVRrcXlzRGZPQ1BDTVEvM3I3NzBL?=
 =?utf-8?B?dHFLMHNXZmVXdUtHN3BxRlVNOVJxc2lsaU9rT1lybU8zV3JVZFhpejFSaSt5?=
 =?utf-8?B?Z1pVQW0zNkhzeTRVbStkbE1GRTBER200b28zSDRKZ2FWS2cyeFZOWlgvNmZs?=
 =?utf-8?B?YlZyc252YVBXaGM1TTlNZTZXYlBZdWNiV0RtQStYSCtiTm4rMGdabnVDMFQv?=
 =?utf-8?B?SlZkR0VGWVhJNHRIVVFGRG5ZYXpsWmFHY1RiQk16eDZiN2lKZHAyRW1FckNu?=
 =?utf-8?B?NkpwTnRxZmdIR3U2L1gxYjZ5NmhkSE5TQUtreXNLK1JPeGJ5WFNNT1h6dGNy?=
 =?utf-8?B?K2RabFlxUlMzQWhSNFFFWTI1bm9kRnhDWSs5VkZ3YkUrZTVuMjRGUTBaTVMv?=
 =?utf-8?B?a2pVckEvWUd1cWFTMFN2aHdFOEJlREZVSnAzc1NHTVFOTWIrYWFPSUkyb0Ru?=
 =?utf-8?B?QWhySUJ5OUVvS1dXMUkrZ3VjWnRyaFRJTTA4WFhmSjlteGRKd1Y5NDZUMmRF?=
 =?utf-8?B?dVloM2wrWGpvbytFa3NyWW9ybCs5Q3FTRnhkeWR4bW5yRFV0ZXArNTdsQVhk?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39c76a4-219e-48bf-be15-08dac70352cc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 12:17:11.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NYKKsGWjGC/XfMssDPZeBoqMU9OSEnxDCJ4CmuKFgCwfODsMs0IaPRgTbWom/E6QA4DPhSnWog93+1++ZVcWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5036
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
> This commit enables XUSB host, device, and pad controller on
> Jetson AGX Orin.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
> depends on the following change
> https://lore.kernel.org/all/20221003125141.123759-1-jonathanh@nvidia.com/
> V2 -> V3:nothing has changed but added the dependency here
> V1 -> V2:removed the redundant cells and status in ucsi-ccg.
> Using dash instead of underscore in the ucsi-ccg node name.
> Using representive name in cypress,firmware-build property.
>   .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 +++++
>   .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 175 ++++++++++++++++++
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 170 +++++++++++++++++
>   3 files changed, 393 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> index 9e4d72cfa69f..8acef87a5398 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
> @@ -61,6 +61,29 @@ mmc@3460000 {
>   			non-removable;
>   		};
>   
> +		padctl@3520000 {
> +			vclamp-usb-supply = <&vdd_ao_1v8>;
> +			avdd-usb-supply = <&vdd_ao_3v3>;
> +
> +			ports {
> +				usb2-0 {
> +					vbus-supply = <&vdd_5v0_sys>;
> +				};
> +
> +				usb2-1 {
> +					vbus-supply = <&vdd_5v0_sys>;
> +				};
> +
> +				usb2-2 {
> +					vbus-supply = <&vdd_5v0_sys>;
> +				};
> +
> +				usb2-3 {
> +					vbus-supply = <&vdd_5v0_sys>;
> +				};
> +			};
> +		};
> +
>   		rtc@c2a0000 {
>   			status = "okay";
>   		};
> @@ -69,4 +92,29 @@ pmc@c360000 {
>   			nvidia,invert-interrupt;
>   		};
>   	};
> +
> +	vdd_5v0_sys: regulator@0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VIN_SYS_5V0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vdd_ao_1v8: regulator@1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-AO-1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	vdd_ao_3v3: regulator@2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-AO-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
>   };
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> index 57ab75328814..58baedbd0f93 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
> @@ -2011,6 +2011,181 @@ hda@3510000 {
>   			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
>   			status = "okay";
>   		};
> +
> +		padctl@3520000 {
> +			status = "okay";
> +
> +			pads {
> +				usb2 {
> +					lanes {
> +						usb2-0 {
> +							status = "okay";
> +						};
> +
> +						usb2-1 {
> +							status = "okay";
> +						};
> +
> +						usb2-2 {
> +							status = "okay";
> +						};
> +
> +						usb2-3 {
> +							status = "okay";
> +						};
> +					};
> +				};
> +
> +				usb3 {
> +					lanes {
> +						usb3-0 {
> +							status = "okay";
> +						};
> +
> +						usb3-1 {
> +							status = "okay";
> +						};
> +
> +						usb3-2 {
> +							status = "okay";
> +						};
> +					};
> +				};
> +			};
> +
> +			ports {
> +				usb2-0 {
> +					mode = "otg";
> +					usb-role-switch;
> +					status = "okay";
> +					port {
> +						hs_typec_p1: endpoint {
> +							remote-endpoint = <&hs_ucsi_ccg_p1>;
> +						};
> +					};
> +				};
> +
> +				usb2-1 {
> +					mode = "host";
> +					status = "okay";
> +					port {
> +						hs_typec_p0: endpoint {
> +							remote-endpoint = <&hs_ucsi_ccg_p0>;
> +						};
> +					};
> +				};
> +
> +				usb2-2 {
> +					mode = "host";
> +					status = "okay";
> +				};
> +
> +				usb2-3 {
> +					mode = "host";
> +					status = "okay";
> +				};
> +
> +				usb3-0 {
> +					nvidia,usb2-companion = <1>;
> +					status = "okay";
> +					port {
> +						ss_typec_p0: endpoint {
> +							remote-endpoint = <&ss_ucsi_ccg_p0>;
> +						};
> +					};
> +				};
> +
> +				usb3-1 {
> +					nvidia,usb2-companion = <0>;
> +					status = "okay";
> +					port {
> +						ss_typec_p1: endpoint {
> +							remote-endpoint = <&ss_ucsi_ccg_p1>;
> +						};
> +					};
> +				};
> +
> +				usb3-2 {
> +					nvidia,usb2-companion = <3>;
> +					status = "okay";
> +				};
> +			};
> +		};
> +
> +		usb@3550000 {
> +			status = "okay";
> +
> +			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
> +			phy-names = "usb2-0", "usb3-1";
> +		};
> +
> +		usb@3610000 {
> +			status = "okay";
> +
> +			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
> +			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
> +				"usb3-0", "usb3-1", "usb3-2";
> +		};
> +
> +		i2c@c240000 {
> +			status = "okay";
> +			ucsi-ccg@8 {
> +				compatible = "cypress,cypd4226";
> +				cypress,firmware-build = "nvidia,jetson-agx-xavier";
> +				interrupt-parent = <&gpio>;
> +				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
> +				reg = <0x08>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				ccg_typec_con0: connector@0 {
> +					compatible = "usb-c-connector";
> +					reg = <0>;
> +					label = "USB-C";
> +					data-role = "host";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						hs_ucsi_ccg_p0: endpoint {
> +							remote-endpoint = <&hs_typec_p0>;
> +						};
> +					};
> +					port@1 {
> +						reg = <1>;
> +						ss_ucsi_ccg_p0: endpoint {
> +							remote-endpoint = <&ss_typec_p0>;
> +						};
> +					};
> +				};
> +				ccg_typec_con1: connector@1 {
> +					compatible = "usb-c-connector";
> +					reg = <1>;
> +					label = "USB-C";
> +					data-role = "dual";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						hs_ucsi_ccg_p1: endpoint {
> +							remote-endpoint = <&hs_typec_p1>;
> +						};
> +					};
> +					port@1 {
> +						reg = <1>;
> +						ss_ucsi_ccg_p1: endpoint {
> +							remote-endpoint = <&ss_typec_p1>;
> +						};
> +					};
> +				};
> +			};
> +		};
>   	};
>   
>   	chosen {
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 0170bfa8a467..27635d459e4c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -942,6 +942,174 @@ hda@3510000 {
>   			status = "disabled";
>   		};
>   
> +		xusb_padctl: padctl@3520000 {
> +			compatible = "nvidia,tegra234-xusb-padctl";
> +			reg = <0x03520000 0x20000>,
> +			      <0x03540000 0x10000>;
> +			reg-names = "padctl", "ao";
> +			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			resets = <&bpmp TEGRA234_RESET_XUSB_PADCTL>;
> +			reset-names = "padctl";
> +
> +			status = "disabled";
> +
> +			pads {
> +				usb2 {
> +					clocks = <&bpmp TEGRA234_CLK_USB2_TRK>;
> +					clock-names = "trk";
> +
> +					lanes {
> +						usb2-0 {
> +							nvidia,function = "xusb";
> +							status = "disabled";
> +							#phy-cells = <0>;
> +						};
> +
> +						usb2-1 {
> +							nvidia,function = "xusb";
> +							status = "disabled";
> +							#phy-cells = <0>;
> +						};
> +
> +						usb2-2 {
> +							nvidia,function = "xusb";
> +							status = "disabled";
> +							#phy-cells = <0>;
> +						};
> +
> +						usb2-3 {
> +							nvidia,function = "xusb";
> +							status = "disabled";
> +							#phy-cells = <0>;
> +						};
> +					};
> +				};
> +
> +				usb3 {
> +					lanes {
> +						usb3-0 {
> +							nvidia,function = "xusb";
> +							status = "disabled";
> +							#phy-cells = <0>;
> +						};
> +
> +						usb3-1 {
> +							nvidia,function = "xusb";
> +							status = "disabled";
> +							#phy-cells = <0>;
> +						};
> +
> +						usb3-2 {
> +							nvidia,function = "xusb";
> +							status = "disabled";
> +							#phy-cells = <0>;
> +						};
> +
> +						usb3-3 {
> +							nvidia,function = "xusb";
> +							status = "disabled";
> +							#phy-cells = <0>;
> +						};
> +					};
> +				};
> +			};
> +
> +			ports {
> +				usb2-0 {
> +					status = "disabled";
> +				};
> +
> +				usb2-1 {
> +					status = "disabled";
> +				};
> +
> +				usb2-2 {
> +					status = "disabled";
> +				};
> +
> +				usb2-3 {
> +					status = "disabled";
> +				};
> +
> +				usb3-0 {
> +					status = "disabled";
> +				};
> +
> +				usb3-1 {
> +					status = "disabled";
> +				};
> +
> +				usb3-2 {
> +					status = "disabled";
> +				};
> +
> +				usb3-3 {
> +					status = "disabled";
> +				};
> +			};
> +		};
> +
> +		usb@3550000 {
> +			compatible = "nvidia,tegra234-xudc";
> +			reg = <0x03550000 0x8000>,
> +			      <0x03558000 0x8000>;
> +			reg-names = "base", "fpci";
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_DEV>,
> +				 <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
> +				 <&bpmp TEGRA234_CLK_XUSB_SS>,
> +				 <&bpmp TEGRA234_CLK_XUSB_FS>;
> +			clock-names = "dev", "ss", "ss_src", "fs_src";
> +			interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_DEVR &emc>,
> +					<&mc TEGRA234_MEMORY_CLIENT_XUSB_DEVW &emc>;
> +			interconnect-names = "dma-mem", "write";
> +			iommus = <&smmu_niso1 TEGRA234_SID_XUSB_DEV>;
> +			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBB>,
> +					<&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
> +			power-domain-names = "dev", "ss";
> +			nvidia,xusb-padctl = <&xusb_padctl>;
> +			dma-coherent;
> +			status = "disabled";
> +		};
> +
> +		usb@3610000 {
> +			compatible = "nvidia,tegra234-xusb";
> +			reg = <0x03610000 0x40000>,
> +			      <0x03600000 0x10000>,
> +			      <0x03650000 0x10000>;
> +			reg-names = "hcd", "fpci", "bar2";
> +
> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
> +				 <&bpmp TEGRA234_CLK_XUSB_FALCON>,
> +				 <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
> +				 <&bpmp TEGRA234_CLK_XUSB_SS>,
> +				 <&bpmp TEGRA234_CLK_CLK_M>,
> +				 <&bpmp TEGRA234_CLK_XUSB_FS>,
> +				 <&bpmp TEGRA234_CLK_UTMIP_PLL>,
> +				 <&bpmp TEGRA234_CLK_CLK_M>,
> +				 <&bpmp TEGRA234_CLK_PLLE>;
> +			clock-names = "xusb_host", "xusb_falcon_src",
> +				      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
> +				      "xusb_fs_src", "pll_u_480m", "clk_m",
> +				      "pll_e";
> +			interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTR &emc>,
> +					<&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTW &emc>;
> +			interconnect-names = "dma-mem", "write";
> +			iommus = <&smmu_niso1 TEGRA234_SID_XUSB_HOST>;
> +
> +			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBC>,
> +					<&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
> +			power-domain-names = "xusb_host", "xusb_ss";
> +
> +			nvidia,xusb-padctl = <&xusb_padctl>;
> +			dma-coherent;
> +			status = "disabled";
> +		};
> +
>   		fuse@3810000 {
>   			compatible = "nvidia,tegra234-efuse";
>   			reg = <0x03810000 0x10000>;
> @@ -1470,6 +1638,8 @@ gen2_i2c: i2c@c240000 {
>   			compatible = "nvidia,tegra194-i2c";
>   			reg = <0xc240000 0x100>;
>   			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>   			status = "disabled";
>   			clock-frequency = <100000>;
>   			clocks = <&bpmp TEGRA234_CLK_I2C2


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
