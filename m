Return-Path: <linux-i2c+bounces-7713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E99B8EEC
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 11:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE50A1F212D9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 10:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB75F15ADB4;
	Fri,  1 Nov 2024 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="TVsOnH/x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020134.outbound.protection.outlook.com [52.101.128.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F28154435;
	Fri,  1 Nov 2024 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456319; cv=fail; b=UPjh4RRxBdHdAyKNsEJCs1ZPYXakJiHYPM1y01E/eLMShW+PmC7iTuvdccfztmyE+7/Qsvl6SrJJSiZ8fiM/D2sxRRY94Yeijp02I4dIySXDS9qfqX9hzVbGd64fk89Z8mp2sCIvL4fJ66pzPq2iWZ6aZeNP/AqHgo6ytNR6coU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456319; c=relaxed/simple;
	bh=RBeiem2TZSATRnd86lUhhdS0M7hOQKUpxPjPIwglkSM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TgN8hk3v8QUwT2ZRCH1/bai2OBhrOsihbNiI8i1ri0//j8El3UVHaEFGhibSQY5BwAIbzJSevBWLY4wOM2bqO+kZGbtjF91gOxX/uldO92Xr9a4BGAmCboK/p6PSgMnVk8cQDTZA/f9XNW7S7HChZy40T2ouOBJHCFRJ3bNuOuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=TVsOnH/x; arc=fail smtp.client-ip=52.101.128.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNWqTno1bkQQbJAcaFeJQmmhhBl4BbISSYvb81VSzAa1Rwsoh8IdK5OSbMKhqMTjmrQtnG5proLO8DdCjQmh8r9MTTjw/TDwsO5/t8803HGNMEAFLCSu+6F8qY9Q1wdhrFaVsX2rtTuFNR2/6+Ib8lD6GU/lljjFrzx89ubyeWgjUDZ1pN/axHca4R9fhj1dJ0D9Q7o5HYRVMwG723Ea7zTIqLVGpqBvIgGomihddCAjNn50rador2KjD8MWcV3ElS46LEE9iJAHpsu6Uy6VFEKXRxJkkTh/orCu+gK9g5YGnXJKMpX2VQMrhvpV6Lq6nTudr8/oDgZkQnSbuK2mgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QA9DnZDxRH76D+8F9m4dMwEWjEKusykATVkqxQ8vIM=;
 b=xkQqy4HvbV6o2qBuNllwhY31tT7AXKpKF9RJ2Ui7+fLdxVKHNyTPB6oudYde7+qQCTXaCVnJK6qSFGI0FvxXvF553TedlHF5q2WX25iyLnwTROZF4Jt42inmqZjOAaifodURYw3ZpaBqorPP3RwZqWOZn9itx2VLOOBtEJB578t37dgnQ0Kqg88JVzISEeE+q0G/IJjSpeujd/6VWJkSiRUmO8IoV0nsT5kfaFWyWY4Xt/XDlrlvo+ZsJ1ms99nfyeEb1zlWKJiT8Q9y7ewhFTZn5M7Bl0rjtx33spsIBkZcF/7q+CH3FgJpm9PPI9ccwpJiTgUrEOpve5cAgdm1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QA9DnZDxRH76D+8F9m4dMwEWjEKusykATVkqxQ8vIM=;
 b=TVsOnH/xUXl+OhYw/c98KfCs6D3JdLRcReFlZ4k6jmpKD9YDG07a5yMeJCX5u6WVNoAnd7S1lEga9GwDwRbZf9ntlIuWx/li1SL9JwAGy3DTEQgNkkeAA5zHIiGrd0B3EMirsLf5bTwthQUC6P4dMee5rFzcyJmLfLwX5cwS+jy7FcvPh+X6Mwcr4FG123tZYftTvcmondLgQseyaj3zptNvQaBaTa1PeuQHZgK7yypefceKAVdEMRrVx26apiZwaUIh8KRK4AHWe/+PP6o9deEGbE0bhmwzERDa6DZ7b9i5fR2kvUq3pGbJen5QKnRZ6kQwQXIrN+9zAiJzFvhWdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from SEZPR06MB7060.apcprd06.prod.outlook.com (2603:1096:101:1f3::11)
 by KL1PR06MB6735.apcprd06.prod.outlook.com (2603:1096:820:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17; Fri, 1 Nov
 2024 10:18:28 +0000
Received: from SEZPR06MB7060.apcprd06.prod.outlook.com
 ([fe80::666b:290b:a932:b60]) by SEZPR06MB7060.apcprd06.prod.outlook.com
 ([fe80::666b:290b:a932:b60%5]) with mapi id 15.20.8137.008; Fri, 1 Nov 2024
 10:18:28 +0000
Message-ID: <3580ce2a-963b-4a50-98b5-52ecac43871c@jaguarmicro.com>
Date: Fri, 1 Nov 2024 18:18:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master holding
 SCL low when I2C_DYNAMIC_TAR_UPDATE not set
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 "xiaowu . ding" <xiaowu.ding@jaguarmicro.com>,
 Angus Chen <angus.chen@jaguarmicro.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
 <ZySU7bEvct4_FbBX@smile.fi.intel.com>
Content-Language: en-US
From: Liu Peibao <loven.liu@jaguarmicro.com>
In-Reply-To: <ZySU7bEvct4_FbBX@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To SEZPR06MB7060.apcprd06.prod.outlook.com
 (2603:1096:101:1f3::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7060:EE_|KL1PR06MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fde008d-a259-442b-afe9-08dcfa5e86e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWxhVE9LWjlwUWYzM205SHVmUm9hVSt4Qk1jeC92dC91YWNFMHNnUXI3NTRv?=
 =?utf-8?B?REFzSnFIdXRQaXUrTHUrNld4OHd5bGxpcVFZQUVlUm1pWENIY211Ykl2cEt3?=
 =?utf-8?B?U0ZRUmt5b2puRE5idHR4OFVET1dEYnhOdWRaVkY1enl5YlJEeVdFM0VlUXlV?=
 =?utf-8?B?NXVOVURCa0tlTm4vL1puRzBUb2NLWmRKUEFFRVllZUp4K0pHUlVwZjlHRkdW?=
 =?utf-8?B?bUpjUG9nK25nVER5amRRTC9Fc1BheTFHenVyYTZnVlpLbjFZSFdpelBsOWtR?=
 =?utf-8?B?T2J2aDhMcVJoVndMT1dNemxzZHBMcmtTOTRTSGN6VGp4eGlraDNUSncrOWo2?=
 =?utf-8?B?VHFlNnl6NzNPalpPdnhKU1JkL0JOYUxKUGZtdGxnaHRLMDEzNytpYmZTRGZv?=
 =?utf-8?B?c0dGYXUwUmhINHlzU3JTb3FlbjZxWFIvbWpXQXYrdnZNVmJmMk5uWHByVkc4?=
 =?utf-8?B?bTdOTTlJZWNFUStQbC8zU2N0eEp3bENwTjdCNHlOV2xmdnE4Qm83bVZRYmd6?=
 =?utf-8?B?dFVjeXBCTDQ4VmNNRUhodXJ3dWZBc2lWWU4rV0VRRldXUVVPUDYrekY1dFBL?=
 =?utf-8?B?STNmanZ4dTlMMGl2RTNNTEsvYTI0anVFVEF0N0xWS1loU0p1c1YvSCtkZFI5?=
 =?utf-8?B?c0VVa3ZEdmp2MWJKa2FVUEdNT2NPK3RHZGFiZkhJMG1XeGtuaCtWZkI3Yjdm?=
 =?utf-8?B?YmlUS1ZaSlNLZFJ1N0J6N3JEK2Z3NG91M1czYmZYeGMxY1FlT0RkTU9vR2k0?=
 =?utf-8?B?RkhiWG1PdXQrb3dCVzNvS1VVQkZCMGo1ZjZhOUxrM1J0WksyUjdwR2FKN09F?=
 =?utf-8?B?MnNaaVNTbUZFdVVIZUFCb0tSOUxJL3k1Y09yeG9IaDgyM0dRRUlQVS9BNktL?=
 =?utf-8?B?YjIvZEZOZmZuR0RGbUl3V243SUZiV2Y4OHhjWnRYdVo2MmxIL2EwdjFvNjRt?=
 =?utf-8?B?dHlmWnJsL2NsSHdiRFVSdk15UkZobDlEUjBJZXRPQWdOR2JwZERpN3pHYzdY?=
 =?utf-8?B?alVodkIwRmhIa1IvNkFwZ200MkJVWWFlZXAwMG9QMC9iZUJlMkpPL3F1aWxC?=
 =?utf-8?B?YVN2ck1Vb3NzSmhoZ2h5U3VyRVVFSzBVeDc1MlE1MU90YXh0WGFaWDYxeTFl?=
 =?utf-8?B?WmdmREI0YWtQdVNoL0VSQ002cVJqU3BrUlNMd2hBMngzKzZhc2FEbUMxNWlF?=
 =?utf-8?B?REZicXlDa0U0NktYb1E4WE9QbC8vR05iemF5eVZaTmFvV2NQVmMvUHdCRExm?=
 =?utf-8?B?MW1La04zY1E2eFM5K0gzS3JINnoxVjZpRE1kL2hHOHk3SHhWb1FuZE9LTmEv?=
 =?utf-8?B?QnFncllwTnRiRmc2cGh3M3FrZmVFd1lnNkg5YVJ5czJSc3JMeDBzaHBXeEll?=
 =?utf-8?B?WWM1WmhON0x2SnFITVgvSTd4SjQwMkNRU0plcGhxWlcvTW1SemlQSjJrNjd1?=
 =?utf-8?B?bXZzTE1LY3ppNHpSeUtyWjZUZmJxaDlrbytDMTd6dEkyVzR2NzBvSUdOTHBx?=
 =?utf-8?B?MnFiOUg0U1NIMWpNNDJ6VWNkblhXbURRY0ZUd3pXU1dKU0haVUZ5MkY4bHNZ?=
 =?utf-8?B?YU85SURCVUZRa1VoOGNNUEVxL2g4VGl6Qk1tZEwweWVsMnFqY3o5WFRwd3pT?=
 =?utf-8?B?b3JtblFreVQ5ci9aTm1ybmFqQVQ5RW5QQy9LYjFyZ1U4UkxEZEdhMFdLTC84?=
 =?utf-8?B?bCtFVFd1alJqN3I0dlphL29RRm9jREpzbmpNc2pFVG1jVDNyVXE2YytTZUZl?=
 =?utf-8?Q?O1uK9OZQ5rG806fe/8tSKZ7icefovnT2lL5vo3V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB7060.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0E0VStMNWswTjJ6RXhLZGN1a1JiQk5BZWF1VmlyNEpZRThuQWM3bS9VRU1Q?=
 =?utf-8?B?RmFpZWZVOUJGVC9vTlJBeTlsbTRnWnJPNXp2Z2ZZWkdHQ3pWRTBsU0JqVU15?=
 =?utf-8?B?ZWNEdzRsYXV2VmNFd0t6VUxsRlBucjI5ZEJ4N3M2OGF5cTUxcmYxSWl1YkhL?=
 =?utf-8?B?Ulo0MnBUTVQyZzBJalFCQkltazVzcFVwVzlQOE9VN21QMEErVGkwSjhjSjZ2?=
 =?utf-8?B?N3lKNjdaNENTQzV6LzVINUdESmhTWW04bUt6SGY2WGZlT3pPZmFnVFZkaExH?=
 =?utf-8?B?c01wdFJzWW52WDN4T3JqdkFnUmdCeTV2OUQvMjM1Nk8yY3llSnErc2FoS1l5?=
 =?utf-8?B?ZVFOS0hlSzM1SDZVajVQSU5ERTIyalAwTkdmVjBFZWFycmRFdkU3TjdjcXo3?=
 =?utf-8?B?K3NOV0VTOXFLd1FPcUcvajB4YmxWMnYvRVpXbHBSUTAzM0NiMHlOVVZpcC9t?=
 =?utf-8?B?YjlpcXBBTVV0dVZVejlhUGlNQ201RUQ2K2dkdDlQVjRMNDVpK1NnWEJobEQ4?=
 =?utf-8?B?L21PQjE3MW01YXVGSndFOEhsbkM3cjRSL0JHQmRPS3lzd0FTVnQ5cUJRQTFD?=
 =?utf-8?B?Q2J1cWYvaXczMlVoYjI4L0JWM0FiS09JRkVqeGhwZHRhcUcyV29GZDEzMm1I?=
 =?utf-8?B?YklRbXJCMEdIaUxMMkp0aUhkZnZTdWloWEgvYmxXLzRIdXhyRkNDelN1M1Mx?=
 =?utf-8?B?aG02aDI1UHBRdkhQanJ5b2loSjQ5aDdUclNzaTdpNXdqTXB0UUxJOUpxaEFN?=
 =?utf-8?B?VEU0eG5OV0sxTUhySFVkemVlb0tiVGhjTDNwMHNCN2U0aFd3dExpcndER0ZK?=
 =?utf-8?B?eEl2cHZqTzJuU1VVT1dOZC9xUnBkbHhWeU1WZmlaaFdPOVFpMXVUbzI4Q0wr?=
 =?utf-8?B?Zm1FYnJiN0NEQVcvdVYxbnV5bUFVQmRuVWxLTEx1NnJhaExJS0hyaTY0dm5t?=
 =?utf-8?B?SlVWYkZHQzhMMFAwTmhZUUkxNVdnYjNSd1VsTVhJbG9ZTXpscWY5eE1EQmt6?=
 =?utf-8?B?YzFSRk9wT0h1MTFxa2pZZFBBTGdKam1BZnM0RFNnci9zWXVCbzFwaWl3dE80?=
 =?utf-8?B?QUhBSE5kU1g5bFE2WHk5cFRheVVBczVZdWZoZmN5M2VTTUtBV1MrY1N3akpP?=
 =?utf-8?B?c3VsUTN0aTZhaVBVTzVqZVhIbmJvS2hzUERxV3V6SG8rZzArY0thZXFhS20v?=
 =?utf-8?B?ME9PZm41NXU2Um9jUUorUEdWUTlUdGp2clVDbGFvWlBFaURPbUV1WkZkYmhu?=
 =?utf-8?B?NkpLeGJRSkwvQ3R3czNiMHZZek5NbFg3TlFla0t3a3I1NUhiSXNqVXZFTm1q?=
 =?utf-8?B?NFVyaDgxR2xPdzdnY2pmd2s2WDVrb1BUOGNwMnVKTTJHdTFxRFdKV3NaaVdW?=
 =?utf-8?B?OTdXTzRiNjhiYkQ4UDVrbnB4YXg2Q0FRdDZqL0FQZUdKUExBWjdiRml0OXdv?=
 =?utf-8?B?Q3NqQ0l5NkhMT1NRdWg1czJENnZ1SEl5dTY0SzRqSHlhSTlIcEYzTFdIZXVU?=
 =?utf-8?B?NVBYSXRGR2x2YWswMk9wc1JQbG55b290eUxQaHhxMzBDUEhLVFNUM1VtaUN6?=
 =?utf-8?B?MFB3UFU2SERFc3I3b3lTOHpoTXhvb2ZLWndUNTZOVm5RRmtHdTFzRzB4VzNt?=
 =?utf-8?B?eXZRWVRrSjVsN1NzSmI5b0JQd0hHRTN5M1F3OFN6aGpyOC81V1cyUXFwV2Uz?=
 =?utf-8?B?RHZudWx1WWVKajc3NW0rNkhaTklRTCt1TzRRdHZYS0dUSGptU1N1Z0FpWmlF?=
 =?utf-8?B?WDdDbVJmZGZGTnhBTzZpY3lEMU1iZEZXSmovbWlZQW1HaXYyY3pqYjhtN2xq?=
 =?utf-8?B?UTlwLzhlcW5OMFRkdVgzTk5SeE51UTdXTHhSSWZsa3kxSjNXNHVsa1ZFRzhs?=
 =?utf-8?B?QjFoY2xlWGpFS2RobHhFaDQ3Zm8ybENob3V0NnRWNXZsRDIxK3lOR3RFL0dH?=
 =?utf-8?B?NDZSUUp2Ymc5WCtDQVNncmY1b2VsWVF6TDIrS2o5K09PQzk5NEFpWitZQmVM?=
 =?utf-8?B?TzNiUmR4ZXNTbUdQbG1raWFSbUNLTDdOOW04VkNDbzRZODZaT2Q0dmJmZ3pp?=
 =?utf-8?B?ZWM4elZFM1FFZzllNEUxL0gxbVlTUVRjQTQ2TjNwN0prVGtmdGdhM0tidjMz?=
 =?utf-8?B?WmRjTXdzelZuQWpKZkhDbHZYRWRKS1R6d1ZxUzNleTFlcmVoMTdvKzYvREZR?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fde008d-a259-442b-afe9-08dcfa5e86e8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7060.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 10:18:27.9184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GB+zbc99OrZ4ozs+BqdkfxynykA1CDN5WAf4G23k4kZDjtfj3EX/qjj3zjR12zkCqEAHQYhUx9vxKeqlSYolsShcWLoMVILy5OG7psadWOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6735

On 2024/11/1 16:44, Andy Shevchenko wrote:
> External Mail: This email originated from OUTSIDE of the organization!
> Do not click links, open attachments or provide ANY information unless you recognize the sender and know the content is safe.
> 
> 
> On Fri, Nov 01, 2024 at 04:12:43PM +0800, Liu Peibao wrote:
>> When Tx FIFO empty and last command with no STOP bit set, the master
>> holds SCL low. If I2C_DYNAMIC_TAR_UPDATE is not set, BIT(13) MST_ON_HOLD
>> of IC_RAW_INTR_STAT is not Enabled, causing the __i2c_dw_disable()
>> timeout. This is quiet similar as commit 2409205acd3c ("i2c: designware:
>> fix __i2c_dw_disable() in case master is holding SCL low") mentioned.
>> Check BIT(7) MST_HOLD_TX_FIFO_EMPTY in IC_STATUS also which is available
>> when IC_STAT_FOR_CLK_STRETCH is set.
> 
> Who are those people? Why Angus Chen is not a committer of the change?
> Please, consult with the Submitting Patches documentation to clarify on these
> tags.
> 

We have discussed and analyzed this issue together. I developed this patch.
This patch was also reviewed by Angus Chen and Xiaowu Ding.

And in this case, should I replace the "SoBs" with "Reviewed-by"?

> Also, sounds to me that Fixes tag is needed.
> 

How about this tag:
Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")

BR,
Peibao

