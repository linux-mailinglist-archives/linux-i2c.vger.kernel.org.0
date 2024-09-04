Return-Path: <linux-i2c+bounces-6120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14896B4E2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16A9FB22ADC
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121E1CF7AC;
	Wed,  4 Sep 2024 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="DcrnkS7V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE241CF5D6;
	Wed,  4 Sep 2024 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438944; cv=fail; b=qcNG4OViIZYnjFBCpbYP3m3Xdmfdm+uYyzYjIvp+O++7g+aftfJhtPmZWJjoiugJPiefk/mO92s0EarW6DqmmYzA3xMR69uo7uy+q1v47h8wJq1XSl8Oi/jFxqtsYYk6v8tAS0mmRnODb1p2xbGXdDVlVpTxn6PwUZW12CJxAH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438944; c=relaxed/simple;
	bh=ieFAqBIrZwcZYc2bF8qkggz2WmVmaiyvWPe5+RDvIbM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h+ddyOA3A6uImxpsoJi/A9+U3sQkLgstj42op9co+k9fbja00J2OFcFKlu45Twfk3D+7F/xBGpbTsQVS6TMsxdbVilS/P4LYURHJEi6qxynNn9MrChucmS2scQD9zSsahxQ/oG9IBXnk4uT+FuxtdLPj1m9pR1+zISXHwA9YezI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=DcrnkS7V; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POH98gKtyI83K0RQBGCZI2kkBGbcJDb/pQQ/gnCJW9/yCoXgzBapyoWbLYWx4wH0RK0bM+MaA+hc5VFzaUIw2X0tCfBL7e7ScmzHjFqIGe0tb1RRgO7L1sB8TwsSG+lAdUp4odbBsCmq1CTOAJ4WWFZrDrCYcvbq156Oo2V2XGOqFMZd6kVMWSSmPNdxjSg363HCJXXEsBdLjbjDVAavZYvCZEBo2qp8tW9oWTpO8yrDY5yrBSROGb5kcfsYsdUCbGRsZxwXKP3UJhzZzLEHr1vBMbbyTWzwWawtJZEzd6/e0JYMLV4kWEDeVG5FIz7FSTIDFFuOrFslulrPkFzIlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QNkXGXj9tOd8uIhAHr199jXTNhbUKAr796LTa/XfMc=;
 b=HLc6qCd9qzDwJpPJgQMwP4Lm92gSpeMD/zTtyZ2bQxg2mw6Y2dVP+XEuxh1fYco1SlR5wZ940a71pl+FiST3/4zk71GcLjp1OSov8TcnBxxlfdkrq5sRRr6SL/tRzf1Q6h4vw+hJMmDrClZwDIEvAxY4w4LD5qrvJ5IueS1jkat6fI0iZuPskXjABA43E0M5c80tzW/Z0D1i0X3iY1cfL9MIu8KRahG+mwCM2HqzJzqQliDALqLF/MlszOtb+bsctJNOGVVegCXGVr4SStr6Enh7wCl6QxcntGC862C/B/UObu+F1uNkqpsTaFklsvoxvRMrv2fC9ieEXVewPuBumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QNkXGXj9tOd8uIhAHr199jXTNhbUKAr796LTa/XfMc=;
 b=DcrnkS7V6SC7u73T4J/KGm1SZxaM6dmmwg3MzCK9IM5HRnj3xyFQlEfUGCaqjlaMmDyvcb5FRPHaf7NTMElD19ZeZwPsHZtnmnF5d6GSFXSxEp46CJ3SajRfbSA/dabReTRX6DQetGwuszUY923Aw74WSfZMaJ56cbrTTiJ/xWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by VI1PR04MB7005.eurprd04.prod.outlook.com (2603:10a6:803:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 08:35:36 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%6]) with mapi id 15.20.7918.020; Wed, 4 Sep 2024
 08:35:36 +0000
Message-ID: <45c51083-ee63-45e7-b8d4-3822213530f4@cherry.de>
Date: Wed, 4 Sep 2024 10:35:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz
 <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
 <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>
 <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::12) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|VI1PR04MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 691af26c-7b94-46e6-8744-08dcccbc8c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1hFNGIvQnA3bjIxcmNjaEZlSTVnRUFFLzV3ZTRIdjY4SDYrcHV2a0hHSktK?=
 =?utf-8?B?YzVFOXVHenNOR0tmaEQ4Yldsc2xRbUxRTnl4aFJMZXRmYzJFMDZFK005VnFZ?=
 =?utf-8?B?UFhXY1MyYlYxbmtpRG1wQ0s5b052V05zYjU0Z01uYkVnTG9TTVVldStNYXRp?=
 =?utf-8?B?akpoZFp0ZUk5SkNvTngwZFJPNldqL21xTkNZcFFIRlVZa2xud25Sa0RQVTlB?=
 =?utf-8?B?ZTlwcjNVRlpRZkkwVnI3K3UwaFB1NDdFd1FJSEVMOWg5QmdneWVvVm5VNlZJ?=
 =?utf-8?B?UmRTWHI1TE9iS1JqZjljeitPL1BFc1Qwalk0Y1B1cW5mdVdQZlByVHpBWk96?=
 =?utf-8?B?NkZiTlVZZDBzL1JMM2tDdkgzWUF3WnN6OGNyLzF3Ui9FYjNpdldNTkUrM2Y1?=
 =?utf-8?B?TWZweVJkNlpDaVNRZW9ic2pWclVaVmZORUZlYlY2eVpwcjJrbnkzRnhSd2c5?=
 =?utf-8?B?bWo1cGJwN0hUUmZ1YUQ1cmFuMytlaVQ5OHhDZkpLL08wWGttOHU2d3FmelJh?=
 =?utf-8?B?V0dUd3BJWDNjQmk5THppcWlPcnFWamxkTHZrY0tGOEpqeUFUUVE0VDRWMmlW?=
 =?utf-8?B?dHFKc1RjeFBGdlRQeGFTWnJOa3NDcEEyNzA3TkZsZHRDYytMck1Ld2FsdkJM?=
 =?utf-8?B?SE1DK21PVjVmbEViK0RqV3RSM0lidEVtczRkMW5vVno4MGR1a2ZzaW5xRDJa?=
 =?utf-8?B?SUsvSWtla0I2MnNrS213aTYyZHJGbkJlSUQ2REl1cFczbjNYT2pxR1N1cElN?=
 =?utf-8?B?LzRnbGxCMFM2bVh4RjhGSDIzWVdiVFlzdUtqclBIQU5jZGdNa0FCeFNua3Av?=
 =?utf-8?B?Ui9DeU9haFhDcUdQQkQrWW9TcWRsRUEvY1dER0F1M0FodEVJcnU5QVpGckh3?=
 =?utf-8?B?YUFFbTR3UWVKaFMwRXFzY3dUSVJzdGQrNkNuYTdZc1YyaUhhS0IzL056YWs3?=
 =?utf-8?B?MlZvRXZwUksyQzBDTlg2c21pM0djb2pIN3pSQTQ4S2dhQUFEZnRJbTc3aVlR?=
 =?utf-8?B?TFhTZzYwMWJFOTFiZktsUG9NTjhLb25ZaGdzZzl0TEpJS2V6QlpLeUkvM01E?=
 =?utf-8?B?OU8zYUhRSGZjeURUU2pBQjAyeUE3TlByUzIxTmd0SW50V1BxcWh4KzAyajYz?=
 =?utf-8?B?cFJIVGJQelFRRGcvZDRvWWdwdzdjYVgrT3M4ZGFrWmdQa0tHNUI1V3JZd2Nh?=
 =?utf-8?B?dStIeG1VSjRFZGRUTVU3TURXZHlMbGFjdGprMHllMmQrZFRvendubVB4Nngz?=
 =?utf-8?B?ZGlJTHFuZjRxWjY5VDFYRldPKzA2amlKaFVEM0pUUktOYkNEMEZVeGNlSU9K?=
 =?utf-8?B?RFQ3RFlnOVlFdHBtcUk0allyOFJHT1JXWWxPQjJFOUZSVTlXQWpZNXpmZnFM?=
 =?utf-8?B?Tnp6cHV3d3pWb0NvZ1JzVHBIc2JtSGhiZWhqUk9TdXdKQU83WW9VaWN3T2hY?=
 =?utf-8?B?ZUpJR3ZHaEE4SFB3MXlQVmh5OW45dkxNL3JIK2pPMjltdnVZZXlMTWd5WWZo?=
 =?utf-8?B?V0FpWUl4V2VmSGxZVU55Y2t0ek9ZR3plVmNrMXJzV3dPTXVEWWhyY05JNEpu?=
 =?utf-8?B?V2QwWkVFTHByM3BCUnFjUElrZGJrVUlzdzZsbWg5SEJ3WVh3ekZKTTl0YUtl?=
 =?utf-8?B?cmQ4SGJqYWNBayt3ZEYvdFUreHVIWWIrUzB1M203TzE3b0VCN1hOWVcwVGJT?=
 =?utf-8?B?QiswZCtiVmh1eWl1MFpUSDhLOXVzNkNiQTN2OWZ2dSt1RW1lVCt6TzFhUUox?=
 =?utf-8?B?cHJmeERpZm9aOUNaQ0xadnpWM1VtOFp3T2xBeGp1RmwyNmhtZXdURTdFRWdx?=
 =?utf-8?B?Q0o0dHNQb2N0SWFlcTBVUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MndvTXFtakl6RkcxZjN6RlRNeDVDVUV6RHBhQlpBcFFNZXdIU1JkNEtieGdX?=
 =?utf-8?B?akEyTU1KeGJRaTBTTnUvVkJIWUNneWk2RERXM0JwK3BwTmJLd2JXR0VwU01T?=
 =?utf-8?B?RTB6L3dWMVY1ck10MlBobmdPSkhvSWZ2dW9VRGV2UVRVSkFHR0gxTmxTQWh2?=
 =?utf-8?B?SUYzcFgrZDVIZFlWdzRZT0pqdU5ZRDJoN2tpQXY2OGM3UWs1VTNMNFIzaDNr?=
 =?utf-8?B?ZDNTbUkxRG9mV0U3c0dCSkxvWWpSNDJzR2Q2RDdwRWF6dGFSM2pNazVOcHRQ?=
 =?utf-8?B?RXFFMVl6bFAyaFFsaytlaG9ZeWJ0bjF2Q3pqSDd1ZDF2c01GMnNOSkU1T2xE?=
 =?utf-8?B?WFpPTWhibmdLNk9tSCsxWUNEV0lBZEEwN1NaV2lqR01PMDJOOGl5RWhGeWFH?=
 =?utf-8?B?L2xPNXlnb24wMm9NamRsdzh4SmRVOXZ1cDM0L1hKVFVSZDZNUlJuQnYzcXpl?=
 =?utf-8?B?dFhBUFVHak5mQnd5OXlyMFhCZms3MVE2NjBOUVViSStaR0RrSGxUaEErc2hl?=
 =?utf-8?B?anVGVDZUZFdBbkpCNUxBWitEUnJLZ3YwZHhTNzUvYXR4dXF3S0FleW8wMUkx?=
 =?utf-8?B?UGdzL0hCRFVPWW1nSHZMZ25jeEhRMnpmZVRnZ1ZGeGxPN0F6U1VVQ2dBUUZV?=
 =?utf-8?B?MEg1Ukx5cnJMQW9jMWQzK1BMVWhWRUtkNGkwNUlyT3djZlVjMko4blJ5SFR1?=
 =?utf-8?B?eW82aGdha2hhWEZEaWU1UVF3alZmd0FmYitwc3NkRVVIR2dEa0l2NmhjQ3NU?=
 =?utf-8?B?MStvU0NUQnd6YnJ5dndKdUVoZUNKQXVWN2J1NmRkVDNHYVhyam1yRUVWd25N?=
 =?utf-8?B?Ym41cmNkdzNROWhqTFJDbnc1WDRZR3hZdzJSdFB1V3ljOS80clYwSHZIUGhN?=
 =?utf-8?B?OWFUNXRRWXllMXpwMEFaemFzWjVFTWR2bTVsYlhmOFUzMUtYdGNFb0hSMXhN?=
 =?utf-8?B?NGIwejRsa3VaaklhbXo0SEViQkZBOE5zcUI2SHlrVHpTU0VzRmdlNjVvdHh2?=
 =?utf-8?B?eTV2SkRVMnRjaVFpK2lHY3V3QTBPeEIvYkhHWEpYVmFOTTU4UEIvSVNhL3lm?=
 =?utf-8?B?eW9PM0ZJdGl4d1VCSm9QTklQa0c0blduc0JIdXNSSWhqbWYzZjRENE9Uc00v?=
 =?utf-8?B?QUdJc2twYmdrUFNxcU1KYlZtTGlWR2E2Qlc3RkJjTENIY2YxUnR1MW8xSTFk?=
 =?utf-8?B?NGlsNjVadWxuOXVVZkFOaUlDcElMTE81QVF6S3RwYnF4Y25mYjlXNG4remN4?=
 =?utf-8?B?U1dIamhHTGFMR3BvbXVKQ09tSmVENSs2R3hsQU85dUlrZU5ja0xCRVRKV2o2?=
 =?utf-8?B?YkVDWjBVRFQ3V010SzZlc0JWSjlpS29ROW4zbVIrT1BWb1d6WHRzLzNoTU9Q?=
 =?utf-8?B?elFtUnhoN1lQTEZXRVRtMjcrNkRKR3RPb2ZLT3hxd3VncitpZTJ4MlZNc29v?=
 =?utf-8?B?SjVabVFidUNGVHpweVp2K0lXdkJrYTBWeFRFNmU5ZjBFaFd1dTJkWk5JdXJZ?=
 =?utf-8?B?ZXhsREluMU5lYmRWcEpwSXRtQTNDa1JUcEsxc213N2JBYU56elZBcFEyNWh3?=
 =?utf-8?B?M1BxcDRNZFhvL0xLMDREWjVRS1FZZFl1Y2pvRWpRRk5jZEUrcmc1VnlMalNl?=
 =?utf-8?B?a0RaZkpXcGhmY2dpWGZIUVEwb3JCTDFJZGhrWkRDeEd2VytoQW82R0RjclZE?=
 =?utf-8?B?cmZVeW1ocVJ4c1VuNUY4ZGFZTHgvTTdmeURPbmJZNnNLdEhqd2hPdjNoMGJa?=
 =?utf-8?B?UDhlVStYNUR2UTFjV0l1bnVCU1hNQmpKYytWSHo1a2QvZG4vVVVYL1JyVWdv?=
 =?utf-8?B?Zk9TbWk0N01kMHorZWJnN3JEcU5uWnhSbll1UFBka2xYKzlwd3U3NFU4SjhE?=
 =?utf-8?B?a3BEYmxSNW9lNDF5SmZ1aSswNzFYaTUzNkdPajhzaUpZY3U2QzFxZ0N2bmdi?=
 =?utf-8?B?MndGT2FIaDZEVThYN3pDZlFrbDFLRHhucjAzWFhML29DdjJGMkpVR2Z2MnJO?=
 =?utf-8?B?Vld4RW5JTzRFKzdyVExnVFJ2bTE2OThhQXdtallEdzlmMnh2bVVGYjlUdXNK?=
 =?utf-8?B?cW12NUtuMG4xYkkyS3AzV0Z2eVp2RzV5eTdJRzk0R2ZJcjNlZ0ZmQmxwdXly?=
 =?utf-8?B?Z2Vza0tsVHFsY2wvYWYwcWtUMFRrYWVGT3N5bHFBQTIzT1pwQ3p0dzVobm1Q?=
 =?utf-8?B?ZHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 691af26c-7b94-46e6-8744-08dcccbc8c6a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:35:36.2877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNM6gyk+p5EepyvD5N+HpeevED694bzlFJM0/Czyi3pAaTLTCZzr2lR9wbvkTvmPmvpAVKK8BZ3eS2MCCPtootvR/IiSh1C2lDWALPXMGhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7005

Hi Andi,

On 03.09.24 17:13, Andi Shyti wrote:

[...]

>> +	/* Create device adapters */
>> +	for_each_child_of_node(mux_dev->of_node, dev) {
>> +		u32 reg;
>> +
>> +		ret = of_property_read_u32(dev, "reg", &reg);
>> +		if (ret)
>> +			return dev_err_probe(mux_dev, ret,
>> +					     "No reg property found for %s\n",
>> +					     of_node_full_name(dev));
>> +
>> +		if (old_fw && reg != 0) {
>> +			dev_warn(mux_dev,
>> +				 "Mux is not supported, please update Mule FW\n");
>> +			continue;
>> +		}
>> +
>> +		ret = mux_select(muxc, reg);
>> +		if (ret) {
>> +			dev_warn(mux_dev,
>> +				 "Device %d not supported, please update Mule FW\n", reg);
>> +			continue;
>> +		}
>> +
>> +		ret = i2c_mux_add_adapter(muxc, 0, reg);
>> +		if (ret)
>> +			return ret;
> do we need to delete the adapters we added in previous cycles?
>

We calldevm_action_or_reset() before the loop to add adapter-removal to 
the error path. I think that does the job

for us or am I missing something ?


Thanks,

Farouk


