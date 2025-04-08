Return-Path: <linux-i2c+bounces-10197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5CBA7F215
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 03:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F8A47A63AB
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 01:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFD120A5EE;
	Tue,  8 Apr 2025 01:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="q1kGPMLp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010004.outbound.protection.outlook.com [52.103.67.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35A2F24;
	Tue,  8 Apr 2025 01:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744074997; cv=fail; b=Dw7litMv+elG7VVeNNmztCAE30rjaPovFARP02gRhd3LwnhvaBJzjkyDgIVK11932/rO5V7lzYc3f1hxsoS4nA7laikXvFEcAH40MMPzJA+sT8zMHTo7H/jo52ungSeMZ+a1Zf1KwS4zINemsVZ4v7o+MFTzuInRL7XWmD2jpHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744074997; c=relaxed/simple;
	bh=RcoMp1chUxWG83Fw/LZZO5kjw3u4gEawbf6nxz4dcIc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pXEj4uWBhBF68CbZDvYBsY5A7D3zguzfIu6J/63v+pXrac5QRBUCYotE6HMJ5lSTC3ml3FC9juFmo7PLFgEWiU0sTXGWu2wZ14n/yK6lWsE/EMTGBQ6oZl7uQcQ8BYRL8vzgrrOFSJ/HNBf64ZdVUGxISjctPCTkPqthwRJ1ICs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=q1kGPMLp; arc=fail smtp.client-ip=52.103.67.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1PG4wnaPMYMO+ok9NkHjuHA+9dpNgXFOCmZzB+HwlbIMPD3kNKvP/xd7ZHVnFzDx18Mw+zHMZRTOjYURQGlCUV7M7V39RdkzjA+wGSms/6BxfsmRmnxyQN7Q7yqeiCaiGpFPw77Hm6nAhXOgutwf+tq8FULJ18I/DJppMEQfftqI3kYD2BfHI00s2EQEnARM+gZRWsSECLLpYWdK+hGgl6zKRdzCCylcbZ1NmR3AMnfNDgCJOFhZca5uECmxA6YsNg3XuZ3DHtk7jGUbPKkYUX5gaFgw4C8qzaa38v4M96FDP+mYvKRy3oIXlgEOwmKKvru5WpnHjyWBhb2x1Ub/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOxMs503ExS3gJnG8GFcDautEwkMsCjF61qu/vlAmjg=;
 b=cDb+30e8lUcBD9JDvZ+AnIJNCBM1Ez+iX9fc/dHOg6bC31YzgJz+scQ+WITQVTEQn2C2rqbgADqwDaQVWDH2ouIflOf+vaOi5puMwFd+xTHxM0Ozz4EPFZ1DWPHDgBoJpdzbp/pWdclDPWW6GFTnYa1BcU30RZty0xHaQ5nwz7sxYCUv0/ZLg10JHhAu0H5jgP6GKtrn8ja/Mun5X0w8z97USlv8Xgwv/nZa0v0xZWrg80cliyqwjQHixiqnOuw0Lcm7bHCkUb4gGpt9ZLRfDXSZh//NQiJe2K1UvFQZyBvZpYAOHKFXxvVtcN7qU9j5ol/4+xttS7Qn/5IR6i7Dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOxMs503ExS3gJnG8GFcDautEwkMsCjF61qu/vlAmjg=;
 b=q1kGPMLpQR2+GH0HPpX9RtFTHlHj3arNYRfa73s+vYXEHJ9OwE2l3Wz35lyRWOwSFjI+nzNBhu7/VeBmqna4f1ZYDDkiJYKgIDiyUcRFDHERAAtbLgEeB1Kplzc1MydmcQDv/XRIs1IEX7RV9Ni6V/wkvvReLTvG6Z/spYvbeTgA0ksriA4mrPTyxY64S/sqGJUhaDXxHAnZOlmUFC+jYGylzefbKf48lUJaG123VYYkXweR0dXYDADsH3j8/iDLnxb4An20/i59Ih9Huyg+lHvB9o+T2CSLADq0nLeAE+1PY4sLb7izpH1Pjcyop1CrIGZhR2gJ9KZftx4fDTmFlA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0186.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 01:16:23 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:16:23 +0000
Message-ID:
 <MA0P287MB226213EB2E74EBCE101A59AAFEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 09:16:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: reset: sophgo: Add SG2044 bindings.
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
 <20250407010616.749833-5-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250407010616.749833-5-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <02172edd-ebd6-4dfc-8cfb-329d3d7dde4a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0186:EE_
X-MS-Office365-Filtering-Correlation-Id: a769e4aa-aad1-4e1c-1100-08dd763af9d7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|6090799003|5072599009|19110799003|7092599003|15080799006|3412199025|440099028|12071999003|21061999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjlmZFBDN1p1NlpPMGVuVXkxa2xTam9XZ3pJQ2dYWENVNStSQm0xTitQcFhk?=
 =?utf-8?B?TGppd3JaR01yMXpKYmI3KzVZRVp4SXNiVmluT1RsZWZwdkNFUEhnbFZhTFpH?=
 =?utf-8?B?RUFLdW55YWJNOXkrR1pBSVJoNG1MenVjNVVWK2pjY1hGdVptVTRNbldwYVJY?=
 =?utf-8?B?bzMvdXg3QkxnNTR2cWtHVUhiMk1UMHYwa0J5cno4RXBKNEYrS2wyMmtlMitM?=
 =?utf-8?B?a0JoUlRPNnhZVHA3Y3d2Y2tvenhuR28yVWJaVFgrcWM3MkcwWGY4QXF2NnFu?=
 =?utf-8?B?Si90WC83cXRUMm1VdEd3RklCbTZGZVdQMmZKOXQrTlA2ZGRVZmtUZHN6Zlcr?=
 =?utf-8?B?bU9vMlI2anRhVHJmdUZqTkM3TW9nYUtOK3B0dHN4Z0lHWTBGSkxTdkRaOUNF?=
 =?utf-8?B?UVo2eG1FQlRwVFMrdkFkK1ZGTWZ6ekFFSDZuckFVQWNGZkNpdmtXYlczTlIw?=
 =?utf-8?B?VVFxWHNjUURxNFZvUUllaGt6ZFVpQzNUNUNwV1JTTjY2b05YMGYrRDIwQnB2?=
 =?utf-8?B?TU5zUzRRSFo1STZIbkF3dFp3WFh5Q2wyOE5YdGl5TmU1T1BVV3FITnNRWjhY?=
 =?utf-8?B?Y04zV3hMako5cDZ5OWhPdFVmcUFuQ3pqZEp4RDF3TnB6cXFydWpndzNCSFRC?=
 =?utf-8?B?OXREVUZrcTdOLzE2dVVEak1KbXdsWG43elJXMU5oRFU3WUwzYzdPVzFOcFpX?=
 =?utf-8?B?bWJUdEY2VkJ0NVJoQ0hKcTJMdEQya1FaNkFESGZkUm5PZnltbG51b3o4dndn?=
 =?utf-8?B?dURGblg1clpWUzMvcVZJaDRFWXFkNHB6eitzWVpESGg0Wm1tbnNHbE1wSDk4?=
 =?utf-8?B?bjZHQnFhQ2JXb0VSK05nL3kzMXRSL1ZSakg5a3Z6NWVrS2dMOElRc3pPd1VE?=
 =?utf-8?B?U3FtcEh4S1dqaEQwbE5EY01Bay9NOW5aV3ZIQmM2aTU2MnZEVmM5YnNIY3Q0?=
 =?utf-8?B?Q0k5QVJlN2pyckUrMzljcXdaM2VTUGIwRzZMRXowMUEvOXpFb3l0d3ZETXUx?=
 =?utf-8?B?OWg2dlgzOGJyT0YwMmd0Q3dRb0dhR25oWElGRndWMjZrcmFjZXczdFg2Q1hJ?=
 =?utf-8?B?bGNBWk1YUHRQZVhCcUdZTitQZ0l6RHY1Y3hENzM3ZGJuWEt3ZlBQUkMwRy9j?=
 =?utf-8?B?NHVidHM2bW50OEFWZEExamwzaTJCWTVRVFdqRm9obzJmSlYzRmtHWjhmODI5?=
 =?utf-8?B?cVFpUXBiZWF4ckxFRm52R2lsYTNXcEd0cWx3R0IyWGFGQkxxZlYwenBUQlEy?=
 =?utf-8?B?WUNQV3N3ZjBHbHFUVG1ScGtud1hyM2tpczFJNDZPZ3FPcU84VHVESnFncEQ4?=
 =?utf-8?B?ZzZxMWplTlFUVEwwSk5BbWQ3ZUhQbWxpN0swcmZKcTdrSGJEWFJFM1NzTVZB?=
 =?utf-8?B?enpNdENqVGFFRm0zd0JHcWZsaGU0VTFFeElBRFFCcndKK2dtcmF4clVmSGpP?=
 =?utf-8?B?N0V1Ym8xeFAvNzUrYjducUN2YmRmcUJpb0U4djVkUjNlMnQxS09lekJlZFZo?=
 =?utf-8?B?dE51TWpNNmk2YjhvaEpEbzh0d2xPdDQvaE1TWjREYWRaWjV4TUd0TWJqQWhz?=
 =?utf-8?B?dVh4RDRabVdidFkzSVh6VlMrTFBJTzdtSnU2czV0VjgrSC9rWEV1aHMwaW9D?=
 =?utf-8?B?eTFpa3ArSGNmeXVoelQyOWQ4bldjaGc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVdqZzYwWXZnZW42eW5vUlAvV0cwUThPaVJNVlUrZVArS2VaNEhUekw2OWtX?=
 =?utf-8?B?c2lIRGVyNFZBSTRabCtndHN4TE4wd0VPQmorMFJxenJjWUY2M3ltRlZ4cVVP?=
 =?utf-8?B?MVFqd3p5cFhCdlk2VGk1TUtBc3lVV3BvR2JQbDVRZFJRVGRPaWQ1c2VwSUlS?=
 =?utf-8?B?Y2xoTFBDUnpJcmlldk5CeTd4cnM0SFJzTEd4eEliMDk0RmUva0x6eXhOYm43?=
 =?utf-8?B?a1lvamErSUxPOVdzZnpvekZNbjY0SU5SRDdRNFluNTE1bzNkcHZFTE9DWEEw?=
 =?utf-8?B?eXRkY05Nd2tVREpuWG5UMXRHZzVieW41SjdtZ05HeW4yTXJsNW5wV0lieWZH?=
 =?utf-8?B?U1F5UmpuU0xTME0zRXlHQVBiSlRSemFJRUI4bGl5bkVmM0NlMWNndERjdHBS?=
 =?utf-8?B?OGdnQTdzN0J3clVScU5FM3d6OUlEUGl6c3RxMnlvM1FHOXBjSUNNWldtTWd1?=
 =?utf-8?B?WStFNW1ZWnBlNVZVYVhDZ3ROMEFoaWt6QS83ZFlubGR4ajlMYXZ3Mnc4ejlQ?=
 =?utf-8?B?cDNmQlMwNVBDTXRWMTBNRDA1c2ZudlZ3UWozSzIzYWYreWN3ODhvMHlFZ2g3?=
 =?utf-8?B?MzM0dkxhM0pMbXRGaDdObFJGOUQ0dVljUjhFdHpsVTJDZTRDYXhQOGhad1Ni?=
 =?utf-8?B?cEVFWlB0MzEvU3VXMTdVYnFqMEpMTTkzUlpyVzZyc1Uwdlg4enBZZStTYUxR?=
 =?utf-8?B?Y3JoSW9vcmoyQlY1RXZHSmQ2dUxXN1pWd3B0Z2tOYVVxUmh1WFc5cWtLY3c0?=
 =?utf-8?B?WTRBL3VWOXhkVkxwYUVhWFdLRXcyTlN0Q0hBTU0rMWFPVzIrTHZVMDhIUldh?=
 =?utf-8?B?VVVXSUwwUmV0d3Z5NjFxeXg2WFZRNndlL2FqWnAyL0ZCc0JEUUJjcEttbi9F?=
 =?utf-8?B?Q1NGd1BBaGdtek9sL1lkZUxYN2NqT3ZXc1FtSGhLVm9aK2c1SkVhcHRMc0cy?=
 =?utf-8?B?M3pqQU9rM01Nd3QxNlYzaG1udFo0M3RxMUx2SHVDelozdld2K1FxaDAxU1Rl?=
 =?utf-8?B?RUQzL3BUbUE5L2R2blAyNDFLR0hIY1ZCSkMvN0poOCtNR3BIWERRa3luOVpE?=
 =?utf-8?B?cU5KU05UNFRjNUJVeitKaE1WMlJLeS9INXQ5cW5MdVZpRlpLS0hpVmJvTlRX?=
 =?utf-8?B?SnZ5Q3lUZ21lR3ZDSWJFU0hsWmtpRXFDemxvZG9uMWx4SkJQWlJmc29NQzBY?=
 =?utf-8?B?b3J0Ulp3aTBXVWQ0bUZTQ3lzYThBaEt3T0tNYWVPV0xkeXUrbUZHeVZvc3ZV?=
 =?utf-8?B?bkZKWmFWQW9qdlNPMFpJZENQb0xIS0ZtbWlVVjJCeTdZUzEzdUFwVU4razJU?=
 =?utf-8?B?NWxta0VMOXJtRXVkdTJRaEtxUjhuV2EzWHNId3J4M2JrdkVuVjhOZ3FOc0VU?=
 =?utf-8?B?aGpnbmcvUkpZTm9oRml0ODRGZnZiNW5wS096eVVDakk1M2xGbVBTVm1zSUoy?=
 =?utf-8?B?NVk2bnJqZGNXYlhoNnhGN2VNL3RsaGhzMjdSaXZWUnZaN1RVWjNTUmF2QmpW?=
 =?utf-8?B?VkZ5MEk5Q1ZUNUZYQThWUVZvYloxS2ZZYVovMEl5MDQvYkg3dXZZNjB4MFlJ?=
 =?utf-8?B?NGcxMGZhZCs0bjdFbUcwL3FUZWZpVjJnS3JheTN4SFBmQ3VVeUJib1l3NDhV?=
 =?utf-8?B?WkVENlc4ZXZiNFh6RUhFWjY2dy9rZmpTeU1xdVd6d29nTmpnQmNPU0pLRlRk?=
 =?utf-8?B?S215a0RnNyt0MWVvbGdsSU8xOGNLdGxBZlVtYUNYaUVCanJYYkRWcnJaRVJn?=
 =?utf-8?Q?ZhaceBN5bkTdKIL5GCVuXVjODct/zYZYhNNOTUQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a769e4aa-aad1-4e1c-1100-08dd763af9d7
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:16:23.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0186


On 2025/4/7 9:06, Inochi Amaoto wrote:
> The SG2044 shares the same reset controller as SG2042, so it
> is just enough to use the compatible string of SG2042 as a
> basis.
>
> Add compatible string for the reset controller of SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
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

