Return-Path: <linux-i2c+bounces-10314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5347BA87524
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 02:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D343A9BAB
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7180A151990;
	Mon, 14 Apr 2025 00:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="HW19Op1i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011033.outbound.protection.outlook.com [52.103.67.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DEF23CE;
	Mon, 14 Apr 2025 00:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744592206; cv=fail; b=uz4T5+Ty5Gdk4GD/pkVOy/kjbrvARGRBiMyi+n+9XCCM26aaf5SAV2r6fnthRqb1Y/MdIEcHVjTnZgv9CcP2vxcvkwWkmkdsMMWG4FUmJDUFm7FE/0AEFN3WeBPsum2YXiS21x7s4VopoSHZeRNX6tkQ+3eOXV4KF677MU2uLiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744592206; c=relaxed/simple;
	bh=Z1OSMjZln/ZvJWKSNRngv+8k1+PQU/L37/L3712mKTo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NC8Fnu9DKEE6dtgG+NyAKEsaSbWLippdHyfV7TVwatwo8F8DrEFqFIYRFow8Jfy/g4hJ97pneFAxaz5Un3AR1BKM6+EDx3zLwpg8JlGWjSQVNjVJWk+UHlGC+S6xotoaTLN+t4h94fDOm51rWRmQVRZiIeiZ8pB79Szck3ZLYG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HW19Op1i; arc=fail smtp.client-ip=52.103.67.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNSsHspb9ssVyuHWX5yHSnLoNbXnsGpiovD8ZXpFCoc77tSnglL5KdNZAlzfe8uJrU6ZDy26tTZtsdmTi+5QggRJv93C4bOBsY76BF+0TUyjNboiPnAzXpwGHF6Go5t5I6Bs90ndSMFCokqIl30gtJ7qNe1tb0VPzuvHFdIkepVLdO4xyZm0O626U1/Ok11OmlsYUngkc+UQg/LbIUE/1y15StjPB/jpmvDjZkgOA+q2fyyNfvfc+5IKNw+1zIS79/QAk7mpe25+HuDWRl6jGwwQeXSpTiKJE0TJXDP7GJL/Vt4Dpov5qI3G8SbKnO1RFlbjc0FYeubgH3QBbSvyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWbC/Tdshs5Bv0VWx760nYQkpZEb40p5HDtGlLNhRNU=;
 b=LUxCQNNzcj6Q1RMYWEemvVmflNGsTJ89hm5bC9nDcaKFWiUyKueqptY3lQUSc3M4uTgsErY8aZg+K/fv8nwWarjCGbiWN8ChfbMVjPMOl7dbDKwpEoiXKciS5sY7rX0T1EQoxfV81kBXTQVtDRJxcvqFTvt2ii977PlihTljiToTgZNKyzG4mIuudvMi4P9mE68FfjvqAT3g55cDSvi3N0h2OBOKmWtJdXWfp46QKnt2biV58ImgdLcw46Ww0VQRIyqJLMrxiMzDpdE+l8K5s1LTFSIHbZ4aUUBFX0yms/LxhOn+3dLRoZeO5aYeKYtULEWG/GNVlh0e5z5vAkoa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWbC/Tdshs5Bv0VWx760nYQkpZEb40p5HDtGlLNhRNU=;
 b=HW19Op1iMkhtlivxeUgfthS8hwCOu/fxRFBauDG8ByNXKqS/TK2bq11PFuDpLRs5vqfInJkaWRpHrUgfEEy6Gdt0Kjf8XtUtu54d32neIAGkNlcrjcc6OY1sopTrh4HInLPjFCt7sZBKGdcArZHLG66pWJyHroQe8X2IAWutTge24hoG5rFq7Y8Z2vZOdHEvcNnVNtYfYBlehW1z3H9l8WEMFr/cT0LWiDDm8lOZURblid92S7pUVQXmuWhXZSY7byqSD1iJPHhqdESIprWt6mbDGUjshMbeCYoP7YN4ImfVeLLV8BgG/fli5dSo2KC0ylOpCndh9PadsQ4Uu0VBYA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0019.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:5c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 00:56:33 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 00:56:33 +0000
Message-ID:
 <MA0P287MB2262A9CF72D959EC84049740FEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 14 Apr 2025 08:56:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
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
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-8-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250413223507.46480-8-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0118.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::22) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <671b1e36-cf7d-4334-b486-f7cc41b9c87e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0019:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b54e35-8597-42cc-eb37-08dd7aef3347
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|6090799003|8060799006|19110799003|7092599003|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NS9LV3lrM1k2UWNQMXVBN0Nhc0JPZUdjbjBBdE9wYzR1WDJtOVYrdjhTdTlK?=
 =?utf-8?B?RFZ5djQrUUZoWVNPd29CTkc3WVBBU0lLVkJPMlM5R21mcnBTU2NqalQ5dDhN?=
 =?utf-8?B?a3RHR1BKcVp6N2lkRUs5NEVYNFRHQVJIbWFtZGp4Ri9nOHQ5cVNOR08zS0xi?=
 =?utf-8?B?WkdHRy9jZ3FXS0lma04yYXVHU2ltRGgydDdIeXdYc2dGZVE1YWhpRXNUWUx6?=
 =?utf-8?B?MHJpYmxpNTVSRGVIUFdSZjRlVU4zazRVMHFiYXAvRFh1VDZvRHlNNk1qUU4x?=
 =?utf-8?B?VTdLSnU4M0lSZHE3c1lXb0h6MTVkRFJVWHhZZm9sSE82dVFYOEM3VWp6a3Fv?=
 =?utf-8?B?ZStiK0tubUZONmd0NGh0SEw4QS9ONURoRTRWdGJHTzk5a3JadlFQUy9PcEkv?=
 =?utf-8?B?Z1FYck9aYThaQUltdkNuZGlRdmU0T3ZJZksvaEdCMmxEaHp6RDJTSjQxQVFW?=
 =?utf-8?B?VitFQk1jV2pSOEZKNGFmd0U2VnhLb0xmcGV4SkNQSWMvVlVCRWNSaUhvNHRI?=
 =?utf-8?B?Qmwzbjc4Q2MveDhmR21zY05QZHVOVjhWOXFmcVlsS3IranY5T1EyL09mWm5K?=
 =?utf-8?B?aGNiME1FZm1ReldlK0FucTBVU2xHRW9xWXY2Z1pJRDBJbmp4dUhORE5Kcm5t?=
 =?utf-8?B?MmM5K2g4RnVlN1ZJbGJwVG1ramFTNjBUY1UwVTFsSmV5MjFVUTNZZVJISUht?=
 =?utf-8?B?SkRyaGRKOVVvaE1RL3dGWkFPdVphemRIOU1ZVDI1blRuc1ZuZ1VaMHdGMlpz?=
 =?utf-8?B?eGtlOFdJWThGTjIyYW11YURxdnhaTlJyMU55R2hmQzArYXVQZzZ0K3ZROFlt?=
 =?utf-8?B?RVNlMTlNb1dhMmdUdHd6S1BRVlgvVnlwOXp6RkdiV1duNnFLakNITFd0d2Qw?=
 =?utf-8?B?Ny9Kei9nOHB3dTBFM0YxSGI0STJuWFRIRFBZa2hzZ29BYURqZHlpWU5vcUI3?=
 =?utf-8?B?QVVva2k4V1BXMlRoL3NNVTZCU2t2V0hIeFdOMG5KSnBBMWVtS0IwMEN3RGhN?=
 =?utf-8?B?c01ia0loRWF4L29DSWhUcWJFNHB1NWt0UW1aTnpzWDIxRkZlS09XNkQ4VFlZ?=
 =?utf-8?B?WXZMcmVGelYzTUFSSGdUOURNRGhmOW1CbldWQmtteVJDZnFyWXhiTWNzTkQ0?=
 =?utf-8?B?K3VhZkJsLzlJSmhQbzdvSHZsNmt0MSt5V3VJNkpncSthRXd5VUhxbS92YXVu?=
 =?utf-8?B?VlE3WEd2SVhJemNMV2p3aWpzTWc4aWQzc3dWSG1lM0FBMUpmUUhHaDN6b0hk?=
 =?utf-8?B?Yk5HT2xicGNHS0RjVnNWdFJ2Vm14VnVzTEkwZEtZYWFZRWxseWpnWFRvNzJ5?=
 =?utf-8?B?dU00UVU4dVRFM3A4YWxTbGJpMVFvZnRweUJOM2V6dWtIZzdFUkM3ZXRaR1J1?=
 =?utf-8?B?SG9pSDRDOE14bTNaeWZpRzg2em92cUdMRTBJeEdDM3dNUnV0UnVwbm9pamk3?=
 =?utf-8?B?VHFXbTJCOWdNUW52NTdySzFtR25HMkxWQXU4Q1ExYXJJR0lNb1dPdEthOVdu?=
 =?utf-8?Q?vy1feUs3+aMInu6XcwbAA5S+fu2?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3JuVXNPRDJlT3hWczFMWUZtOGswUWFNUE1YblQ5VjU0Qk5CNkgzbG96ZlBl?=
 =?utf-8?B?NXJuMmIwdHpZSy9BQmVJQzFwY2hBNzBrQnBvSm54MEpsd3NTTExOUXB2Q1lp?=
 =?utf-8?B?d2FpcUNOd0lrbmlraXpBRXFTcnNseHluSHFFKzNNRzVjWmVYSzRROHRpd3Rq?=
 =?utf-8?B?Y0lmeUZLWSt3MGtpZThqRUNDN014Q1dnY1ZEVWd0V1UwWnBDb0VVdGNHRVpP?=
 =?utf-8?B?Z2V5RTZUSEh2YTF1SkNGbkFXMUFSTWVaenV3MGN0UUIyYis0a1VYVS9oand4?=
 =?utf-8?B?Wnd5ZWtvaVorTVMvd0NrTXlKc3UzaUVvbHZaaVUvOUhpU3hGdVpCanQzajBH?=
 =?utf-8?B?SHVGeGN3OGVPT0QwWEhlL0FSUWlsaDF4WWFMVnhGbElZeVJ0OEplZjhGNTlE?=
 =?utf-8?B?Y2pzNTBIVnNxQUZTc0Erd1JRdk9sV3NTT2xkNjY2NWQ2OWtCWnFaWXBiNXgw?=
 =?utf-8?B?V2EwN3pKQnl0Ykl4OTc5KzZTM3lLYittSStNUmJLdjJyZ2VBTzIydXhBdGdS?=
 =?utf-8?B?eW5BcWs1L0QyNUJMdFFvalVaakVVRnZ1cTJ5Y3RpNWxtZjVhSXRoZUorMmE0?=
 =?utf-8?B?RXplTHRqZWdrY3BuSTU5QU82WU4rNmF6MWdNWEc4aS8rSjVNYjExd29NdDVy?=
 =?utf-8?B?c05FRzNUdGo3MHBReU9RVFB4ZlV0eVVnK3ZZNlkxMFl2WnJmb2tzWnVTMFFH?=
 =?utf-8?B?WG5KcGlnVTRXVVRWVG9IM1YzVWpsRmlMS2JObEJDMEs3WGNneThZZEF1NEQ0?=
 =?utf-8?B?RStoWVdTTzEyQ2U3WGkzT2MwWjFwM3h0Q0xZSWl6enZ0THVQeWFVcXJLRDg1?=
 =?utf-8?B?NFh6NGhkN1dmbnpJSGZWcHNwcDFSTFFJYUhKVmdzeExEcHNzTmppRTFCcUZV?=
 =?utf-8?B?ZSs0L3pPV0FGSlU2ZStBbFZ5VEJQQldRNmtzeERWamRFL2hLa2lGby8rVlJ0?=
 =?utf-8?B?MS84L25tYytRZUxqSE5zN2wxMlVRNEtHT3VJbGVPZEN1dmJZbmpXc3FQbVJh?=
 =?utf-8?B?UDJaZm9vN2FRbnBCeExuN3pQdzVEMEhpRmlrVGd4MVNLMjdjUVgxbDlDNWZ4?=
 =?utf-8?B?c1ZOOWR5V3k1aTVBR0VYMFBFaG8veHFPS1c3Nlp0R3p4TldTS3EwSEVTWGNX?=
 =?utf-8?B?QThLaWZ6ckFkNmpObWRreXdBVDN6NTc3U2g4VkdmVVF3ZkZKT1pna2VXUEwv?=
 =?utf-8?B?emJjM1JVSEpkcFdENUVGN0hyMnJXbWo1MmZPK1FjMmJuMDVjVkdIN3h1QmZ6?=
 =?utf-8?B?OU5KZytqT3hiVEdCM2RwZVFUV3ZmbnRmMjgvUlJRRVYzc0txUUdMZi9vd2pw?=
 =?utf-8?B?OWxPRFNwUGJVeG1jVnBSVEdJWGNKem5DbCt4S0VORjhra0tMdmtwUWcwQTNs?=
 =?utf-8?B?WVVnYzM4aU91bUUwVitCT2NWSkpINmd0YnM1V0M0aXkrTE1Zb1hZNGNYdmkz?=
 =?utf-8?B?dXdkQ0NMTG9aUnJnSzV2dm1DUE1vcDdPT0lCeEN2ZzRmUy9wcWJBazhoNkJn?=
 =?utf-8?B?UXRTWW1peVIrdExibUlySS8vOXZsd3EvdjUxL3Qyc3JzRE1uYVlMLzdJelQr?=
 =?utf-8?B?MjhYSGdsdFAwd3lxN2xhWW1sZUhtY2dCM0VnUWN5OUhseWI5T1MxL0JXUXRx?=
 =?utf-8?B?VkFZYnUrQlBxVlowTUJKbG9OZ2xKdDU2QU1RaDJjRDFnQitmbDRzM1JtN1k1?=
 =?utf-8?B?K0s5WGZZaE9Bb2xJcWh5KzRPeG1zVnpQemZOVk9Pb2tHVk5DYTZWMlA0SUgz?=
 =?utf-8?Q?/Kek3eVwqBJPIFeQ/L4jj1/HQYip1A/T/KLuf9F?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b54e35-8597-42cc-eb37-08dd7aef3347
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 00:56:33.5064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0019


On 2025/4/14 6:35, Inochi Amaoto wrote:
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
>
> Add compatible string for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index e6e604072d3c..5fb347167004 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,9 @@ properties:
>                 - rockchip,rk3562-dwcmshc
>                 - rockchip,rk3576-dwcmshc
>             - const: rockchip,rk3588-dwcmshc
> +      - items:
> +          - const: sophgo,sg2044-dwcmshc
> +          - const: sophgo,sg2042-dwcmshc
>         - enum:
>             - rockchip,rk3568-dwcmshc
>             - rockchip,rk3588-dwcmshc

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Chen



