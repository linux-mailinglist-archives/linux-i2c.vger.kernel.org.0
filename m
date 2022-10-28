Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D92610D56
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 11:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiJ1JdU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 05:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiJ1JdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 05:33:18 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::621])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D989EDD3A1;
        Fri, 28 Oct 2022 02:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfr+1XZU/7CcgVXEg5Kf9yRAc070ruCaoO6KlDTY4TBsMxhfWXf90dmwvl9XluNP6Fxq0uM/4XNnNsFh0Y81SKhaLyXpo2bEkypfAHq9yvZLUERgNk4u0Mvr3I+6a0cJcOHar56Xf0PPTBsz7p6MDEwiw9aNYo2x7e1RhZ0JEVmMVAdG/0tZ2z+JezUsx35DwMZz+Y08aDEHsW4x7TRTEyslthmyTtQ0UzMEDLgRYAVDw16iL2MaeD968WRoNJe0yNmhNa32OuCz2emRKByPid21K2xLlnuDUu4F7gqGOHCGF3pYbDnRxpytYyspXGk8025KLtm22SsTJjYgqdnQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9PtRBEUXFCulHKYLaqEQSTXH6FXGSGqbMdntqTUeP8=;
 b=oUgJp8IXvMWmfTZxfTlP69iAuossCvLjJuL8bgxbbowVOMGTSiYH00rRuKNN2Uh6kHqimUVFEB3xjRr62bzZs3bej23aQT9bWqzg7Uj93g5EauWfLVejY9DyZgWmxzXZnA+eZ4Iw5Sb24TMgqBchWWD2J6I++zimNZffQmRpXrS73XONOY0KYqITt6POhAYPWySuUOpsST1mK5Vr9VFZvBJCMcy8dgJc2nsmIZyvF/3+8w5IN/JxB1i5nGiOGERu3piUWLrGHg7a4kiV+CjWavy0HnkL2cdxmiItplYH2xrS774Fs0zrogszkhwSz+TkZmPEwzs5HT6gpwwGlkCvKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9PtRBEUXFCulHKYLaqEQSTXH6FXGSGqbMdntqTUeP8=;
 b=YG6jqoxDw22DPjywyg3SPkl8HhHHPrMR3GcT7kyLF5tqqT5r8m1EO4ujr2PCF6Ta6/CcYhpWbrcx1C75sBTgFnzjdxIcWkH4odDgJH1jsKMQVxqYs2jFAH7pE5iAJrbwpsMNgkqLJBUgiaPMyhwTQdd0oj7u2AHzJ54SCmKpzquIswZOPq1buI2A0sIQy6Xxokah7LxxloyjmsFybRI4VV8LShwNrtsfyif3hZPu5XUlwnWY78Y3KeJjw7+TBQ0n5BSUD3zwoalkMfQqnNymVfCttfWh21SsKXq9IexTibvFIlWFH+JwLM9VWlnh7ytA49dBIansx5gARhX8XQBVBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH2PR12MB4940.namprd12.prod.outlook.com (2603:10b6:610:65::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.15; Fri, 28 Oct 2022 09:33:12 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::c0e5:f111:3e59:7c66%6]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 09:33:12 +0000
Message-ID: <b803bcf9-fc47-5239-ffe9-707925f324de@nvidia.com>
Date:   Fri, 28 Oct 2022 10:33:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 04/11] arm64: tegra: Enable XUSB host and device on Jetson
 AGX Orin
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
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
 <20221024074128.1113554-5-waynec@nvidia.com>
 <2059dfe5-b084-42a4-7f35-9da9561fc12b@linaro.org>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <2059dfe5-b084-42a4-7f35-9da9561fc12b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH2PR12MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e30751c-d6e8-4fb2-408a-08dab8c76e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5dgSzT/SpygCUiuUxFNHLLf6Kwg/jlrP1pzAK9DlaBMNLwvpK2R8z76JjeWmWdObqg25ZbnDDkeNKPkWoQ46dsmwGipMDMsVO2ZiDAm8Y9jecSp7jBUoRkp1KDDKXBtCx3vu/3GfYYESjcBGRRmom0HCqPhRX0DYiK9oykii3bn0XuBKmm8FbxDZpW9VZNl9ADnFxPrMXeM+LlTEDUY2WE4fSGsTzqMAhf+qjBHCRWHDTPQ7YxxthFLZNioJOSxtSKri93l7oBPNEVvip/tpnpHmj3lHawKYfnMpPdXFbMQER6sdf4RXOo1PVqBabKbu52hC/uXnBRsgnaeV1QJlvhO5LgDsP7LgH/K3V8sHR8VHV4ydMdL8BMCAcd8uXt/912kWy51PuSCeLXcVzf4cS6WUvG2dh5kocuZ3LFXLxlL82QjiY5tWahw/J4c2y+fnBmCZNUC6DLisPQiI+bmIk1jkzlWmNt8aCzMj3vLtwINK0lBRdtTFeh17p1OSSIKox5UioiOeJXfVJ2M8UfxE6f/RtLH4j0cGc6Q9/wemWN9eqOBABHTWllE3XKBSWfHHwaPWef73Z8/T0tShshxOThM/HZOhGNWmwvhR4H3xNy8FCdAeCWfyn7wyUOG1m9LNvChelVtqw7v5b2kWbHXrgZnUP9BPJV5hOLjeP0J60y2PkCv4MVONlx5mE0L+Uo4VkvuUPlm30iecOQKkPeYHxOyxwMgnDUgSjZtoM7hBgDdseOdApixZeVAZLOuYwUQhFII2dYTF9uRuKEZj/FoXN2IFKRZYaAXehKDErWxtjsfl0JdF39CCgG64IY0XdGk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199015)(36756003)(31686004)(7416002)(86362001)(31696002)(5660300002)(2906002)(38100700002)(83380400001)(921005)(6512007)(186003)(2616005)(6666004)(6636002)(6486002)(478600001)(316002)(53546011)(110136005)(41300700001)(66946007)(8676002)(66476007)(66556008)(4326008)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZPT0tCNndMaHZwdWtheFlBQzhmWUpqQUV1OTNuZ3JNcE5yOFkzWmxFRFBG?=
 =?utf-8?B?VGpjb3UwVEpGZWgyWkpld0dISElsQU03MFB3WXh3d205QUZBcTB6Z0NkcU5s?=
 =?utf-8?B?c1QrZC9PWmM3RVRkNnZudVVjV1lqdkwwYUF4aFQvc2FYeDE3Mklqb0NOanQz?=
 =?utf-8?B?K01TeCt3NXNBR1lYcE9Yd1pVWUtUclh2bU0wQThlZHpmYlBRMjlwOXpOUGdU?=
 =?utf-8?B?em9STlZPakQ2amtZeU43NHhHaHJLdDhtRzRpVnJnNXRDTjdySGZaU1N4UlZU?=
 =?utf-8?B?MHB5RitZQXVwNFdFbUh3cjltc3UzbXZpemx4Z1VLQU1DdW1zZElvMGlRcDA4?=
 =?utf-8?B?dU82R3FwTnAzdDl3OW9XMXNTNkJMQnBRdlR2b2psNG8xbVlSazNFdCtJa21R?=
 =?utf-8?B?dFdlNVNRTmg2NVBCOXpGaS9ncmVKVDc2YlAvZDVPZkpzRW1ES2JjaVRObysx?=
 =?utf-8?B?YWNUbWtBNkRMY3J4dDA5UUhXN3FoQVozcmMrOHNabUh6UWZ6MlcrZ2xWcVdV?=
 =?utf-8?B?SGlKUmdQZjRNbndFV1hXZVh0cUU3V0M3UGh0QUlIb3o0dFpaT2VPdUE0bDBs?=
 =?utf-8?B?U2lKVWd4c3kzZEdaSmllcjRFMmlmTnVLaHVrNHppS0MwTmlZMU1uenhvak43?=
 =?utf-8?B?Nm9YYmlkcTRpYUw0MkU4WWc3UkJ5a25wOGsrRFZnWTVVZDFrR0RNT3ZXOE56?=
 =?utf-8?B?dmtJV0pFMlRFNWVhcXlOYkRlWDNoejNjdTdjaEdaMVR1VEtPZmg2VTB4NFNX?=
 =?utf-8?B?dmJjYTFUTHFBQ1h5b3pBTGxmNDRTd3E1OTBLOFI4Q1RKNkZkdXBjQ0FWc3ho?=
 =?utf-8?B?S29nM3RwNis5dTQvTC8waWw3cTd5WHo1ZE5yZnJHT09EbkExNm9ESk9tL2tq?=
 =?utf-8?B?L1UvMnA2NUpjSFdEanYxWHc1dGNYanFnTTQ5K2VMcERiM1BabHgzVFF5Z3NT?=
 =?utf-8?B?OElhcVpQU2M5L0V4MGNFUTJoWmVpWDY0aERsUHJxUU9sWmdydXlVNmI0OWgv?=
 =?utf-8?B?c0RLWjVyakdmemNncGxqaFJjMitsUHFWM1R5aytEdW9SZGlOWDNSSmQ0Kysx?=
 =?utf-8?B?SGJWODZXaXd5U2pQUWkycTRwUHkrL2NZaVdJbXZ4N0hQaHBzM296NEhJeXN5?=
 =?utf-8?B?UEJjdGhnSlJYS0VSMVM2SktwU0QvS1Y5dVFwYTJnbmJwZDBJSkxrRE16c1V1?=
 =?utf-8?B?b2hmZHpxZWJESGM4Z0I5azJFbTlMNXpDNURrRXo4UG5FWGxod01iYjVtWFZj?=
 =?utf-8?B?RVdSVGdqc3QwUjc2dXNsWm5RdkhlSDZLUStzaU5BQmE1OG9uMDcvbG1oYTdT?=
 =?utf-8?B?U0tUZjZieGNlY21LUGJvNzVxVzBCQkZtQTV2a1dXb0lJcTVxSkY5UFRJL0lZ?=
 =?utf-8?B?STJ0MG5UWUtzd3l5WkZrUTkzb1N0Vzd3Q0VneEhBZmhWQ3NjcXpYamVjZ0VQ?=
 =?utf-8?B?VUVsT1BhRmZNRGhvZVBPNGZmREVNSU5hZ3NCLzBQRWJ2SUtEc204WVo5YVph?=
 =?utf-8?B?azB6RjVGcDMwd1dUOStVd3RVSklWRm5WVjhNS01TOUN3b1JIOUFMSzNBUjNU?=
 =?utf-8?B?Y1ZvT0VXME9Jb3MrWUFmUXpwS1FRZ0ZRUmw2MXBWK2dMRldiZitxbTVmd1B3?=
 =?utf-8?B?NEsraHEyMkxxblZEZks1bzBwRVlKVGZBSTlTdW01QUxRcHRtYXFZZkRBVEEr?=
 =?utf-8?B?NS9PNTZzMnl6bVBSUWwxZ3FkQXlJNnpTdGI2RHROd0NyQ2lpNjJqMndTcFFV?=
 =?utf-8?B?aXpueXNGL0w1R3hBRmdwaDUzZFBvNzY4b0EwK2UvTEZBTmRxcERZaG9keUsz?=
 =?utf-8?B?RGF1TzJiSGhNeGR2UndOTzN4Z29QK0NNclNia2VMQXg4WEtvck8reEZiOWVl?=
 =?utf-8?B?S3RrZVhudHk3MmltQTdJYXJCQ3RZYk94WFEzd3dSOXRHdVZBMkFtenBpdDlU?=
 =?utf-8?B?aDF2THNCMVAzMUkyalVzSkVTR2ZzdldHd2JKWlFBNTVTTnQvVDVvYTJteHk4?=
 =?utf-8?B?MGRRL3oxZXdWQU5HUDdKNzFoa0t5enJZN3dwN3VIWXpFOVlyd0FEK2p0MDVN?=
 =?utf-8?B?RzU4Q25kYWk2aW1NZUFuWFBGZ21USzNaSkRWV1h1QmZ4REtVaDdpTmpqVE1n?=
 =?utf-8?B?OHp3ZmZEUUwwcUtUS25rM0xYcVR3ZkRHd1NaTlZ3MlFNalQrMzgyYnBsbGhy?=
 =?utf-8?B?aGhsc2d1S3ljN3JlaGpIOFl2cUhIQk1ON01HeVBYWTAyd3c5b0tvL3JIc29h?=
 =?utf-8?B?VUV1NGhhd1VoV1VjL1lXWmdrZTJ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e30751c-d6e8-4fb2-408a-08dab8c76e59
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 09:33:11.8191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qAO5Au59vX9rEXoa9LXVTmXl2VxdR9ch17W5RHZRuGfrQg+4RUVcwD0JYOUcit6B2xCEMDR7/z8YLDkOZECOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4940
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 28/10/2022 03:23, Krzysztof Kozlowski wrote:
> On 24/10/2022 03:41, Wayne Chang wrote:
>> This commit enables XUSB host, device, and pad controller on
>> Jetson AGX Orin.
>>
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> ---
>>   .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |  48 +++++
>>   .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 184 ++++++++++++++++++
>>   arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 170 ++++++++++++++++
>>   3 files changed, 402 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
>> index 9e4d72cfa69f..8acef87a5398 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi
>> @@ -61,6 +61,29 @@ mmc@3460000 {
>>   			non-removable;
>>   		};
>>   
>> +		padctl@3520000 {
>> +			vclamp-usb-supply = <&vdd_ao_1v8>;
>> +			avdd-usb-supply = <&vdd_ao_3v3>;
>> +
>> +			ports {
>> +				usb2-0 {
>> +					vbus-supply = <&vdd_5v0_sys>;
>> +				};
>> +
>> +				usb2-1 {
>> +					vbus-supply = <&vdd_5v0_sys>;
>> +				};
>> +
>> +				usb2-2 {
>> +					vbus-supply = <&vdd_5v0_sys>;
>> +				};
>> +
>> +				usb2-3 {
>> +					vbus-supply = <&vdd_5v0_sys>;
>> +				};
>> +			};
>> +		};
>> +
>>   		rtc@c2a0000 {
>>   			status = "okay";
>>   		};
>> @@ -69,4 +92,29 @@ pmc@c360000 {
>>   			nvidia,invert-interrupt;
>>   		};
>>   	};
>> +
>> +	vdd_5v0_sys: regulator@0 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VIN_SYS_5V0";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vdd_ao_1v8: regulator@1 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vdd-AO-1v8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vdd_ao_3v3: regulator@2 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vdd-AO-3v3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>>   };
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
>> index 57ab75328814..b4630280bb32 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
>> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
>> @@ -2011,6 +2011,190 @@ hda@3510000 {
>>   			nvidia,model = "NVIDIA Jetson AGX Orin HDA";
>>   			status = "okay";
>>   		};
>> +
>> +		padctl@3520000 {
>> +			status = "okay";
>> +
>> +			pads {
>> +				usb2 {
>> +					lanes {
>> +						usb2-0 {
>> +							status = "okay";
>> +						};
>> +
>> +						usb2-1 {
>> +							status = "okay";
>> +						};
>> +
>> +						usb2-2 {
>> +							status = "okay";
>> +						};
>> +
>> +						usb2-3 {
>> +							status = "okay";
>> +						};
>> +					};
>> +				};
>> +
>> +				usb3 {
>> +					lanes {
>> +						usb3-0 {
>> +							status = "okay";
>> +						};
>> +
>> +						usb3-1 {
>> +							status = "okay";
>> +						};
>> +
>> +						usb3-2 {
>> +							status = "okay";
>> +						};
>> +					};
>> +				};
>> +			};
>> +
>> +			ports {
>> +				usb2-0 {
>> +					mode = "otg";
>> +					usb-role-switch;
>> +					status = "okay";
>> +					port {
>> +						hs_typec_p1: endpoint {
>> +							remote-endpoint = <&hs_ucsi_ccg_p1>;
>> +						};
>> +					};
>> +				};
>> +
>> +				usb2-1 {
>> +					mode = "host";
>> +					status = "okay";
>> +					port {
>> +						hs_typec_p0: endpoint {
>> +							remote-endpoint = <&hs_ucsi_ccg_p0>;
>> +						};
>> +					};
>> +				};
>> +
>> +				usb2-2 {
>> +					mode = "host";
>> +					status = "okay";
>> +				};
>> +
>> +				usb2-3 {
>> +					mode = "host";
>> +					status = "okay";
>> +				};
>> +
>> +				usb3-0 {
>> +					nvidia,usb2-companion = <1>;
>> +					status = "okay";
>> +					port {
>> +						ss_typec_p0: endpoint {
>> +							remote-endpoint = <&ss_ucsi_ccg_p0>;
>> +						};
>> +					};
>> +				};
>> +
>> +				usb3-1 {
>> +					nvidia,usb2-companion = <0>;
>> +					status = "okay";
>> +					port {
>> +						ss_typec_p1: endpoint {
>> +							remote-endpoint = <&ss_ucsi_ccg_p1>;
>> +						};
>> +					};
>> +				};
>> +
>> +				usb3-2 {
>> +					nvidia,usb2-companion = <3>;
>> +					status = "okay";
>> +				};
>> +			};
>> +		};
>> +
>> +		usb@3550000 {
>> +			status = "okay";
>> +
>> +			phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
>> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>;
>> +			phy-names = "usb2-0", "usb3-1";
>> +		};
>> +
>> +		usb@3610000 {
>> +			status = "okay";
>> +
>> +			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
>> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
>> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
>> +				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
>> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
>> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-1}>,
>> +				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
>> +			phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3",
>> +				"usb3-0", "usb3-1", "usb3-2";
>> +		};
>> +
>> +		i2c@c240000 {
>> +			status = "okay";
>> +			ucsi_ccg: ucsi_ccg@8 {
> 
> No underscores in node names.
> 
>> +				compatible = "cypress,cypd4226";
>> +				cypress,firmware-build = "gn";
>> +				interrupt-parent = <&gpio>;
>> +				interrupts = <TEGRA234_MAIN_GPIO(Y, 4) IRQ_TYPE_LEVEL_LOW>;
>> +				reg = <0x08>;
>> +				status = "okay";
> 
> The pattern of redefining full path in Tegra is confusing - I have no
> clue which of these status=okay are correct which are redundant.
> 
> Do you?

I understand you may not like this approach, however, this comment is 
not really relevant to just this patch, but a general comment. But yes 
we will ensure that this is correct.

> 
> 
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				ccg_typec_con0: connector@0 {
>> +					compatible = "usb-c-connector";
>> +					reg = <0>;
>> +					label = "USB-C";
>> +					data-role = "host";
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +					port@0 {
>> +						reg = <0>;
>> +						#address-cells = <1>;
>> +						#size-cells = <0>;
> 
> Hm, why do you have here cells?
> 
> Did you test the DTS with dtbs_check?

That does not look correct and so we will correct.

Thanks!
Jon

-- 
nvpublic
