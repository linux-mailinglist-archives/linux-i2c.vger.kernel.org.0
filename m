Return-Path: <linux-i2c+bounces-15113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E32D19EEE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 16:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68B04307BE4B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F392D392C37;
	Tue, 13 Jan 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="noLVoJ6D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010060.outbound.protection.outlook.com [52.101.69.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFD8392C33;
	Tue, 13 Jan 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318203; cv=fail; b=MxpNilhjV/2OqDvrTRxpLEUqq8I4AcdJdDln2PslylCVyx3SoLh1nbJjlvaaxCaGF9hokwt1GgjhB3jj8DOra6ff1k4KfnO2LTIXroHs4963ngCwqwQks5W2Ms9C0YrE++5w7ON0voBvISoQf8jb/HHgM0bTkXluxSk+ZbMu0f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318203; c=relaxed/simple;
	bh=tOD47SW8T/SA2+5zIRYdJ8OIDqTDyWTAGA6m2hAomqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m+rbofPunqkXfub0vTd4TgSOr2mNxGEONrzrJxZzT9OuYGMTnqVob9yHXUnZYRUp/a9KY9x+0VCSAr5Z2yyINuZLi6s+a/otOsjZXIDH/2F3mR4zOoHoAYbJUB5zzU72hxl8yXsEbefqmYCmGehB2NCnYrKHvk9gZeUh5jQb5go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=noLVoJ6D; arc=fail smtp.client-ip=52.101.69.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A38m9gne79HincyGvUnJoxSBAmSH91YmTNLWir00SwJmrxrhPCFUMn+iFGImQy5vvUHfw/7uBXR8eS8z/PWPMBdipFpt7NdCL1ccgbi04/V5JeDijfBpAiwxx1tl+C5YGyGfBo8xrc1YQ+AMaxPkVwVpgtn+6Xvn+M/Pzo0MQtRTX9yxeCBYty1p9ZnjfGMuqSRet3Agi7hhUxbzM+hQfFpcQRXIeh4quNWgIauJ5P7vD54aAw308UuhCP0FKQzgsK5Xy9YgssQfSxwKk4jcPRV2sVyU6SbsoCAKmzuxG1CfZ7/kqA9e0F/ZZcCLqOjrKu6HxjUCuETeOoAGxo/Z5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwZSNiswjORV+k1ZF1ipec8s57WW53P2S+VSNW5dl4w=;
 b=rxUX6Q1pVrwjgb+vIVIroYFAM6vb9eYQCxkk5oqiVVBVgm//leAkbeFsp8dXEN0TNHgP79yHMQYTLg7BJjLccPRJB0bB8pfFB0YvLMjn7V3QgZMiNlad85Li6LaJ/j4NRKaU/Z7RMZ1nP/vIyvUpNH106hexJ+MHXGvfvWfY5OGRORE5Qyi3RA/Yhm9eMR1pp6Me0orzywWD63ZHPl/0LTTSAYMa1I9E+YfqF9tdyaZvst350WptOWbRCnuMYA0jZ/e1iSJJsxGb87GAbAMoFRv5UtAdBED1WcmHyprLXGQD9sEDOa/lKejdX2216I/9IRLU0QWHO8Pa2oCepvUVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwZSNiswjORV+k1ZF1ipec8s57WW53P2S+VSNW5dl4w=;
 b=noLVoJ6DLfFqbjohXjvdNf/2PWbv4PiPFb+f1zq8SRXXTTB2WYXhGKWpbEzPPYha3FEcyBq0br6Z6XmZJdVDjGR2XKrzDWWR0wYatz6uqCWIyi9oYsEHDsSKb0aHPEJ18v4kCLVJQTPN6FCFNzc7q7vKns0zceoniM+BHl/Xr8awMiowOIn6L+UqNGRcCNqOLUJ/m/E7zQyUz13lE+/WxVa7eHQuBaIbNDLcSVEVtuHs7oZ9LsfWKD9q8M74AURf6x2CnYGFtEByN0rSUV8N+PayyBAHW/eqlCp+Wr/QHX5lkKXauu90/ZfWhYwGbcbJfhaEUla5pQjEALG0zu8h+g==
Received: from DB9PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::21) by PR3PR10MB3915.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:4b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 15:29:57 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::2f) by DB9PR01CA0016.outlook.office365.com
 (2603:10a6:10:1d8::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 15:30:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 15:29:56 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 13 Jan
 2026 16:31:20 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 13 Jan
 2026 16:29:54 +0100
Message-ID: <5a9615d0-86f7-4930-b65d-d7f9196fb281@foss.st.com>
Date: Tue, 13 Jan 2026 16:29:54 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] i2c: st: Use HZ_PER_GHZ constant instead of plain
 number
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi@smida.it>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "Qianfeng
 Rong" <rongqianfeng@vivo.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>
CC: Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Ard Biesheuvel <ardb@kernel.org>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
 <20260112134900.4142954-7-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260112134900.4142954-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EA:EE_|PR3PR10MB3915:EE_
X-MS-Office365-Filtering-Correlation-Id: ad846134-3179-4c3d-ab09-08de52b89b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG9yT3owNnJZckJOR2xhQlBnd0FLY2Z0MTVEa3M0UVFwRVBSS3dhUW5McFNs?=
 =?utf-8?B?VXh1NWMyY1NpenVJOXdscDdnT3o4VUFQWWdreVZXdm1HeGNxalluUUJ1Zk1j?=
 =?utf-8?B?T05HdjZzQWlpdEVZMEo2QTBEZmIwcHVoN1FYU3NPb3VqbkQya3cycTd6Tk9G?=
 =?utf-8?B?TTc2c3ZJM0RCald3TFp6TkorTTVWNkNCc2VPclhvbHF6OGRjR0djL3NRN2tz?=
 =?utf-8?B?ZURqeXBiUUNzM25MVDB5azZwcGNaSENCRk4xVk11bjNId0FCODNObUt1V0lY?=
 =?utf-8?B?MFZ0L1NQZG9LdWUrTmtSVE9JalhhVmk5bUhSb2hOQzYrRTlpajlBOERDWGpS?=
 =?utf-8?B?ZFNyNUluOVpkdjBJWWdZbURsbjNlakFBRXAxL1dMY21OTUY2ZHlMTUJkRVdL?=
 =?utf-8?B?YlNWaFV1SjZmaG9vS09aTU0xRFZISEw0UW43ZmNlZ0xDNXRscE51Y010R05h?=
 =?utf-8?B?d0xLRkhZcURJVkdPYSs2RFQvdFM1Z3BwT1dsSXgwMzVIWW5WemJEVnc5S29o?=
 =?utf-8?B?eGM1Vm5YeldsWHVObzJSQWJoajZLRXBRWFVBaXdkZDFwQ3RWZitzeTVCclov?=
 =?utf-8?B?bVkwQ3RGZ3ZVREo2eWlhZktuakRsaWtnZHh3c0x1U2FEVGlhczN6WHVTMTlC?=
 =?utf-8?B?TGhYRmtReVlnc2JEM21iek9NdVhwOTNHM0x6ckw2Vi9NR1RNdjFtdlJtSzda?=
 =?utf-8?B?Um50NGtsRFgwRlpJOHJNZjBqcGZ4VC80djRFNVpIUHFLUm40ZUQzRzBVS2x1?=
 =?utf-8?B?VFV2MmhjSWpKQ3BOL0dtMXJFeXhTQUxlcEExV1NmNFp4ak93MzQzVCswTy9D?=
 =?utf-8?B?bVlIMVlIbUg1dElMdkdUcE82SUJxLzNXL1FPSTIvYWNDUHVKUXdLWVdEc0pr?=
 =?utf-8?B?NDJmakJqTXFmbmlPUm4rZ1UwVWxXNVF4SHJmYUxTaGZ4ODgxVkFqZmtubVl0?=
 =?utf-8?B?ejlqZ1dLTWYyRm94eHFiWFlaNS8rbjNXcTNvNUVQZ2FQTWMzaGRpdGdHY0Mr?=
 =?utf-8?B?aDJLM0Y3dWpyRy9wV2tkZzM1N2hPL3Y2YSthWlRNNVhEei9HT1N3Z1VTQlBu?=
 =?utf-8?B?TTBrZ21ySXNNZ2VORTJRNmFPUVYzemhkRVhsM3FSeFZFTUFBQ0ZMR3ZRZFhr?=
 =?utf-8?B?UEViY2Q5RlZwUmJLbEVLNmZqWGg0aEJYcUJ5eENua3RXcUFtcnNpNllxbmZz?=
 =?utf-8?B?UUUyeXM5Wi9ZeFJpTFJJYkVmSzdkTXZaQ3hhRUVHUXMxOUVXc2JKQ3VhS0wz?=
 =?utf-8?B?UHk5S3NhdC9VZDYra0RwekFSL3FteHhnbWNEQ3NmZmRYZmR5a0ZySzlmZGlD?=
 =?utf-8?B?bThHYTZockxxOHpRbFdRZDhXeTI4dC9BRHFwYjE5N2c4TnNGZDJCNkhGMlhG?=
 =?utf-8?B?R3FtT1RWTmQ1L3ZwTE82WllhR09QODc3N3ZRL2NiUUhoVTFmbHl3TlZSMytv?=
 =?utf-8?B?UWozaERCdjB5SHUrWmtWcTUrREJNT0VsVEN0TlVobjhrRUZQc1lrZi9YUGRL?=
 =?utf-8?B?UFgzaFAxZ0Npa1NHQ2dmSFRMZG4xVlJ4L3pRZGVQbEllK2ZLN0lZMkZ5akZD?=
 =?utf-8?B?NzBZZURzV2svSEx6Y1VLYlJPbG9QeVhkdE5TSUs2THE4NzBFd0huM2taeXdZ?=
 =?utf-8?B?SEFnZU8yWGo0YllYZGRrMzRUTXhlSURHMVYxMVZzdERmaFdIKy9Md21JUUVz?=
 =?utf-8?B?YWdmRzZXRmNJcTVydkdVaUdtcHU1WEpOaFlQY2RCaVRQZFlVWFNacjRMaWVQ?=
 =?utf-8?B?OW1MeHdxTUhrNHRwNm1qK2Y0NFNDUTJhZU5qaE9NMkg3RGpZVno0Q2ZkUktD?=
 =?utf-8?B?eUJ3djN0cTZMQVdNK3pqclBnK0Z0QnFlRFVmVy91cDJQWitvZW02T2VsV1Zp?=
 =?utf-8?B?V2U2YXRlaUhmckE2RzY4V1JpRU5pZkpJazlHOUEraUZZS1ZKUGZaRU51MzlZ?=
 =?utf-8?B?WFkrOE8xYVpJNE9XVVdGQTdmOVAvVGppZWpHQ1JSc24zZWtmWHYrNDZSUHNI?=
 =?utf-8?B?c2dJNnNrb3Fhd3ZIeDQwQ3F1RkpiUE41eHVZcCtMKzdReFB3eitya2ttc0Jl?=
 =?utf-8?B?RG94N2ltY2sxQUczTlgxZ25FUzEwci9sSk1IOE1qT2pTZ3YvWUl1ZWJFTXU1?=
 =?utf-8?Q?sGTI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+D1AYEpJ+3bOXVJZNQAcnFX2vNVdFquACKRVknCNUqZoEce3a0Z1UjFPv3rhpKLlMw09khqR/iRd4S6zho6RFcFiVxJjvr8D7+YghW0W6nFw5WEj8sCcSfXW1vEG2MIb4X1i507OWnupCxURr1vyWEXdTrIpzZqfZk3+JV8tNWqNEOM36IHHEa1xKTfYVMPTAUutvsIARvCZ6jjPDT/dqtnujS3jAdW0R1RY4YpvdkiJjUCuq7vx7QMLjifcreXkPgQ2oECsOSKAaETLyUgP8wZzr5AQtv04ND8sJ0QkK2TRFxDWLfihgvDDsqi/r00oUIIYoPw2oGwPkWzhLTFhJe/fTI3MWGuNQB04rjTFI3s8zBWs4YgGHrIbXgY6GBRYcqrgRa47KHbIfDu2SCJ5bc1ZLRSMt3edmM+0uyxxExt/GFtxwm3MpJAMGGxITghFt0zm5RmOg/OU4ff2L2MFYxL1YVpY9vPa6R5u5b58eagWgCGCZtsBBtpK/Q8r9ePTVdNn2HaDXDW8E08fyNjNHwvXz+VRNUfRiRdHnZvR/SE+npBSWNaQ25v88FKXl1t14ESwdtw+69JLf1SRPn08W4/A2Z6GLEY5fFCcke+XJQNkpoy+Cr7HCbZRTJNzFmFGP5rDjm7/sSy0uiw1K/apqmSXrOYfB+0mPjZFJiSHG9i8Ho9yqGfE/sERAlm8S6nd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:29:56.1843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad846134-3179-4c3d-ab09-08de52b89b1c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3915



On 1/12/26 14:46, Andy Shevchenko wrote:
> Use defined constant to avoid the possible mistakes and to provide
> an additional information on the units.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-st.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index 97d70e667227..751ea421caaf 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -20,6 +20,7 @@
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/units.h>
>  
>  /* SSC registers */
>  #define SSC_BRG				0x000
> @@ -285,7 +286,7 @@ static void st_i2c_hw_config(struct st_i2c_dev *i2c_dev)
>  	writel_relaxed(val, i2c_dev->base + SSC_CTL);
>  
>  	rate = clk_get_rate(i2c_dev->clk);
> -	ns_per_clk = 1000000000 / rate;
> +	ns_per_clk = HZ_PER_GHZ / rate;
>  
>  	/* Baudrate */
>  	val = rate / (2 * t->rate);

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

