Return-Path: <linux-i2c+bounces-10198-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7FA7F247
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 03:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65EBA3AB65E
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 01:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B04243953;
	Tue,  8 Apr 2025 01:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="K6VRaQlh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010013.outbound.protection.outlook.com [52.103.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE77227B88;
	Tue,  8 Apr 2025 01:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744076268; cv=fail; b=SmRFoJnRuIA6O3tF8GnrkUx3hsa69RPz4y9jR6tbynT7julrZGidyOa5aRFXVq1UXvSXmgWXGh4KikxZsG7ojhHD3Rwi1GxpyX953AOBvJRAcAjICuSJa6NxmTSrSMof3qp/WPgRO+hWctVOl3daKjCbsk39Yf6f7afVzxJ7FK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744076268; c=relaxed/simple;
	bh=6UcyHaXLn+j+Z5NXMakpZr2FWAqrUD9X/LQJ2Mp3V9E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HGDTD+Cs72k+xwWSMs/FtcdXUDYAZZ5BpALxDwGJmDMcHirunPHllUdEYr/inQsYnTGd2kICQKJQoqB/J6HnAmj1ctED/ejrjQkQknFlwZ4HkNMMJofRTxyDOywVKuFfWj+59WlCF3WhbRuoTH803xtQA1momnbZwDaJPmPv9i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=K6VRaQlh; arc=fail smtp.client-ip=52.103.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaYLfaFz5QZqc7oxOhhs9eGqMU0Xg8jRXtR6ELaUVCCuYRAEliM7z3GSu1PDiGr6HhI9ywLxcTzXOtw8HTINdJ5xPoNcBzkpw8hjdawTV/fpy83zszbzqoyuP55twDozyOMYocEm3cJPbE0nEYJadXug03bizqSHVGAeyv2SFd9IYXqpBZMsDi0X2xtaAXfwPEEZ0X/T0AhKmdFuWPfX+D9IaFOg1SS7DTbsdh4oHSQbazjngE3kwbRzzV/9CTTy8L/Jxn5cnhEQ9aDWzIzj2pFuwkEOPyUpygch5Lfm4MKuUs1zU2Rmy9TiJgRZKQiQWV3MGTbH7rdqWe9Pr4hiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D231PLI0jsT7sP7bcp80FnNybPAiTH51sVgAeOhSEp4=;
 b=NYIzOWUKDNoGGdJR6xsfUpTDyz0n4XeacGbq7Q/p00TvK/EPEc5vEuBuNRttoG9fmZEnLu8FIVYIwYWlDfmXLE0d0jl+1hLjEA5lMCLgk6+QUDAlJLYHeVDrM9lYcR8YwDtdqg7WlXtfOjrMyMLM9JcPBA3zXeBrbgJknMg3T2pXw2GS/x9s5QytWdXxgjkhAcsjqqh8mT+OVia+LK9kZspVZJlUD1tsWApBFtJpaq4sd0+qzIOwQiHkd4et2kRguRkSh9P+0g1hwyzBzVGeaqlqUnvkD2mdEfuF95BB9gJgOQ0EiR3ZbUE7QZ7NcDDcqyfLbxTkzUX3rclCdfe2kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D231PLI0jsT7sP7bcp80FnNybPAiTH51sVgAeOhSEp4=;
 b=K6VRaQlhCI09yBg1mNatgQBVAxU1ZRMoWBfJKbAZGUzDsSgYimuXD/1jRe0nlbryUUI1F+oiE4Pf7OwJnGd52lIuKIN1fzc6BZYaai7Z7m2VmaEDUoCvwdg4TWVTw5WIDVFGeqhliQwtX0GZxIqwqctBkBNyeSjAmhcDvAoFFrxH7DWV9w0qCekHn+YDy5VcoEeVP70HgNiMFMOsc06EEmj1PtSjI682DI2meYaVWHb3OTXukOeHWQeSZqIWSmxRMzVqz9N0C5NjAukJcii0sMIhdM14PyUqoCN3Hq+9MuDLnsM+6GDr8fR7wYMdcLFHDhtgi/OKVHXBGuVAv1SIUQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB0931.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:16a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 01:37:35 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:37:34 +0000
Message-ID:
 <MA0P287MB2262DFED49F9E86E9A3BF5A8FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 09:37:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] dt-bindings: riscv: sophgo: Add SG2044 compatible
 string
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
 <20250407010616.749833-9-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250407010616.749833-9-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <20b037c2-3cd0-4351-b9c1-c35ab9789b24@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB0931:EE_
X-MS-Office365-Filtering-Correlation-Id: 505f03c0-e257-4fb4-5274-08dd763defc8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|15080799006|7092599003|461199028|8060799006|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WG1sZHViRFpuQXpVNWdOdjNKK1BqQ3RHbEZJZTJPUVRmeHhtZS9idDczVHFw?=
 =?utf-8?B?SFVXbWlmc1RyaTcyc21EVGJUeTQ3OGp2WjVFWkVrV3FwNForNE4wazlIZ1dk?=
 =?utf-8?B?TVFHT3V5U1VndnRGdWNGQ3k2V2QwZnB3VjlvSTdYNTd1L2Z3UkNmY2lXQ3dH?=
 =?utf-8?B?MTZRTlBzMGRyNUtya2d6V3pwTkdMSnVnWkIwaE5hbEtYdk5jeXRIZWN6ZnF3?=
 =?utf-8?B?c2Q0dmRNNGFuNlBXa2lMcFJwQ1hNU3dVdy9CMW9hZVA0S2cxZ0htb2xsTWcr?=
 =?utf-8?B?QXREZDhFMlRxU2pLSElJSHdZRTJjd2pENjBZVjM2ZlkxOEZUMkxld0Zzakt2?=
 =?utf-8?B?bThyZkhPWkNQbVlXY29weUt6LzFpSW01MWJMT0NyeG83S1pOOGJUWVFSVy82?=
 =?utf-8?B?M3h5a0NaOVJ3SmZVMzN1V3NGQ3cyYUZ6Z3VpRm1uSCswVHBCZHM4dTkzY05q?=
 =?utf-8?B?TE1WcnJOQzdJK1pWR3VmVkE5Vm1EMHhXZWlnT3VJVTREYlozK3FoRnlTVWlX?=
 =?utf-8?B?OVJ2dFBOdHVRclBYNTd3TFpCMmorR2dXNTlpcEpFdy92MkgyZDhHVGxsMHA3?=
 =?utf-8?B?Z1gzTVJEd0R5aVR6S3h4NnNQMmsreEt3MTFqOG5SL1p2a3NlVHdJRW5iRWNm?=
 =?utf-8?B?M0pXRXpxa2Via3kvbk9KSzZQUHY0TVQ5eGg3aUFiWGx0enhmNjBtdHBmY2J1?=
 =?utf-8?B?THgxZUF4NWFaWWZoQnpQc1VsQU5pOHkwbGZMUVgrMmtBa092cjBGaWlvdGZX?=
 =?utf-8?B?dW90ZnMwdUhRNGxGSXZ6VlRDR3FEL08yT3lXNExTaEFsY1Avb2lNN0J5U2dD?=
 =?utf-8?B?Y0s0T0NuOTh3RzJMUlp2OEJ0WCtNSVV6Q0IzSjhiSllVWEQwYm1hMlh6dTNm?=
 =?utf-8?B?Ryt1ekFjc1VxL3d2d0VORko2YW1CT205bWtUcGhKKytBbEw0QzN1eU53V1JC?=
 =?utf-8?B?TE9NNHFWaTdvSFhqOTJiSmtrRitieWdCY2lnRjFPQ1hhL25TVUVocDBRaFNJ?=
 =?utf-8?B?bWh4eTVXK3ZRTlVsQmpZQkxCQkJYcGRaTENZVFNyMXo3akVNbDMzSGJTY1d1?=
 =?utf-8?B?Z2dDWWxjeEtOUlQ4RmNqOEVDWDRNTTJsWjU5NVQxZVk4SjNwMk9LSzg1eWwz?=
 =?utf-8?B?d011S3lQR0ZseWNteG0zWjJ1bmZFUWw5UzdZRHZoK0FBV0NwSUYyTFVERHQz?=
 =?utf-8?B?MmcySGNGaHlKdlF3bDR3V0dzM0ZXTDRNdVhGRVI4dGVRNkNIYVdYU1JJUzc2?=
 =?utf-8?B?RUY4dE8wNzFiZ2k4UTgydS84WndBSkgvOGJudXR1RXQ3aE1xWE15d3M0N1BF?=
 =?utf-8?B?Zk5rVVNZanRGUUVod0NFKzB2dUE1WUpwdzBiMmJWVHlpcEpSaDhXSGFsdXRS?=
 =?utf-8?B?OVM1OUxWcWR0aElMeWI2OHRvcm1Ec3YvRzI5N2hHTlk2SFlkeEJ0Q2lpTUE1?=
 =?utf-8?B?K1RkeHJVdWNjNzliUHNTblpqV3c3ZnI3cjBEb2lROVk3NjdlZmxJYWs1QzFo?=
 =?utf-8?B?b3BJMWRqMlVKSGcrMUZvV0NtTlRsQm1rVk9GYUcxSE9mekliTHk1NTlPbW8w?=
 =?utf-8?B?WDQ5QT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkZlZEpmL0hQQUNJVDNHaDNLMjhmbzZmNnlrZ1JDeVNsblp0OW1xUllmV0xW?=
 =?utf-8?B?QXFnOHJDakFHbzVkQmpkSnJHTnNDTWtDdlRMVDlHQy9YYnJ1UGEzclg3dnNl?=
 =?utf-8?B?RzRhMmNJMVJ0STBxWjlVUUxTVFAyd00zZzFVejAxcncvN3RvQ0hrdnZkZGVO?=
 =?utf-8?B?TE05V2FWc3ROdTZSMm8yZ0t1TVRnYldpRlgwK0VCZDVlMjQ3aS81QXlMRTJr?=
 =?utf-8?B?MGN2R3Z0TWI5MitDUjRzamRTK1RhK0VnYWh2UENUa3RZTjYzVlZFUUpPRlhl?=
 =?utf-8?B?dk85eCsxMEVSZ1E5M3F1bGdRSmJmVzN5QUQzU0R1OHNSTlA4VytDWDFTZUdS?=
 =?utf-8?B?VVF0Nm8wOUpZYTNNODRlTVZabnQvdWJHbUYzUUpmU3VFTml4ME9nRzlaeUNG?=
 =?utf-8?B?R25teDN6VFh2enVncjhlYWkzRFhwUFhVQVFzQ25RZ1FKcWsvMCt6VURKVmNU?=
 =?utf-8?B?WXpiYy9Ea2VLa2NFZUg3NmJ4cmdGUml4U1lUNm55Mjg2K2Q5YWpTemFWS2Rx?=
 =?utf-8?B?ZWhoeFlFZEx4d3VQbnJFMzY5VGFWeFNKZFlMUTh1czI4dnIrd2FVUWljelQv?=
 =?utf-8?B?Z2c4V2Zkd1ZTZ0h1c293c0ZMSEVoNkNSZUZDMlBkTS9PeGFRQ1JjTFgrR3g3?=
 =?utf-8?B?S0NWNjN3K0VXbVhoNllhVWRDVDJGOElNLzhEM2Q1dHJOUlBlRkkyMTVhRGt5?=
 =?utf-8?B?YTROL00yaFJ0VTdtVDNiTTZMS3E1RWVIQUN4TERXeEFhMDBGOUJWQkF5NjJX?=
 =?utf-8?B?QmE1QUp0eXl1TzRIdEp6NU5kZmFxazVvbHl4R0MxZk11QnNST3JEdUJRVENL?=
 =?utf-8?B?R21odmJxRkZsUnRxOUZIdnY4cmZySGNtWTNlNTZoVUdRK1I4SC9QZFgvWlVj?=
 =?utf-8?B?akZReEU2c0hqczB0NkVlRVhCZStSRVE2aGRHT2Z0QmljTFp5MElkaDlJQUMy?=
 =?utf-8?B?M0JOdVVYYzludVY5L1VBTnpQQUlYRjhKUWlWUW1YelptZHkwalp5dDk0RWQ3?=
 =?utf-8?B?QzgvNkt1UFo2Y0RBZ1FpaXlyYWJDWlVwSFArVEtOM0hpcmx0bEU0NXlNc05D?=
 =?utf-8?B?QUtveEZiYkxrb08zb0k1dFJMa1lkTmZlQnFpWW9YZVdOZ1Voc1EyU2VCUVBy?=
 =?utf-8?B?UWJMZG0zcEZGSnhmeEtVWFkxdTVZZUZYd09rSVFoMmFwV05oaGJrMGR1Qkxj?=
 =?utf-8?B?MWZvTC9KK3llTklna3NTRFMzUmt5d0JCQ0hIWjZrWFU5aTFsR01TaGtzdUkz?=
 =?utf-8?B?dnMvdGpyMmdRUzJnK2cvMFJQTmRCMmZ0K2lubG1YcmRhakQxQVBBS2I2d2RM?=
 =?utf-8?B?RFlkc1c4ZTkvUzFkVCtQNGdIOElOdzhWNFdGUW5TUTlIcHYvQjVpN2NncHBo?=
 =?utf-8?B?dlFJbm5tb01wRG5leituaVdmUzVQQVRUUUtjOXg4WkFpalpSY0tLa0o4TUtp?=
 =?utf-8?B?VEZqUW1vYmhTSkRDQ1ViRTBFamlSNm9nZkVxMWpaaUFDYTc3ekZBOVVQakZi?=
 =?utf-8?B?eEphdW9Jd1JPNkoyMzJPTUFmMDdCMWw1aXlkdDg1MWpvR3dFaW1VdllLcHg4?=
 =?utf-8?B?MGlISCt3cUlhd1k1SHo5Q0VVYjJ6OTZaNFFHTmJMYVpQTklKQ2ZwS1FzbHho?=
 =?utf-8?B?ZldRUDJWQ0Q2d1dBeE8yT2djcmF3MUdIbThmSUJUWG5lOUpES3R1U2V1enBE?=
 =?utf-8?B?YWt3ejVWSmN3c3hnQlpzZ2tGVFlkUDcraXMxNGYwV0hGN3BzQk1hYUxXVW5w?=
 =?utf-8?Q?Z1NeNXo5rH/fq/n97u4HgI8DXoAm+L+6H0gAFch?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505f03c0-e257-4fb4-5274-08dd763defc8
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:37:34.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0931


On 2025/4/7 9:06, Inochi Amaoto wrote:
> Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
> board.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> index a14cb10ff3f0..b4c4d7a7d7ad 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -35,6 +35,10 @@ properties:
>             - enum:
>                 - milkv,pioneer
>             - const: sophgo,sg2042
> +      - items:
> +          - enum:
> +              - sophgo,srd3-10
> +          - const: sophgo,sg2044
>   
>   additionalProperties: true
>   

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>



