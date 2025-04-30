Return-Path: <linux-i2c+bounces-10682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC57AA3FD4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 02:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC8B5A0B1F
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 00:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE03363B9;
	Wed, 30 Apr 2025 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="n7Qgoeg2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011038.outbound.protection.outlook.com [52.103.67.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8723FC7;
	Wed, 30 Apr 2025 00:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974228; cv=fail; b=CFHuHy/Bf3fjfWUlelzyWNnFrhprXh8N8MeeecTiZORVSXpmufhM9PrDG98LCNQ5g7OICAi+p307xy/lN1QxC6fljGD0qtSrH4hcZNX7mBhtzeM7d7ic7YXRomoxcgs500yVj5y14D5BeyemMdYPIiMt4A+PXnfPbNhAMWiC6CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974228; c=relaxed/simple;
	bh=8Og1O7vXnB7x9FrhSaeqZE1Pih8jl1dCwhxNp6HzDyQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iPnSOj5QdbPNIv4WlNBD8GjzXqOlmdemPUm8HahJ0VJ8j0SSGPRCsk5SDkCcacjcG8p6mHuJJgg3Pyw9hKvREUXGXmwtdARKUxkTR4zxyjXNmVmQcJNByzFE+o4LfIhCxX6biSCXotbeNuOxftqnpDEbQbCME8BdqFr7qdusy9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=n7Qgoeg2; arc=fail smtp.client-ip=52.103.67.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5l16X3XO7dpU0q8EeDpVp8RIGg9DtWjhI/eVizFM3Do9+T7d9XtlGEvKDz2bBTXpzTniBoKXiEXXvJElhDczI1pHcs19zgFyEkm5IwLvYVjvzoAwkAoFerDQ22pSWzSrISbyGa4SDHxgEHPVed2qSzul6DnrFYN+P5w1RClaH7JC00kBSej+xukV/5vo97FqmxxURtFUjbDiyjH05a0JQL/PxtfSei1lqRVJOw481aTMbBhaTi2cmZzvB0JE0G2ricDT2U+GWCiLc428dKcbQA9vCowsWE/3yoX82nv8qDG7MIqHR2vt9dxLime5B1YBwfPc5fV9dUbsePc3jrCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsz9pMkvBImV6EOqjUdo6lInD8icHyHyWCobqyW7+kU=;
 b=M2yRGkXGjqq3pMJsIZJ+6klYhmshW6izl0hbtv4evVrZ1mb5inq+/Bf9LCp/TI32p7cs1vokIeBxvP8bPD5BN6ZxZJCAXrPX/Rt7BHJFDMX8SOGy7blCCZ8+yQ3emnM5WnR3ob5rjHSqg1MTA9nYoSPAALWR/vItkJaJh5pjkQHLvG/G2VqFCh+5lqVqbib+h9vL2VJRh5lNsc1H441EHmzHRK7/O9RA7t+Xo4pB8wEPlY+DnVDdergAP4z4g1+ZuxwFvgB9n2EA0YrDaLpa4NY2O5UPcCdY3Y1yOe8i/p8+UdxfOEDQ9nEaVmC69tR0nU+heP2PtGkwUPAEpBxK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsz9pMkvBImV6EOqjUdo6lInD8icHyHyWCobqyW7+kU=;
 b=n7Qgoeg2eCYz0T07RJJty8acSXMVaCXn/+D1qw4nmD0mRv5VRZQ8wREO/B2zppN/HV0AjNQw2d8PDk/VzEJLEI6RX7OlG8q1WjvnGLITaaJfV7VzbBBTEs95WmNYIeXD8SQIrtoYS9WDRt59TQklds4+b+zTE9poTuGAjIpu7eU8HBIllaX8GMAGN5UCXO9Kz7KE71I/1cenQQGdBkwdpi+fEQBKlrR8jj7hH/6kbKNTzr65dkkqwG7EIQadBwRvwqi2Id1Ckaej+Au27LYcTvWblGi6ywlqMWWL7z409edFl744UtrLh0j7CpBeiqMBndJFsHTH/kjDo4/7yxrNjg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB0476.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:121::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 00:50:16 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 00:50:16 +0000
Message-ID:
 <MA0P287MB226233A10BD5082A7D6B7F5EFE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 30 Apr 2025 08:50:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] dt-bindings: reset: sophgo: Add SG2044 bindings.
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-6-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250413223507.46480-6-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0102.apcprd02.prod.outlook.com
 (2603:1096:4:92::18) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <cffc744c-430e-4e11-8c7e-6957cf8e0259@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB0476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0fafd8-6e54-4467-7cf9-08dd8780f8d6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|19110799003|15080799006|5072599009|6090799003|8060799006|461199028|440099028|3412199025|12071999003|21061999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2xUK1NiU2JFa0tSRE1HZ21KRjZrY1FyekE4TU80c3pJWmE5d1RLU2VaSnhk?=
 =?utf-8?B?SHByMlJid01jRnc2b29mcXRLa1NpSG9DSE9McTlPNW1vRkdBWFIxdTNnbGY5?=
 =?utf-8?B?c3g4blE3dHVncjhpYmhHMWhRSlMxSklDMkhjNG8xVm8vQmdBMy83Wm5kYUV4?=
 =?utf-8?B?L0dMdnZ4ZS9tSENJL0k2eXB6aDY0cGZ6Q0txZVI5K3ZiZkVBT3hBSXNsTGgw?=
 =?utf-8?B?ZkhMUzZaN1ZtZ0ZuQW03UFRhVE5WUVY5K3hoRHp0OUh0RERxSGpDRGZZS0JE?=
 =?utf-8?B?bVdHOTkxNUdHMG41YTJwcGw1K2svT2x1VFdwU210MVlROHZleWk0eXE4TVY1?=
 =?utf-8?B?L1pXUFVTSWVSRzQ4dHhSSjIvSHQ2Qy9hTGZaVWtCYXphK3FWdks3V3lXL1Ns?=
 =?utf-8?B?d3NSVnBlNVgva2YyVm5DNXpUaEl5YTM2bzZnakQ4K3NWZ3dVbGN2MUx6c3hM?=
 =?utf-8?B?OE1IekU2Z2dBQm9tVXJFT0hmQUw3SnBhY0RNVDh0SWhBc0k3KzlWSmNTYnhn?=
 =?utf-8?B?L2JJb2dqN1RtdXVYR2ZDa0xweUlaYnExa1BIVFBmakpBYmZnUTM0dGhHWUth?=
 =?utf-8?B?aGh6aVIvemRwV2hqcmVKUnd3TnFJaXpwWFN4VzdIdHd4MGtWYm5HWitpODJq?=
 =?utf-8?B?K1lNQ2xQeEVZQVo0VUFyWVE0ZUV5dkQySmRraWxoRjNmOVNsdlNwOWhMaWpm?=
 =?utf-8?B?SmRnZmFRbW40dFhCZ2JvYVRZYU1BMWVDdVVKQTVsZ3ZKOG9PZnV0NlpUNTNj?=
 =?utf-8?B?K3BvamNpN3dYNjdMRmRwVkcrMHVNY1Y1QitEMXJiaGRvODZ3NUJMeTdmY1dF?=
 =?utf-8?B?VkNXOW9xc0U4aGNkYWhMVGlrd1pIaUlidllVQTV2YWVSVEhkNnIxSUN5U1VX?=
 =?utf-8?B?Qmh2MW56a1hwWlljTlhlb1YvL2RrTUh2SHNVRnRZUGxWNEF1Y1NRV01vVEN1?=
 =?utf-8?B?RXZiYWo0YXVKb0pOSy9pMDZMZC8rYmtpN3RBbzhUZFdld1hTUVFFb25hTUNI?=
 =?utf-8?B?T1JBQ3VWWiszM0dGZGpieUE4ZEJkRVA3cUg4cFFpTjBseGl6ZWk5UmJGcW1D?=
 =?utf-8?B?eW5yM2VKVVduZGl1ZUN1clZmaEdVZTBHNmNtNmVQM0dzUUNDTldxRERyTFRS?=
 =?utf-8?B?Y1BxSHRLVi8zMDBJeTdZSDIrR1hMVmtzNWY1RkRVOGhYcllnWk9RcjBYck9F?=
 =?utf-8?B?R203UTNQTXRuTFhRU2YzUU1QNlp2TklwN09NMUVnZ2tJRFpSYXlxVzViT2E2?=
 =?utf-8?B?VnVMSUdnN0g1WkFFRmVzc1pDUDkzWG8yTUlkaVNQMWdCY29nRjhqWkVVQ1k2?=
 =?utf-8?B?S2xFZ0pjRlI1cFdoWEpKT1JPZTRXbzlDbldUNWxuL3lkSnhuQ2RLOVNyRENZ?=
 =?utf-8?B?OHROSHcwT2NmTlBSM3crT3hzUXY0ZVQ0QldKVEZhNlA5ekpQZ2xHTlV3QlhP?=
 =?utf-8?B?N0FqQU8yRm93SkR3a2dqMElLa1ZYY1RvaXMvMkJuWDFzU053QnI3blUvZWNT?=
 =?utf-8?B?ZmVvUWxIWWh6cGFxdFY3VmdlMmxodDdHenFiNHEwN0ZNN1RvVnRPcFRKZzk1?=
 =?utf-8?B?Yk80dTcxZ0xYck5MaFYvVmovMUxMb0ZNWlBWcnlGMzVTV2k4Z3JFc1AzeFZJ?=
 =?utf-8?B?QkNJa1RQN25kMlU3OXkxMDhOTkYvQUE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGJGUitmZDFPMXZWSDNtRGc3S2xUSHU2TEhzNGtUNEl2SFZ3TWNHU0pJSTVZ?=
 =?utf-8?B?ckM1V2VXRG55MVZneDZubjFidUZPcU8vckdmSGJuTm1yWVd6Z0tBNVFkVGdv?=
 =?utf-8?B?dTJYZWJKRW4waWRCa1VET01pdUZ2K2VweVYxRmI5cklSV05acno2R0JPemJL?=
 =?utf-8?B?MVRHeStraVdJUCtEQk9hME9sR0QrOU1FV0pKQjBFdFBiUVZjTU84OHU1UjRh?=
 =?utf-8?B?THpla0c5K1FlR0pZTFBSRnBodlZBMHRMMGNmbzBqNXFmVXFCVVRqUU5lZElN?=
 =?utf-8?B?NysrYWU0Tm5SZThja1B6TDhhSFhEUVNSRlNMNUhOYzZSNzJDUFk3Qmc1NjJu?=
 =?utf-8?B?ZnVqOE9zREx5T3ZDekZKNHFGWExyTEk1TkpFVWo0Q21TdjJMTHY3UklFcm1o?=
 =?utf-8?B?RW5KYUUwK0pMUzkzeFQvd2o3NkcwYjg2NGE3aGtXc0hGY0liTi95RmVKNEp6?=
 =?utf-8?B?SjlhNkFEbTdSUnAvYzk5U1pwTkVzQUpMOWwyTTVUblhHYlQxNVo3QzB2Z0ZL?=
 =?utf-8?B?b0o1eEZRQWNZR0t3STNZZC9na05FMWl3Tm9wVEk0ZnoyeVZESjhROG1MdDMy?=
 =?utf-8?B?MmNYeC85UkdLZXVBZVRER3Nkd2F4cjdFUjRDNGRtZUFjQ1poYmR2amhpbGts?=
 =?utf-8?B?dEJnK3VKa0xHdGhsLzRUWTNObGtud3JDd1NDRS9nV2xvbTFHbW43dTVJVXU5?=
 =?utf-8?B?TGhSUnExcDcxTWtKTUsxYmxIekRVSUxIajhnYXAxbG9DWFc1N1BoNE8vMW5X?=
 =?utf-8?B?NUpaTjVNcnd1R2tKODI1NWFTUTFHV2NHOVM3VzNkV2RJTDNDTGord2MwT3Jq?=
 =?utf-8?B?QmV3N2JUaW81WUVFSzVlSjArWnVsYnJPWEM0Ni9CNE92MlZaWkVoZEc3RGFO?=
 =?utf-8?B?V0ZwTE9aRENIdEhVbVVyNjl5bEtMTU04SlBxYVYvS1d6SVRlOGRVK0RrRkNa?=
 =?utf-8?B?bnRsMUNpRTVWVnVCcEpOWWt2U21UN0JnQWhCcU9nc1dOTkRKVGl4NXUzUGY3?=
 =?utf-8?B?SHd3MEZmTCs1dEo1eUxtMWJldkVPOWk2Z1pKTmw2OWhMWEdxeDVlUzdYdklI?=
 =?utf-8?B?d3daUXJoWG1CUktsTnJOZThjeDFQUUEvNzNmZGxhSkw3b2lJcjBReVQzNzBG?=
 =?utf-8?B?dzVQL1VmYlMrRmNsYkRWeDE3RnRiZjNDYWp5TnZwVC8wbDRoNHBRZWZGL3Ru?=
 =?utf-8?B?WVlYOFhRVm5iLzVnUkVqV2hUYUNYdVdJajF5VHdsYVBRL012Z3NPbmRWU1VX?=
 =?utf-8?B?WlFqQzcrZUM4Z2FQTFcvemZlUWpZSE5SbmhWN25aVVBVZWJiVU5Bc2ZZeURT?=
 =?utf-8?B?S1huMUpIcWNOZXBDMEZGUVpsZWlPTjdBS0ZoZWpTZzEvZ3ZaS1VmbVBFa2ZQ?=
 =?utf-8?B?N2kwNUliYXZ3T2ZGNElPZ3BZbmVrc1dpRENDUEdvWkVrdDFNeU1YL1RVbUM5?=
 =?utf-8?B?NzVsckJuWGZkblluUTJsRnc3UVpIdUxBLytZeTBQaHNZcW9GRFdKOE5TTFBQ?=
 =?utf-8?B?YzEwb2xybTYxRXkwckFFV0JvMnhHRG9ScHlzZHFEdndqSGxzcmFGMEdsVXFr?=
 =?utf-8?B?bFhia1NyZnkvWFVZbjNBMFllcEtqNDZTTUZOL0k1UTR3V1FpbTFXTXoyRE5M?=
 =?utf-8?B?MkRHemh3REFjSmp2SkZHMXliU3dJUjk3Vnc3bWhiaHQwcWJ1eHI1bUJxcjNv?=
 =?utf-8?B?RDVLQUFnT2NNdHM4czlSWUlkTDZHRzFSdXc3a2x1NStjUHpZWVd1M0FwaGpt?=
 =?utf-8?Q?1GRCAURnV2Rp4Tfpw3lzCCry0ePe5wq5AEJO+/G?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0fafd8-6e54-4467-7cf9-08dd8780f8d6
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 00:50:16.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0476

Hi, Philipp,

Would you please apply this on reset/for-next for 6.16? I checked the 
change history of sophgo,sg2042-reset.yaml and looks like you submitted 
it last time.

Thanks,

Chen

On 2025/4/14 6:34, Inochi Amaoto wrote:
> The SG2044 shares the same reset controller as SG2042, so it
> is just enough to use the compatible string of SG2042 as a
> basis.
>
> Add compatible string for the reset controller of SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>   .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml     | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> index 76e1931f0908..1d1b84575960 100644
> --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> @@ -11,7 +11,12 @@ maintainers:
>   
>   properties:
>     compatible:
> -    const: sophgo,sg2042-reset
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sophgo,sg2044-reset
> +          - const: sophgo,sg2042-reset
> +      - const: sophgo,sg2042-reset
>   
>     reg:
>       maxItems: 1

