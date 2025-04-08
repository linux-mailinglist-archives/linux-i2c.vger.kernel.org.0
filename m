Return-Path: <linux-i2c+bounces-10199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C22A7F258
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 03:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F63217A404
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 01:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED01024BCFD;
	Tue,  8 Apr 2025 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="LekvemD8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010011.outbound.protection.outlook.com [52.103.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC40523535D;
	Tue,  8 Apr 2025 01:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076472; cv=fail; b=Vv7BsWIUNgCyKn2nJc01tu2K/ndJ9vNOs1Hjh31Uy+kzYOykoB+Yf2bUnRP60rzZ6S6AL9gDbQU1whTel3666lOLpd1FoX/G6LvmTe9F5xQI71OvL9wbubV4+zmVx6uFyGlyrcTgJ39xLS+6ygn/h/r+7OSsBVLOZRA6wrfgt5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076472; c=relaxed/simple;
	bh=h8GaqVOpQdy3tNg0lZ4gpsVykIqZLK+DaTyHLz5ySyA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GpaEA+S5ANPV/Ao2PF2kgAbMCHU3dmVNelEeNTGyNR53SaBOMOda19BhU1rm4yiowxdI3cNWMNcykQcvLBDRurh7EdRDGZNd2QTfQ/1BNF1TAKsmBxXJhCdXfFJryyAMIIB1QxtFLvXunG7cO0qZNlwTUgKp7Ph8JLcSa+9KIqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=LekvemD8; arc=fail smtp.client-ip=52.103.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY0IVrZwm31ekCFn/TjnpChManzIFbASCuCIY8eOHQf8b2u75MZaNR0OwVIHNDpmgdmqJ5ogC/+RkA/q5l3ewbn8kDNdEEqHGVWIt26wTtbrBM8K/QBHExbTGZl85R3eovoIFAqc49HYml885Azll6mpFn4+z+lt7N55SxDIB5Mv2U7lGwzBGGdODb3Y2hgLV29olHbXIsFsVdm6R0fyPvZz1pIFhVMMdc/v+xp3rNr8u3xWTTZw6vhqzXBsf45TtCgiih0Ucx358OI0aYYbdiuo9chbv+NOOQEj8TsmY1pLTvlHscvfs3dCoAjTAYjuhCjUVQD1vCDm7wPdARHwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpzukWXvJQjDf8qaZdHqgbwvmzn2HC5thwi6bErXXZk=;
 b=hviLGRicryEBMBKplLUQj6L1AlP6QDdKTdyG1G4Jgjz9eju9Rs9bz/O3yo8jDdvGOSEFm048hzZSxyHbJvyLEimWkt8iZ99FAaVQ4/wscxcfDJ7k75Yd2uvgf+grwQyCgFpfm8Yepb+vh7gG79krzzcFHQ7lEDPMAWoF1unmkpTwNWkR6gCzpaTQXbY6hRvoZS2QoZN0rtm2ZCcG96eSxbPb3T/1+l4oqCvOJnO/TiT4FNVPgNCSqCvKsmffVd6+mYtpyriSE74aOgwdAZl8p2vOHQmFaC82wxQxcW/B/3spV6W6Y7kSnG6pIpxWFcDuOPhhZj1NOe6Jbw8zP0a/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpzukWXvJQjDf8qaZdHqgbwvmzn2HC5thwi6bErXXZk=;
 b=LekvemD8zVSQE+NOCZbD6YcOGzVxTG3y/7HkA74byJr2S2AbX6VG1xuvCZVdjmMYyJSdT6avsmIJo8O1qgEWAHEivKpXGwmW4yDwJ0r9QOl/D4Vyf9fGTPVBtpbHfWc6GCqf2VGFizmMtYoWjOYQrmd91RmfyO/Khl3QXd6Edy8LEbkIjsPJvolUV5dxa8QngVllEovcFLLne2duKDxQcKw6M2mjoZ57h6pZqeSRQF86cP1gWmKocEAFqo+aWCmO7GZM4xB/AkvijX/ZbEPuHsIy0+cEWUAJzuX0P7yCQAs0Bi/Um0Jo2oXFX5efZeaJc8F6tg+zhgD6AnImLqGVGA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB0931.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:16a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 01:40:59 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:40:59 +0000
Message-ID:
 <MA0P287MB22628DD45C86FAD169AEAB15FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 09:40:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of Sophgo
 SRD3-10
To: Inochi Amaoto <inochiama@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost
 <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250407010616.749833-10-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <111d49a5-4f5b-4922-8885-78a56c855031@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB0931:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c2965f-dee7-4f37-c5cb-08dd763e6a0a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|15080799006|7092599003|461199028|8060799006|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmFvSXZQRmZhWGpwb0wwR2xBV2dCN2graGVPdjlmcVRWbDZUYUY4cEFueURy?=
 =?utf-8?B?NEdPT21uMHRmS0o3UWRTOVJNWlQrUEZQaFpocE9RbFQxb2sySWlPeFZQUHZn?=
 =?utf-8?B?TFpZTUFjY2w4SHFVR1crNUhWUkc3WTlZbUdPWExkUjF2K2VFUUMxRzd3Y2ZC?=
 =?utf-8?B?ajhzcUFhUnJnL1Jhd3AxVVhjbXp2TjR2RWVCWTZZZU42Sm95NGJ1T2NsS0Vk?=
 =?utf-8?B?Z0tSK1pPdCtaVHNQWW5JS0VYUjhWSG9vZ3oyMCt1cmJqelRtTURBQkdNa0hX?=
 =?utf-8?B?enB2Rk9SeENzQ2piRWRiSkcvdnkwRUNjOHR1VEU1c3I1dVBYNUoyaElZdnVU?=
 =?utf-8?B?aXkyYWkya2k3bXNWQmxVZk4vbjhjdzhvaC83MFRkamRIRGoxWW5wV3FFMnJa?=
 =?utf-8?B?OW13bXo4bVBhS3BtUlBtRjFoVnAwTzNHdlJhdnJpL0tBTmo3Mnova0hXcnhJ?=
 =?utf-8?B?ZXlDOG8zR2themZObzQzYUdLQnkwRDNrb2JtNnVaL0ZBSmtGNmptcnpLblRC?=
 =?utf-8?B?Ty9EMGpVcFpVZUVYOXo5Vmx3aGU5VUpUZlJyMlVvZFNnYnhWVGcySXY4Mkx6?=
 =?utf-8?B?N29QcTBKWUt0UCtOOWU3YnF5dWZyR1ZsNDBXMnRROGp6WnJxMHo4dG03UEsv?=
 =?utf-8?B?QXhEMzJ3RG8vRVBNVUpQNkFYVVVCM05scURsWFdIVTRKUWJiV2lXdTc5L3ZT?=
 =?utf-8?B?eGxDRmNUUzNzb3g2cmZ6eTgzWWU5ZGROL25xSTlRRXBIZGcrcjNJKzZXMnls?=
 =?utf-8?B?eWZqQ1A3NGIvVHVSaCsrNHpZWlJpZFBkVmpubDVzelU1OGRwTWJLanBwL1Ba?=
 =?utf-8?B?VTlMTVp0TnhuSlhTOTN1VDdETnRua210ejNhTi9ZM3I0d2ZUdG4xQUtmc09i?=
 =?utf-8?B?a0VWZkk5aTE1bitDZVd6bWZaZGlKUzBrZTAwOW9zRjNxTVc1c281UGFiZmNY?=
 =?utf-8?B?QjB0d0FraWdURDBWbTN6NGJsUGJKamtzLzNVdXUyRHJaNlJ1SkM0TTJFNHRu?=
 =?utf-8?B?OVdHemdVMCtDRWhoQU5CMFZySUYyd3NMdmlUN0lGenk5bUlKR3ZEMGVEQmpl?=
 =?utf-8?B?dU5oVGZrejZDY0lvWllPWmJOSXZJR0kzWFJGcCs4U0wvQndYdTRqd3d6NVVP?=
 =?utf-8?B?TTFuRFdZUkRncEdVRTlMVENJNDA1TW01dkNzMmd2TmZVQkpHeGhrSldrMWht?=
 =?utf-8?B?K0p1QVlQbmc0N3RieEhjMDhuZUZtMDhGQ0hUeUZHK2NmRGlFN2JOOXhXcTVr?=
 =?utf-8?B?V0hLS0p4NlhoRzdwWkxYL3k5WEgyVTkva1JjMnQycktUekphcElwTmMyZXl2?=
 =?utf-8?B?ZVpwMldZWFdSVTdhVGxrRGJlNGpuVU9WVy9WNXFXNkdzSStyVy82Qk1UbmM4?=
 =?utf-8?B?OU5pTGpGVC9hcFVwZXR4Wm5hN2haZnJZZkVKRHZWakFacUZKL3gyWFdGcDJY?=
 =?utf-8?B?RWxuWC9WVGI5d0xsU0ptdFJ4eWozT1FlVjRMdDVXU1BUUUVjWnBDMHl6Qjd6?=
 =?utf-8?B?amo1STZqSm4yWkxSRHIzWmY3YkZzMXh4bFVna3lJeTZqek1yR0gyWlFTZEds?=
 =?utf-8?B?c1M5dz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUtMUFFsN09nUFRodXRWSlRwNE5ucEVsTTBWYW55M0VDdS90ZDNENzRqRFhz?=
 =?utf-8?B?RGpoOVdwS05xMElyR1NWRStwK3FCUHlDSXE2RjlNL1RyZVhwKy9QSVJnVXhH?=
 =?utf-8?B?enh0c2hPY1V6WWVkY2VIZGpjSEFTR2pYK2FSMVo5TWt5N3FPZ2RrR2E2OENS?=
 =?utf-8?B?VFo4M0dKQXlzSGFmdTkxelgxeTl3YnFxRVZ1UUo4Snlsajh1Z3FYdzVSb0xQ?=
 =?utf-8?B?SVVWZnVTdkJPajdUaXZRWkpSZWcvY3BUMVpoS3R2dUZ2RHR5NzNBMGFoVUIz?=
 =?utf-8?B?YzJqSXZDcVJ6NUhSRE9sUk9zL3pDQ015MzB6a2p0VUpJbk1GQks3Nm1xVUg2?=
 =?utf-8?B?eENvVExIUkJuVXl5dG1hOVErSnhLVUt3YW4wejBCSTBFRjZoT2xwRXc2bTVF?=
 =?utf-8?B?K1NRcG8wUEhtWFNmaDBuNFdOMFpNQnlCb1Faako0ODhSZWdZc0lyME1BYThw?=
 =?utf-8?B?Kzk1ZmRnTGVjaGluanVtVkF1Q1F0MzdXUURSQnhWVTI3M29DcGVnWE8rb3Bj?=
 =?utf-8?B?VlR5dXFXaUV6ajRZOHl6em44K0pOYzl3YVZGSW52eGNaN0NiVWVPR1Q3VzhH?=
 =?utf-8?B?Q01jMVp4YkdES2NMbEYvMzhXNko4Q2RZMjhQUlRWMlZ2NHVZekI5M1JGWlho?=
 =?utf-8?B?Tmw1aDluWm9YNUs1bXkvNEg5MGptU3dzamZzYkpKV2FHMnNnOU9XUzQ5NGVJ?=
 =?utf-8?B?U3lmVEd4d2RaVjFiNU96WWg2THF4enN5bFRwYjV4aVhUb1NYUmZWNUs2WGRs?=
 =?utf-8?B?M2pIVll2dGhXZnZYN1FVUGx6RjJXODRtbWxUK0tCU0pmSjljSzBHUkpZS0dk?=
 =?utf-8?B?YTNNL1JEZVJ5blFiVFlPR0xXamhabjJ4QlpNNndFMitDNDhGNnArT0JTSCts?=
 =?utf-8?B?T3dtMTFqSmtFcVpGQWlTdm9iY2phZWxnQk5ySktKcTB1K0pNQVBPVFZnN3pU?=
 =?utf-8?B?aU41TGcxM0dOa1IvS3pxVWZBM1NBaEZwd1FjcVUrMFpmYWlicTgrTi82S2tV?=
 =?utf-8?B?bDA0MFFlalVBYjdkWjN4Kys4d3Bvdll2UW9hejFDVHpYaGdzVjAxOGpuS0p4?=
 =?utf-8?B?RDdtRmtqNkFuenoxN2RVR2I3UldPM0RBUVFSNERBaTd5c3RXalZWWHk1Vll0?=
 =?utf-8?B?Y1NYZVpnRjM1U01PV0o1RkNrNkNFOGtLNmY4Nmczd1JhdUhrY2E0Y3ExVWd4?=
 =?utf-8?B?TkFBSHc4Tm11VW8rM2I4dThoeEVWNUJ0SHgwQy9ERUJNSm9hL0x6VmcvK01B?=
 =?utf-8?B?Nm1uUjdoV053RDZGNzVtUnNTVDJuUTl3SlJvdlhDb1NDbUhvTnZQL1hyUlU0?=
 =?utf-8?B?TkVRc3g5c0oyUGR4VTFlUHBZSy9iMjZSazluV2dITzFaOXExYWVBc280SjhE?=
 =?utf-8?B?VmIrS2hCTDdycVdFL3gyald3ZHpJWkpiNk0vaDdlaXgwWCtYMFh6UENJZ3Fl?=
 =?utf-8?B?aVNRUkkzMzQ4TG4xRlc2a21Xd2J2VGo2QWJYa0JMd3czUm5JU0lwaDd1SWNM?=
 =?utf-8?B?Z0ZUWW9pdVQ3MFAvdjRFMTh1bkJwMG01dnRJcHVRdFpxaCt3N1E3aExhNkU5?=
 =?utf-8?B?SnFsM3ErNyszTGd5S1A0Sm9rWEJpK05vbm1qeTNMQko2NEZpaVpPR1hGVTJF?=
 =?utf-8?B?SE55enJJSTZ1c0lud3JpWkZMbVVLdkhzbUhsMHVtd1pQQzl0Y1o3K1F2TnBj?=
 =?utf-8?B?RHVqZC8xMTMwRndINGdDb1BmTjQxNDFOV2Jram5HbnB3RjJ5aVpKajB2VHlV?=
 =?utf-8?Q?F3isKD/gf5Xb+asM5Lni43Cp//ptdJUiKK09k/4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c2965f-dee7-4f37-c5cb-08dd763e6a0a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:40:59.7804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0931

Hi,

I see reset ID in sg2044-reset.h is continous, can we move this file to 
include/dt-bindings/reset ?

Chen

On 2025/4/7 9:06, Inochi Amaoto wrote:
> Sophgo SG2044 SRD3-10 board bases on Sophgo SG2044 SoC.
> This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> 1 microSD slot.
>
> Add initial device tree of this board with uart support.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/Makefile           |    1 +
>   arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
>   arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
>   .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
>   arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
>   5 files changed, 3249 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi

[......]



