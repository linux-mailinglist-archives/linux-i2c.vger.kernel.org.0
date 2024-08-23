Return-Path: <linux-i2c+bounces-5710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933595C359
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 04:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F2621C2259F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 02:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9043717F;
	Fri, 23 Aug 2024 02:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="LICIxTwv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010065.outbound.protection.outlook.com [52.101.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18EA24B29;
	Fri, 23 Aug 2024 02:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724380629; cv=fail; b=fcqs8MVKWM0hOzR5qsWK5KPAd3c+3xbhbiPN9AaCtV5u6uU32xuw3JLCv4xv71D58zxOSVnlZPBJoZshZkxcp4PJpypPYAp+DAk4s0qWkSBBjvh+g++ov/qe9UbYYdW21aOOQPJatNb3i2pxVLDsKQFJ2KsnJpOEm7KN75JL16g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724380629; c=relaxed/simple;
	bh=yXpYXsBu9cRa8c3LWcCkhNpsDYhOUdTYTQNte1ql//g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KM801JvS+YVFpGI7cjLP0ZBDXnE7bJ8wEZ9K+ZKXwgDpNVZZ70lKtNoRB1+iG8LICac0v2cJXJOWiELtgl9tTWGhg6kXiPv12Md6mvjCSFBh8ORRHp9fSZXzSne53nUX5WIy4NuO6gmuahp5/FsMhVibQC0G/2iXK5XR3mowtRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=LICIxTwv; arc=fail smtp.client-ip=52.101.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXkM/PoKqoDPtUiIl5g/UEqzMRYzEhxYhrUT9bAWNKnZipebBpvCFVn/xV0s64wk2e2glG+lXPeLadJTgJIv/hO5r29zjgeh3MVbp3+fy74+KPBCRiYzMehs+AmctSKVBi4PhrIFzdwObsDmcPvFbpNNfYCFTnGMB8YL1l0zG45DFK4EkJMTU7rLVe/rNIUM4m9cM0DWgY0xxZbas6YL8ohE+ZHP4FLjejGtgLIrmx0qHnuL0t/z60HR+MRdNDjwBBbAsCSmLHUCMxHcYMyBP5PbQo69oEF1ZdORRZ/QWwirrnwMmr0UpWvsCs2QVntDtlet6f/EuP15pNku8OpswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfy8r00bvdm8BivVjVINp3TK/U/H1Bcalie13XT/xB0=;
 b=WnAj5pOI4r3g2/qRaXCgddv2UNAWjdLj3G+iGqjprjzwwjiXEtzdrneFMX0iV/ai00nP62VFBYCd9h0MdHVoGajlDqmGNFyVPHyvWEF+9dzSdE5kg6Pf/bIHgKLDTIw+YDbup3Bk2wGb9lwX5347dvIDhVWtO0OO2x05RhOatfBQvBPfxqxbHqwCavIYjrBEFMUO8fz5FqbJyn1KqdJSdOc+9VGSvyLpGiXHYx/3x4Z318GesJ89qNzJMk2uBesB+5JHAH3VQ59ObRSkvSBkoSgxOknbpqHwwO6hdEcrNV838/PwgnmcZQmhYYfJdiJeAxFJmPQMTUeHIktKTI5bTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfy8r00bvdm8BivVjVINp3TK/U/H1Bcalie13XT/xB0=;
 b=LICIxTwvqm+egMlUFtSrWF2bYSGL9z/EQh1T5z3YTqWxFB55YvRIXRoexph1EH0X9XclKJzT6gBpvP2VLCbeoEKW1XWkq+Lgq4QVyh4rLSRv6/m02AoeKy3XDepqtcSL+7oXYLpx+WwQQh+xstPq4JwpDuphVaEkIq9p2WosdNR+o+va8oa3c0nZCXyWfEkJ0rGrgvuROf34YmpcyxGnvh5/dO+HZ4CWqa/g3Q2lEIGjicbRZtoH2dTDxtT5yyRqYUAMlp5N+NWnoSEj+ny+16FlaG4zjL5IVW9b/a1LPNmcblYrmgsDc5abSoT8lC9Dxrcgd6BJMtk22RUfLhd84Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB5671.apcprd06.prod.outlook.com (2603:1096:101:bd::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Fri, 23 Aug 2024 02:37:00 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 02:37:00 +0000
Message-ID: <271d9f3d-8f18-48bf-80da-2d049783e13f@vivo.com>
Date: Fri, 23 Aug 2024 10:36:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] i2c: jz4780: Use devm_clk_get_enabled() helpers
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Rong Qianfeng <rongqianfeng@vivo.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240822140413.65369-1-rongqianfeng@vivo.com>
 <20240822140413.65369-4-rongqianfeng@vivo.com>
 <TY3PR01MB1134676C8A4FE7BBC89E13701868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Rong Qianfeng <11065417@vivo.com>
In-Reply-To: <TY3PR01MB1134676C8A4FE7BBC89E13701868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a7f2ed-14b4-4f75-56db-08dcc31c76b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|81742002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU5NNGx4c0lRT21nUlpKUXplRmZVckZMa1ZBSWgrSVVBTis0NWRWTHNJQ3h6?=
 =?utf-8?B?R1NJNlFQSXVranFGTG9ISjNFOHJOQ2E3WHBCMXlpNlVSSGN6VUZuZzFYWnpM?=
 =?utf-8?B?VFVNRllwZ2dRdkNJcXlWbVNUVVJCUjIxa3FMb2ZqUVlWbDl0V1ZQTU01c3c5?=
 =?utf-8?B?dCt1OEZGU1Y2ZEg0cnllS0ZZeUsyTXJaaHVvcVVaTzM3a0hhbGRCakNIRGtk?=
 =?utf-8?B?WjFWTjQ0c25OWW91Q0FKbGJobWxIR3NCTS8rcXVsSkxVSkg4ZnJnYVBsbUpD?=
 =?utf-8?B?cGNERlFWbHVmRTc1WGdNTEZ4L1d2UWlUSk53M253RTZpeXR6NlJEQmp0QTNY?=
 =?utf-8?B?RE93c1YwOUhoS2orSjJHQks5Z1o2cldnanVvM29FOWpIK0Q3MFA3a1hMMDhh?=
 =?utf-8?B?cHo3UytSRXlDWTFJeUpZSmphNUxSY1U0R09objBDZWlhSlRhSFZQaG9KcUMv?=
 =?utf-8?B?dlJEMDhqb0pKTEtUVnd2UW1wZDh4MC9KNmxlK0VOTnhNbFU2ODZVY2FRTEcy?=
 =?utf-8?B?UVJXd2NhRFp6VmRIbk5DbU1rSFJSaDNjYlFFQ3BzTVZTdmY3V1BVRDB6Tmgw?=
 =?utf-8?B?a2t2RFd1c1dTOW1zNTdibFBvRjZlL0xzWTA2Tzk2aUhrbTFteHdvZVZSRFQv?=
 =?utf-8?B?bTBhSTAvNHNSSzVLWGZURzYzZHdRaE1kd2p3Y0NBb2Fka2V2clRFUEp2bzZS?=
 =?utf-8?B?bWVHSlQxczhEM2pkZzgwMEtLeGZYekFabzBzbzlHRmp6L1p1bHVDMEtHRjh6?=
 =?utf-8?B?TmJxb2pHYWM2eWlGWm9XZ2tDeCtWVUFTb3hFYmhrWXMyYXQwYWNMaktOWk1L?=
 =?utf-8?B?YkNkY2tsZWEvT2wxa0MvWTB1NEEzeTFlMUFaYk15V3BkSkgvSEZzWS84WGVS?=
 =?utf-8?B?VlNWa1VCSWV1dVF6TkZSZnA0a3dnY2VGTWwxMnBwYUwrRXNIRWNIejNpREQ5?=
 =?utf-8?B?NHRPOWFQRldUZnNkNDRFekp6ZDZOcmJ1WEN2dG1qdGR2VVV5VU9xenlnSFV1?=
 =?utf-8?B?UytSY2tKQzQrS3ZiY2ROUE5jTFE3SXFwc1ZYVmdINGdITk9BQ2c2Q29ZKzVH?=
 =?utf-8?B?dWFvZnEvcm5DWHk0Z3AyeWVmdFdGR2xFWFZQdWZYa0VPenowVjlzU0V0b2Na?=
 =?utf-8?B?M0ppUVV0VEQ5ajBVcVV2SzdmQ0hhYytlRnpVMUlVZ1VQUFY1c1RQUUlqTUhl?=
 =?utf-8?B?QnNxOU1DNmxsWm9yU0lIYSt3NDlEZnRVSkNPcWRyMWhGRFRJdHI4VFc2bVFy?=
 =?utf-8?B?dW1WMC9selM1YUNjSGtWaXM2blBKTFhhTTRFTU1uWHdpMHE0R0hpMHBpdDlE?=
 =?utf-8?B?elNaZjloSmRlNDgxZGhkdTE3bkZLNStOdi9nMVJKMGRHSENxMm5zajROK205?=
 =?utf-8?B?c1hOREx6emw4QmdLRVo1Y2RsUTMwbWlkQW5xbGRodklCbEduRitaU0VRWkpV?=
 =?utf-8?B?ck5MZ1NVUkhyS0RvaEs4a05CMUZKRWVIcWpLQmdIWWloUkIxSHpMOUdHenRy?=
 =?utf-8?B?R1V3b1F3ZVk5Y0phWEJmY21iRXpPSDIrZ3dwYk12MFNSa0d0VysvNUNIY1h5?=
 =?utf-8?B?dDErYTlJQk1SMTc2d05iN1J5QWEzUEpWQUx6eTIwbUdEL1BjRDRqWXM0akdi?=
 =?utf-8?B?akQ3MVZBZ2dpT2xPMUcyVDFKdnRlWXlQMkZPTGtwVlVQWjJEcG12UXB6YlVw?=
 =?utf-8?B?TWFCWVFDUFp3NGxqRmgwYmZvSnNlRzc5VGt5VEFoWUsrbGxOR0gvZEw2UG5s?=
 =?utf-8?B?S2VHSzhXQjNPczNxR0x6cDlLYWJ1V2gyZVZiTDcxVlVVcDF3aW5NdEZEMEZC?=
 =?utf-8?B?alBMTjY3ZTRJSUNFcERXMy96RllGTzdkakN6ZTRSZmxoemdYckNzMHdySG52?=
 =?utf-8?B?aXloclA5YWIwTm9uaGRKLzZyVHNONlpVaGYyMlRtL2tGNFNwTCtqaTdVSUdx?=
 =?utf-8?Q?tUscnQglsHI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHloU2JBb0k2SjFBNUpJRjBFUk1QRzFLR2I5RnVJd3VlY0dIZHAvb2YvdEc3?=
 =?utf-8?B?TnAwZFdCT3lkaExzQjNQQS92WDlJR2Z3SUR4d1FRN2plMmVYR0NXNmNaYjh6?=
 =?utf-8?B?TXNaSnROc3pILzVUWE1DVXBpODFyZFQyNml1c3EyVXNCdk84WlBYNDVyelQ3?=
 =?utf-8?B?NXJ2MU5QTGV0dUI0dVJyQVphWnVWVm1rRHVnaklBNTljbjI2Zm9DbWNjRlJW?=
 =?utf-8?B?TW9Dc1psSzFaS1BnS2M3R1NFeE5zTXM4T3l6Y3VLa1JnNFJYZHBmWk9QaVRF?=
 =?utf-8?B?YitCQU1BMjNJcWs0Vng2ekVBTkdyR0pud2pOaXF4WllwMytDcUh1YnVjNmN2?=
 =?utf-8?B?WG5IVGtwNXdjdWlRb3ZFNzZTeUc2UDJGZWxrMXhvRHRsbHVrb2JKK2RwdTVa?=
 =?utf-8?B?dUF0aFNBQVNuaU1QZ2VYRTlLUS9HbjNLR2R6c2tVQzRSbG81dDBJRUJMUmlm?=
 =?utf-8?B?WUs0azJrTWtxbDRUUi8wdmlQN3paN01maHRkcTE2Z2YrKzlIUTBwdmphR3lV?=
 =?utf-8?B?aHBXV3JUdFVxd05CMnUzc2RtaUU1VUVOUmtHQlVFVjcvY2ZkdDF2S0hnTUtU?=
 =?utf-8?B?MU96cnU2c3NhV1FDL0JJbkZ5ZG50SWxPbkhFYVdIQkdzV3hrUlJidFpzdWZY?=
 =?utf-8?B?alhVZVp5Tzg3NVdvQmZKWEtqSTF6N0d1ZXhpMkJjWnlQN2ppaEhzYkFwTGdH?=
 =?utf-8?B?SnFRNzZpMXlzOVpNRFBsUGpLQjdKc0ZyNFd5Z1Y5Z0Uzb2Y0aHgrQjcxRklm?=
 =?utf-8?B?UGJZd2FIVGtCK3YzRmUxRkgxVVBleHF1Mm1SK0JNM0xMRk1uR1dTTlVlUHFZ?=
 =?utf-8?B?NS8weTB4clVOUmoyZEh3N1ZaY3VhYlBBOHJNVTZwa01STTRiWWx6Q3kzN05Q?=
 =?utf-8?B?UVhMZTlFSUVVYlFPT2hVcjRGdEIzem0vcjdUSUZtZmF4Y3NjcW82Q0dyKzBX?=
 =?utf-8?B?SjRsZ012Y2UxekgzenJoNkI0dG5QOFRBZUpibkRORHhwMzJkSWRFMjJJM1JM?=
 =?utf-8?B?RUlka0xLckhtUE80MzBwejVvMG1qd1poaUFDRFJQeWtaS2Y2N1c2VE1EbGhJ?=
 =?utf-8?B?TFZyckpLYzBrdEVGZm1JV2wxOWxteTRORCtncXM3ZlFnNEdjTkE4UFNhM3dL?=
 =?utf-8?B?Q05laU1NWXR6em1oYVVGb2FzM1E5RVpCdmt5anlIN3VhMzNqQ3hZM0JEa2Zt?=
 =?utf-8?B?Umh6ZnR1NlNpN1NmSEtRQ2ZxL0kxRHJ1bWxBZitEL01UQnE0RTdJWW42dklw?=
 =?utf-8?B?UDhpNFM4QW00RStrYU1SdGQ3ZmZuTXZLb09PalU0R0RLOCt6YVcxSU1VOUF2?=
 =?utf-8?B?YnQ1RmdBTzZSdHZkTkZEa1U0cEVaYWl6Ym4wQjRHZ0tTRWQ1K2R6WGdZYTZG?=
 =?utf-8?B?bXpNK2FnY3RVTjZkTXhmTlBXdjZmc1JCWTVSZ2d6NFozVHdvRVd3SHA5cDJR?=
 =?utf-8?B?ZDZFZko2S09JZ1FxR1h2UzdMejkzemVCSHNZclU3L0R1azMyR2YvOUFXdkZH?=
 =?utf-8?B?TndvYS90TVBlOGJGREQrVDl2cHRkVkFUN2E1ZStJK3B3NTlVS2JiaXNaRHlY?=
 =?utf-8?B?QWFZb1RVeGdUZmJsZGhuRkphRVptb1o3eXFNR0FBM1ZtMHdnbHdudjRUM3NH?=
 =?utf-8?B?R2dLTlJ6WGphM3NDL2ZMQ21UZnltZHdaQVFiVXZBdTEvNE1qb1FqNGRaSDJO?=
 =?utf-8?B?RE1xWHR4SkplQzRvNUgrSGxwYVZtM0JCMVdRcjI5OFZQTXVUYlFocC9OWS9v?=
 =?utf-8?B?U1ZKRmQvbW9GUytzN05ZTUpuU2dmM3h2bzJTblpSMENqM29sQUsxa2pIMTZK?=
 =?utf-8?B?QThuenJRdi82V1krblJlRnJER3NYN0Nxd1pJY1Y3TTExS2FWU1RqQXNJZ0JN?=
 =?utf-8?B?dGpTQ1Q4ZkEzNUlsc0RJZ0Z5UW50dWlzZkhDMzdiVFpOdGtRZUZVaDFnWStI?=
 =?utf-8?B?MDk5K09qWjB2cStlL3I4R0FFYW8xMWc3NGo0TnE5TjFOZmpaTVZMY1Byb1Jo?=
 =?utf-8?B?d1p4YjZBSnZyRkdjVFJ3bGJvRjZ4U2UrZG1vWTY1aGZMK1lyc1VNcnJmTWI2?=
 =?utf-8?B?SkVxbm8vYXJrelNrSDRWOWd2OThzeXJsdGszaWd0M3JJTi9DejV1UGIyK0pm?=
 =?utf-8?Q?v/iAENhKw05oRDorZsXqjvE5u?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a7f2ed-14b4-4f75-56db-08dcc31c76b5
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 02:37:00.0057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjoDbDJTQ+nnUKIHqtdZqjU6uP8Euhq9316oHbB/+Gmavx2FSq3db2PgZiZ/ETCY6qsBDtOK0m89kSsKNBcO6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5671


在 2024/8/22 22:21, Biju Das 写道:
> [Some people who received this message don't often get email from biju.das.jz@bp.renesas.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Rong Qianfeng,
>
> Thanks for the patch
>
>> -----Original Message-----
>> From: Rong Qianfeng <rongqianfeng@vivo.com>
>> Sent: Thursday, August 22, 2024 3:04 PM
>> Subject: [PATCH v2 3/3] i2c: jz4780: Use devm_clk_get_enabled() helpers
>>
>> The devm_clk_get_enabled() helpers:
>>      - call devm_clk_get()
>>      - call clk_prepare_enable() and register what is needed in order to
>>       call clk_disable_unprepare() when needed, as a managed resource.
>>
>> This simplifies the code and avoids the calls to clk_disable_unprepare().
>>
>> While at it, no more special handling needed here, remove the goto label "err:".
>>
>> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
>> Acked-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/i2c/busses/i2c-jz4780.c | 21 ++++++---------------
>>   1 file changed, 6 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c index
>> 4aafdfab6305..f5362c5dfb50 100644
>> --- a/drivers/i2c/busses/i2c-jz4780.c
>> +++ b/drivers/i2c/busses/i2c-jz4780.c
>> @@ -792,26 +792,22 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
>>
>>        platform_set_drvdata(pdev, i2c);
>>
>> -     i2c->clk = devm_clk_get(&pdev->dev, NULL);
>> +     i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>>        if (IS_ERR(i2c->clk))
>>                return PTR_ERR(i2c->clk);
>>
>> -     ret = clk_prepare_enable(i2c->clk);
>> -     if (ret)
>> -             return ret;
>> -
>>        ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
>>                                   &clk_freq);
>>        if (ret) {
>>                dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
>> -             goto err;
>> +             return ret;
> Nitpick:
> Leaving it to you.
> If needed, you could send another patch to use dev_err_probe
>
> if (ret)
>          return dev_err_probe(&pdev->dev, ret, "clock-frequency not specified in DT\n");

Thanks for taking the time to review my patch! I will send another patch 
later.

>
>>        }
>>
>>        i2c->speed = clk_freq / 1000;
>>        if (i2c->speed == 0) {
>>                ret = -EINVAL;
>>                dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
>                  return dev_err_probe(&pdev->dev, -EINVAL, "clock-frequency minimum is 1000\n ");
>
> Cheers,
> Biju
>
>> -             goto err;
>> +             return ret;
>>        }
>>        jz4780_i2c_set_speed(i2c);
>>
>> @@ -827,29 +823,24 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
>>
>>        ret = platform_get_irq(pdev, 0);
>>        if (ret < 0)
>> -             goto err;
>> +             return ret;
>>        i2c->irq = ret;
>>        ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
>>                               dev_name(&pdev->dev), i2c);
>>        if (ret)
>> -             goto err;
>> +             return ret;
>>
>>        ret = i2c_add_adapter(&i2c->adap);
>>        if (ret < 0)
>> -             goto err;
>> +             return ret;
>>
>>        return 0;
>> -
>> -err:
>> -     clk_disable_unprepare(i2c->clk);
>> -     return ret;
>>   }
>>
>>   static void jz4780_i2c_remove(struct platform_device *pdev)  {
>>        struct jz4780_i2c *i2c = platform_get_drvdata(pdev);
>>
>> -     clk_disable_unprepare(i2c->clk);
>>        i2c_del_adapter(&i2c->adap);
>>   }
>>
>> --
>> 2.39.0

