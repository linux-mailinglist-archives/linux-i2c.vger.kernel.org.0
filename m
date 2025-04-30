Return-Path: <linux-i2c+bounces-10683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF130AA3FDF
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 02:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09648170FC8
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 00:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B3B2DC793;
	Wed, 30 Apr 2025 00:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BqA0nqLo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D04BA41;
	Wed, 30 Apr 2025 00:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974464; cv=fail; b=IiQMk0VowM0xibR0cxsizrfTzckAW/0gWjfz6rnunJ4EkWSmMH/1kk78KEnyH1n1TJt67WSVCfhnoLv/5HFSruFceFcxamHynMjW1NWVBfIJbkKspQ/Wyj35kOtX6Q8QJJRaRCsZj3AMEUVfp2OYMq2MRBUNOBkk8Xhsm1tDnxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974464; c=relaxed/simple;
	bh=Ha4c1U6/ccNfX1TjDh53QhEel8S6BcFt0ot6x+QmRmY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A9Pd6PgLHN5XxJ4cAp7uOLLHjRzHIyPhR0SYsPW4hg17Mt5ChxJIrWYsx1Au/wC4fNhr6iA4EX5W62x50AME1TKvki4d2ujTo6gFEPtqJq/DPhX+YD0FVtmbew/AP6VTfdC8iQ2+e3cGBbjsKSArMXNp9x+1JGlRSuHzRu8gMK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BqA0nqLo; arc=fail smtp.client-ip=52.103.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmV57xM4hj1BLFnMH4cgXBdpRltT1szlU27fkSOoMp1xGUcflg3d7QfVo1MUiTBcEUkbm/nF23/Ao/Rd/4ZI35K1XRbOYLBeAzpVcdYUOzA0vf810Pkp4Smwa//s5eeY7aJGJ+HcOJ5C9ddkjW8JTXtc8jhuYmOvTH8UUNmgkCzVu7Nb1fyW+FYC0UNWm1nRHAnq+rv2y55PUlZhGEwpNUFULSbn5BiveZYcv5tkgzwJT6KbVNOQV79VQAJ4SoWJj+gr9WO73A6CGwv955kW2Fnz9ZVitlh6n3Qk+HCwxSXP77kEJKIxu8uJxrvEI7w1A4hD1V07AtWzHPhLTc2Y/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxFsueXrYYnS2/Gy79XJh2Iklae5RFRzbmXIiY5dR18=;
 b=PWpTA1i77umihjSaHepWzNLxzWeZZqeBT5Y2HAReveWtc3xQBEduMK5evTeVffYJcl5rFoeBaIstPdRGYq53vD4GZritf+MO/kZTX7a+aTyCsQYOMpUlld/U/UE6dpn0qoRU92yWC/lm+U4lmg15V0Ktoix3jTe2kRRCgfJJ5EquqZmRa240V6Pr6jKxQWGx963IBEL33gZGyOJzPSwA3KLNSeqgYWJxbvyEgpvNP2q/r5ZZCRJLvZCkkP1G7wvrKFewPM7vu6cmfw6RrhcKx9QsWbCte1rTx/St0a40FOhz7vR6aZNEj+byoeHV7gIJaAq6aiDfbpeultgaeJbxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxFsueXrYYnS2/Gy79XJh2Iklae5RFRzbmXIiY5dR18=;
 b=BqA0nqLoXTfx8bJ5Ahc465aOpv0UGXpXb18Rz2Sia5/r8CSrmZsFoD7m+XQihoAs2IFWppS+JoXPwdWfN/aOQu7b/FMryG9JHY0ToT/PWmma1Sibdp1K746Ft+h44LTRUQym81velCrgWXbggIhox15jruyIxA6kRfsODey57AW3Fio2viSrzAvYdlbOGRqVWb+Ux5QqwCGOp0ndQylE+NPQS+jHiajUCnIbwnOph2kBKthGMcOleSWbq0gmQpgaMltKJKFaI/9prl0UMmUR8+C+MHSPXT3MmwJd52sE2/zvIXZMAvmVNflvgN4hZFM6f9wBiY5o1wgMY7Jzggn3xw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB0656.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:164::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 00:54:09 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 00:54:09 +0000
Message-ID:
 <MA0P287MB2262E9B325CC58B2B1788382FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 30 Apr 2025 08:54:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
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
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-7-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250413223507.46480-7-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <ceb63856-4d82-4712-b2d8-f8a9d97f3486@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB0656:EE_
X-MS-Office365-Filtering-Correlation-Id: ef7a961c-399b-4871-ad7f-08dd8781840b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|15080799006|8060799006|5072599009|7092599003|6090799003|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGMrU21lSkViOHB4MEJhN2ZnbVN4T1JUUkZwV3JhNk1RUFNWZEw3Ky9wSWdU?=
 =?utf-8?B?MlpKZ3pYbHhHeXErZElUN3ZrUDRFNUZsQ3ZDanlsN1RrNEZQaVd3dWFQeE1M?=
 =?utf-8?B?eDV1RDZLMHZPcEZHbjljVW5ldDIxbm9SenVRZTFpeHZyaEx6U281b1B2NXQ1?=
 =?utf-8?B?Wk90QzVIdFdJYlVaSmRZWEFLR0o0Z25qSG5yVmgvRkFTbUxDNk9tUWxoT29X?=
 =?utf-8?B?MmZGZityN3hzUDNrLzh2WWlQbUFXeTZiZS9weGgyTndCZkpsRFVsMmYwWmxN?=
 =?utf-8?B?QUdzanlHSWJoeGN2b1lEbnpkdmRibXJDbWpvOG11SG5aVFhMalAwK3JDV1pP?=
 =?utf-8?B?eEhOSnRYc05HekJxd2RPYnVrVjZvUFF1UnlIb01mSC81dkRvZEVkUWZQWmFv?=
 =?utf-8?B?TExDR0l5NXk2Q0FBakNCRmo5MVlFa3k5bmMxbW84T2hxb0R5NHFsZkNQYkdC?=
 =?utf-8?B?aDNXa0NZVDY0ak9ReFlpNGZzcjlIbEdwbHlmRFVCUjBxcXNSbTFnSHVLR3Jy?=
 =?utf-8?B?aVI3Y0t2VmxiNXoxZEk3TGswNS9kNnM5a24vSHFnSDZTMm9TcFdrc0h2MDEz?=
 =?utf-8?B?Tk14Vmp4bzkreVExVGZaeDBEemw4SFNqS040MDN5Qyt5QmNGU01EczVHZEpO?=
 =?utf-8?B?b2xuRjdFYlNHZUpKelZMV1orRW83ZXg5L1NlOEFVWWF1N3R0dWxHUjA1WHdR?=
 =?utf-8?B?d29xSDEzTWZyU1p4eGtWY0RyNVpuMmduLzNZVXJ0TysxdnNKWUovWmsrWDVQ?=
 =?utf-8?B?MHhvcUsveWtrV2pjZnR2MCtsOWNmS2JCazFZUGdNV0U4c2IvVU8ySGV4N2hR?=
 =?utf-8?B?aUlJSGllQVdkZW1ZQ09zbFBvTmJ2NndhS2xkNkpxK3F2TldzNk44NzlDbFJq?=
 =?utf-8?B?bG9WMnZLdjBrU3J2V3c2YU4zc2hINXpHaXAzOFVRdXorVC92Zmp4NUkvUmEr?=
 =?utf-8?B?RlhOczVIbm43QlhzZitpa04rZXdlZGl0b3NzVUErT3M4dnpMUHdYdll0M3NI?=
 =?utf-8?B?dkV5Qm53U1pRUU9GYnFUVW1CM2IzLzlDa0ZraGFUK25HWmdDRVdES3dJa2hv?=
 =?utf-8?B?ZE0vY2FQZDFLUDRwbGpjR01VKzhZa3ZzWlhZc2x0UFRjelZJWk1rOWxNQTd4?=
 =?utf-8?B?eHNmeU9BTEVTYW5EZTRtYzRySVIyZmtEeG9HVFIyWUFLanpUdTNMcWc4cnJV?=
 =?utf-8?B?dDIrYlJqc1hjU3U3WDBHWTBjWTltQ1JTdUxaR1YzUkJOR0N3akx3eVZTMnFr?=
 =?utf-8?B?eDRRelB5RGY5RmxlNUtaU1FBSVpNYWl5Qy9TL2QwUGNZV0UyMyt6aXNlM0l0?=
 =?utf-8?B?M0N3WjVWQm5tUmlXUDFKc1k1REt6UndXSk1wRDdxeUJ5Nk56Q2JmTlVWTTN5?=
 =?utf-8?B?dXFBZWlNVjZJVjlTa3VhcVBCVVJ0QXZKQ1NWaXk0Z0V3OHdCQnlkME5OeENr?=
 =?utf-8?B?TFpqb3ppRHVJd05IdTkzUTZDenhsOENvc3lQL29oSktNL2Vkb1NlS00yRUZR?=
 =?utf-8?B?dUczcmJFZW5aM3E0UXRhTUlNNzEyaGNDMUN3aVNQQktNVXBSdTViS3NVZEt5?=
 =?utf-8?B?TjhKZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENDOCtHdlhiQjJrdjViSFh1MXltQkxxaVZsSVY1dVZQRkZwZU53WE5wRS96?=
 =?utf-8?B?Z29GSFJGL3p3MnBvNWlUeHEvQm9nc3FWYStxREd0ei9YbnV2YmQ0RHE5RTdQ?=
 =?utf-8?B?VVRUcDI4UXg1azhrcEkyODhkeGZ2Nkp4NGJJVHNlbkV5TXJaL1JGSkt4dGdt?=
 =?utf-8?B?TWEyT3NZTWFTZjByWFVtdGl4NDRIbW9nQTh3MUtaMExaNGtUd1NBK1F3eGxJ?=
 =?utf-8?B?SG5RbmNBN1Mvbi9WWDg5NVpuUUV1d2UvZGU1dWEzZEVDaWxCRXFJU1ZRTW1o?=
 =?utf-8?B?UkluSFc0aW1nRHM3NzN2M2FwVHF0c1pKQW5JUzlpc2h6bDlnYnIwNklGVkVm?=
 =?utf-8?B?ekwwc1o0TEo5UFpqTk1sNW9qVWZHV240a1A5ZnQzdU82WjI4V1pQTFJ5NFhD?=
 =?utf-8?B?SWJhQUNzalJocnZ3bVdrNTJockhaNkZTZXBEQzA3czlkM2NrTEh4RWlIZWxC?=
 =?utf-8?B?S05YU2dRVklHdVl6WUMzYnRPanRkNkR6WFE2UnlkNWZhNnUyLzVadUk0RXVL?=
 =?utf-8?B?Y1dFN0FwN0xFdUlIVkEwQnFHL0xNYTQyaGpCaDNtUHBMVkkxK2NYQ1RDTEhL?=
 =?utf-8?B?YlVKQU0zekI5d3NMNTNLQjBHYzcxNzJLRTI0YlZabzhsdCtXSnZFdjJTb1k2?=
 =?utf-8?B?TEJYZVg1WVUyMzJ4c0pSeGFNWWtHdDZCR3hBRWppblU0RHhablRra3RnclZJ?=
 =?utf-8?B?QzJjRlJIWFBvS2cyVHpVU24xU2VaS2xGMTh4NGdIa1B0ZHdxcW1heS9pTG1t?=
 =?utf-8?B?YVRHSDgyMXo2N0lvVEZyN2pBcmhrUGpRQytLN1JUeXZRNTJRSDE0eVZQQ3Ji?=
 =?utf-8?B?VXhBUGlKWmx5MnRmaDVtVENSZllZNC9KZ0I4Z0p2NGdxNTFRZjVCVzZsTkpZ?=
 =?utf-8?B?bnkvem85aDdITmdaWEg5QnJiL3JkcHNVaTlwOFRiVGNYb1ByYlJYUjVZQkpO?=
 =?utf-8?B?WENkRmhCVVNlODVhM3YrMlE3MHhkR0wvU1JaRVhDOU92dkNzQWFtZ3kzV3M2?=
 =?utf-8?B?UDFORXAvcVE0VUV1SDlKZFhCaFd4V0oyWUhtOURNaE5hRmJkNEcrcG9HaDlD?=
 =?utf-8?B?U3QzSWMwZU5KeUVCMlJxVndnT2JRdkZ0S2ZlYjhaWjJaclhCbHdlNDVHMkUr?=
 =?utf-8?B?T1E5cWhONWtoS01EV0oyQTE4R09qd3c1QXFKVkFuUU5hQ3RjTy9GNm9ldTQw?=
 =?utf-8?B?UXFYUFVvVENSNUgweUQySmJrV1dubnBUdVI3d3hIREVhSi9qc2haRDh0a0h5?=
 =?utf-8?B?UHI5VDNtbXNoY09HbWdIYytlVWh2bGtEYi8vRUhmdUhsNExXNmFzYUJDaDVi?=
 =?utf-8?B?Uk5rT28wdUlZNlVrbEV0SFVTQkFuVlRUbkxRT1R3TnVPbnN0ajQ1TWN5MTQ3?=
 =?utf-8?B?Z1RVV05SVUU5UldIVWNXbWw3QlRCb1lGQWZIMHZTN2hTeXdCTGVtampxTDh6?=
 =?utf-8?B?Um8rYzF6MGxNTndCbU9lb0lENC9ZbXdzMEFZTzlxN09TbndHRkYzZWkxbXBZ?=
 =?utf-8?B?cjltbGYyaUdqaXdRV3BkNTlzZmRkQXU2ZTBjVXFZZklVeVdaMUZyd3Rsek92?=
 =?utf-8?B?QTFLck92WjFQSkVvYmRtQXJVT01scW9ydytkZHdqMzArK2FJRWkzcExqMS8z?=
 =?utf-8?B?RkI4Y3l4Mk5DdHNkYW5rYS8zUmc0bHcwd1NVeHQ2YlBCTkdISkI4b0RJY2xk?=
 =?utf-8?B?RVl0dmdnNGZhUU1aN201MU1vY1JPUE9ZNzZSemZFbStKbTVmcVFSZ1hJM0dm?=
 =?utf-8?Q?r3CZECGnr0C2Z7gnI+4NAgaRwJkv5B9cdgw7kjC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7a961c-399b-4871-ad7f-08dd8781840b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 00:54:09.4385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0656

Hi, Guenter,

Would you please apply this on hwmon/for-next for 6.16? I checked the 
change history of sophgo,sg2042-hwmon-mcu.yaml and looks like you 
submitted it last time.

Thanks,

Chen

On 2025/4/14 6:35, Inochi Amaoto wrote:
> The MCU device on SG2044 exposes the same interface as SG2042, which is
> already supported by the kernel.
>
> Add compatible string for monitor device of SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> index f0667ac41d75..b76805d39427 100644
> --- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> @@ -11,7 +11,11 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: sophgo,sg2042-hwmon-mcu
> +    oneOf:
> +      - items:
> +          - const: sophgo,sg2044-hwmon-mcu
> +          - const: sophgo,sg2042-hwmon-mcu
> +      - const: sophgo,sg2042-hwmon-mcu
>   
>     reg:
>       maxItems: 1

