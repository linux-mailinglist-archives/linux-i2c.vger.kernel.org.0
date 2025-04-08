Return-Path: <linux-i2c+bounces-10196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E59A7F209
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 03:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 475751894CE3
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 01:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F34F24A07F;
	Tue,  8 Apr 2025 01:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="gCCfKeBq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010003.outbound.protection.outlook.com [52.103.68.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074CA47;
	Tue,  8 Apr 2025 01:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744074686; cv=fail; b=tJN3b2qpDNmr3FuIWZeUOfVpWe6QxpULzQwN+pj9S2M50EqlQ53N7Z8CZlcY59NcKPCGHSQn8IqK/fI6E8I0j9CesQrF6SFV8j6/R2GUsuXOre4D7gfxp9XZJ9PAG7V4n7nWhYrOnpISEtmTIy91NmniTO71irTmdPi1TmpSeUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744074686; c=relaxed/simple;
	bh=CVheTwMosmg8mezNc+yMmxTWwBLyrwP9U3n2CL2aH2w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HckQJZx6g3c1V0cnVxDsfmMaXFYku1zs33wwSgh7EV1FGh6s+5MpDdJb1WdKi9oP+NkVXCYVJg8y5egbo9SsDnkH4G+PhNflilqFnq191AI/Hsjvi7JtQoWSSFqZigTZavvWjtpigXgr2Qqnynm7IFB3nZHN5aQzc5uTaEv4eTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gCCfKeBq; arc=fail smtp.client-ip=52.103.68.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okjW/MKy6EE4AbztBnBrLFhyasl13BY1SV+dC5JaWnzw8vu7nP85qDJkIJbjIrpQV+cB4ZtFCln0AgQtDPLZIUtFkCFOC/YIryDDjkpRreazOHGnxNFAGYAlaB8Kx7IyKadHudUPbIxQy4OOdF85yptCsNpS63Ss4EpGt1hkRk0eTB81vmIK7WyE/ETcplFTiNkBxb8FSy89/dy2eAVoG7tEh7Ar82B46FjJuHFLFNmQs0VNZ6s/tw+et0b1Qz2K40oYQYgHJUPDI+huf8cssxDm4HlqzExFopkATgZvz/4I6ufp7w5yZ6LKV3iluCgly52Tjx/kZ3kV3NTvTGWHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVheTwMosmg8mezNc+yMmxTWwBLyrwP9U3n2CL2aH2w=;
 b=PogNmp3tcHKI+XG9HmzgsOSjvB9KLUL5sSmIphO/nQcVyNWisWNgXM4dkyJ8YasGhFQTnDCc6Ub1u4LXFx8RnNF5ek+0JEaf8H9Xa8C/IcdSczQxifyd2EQwOchcvC1GMct6ESluE36keexXP10s0kPyFXzQjH6jMqrDee4RiJQZ6JDMeRkQ0zbbTm5rs6MxtcuocoinclVC+1MNIQnGVVXT5wQu0K6uivCGZbTf4i2OZa3I31E3nuT1XmOq+M3GRnCQjDrgufiITUqYs5EYHgk6hof+nrpox3+xLZSnTjxjgbzQDXQJUyRqo+2cCcraCeSYP6qXWGp9EyFpZh2HSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVheTwMosmg8mezNc+yMmxTWwBLyrwP9U3n2CL2aH2w=;
 b=gCCfKeBqwHfVq1xQvfc12tvBn7x29Fd5Nf5S2waBGoKEy/bdm6mf/3ulbr135bZRsYxOr7Ia2B6BpfQflJ6xuIe7bpz8pgpCSj0rNX8UhgJBYUsIytIf9QZ5WWsa7t7g80C9V4EcKPdZnbDvt2NTWh2T/lFCZfaQ73WIIknocKgCjef/18XqXDAoqYhBFHD7FiTpDX6zPWmGskNVp45jVnelyEPpsiTHKKpYcFHdUBpJ4JNHCPMSPluFgrKxXiuydiY7PzqJEz+s6DK0ijcd3KwfLZORuoFNeiIVfSfQrDF7VZw/4VBwg4v0ZoX0S38fcLar2mb8Sz25tAyqofa1LQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0186.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 01:11:12 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 01:11:12 +0000
Message-ID:
 <MA0P287MB2262A2C2C3A00FF457FB2822FEB52@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 09:11:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: interrupt-controller: Add Sophgo SG2044
 CLINT mswi
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
 <20250407010616.749833-3-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250407010616.749833-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0222.apcprd06.prod.outlook.com
 (2603:1096:4:68::30) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <252e100b-98d0-4b5c-a99a-46cb44a4612f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0186:EE_
X-MS-Office365-Filtering-Correlation-Id: d46ccc8b-c79a-4c57-50da-08dd763a4082
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|6090799003|5072599009|19110799003|7092599003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3pGNGVxcVV4L3FOR3lxTEhkS1BOZERwNUhBeEFoc3ZBcXdZa1owcGZnQ2tl?=
 =?utf-8?B?NTZMV3BFY1ppdW1rdEEzU3dHL0Y0aEx1Yk5OZzVkVk9xc2Z1NUNrR3NwVGlN?=
 =?utf-8?B?ZEFjQ1dMM0syZGRmQnRCdlpSWU1taHlQMWxVenAzNGl1NnE1NXJvTnBINWtD?=
 =?utf-8?B?UXJSWmswUS9SVVZUeUxZZUNzWW00bG9LdmJoOWRzcFhOVGRFeTJqcjh1bzNv?=
 =?utf-8?B?bWhLbHBLbXI2c3ZIS1R5TXZ2UkV1TWhXNGNxRkpUUUtEQnplY1VsU1FlbElm?=
 =?utf-8?B?c1VqVVlhZ2RVVm5hbkV6Y3NBa0JpeFpJVGNROVFBSEFDbzZZUldvQmFFSlFt?=
 =?utf-8?B?VlJhZmUyMU1BWk9adllOaExzSjNZUzU5SVN1SnBlUVArK0hCVVNDWVRlTW9k?=
 =?utf-8?B?V0hJWnZnZ3NSOURXbERMWU1McXlRa1drcGI3WXZwOEVxY1RRdXVSbXZHSHN3?=
 =?utf-8?B?VDVaRm0xb25vd2RmMVJkL2EzYVY0ckVpSlN5RVlHWTBiejNjTXhlaGdDUUlT?=
 =?utf-8?B?TWdFZENoN0VFb3diTTUwNnR4QzFDY3N0dHBEbThyQnZtMmIrOEdvUWZCNTBJ?=
 =?utf-8?B?YXN6aE1hT08xQVJZajZVV3N2RHQxaHdYekJuTmlzdmlLZWk0NngvajhCbGRw?=
 =?utf-8?B?ZTFtcm51Vmt2TVlmYSsyVkJyQ0lFYXY3ZDU4cFpUYzk5bG0rUU03cVBkZ3JY?=
 =?utf-8?B?endCSmZ0SjNxUnAxVDZxWm9oWVlEdmdQTktiaytreG9lV3pwTTJVOXRhTTJG?=
 =?utf-8?B?U3h3YnAvUGtDSTM3d1RuYUhsMlR3U0lOaisvR1B3cmEwdFNabzFGYlBIb3Vw?=
 =?utf-8?B?eExnMHg5eWVOQlg5NWdWUDlSVHBOR3VhRzB2SHJEQkNlYVB6OXB2R3A5andL?=
 =?utf-8?B?U0ttSCtsaE1wbHF3MkF3R3loMXM5OXFJUkVWeUVrZEx5OCtxOFY4MTN6ZGJ1?=
 =?utf-8?B?OXJvVHFjSCtFOW5XQWVzUElEVWVVYkRNQXlaNE1EUDFJTGVWQXc4eTJXV0VL?=
 =?utf-8?B?Rlc2OHNkNTh5RjA0MTJSVExZYm1WanJZZDNqQWFHZnpsY0dEeDYvdmJGR1Fj?=
 =?utf-8?B?S05mbEJyUkU3Z2g1elZiZCtodjlUYWZubExVNVNNRHdtcnlaQUd1KzZId09t?=
 =?utf-8?B?cGJUZ0hwMU90MlFFbUNwMGc4QnpFank0NUNGUm96U1B4N2E1dnFFak5odlZB?=
 =?utf-8?B?eHcreElWeDU3NWNPK0VRczNHZlVPWFFvVWx3cFZLeG96U0ZGVlhHRUxxdlJU?=
 =?utf-8?B?TnhHNFllNjVRaUpidS9CZUtVYUN6aXE4L25wTDBicmNKZ2lCVnRsa3NSYmd6?=
 =?utf-8?B?Z2o1aEJqRE9jcnFWemR3RzBabThIbmh0b29jOXNBRk5RSkxDanVmQy9sNlFC?=
 =?utf-8?B?eThvemtRZHV1RXJhd00vMWYvS1ZVSGh6c2E3Z2hFV1g0VFN6Sm43dGYrOTNl?=
 =?utf-8?B?dHBUTjMwTUlOQjhEeDFjZHBxUDVGeXVONFdJSlNrRlRRUUtZYVc1T1U4aFZL?=
 =?utf-8?B?eVZQZWNUSDRId001MmRUQlhQazJUcGR6aG9MNFltRWxxVWMyUjBnR3BYQnA4?=
 =?utf-8?B?dnJxQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?empCWnJVQVNEWm13L0Z4NzMwZHgyZ3NoblBXWTNCSUQzaG03QlVrbkphN0Er?=
 =?utf-8?B?RW9wUlE5anpCVlFHdDNIZXVnSXVOcnJzNlcvRU1OZDJFeWFNUGtQdUxPYWkw?=
 =?utf-8?B?Ymxiei9Hb1ErUjJ0OXBGSHpZempHNFFXWDJQZmxUVFpiWDNiTDM5YWtpMVNW?=
 =?utf-8?B?RmpENjJkQ09xSzlOYWJnMW9lTUZlYnNUbDM0S1lsei9VL3IxN3NpVFVzdXpw?=
 =?utf-8?B?MlVXN2lHeFBHTlpEVitrRnBVb0hseXFaWHVMbVNCd2pFVTVxcHVpMVhuVW5E?=
 =?utf-8?B?dmFQZkxUNWdQOUdENmhnVERVUWc4WUp4YTV3eENkMUV2Q2dEdkl4Ry9PYzVo?=
 =?utf-8?B?aVRsYVgwOUx6SittRUFIN01RRzdBeDlzNy9oaFBxeHFRTWQ2cGRLczJJWktC?=
 =?utf-8?B?dUIvckVZVHJqNXZnODRrWSttb0x1MW9mbHpETFliYzE3WFJTc1M2UExSejZ4?=
 =?utf-8?B?QVlERWd1WGJPRGdmV0dCT2krSzdJUTExUmpxWktJbWpCeEVvOEs3ODV5bjVh?=
 =?utf-8?B?NEdFSEh6U3NaOThaK0hIclVLUzY3TTB5YjFnOHRma05UZG9ycnROekZRS0c1?=
 =?utf-8?B?bHAzUlNLaXRPZDU4WDEwZ2NRSDM4aFdLdG52MmJqSk9Yd1E4NWNGS2Y1T3Vh?=
 =?utf-8?B?SFd2QmlBZFZGSGl6T2VLbGZWVGJuTGhqeXJ2SmRjc3F5QTNhWlpxMjFYTDNq?=
 =?utf-8?B?Z2VKNWZqYktqQS9SemJqNWdDYmpBbnhrWVVWeUU0QjQ1VytxRndSUmUwTFRL?=
 =?utf-8?B?dXpqYitDWjlOVVowZmtrRC9LcGFYd29vKzFLU2Z1NUVXRTUwb2p6dHdXL2t3?=
 =?utf-8?B?UXVyNmtNZExwUEZWZXdUamlOWkgvNDk0NXVaTzFiVWJnYTMxS01OcXNoeita?=
 =?utf-8?B?WG8rcXhQV05pNTlyTFc0clJLanBQODRuY0hNVk5pWWtDVUlueEZvRFNKSjh5?=
 =?utf-8?B?eW0rYllRRjFsYzc2VmJjb1AvTEM0c1E3TkNESExFK0NkcUJyY0tMS3I1VXNJ?=
 =?utf-8?B?anY2TXFmTFBUcytjZUtSY01VNkZyQm5wbXAxdkRicGtkaUZtSFdUZjUvTGda?=
 =?utf-8?B?djJvb1NML0I2TDhtNXVmZS9oc0pJYVhIU3dvcFdoOXRTNlFkTFE5VDBsZ0pP?=
 =?utf-8?B?M2lzWXN2dFo3Z3F2SWZsY3Qxd0VWcURLMWh5VWRtaXY2NnhOSFJLV0IzU0hB?=
 =?utf-8?B?WFhXUlRxckJMWVVOb2hFbE1RZWpPQ2gzYlBpL2hkOVlwcW05WGdaSnJRTGxI?=
 =?utf-8?B?bW8zVlJuNHZYMjNYdk1sSUdWNE9aRm9NZ3VDTGUyakRCV1J3dkNtZXFTUlB5?=
 =?utf-8?B?UEI1YUlnNWs1aXpjTHpTRElMK3QvWFAvd2VFRnVHelRzTjlGbURjSEJBbU9D?=
 =?utf-8?B?NHBubGNneVc0Y0NGS3I5NjZWZzZubUdQdEFBWEhTU3d3amJpRTVyazNzVzd5?=
 =?utf-8?B?ZHRvUjVRQmFZc1NpanovSWw0NXZha1lIblVzL0VPekxYTVB5VWRGZ2owd3d5?=
 =?utf-8?B?UGlXN1h2akhEa1RBcXhDQzFXWkJZNVp6cVJaek5aQ1pmdDE0eEIva3YrcllI?=
 =?utf-8?B?YkhKRlJzRjBXNXlJeUxab1dBOS9vU21TQzg2MkNJemdIN293TTMzNUhJdVUw?=
 =?utf-8?B?a0t2NVRqSGJjbmVSVFY4L1FvR1pFL2ZBNW1xaXJqTzhreTFuRjhWa1pkWnJX?=
 =?utf-8?B?RnBCN2poQUlScFF1Q2F4VEZWa0lJR3dCTXlJcFFZbEloclJoUVJMWVhseTZN?=
 =?utf-8?Q?iXgm2QCFsRrw4KF98k4jVDcNY44omq7m6NxC6Pb?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46ccc8b-c79a-4c57-50da-08dd763a4082
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 01:11:12.0900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0186


On 2025/4/7 9:06, Inochi Amaoto wrote:
> As SG2044 also implements an enhanced ACLINT as SG204, add necessary

SG204 -> SG2024

[......]


