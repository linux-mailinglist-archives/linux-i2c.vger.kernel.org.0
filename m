Return-Path: <linux-i2c+bounces-14000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 294A1C3C2E9
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 16:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 609B34F411A
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 15:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB0F33C531;
	Thu,  6 Nov 2025 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sdq1m1/3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB82B303A0D;
	Thu,  6 Nov 2025 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444332; cv=fail; b=cLf8me9V4m9uFdzzseolCfl+E7L6XyVR/1Gu0ivsdXg1+fyBqzWAvafYU1N9VDs16/2bcvppKeuuZQ6cpnqgqb0UDB7cd7BYI0IOF17S9D4T3Fqwe8Ukp1NP4LTP0jHm9iA8nh6beu6y9rl/N57J0kByAltirzO/Nall/yZMxNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444332; c=relaxed/simple;
	bh=5JXpefDSUA2JZqDpSbW5E0uShBMHLSMh02MlPvID4Ps=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iamqzgN275tMfS7SzVTF+m870Uq85SfbHluiZ45eolzS/KQhetL8gqgVkKlEieonq9MLfgqeVg02qWzDB/Z36lRU8jXYMRKS7hglv801PeTbwgjICjyBSHn9Ns+g4Uw/e5/Waaj5Qcd1m9sF0oV1i5etu2S3TwgC4taJRCuaUgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Sdq1m1/3; arc=fail smtp.client-ip=40.93.196.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2DPF2WffQo2tgQWF9cahy3N4AzHqmb/tutTc4yPs4BCEnwRGCInriQAHA7YXpDucs7vqCbTb6IrQrg6OeH6LNVCNe4pD3UMgIi/4hyfchD3l3ONwG17O9+J6OppL0uPE3Om2hMWwmjU9wTjK1qoI7UkV09XtAAhSNEbVtzj2sX+jkeETx1t7jzudPtxjSNn2ryBx/JoU4NPAF3wQbwy7g/8X587CEMicAoRN943rFhh48664brAhluoznBlkvTe/wmRYg06dY1PXl5eSahjW3ZhmjUBDimWB/rakzQ4dJNoHaMlDD7Xdk/Kaj1hV+kWB9rfJwu6KlNC2cJqiFq5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVZPY6HN2qQSWZd81UcyW7wGk10wX0JIHYNLf+MR3NY=;
 b=RgW+GROq75QDOln5LPEfdWNyTA7fv28/1hS86Nb7YF45w86Au7aX2Uft25zjRXuZADvwZBBwRibI3Z4stoXdPgrqbPAeicS8fF6cG32Wcw8k83zJkfdPEO91KW70HI4woi4t4w7rk4RZP3RIYt2zJgQtj28Gcq3ZcnJV1xOQzPp6ZE3WKjUrW8M0HYUiCkKsQOg17Rr2JeU+VMRX5nVktVUF9d0yp1P2JZ42nRmokHr1JDa5rtkmG1dbsAGe9aXVvoQOrCSe64RpjWbPWNTJF+ZJTHGbJ9jCSSpQAGGIzVZQSUEbz0ZKXMzsfmfb7FtefAiS8p4XdkTX0ge+bolV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVZPY6HN2qQSWZd81UcyW7wGk10wX0JIHYNLf+MR3NY=;
 b=Sdq1m1/3/JSQyvUZcRMq051cuX7+8adYmNFJ3lbIScB0F3g7/aKTKSzq1poSM2VffNLQUT4C24nsYSv4tdAL9odcFO0s/Z9f9G4lfOPHcRjD5LUgkvtrMgikmh5yEas61oj9lVK1UUfDskV4czo7MvnR1QIIvQB0pGbLqulflWQW+QJAv54GJTX7QKQLwZgVYnN7Xxx9NK5S5MxbJvx4aI8VBBqvLVjlOBcBet4gJOXEK03kLqrM1nVte9I4DZqN0sqUl4LhmmsL5crOmDuxz4u4w+VLGyJwGBmdPtq52EMOZL6P06NtL1exdhqMClOT9FuGcnvFtZ5xOmrVZ6N2IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 15:52:05 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 15:52:04 +0000
Message-ID: <ed4e2c5e-370a-4fc1-bde7-507ef74f68a9@nvidia.com>
Date: Thu, 6 Nov 2025 15:51:58 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] i2c: tegra: Do not configure DMA if not supported
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001064759.664630-1-kkartik@nvidia.com>
 <20251001064759.664630-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001064759.664630-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0499.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d3f83c-ebc8-453c-3e9b-08de1d4c6eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTBVQVUxenpFZVdaUHZtM3FZMDJ6Qkgrb09uUHBaQ3Z1Y2t5VzJFQTBkTXd4?=
 =?utf-8?B?bEoxNnUvT3FhUG9xeGxnam94QWhwcFRvNmR3SnVpWXZrQ1lic3pmZmRQTllp?=
 =?utf-8?B?QXhUQ01saDRKUFZSV3NnMjR2L0VlRXNOSDM0S09FaW9mNGJUS1RxT05LWS9O?=
 =?utf-8?B?ZkFFYk02WHhTdTVEZnJMQTllTnJHTUlRdGRtRVV1cUErbkxKcjFDSmZZVWh1?=
 =?utf-8?B?TkRmVmpjaXQrOHpIdTV3bXVUdmY5dGVQcWlVeDZPeDhXMmtkUG93OUVzMk9k?=
 =?utf-8?B?Nm91RFBPNnk1V2Zmczd2aW45aDY1cHdEbUw2UE1mTFpRdVNNbzdmeGxEem5I?=
 =?utf-8?B?bHNabDBWc0F5VFU4bHlqTGRRTnIrZnovWGorVHRYMytMdzdHTk1hVE5LUlQ2?=
 =?utf-8?B?UzBTQjF4aG5uTVYxOXJRK0dtZEtTdlBUL2hwNlhnckhIRWVtTXpLbXg1UXR5?=
 =?utf-8?B?WVlWUUNFVDgxSUppR3RJZmE1dmpjOEpuZm1aaUd1Z1VremxNR1NEMGpKcGdD?=
 =?utf-8?B?Ni9hWFFaRVFrMyt0RDFkSFdvUEZINklYS0pDRVJLa25VNXBlWEhHOUwySitL?=
 =?utf-8?B?bDZ5TmJPc0xLWlJCRE9LNjUxUXRhRW5xbFdsS1I0VTVMOUpVTnBmV2FpUEVC?=
 =?utf-8?B?N2pJYTVHMERBRnlUTFhHamFzbC9tbHVzeHNRYUdCdVpVNHJzLzlpTzc1YUJZ?=
 =?utf-8?B?YzdxeFdLN3duRUVJUDZvV2kzeWJsUjVaSDdBck56MjNzR0ZpKzY4cTBjdTNT?=
 =?utf-8?B?d29NRjFkdWhzQUYrVVpwS0t2TjRBNGxwOG1mc09UL2UyNE9oRE9KWmdQQmtW?=
 =?utf-8?B?aDVWNzhJK3l5Z2tPbkhXSFlLVmVJWmxpbDlxbGZOdXRINXJxbCt5cEhhcWpF?=
 =?utf-8?B?WFYxNzV5eTV3aVNiSTJJRG5PNjJPak13K1lIYzhaQ2U3TDYxSG12dlVGLzVu?=
 =?utf-8?B?TnArNDVZSXp3ejlOZ3JNeWN3VEJVWVlPdHVrb21WN1o0SDJvd3BNZjBMakhW?=
 =?utf-8?B?MUpZdU41M2xkSjFCZ21BOFdGL1lEZDdmZnZMcGNoYlJ5UmR6SmRRVmhkVVNK?=
 =?utf-8?B?VnFLaUIycFpFK3l6UERIN09lUStCekQyY3ZOQzNCVmxuUkFGRzkyOWFxcFRx?=
 =?utf-8?B?VXBQSDkyYUdmdER5V2FaaHFxSzJqQWNzLzlxcDlvUDJsUjV5cnpDNHlWKzFp?=
 =?utf-8?B?NXUwK2VTOENIMzhIMFRRM3dtRFRaUlpMQ29DYUoySWRZcEh3UXlpNmNDSXZC?=
 =?utf-8?B?L0tFMUM2bFIzMWFDQ1pCRWtETmJScGVqVzRIWDR3R09iNEl2MXZJMmcwaFN5?=
 =?utf-8?B?aW9xb0xwQy90dFpFZytsWFd1dk5EWC9XYThYUW4zb2o0MUhWTEpVZ2ZndnJI?=
 =?utf-8?B?QS9Hbk9lQ0YrYmhPWUpkbHRHZkxRYXdZdTBneFdoSElYMm9kK0ZacVNXM0Fw?=
 =?utf-8?B?a0lhVU53bzFqWWIycHhoWFJjRnZ5VUFpZTlpK0JRMXNyTnF6MG1ib1ZXUDBF?=
 =?utf-8?B?WGd0MFp3UUdSVDNucXk5eTJnVHhEOXIvakhMSm94RXJUblRiRmF5d1ZlTlpk?=
 =?utf-8?B?Q3ZocW4yK2w2SmRkQnBaTmtBTDNEZExRemxsVDNTREY0dXM4TjVrcGNablAw?=
 =?utf-8?B?M3hZekRiZTJyWTBaaVo5Tkx1TWpydzRMVVdPS0dFUzl1cm9tcFJ1Mm9yM3RD?=
 =?utf-8?B?cE5PYTh5UksveVB4RWIzdkVwczE0dlpGU2E1ZlY4Zkt1QnMyWXdiclI0YXIr?=
 =?utf-8?B?cGwwL2szdW5YUlFRcFY4THNBOENZbEJYSXptai9tcVNSMGRKVEtqck1Yanh4?=
 =?utf-8?B?VzJxNUFWQW9ZWjlBVW9JT2lBZk1vWE9DeXJ6SUM2dzNTZitBczRNRkpzd2xW?=
 =?utf-8?B?aHdGa1ZKQ0pPOW5nUElsTW1BQThZS055YThSOGc2Q01DV2hTVzlQS2ZmWldj?=
 =?utf-8?B?b2VhMWE4SVJLOEhHVklzQllJYUdxdlVNejlMT05pdXJWLzY5ZTRub1plM1Jh?=
 =?utf-8?Q?NNphrFXo6NeRStlNLMhfURzDnGNDjA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmNJQndsU2dBWEtxdjc5bnh5Y3hxK3dNS3poTVJieEF0RW1uak1lanFkTXRB?=
 =?utf-8?B?WGl3T1R5UlhiTEdhbGFSbm4yM3JXUUxjY1YxNGdWRGFHUWYraFNhdVp2TkFu?=
 =?utf-8?B?ZkZCdWhRNkZEWlBjbEwwQUIxNWNZOXdwZnd3OU9nemhPb01FUU11b0wzY1hv?=
 =?utf-8?B?c3BMMlgxc1hkdHJaRFhaZ0lmNzQyUm1PeEU0SzZhS2RtSFh5SFo4aTFUbjI3?=
 =?utf-8?B?Q1pOdkQxT25JdmJnVWVaS25XcGduSC9QK0xJbFdLeHFOZXRHS1J4dFh0ZjN4?=
 =?utf-8?B?aHlHQ2hKN0RIVzdvdWR4QnJ3RjI0dkxMOS9VOSsxdHpwUmVVWFVGTVBPZTQ5?=
 =?utf-8?B?NlY3N2N6VWtwTWFJSTY5L1dVZ0IxUFdzZHBOK1VQTVJYUm9FMzYvS3IraVpW?=
 =?utf-8?B?L3dsUE1Da1VydVNqVkp3ajN2TjFzbzI0YjVROXUzbTNudnZwQU52MUFONU5Y?=
 =?utf-8?B?cTlvNjFsWTlGcXJsL2V2UGduZ2JDVUY1WjZWV0hvTzlpRVh0RDNpT3Zpa1dm?=
 =?utf-8?B?MVNwT2xvK2VjaE9ITUt0Z1JIZTd0K0hYdDZqN2pNVUk5TmFjZSttKzUvVjRj?=
 =?utf-8?B?QU1RcTlHem8xUXJkU1BjVWZnUHpVN3lPaWRMdmpZeXBwNkFPem4zd1lxK0hm?=
 =?utf-8?B?NldmT05sZFpDd2tzeDJkSERvdVpUUlpKMVpNOEMyK0FKNFd0dVk2UFRNS2cr?=
 =?utf-8?B?N21hOVlUaFgrbTZVZURtRGVnU0UvcDNIc1RveWxFWDIzZEM3Rmx3R3VJbFhJ?=
 =?utf-8?B?N0d3RStnb1NIRGFqYmZPaVlMR05lV1BLMTN3QmViM0xRWTFGWTB5S0s3Ulh0?=
 =?utf-8?B?MGkyM3JhUU4yQ0dZU29XQWRhRnNPSnZJRGgxS3J6RjNkRUtJMGhRcjdZMTh1?=
 =?utf-8?B?RzVEM3U0NzNiWEtFMHlHM09kNk9qTDNLR3JHMkhyZmc5MFMwaFY0UTZOdTZD?=
 =?utf-8?B?emtjZmFoM3pPUWJuUEREWmREdjlLTmhpS1czN3lseG9VQzg4SkNMOE84RGh6?=
 =?utf-8?B?U0phem54TGRVME9vbjNCdW5DMmwxMnM4cnlkYmxwdUJQdmNLc0xjeDVYN1Ry?=
 =?utf-8?B?dWlnTGNESGdCSDl1czRvaFBEeWdFVmEvKzNXSk1aZkxQbmMxakdpRDJxU2xR?=
 =?utf-8?B?WFRPOWY2Z3NPSWtwS3p4d1QzY3FrMTNHakJlM05tblpJWjY3TlhLTUpPYUpO?=
 =?utf-8?B?WGxBNU5KdU1vNzBPSURMZTVVaEl4RW9waWpvYTBxSjByNFdiTGNYZ0g4MDlB?=
 =?utf-8?B?TEh3b3hpWG1wdm1zTGRVdWtuUlE3Nnh6U0plc3pBRktwTUYrQkZkLzVlUEh1?=
 =?utf-8?B?VmU0MUNIZ2srL2JKakwzd1g2Q3dFdUQ5QkQxNXNSM3lNTUNNc01ZNlJnYmtm?=
 =?utf-8?B?VHFuS1A0ZFhYcy9RWjFLUVl5azBoOFdRWDVmWTRQTUhEb2dqM3h4WThXZ3BU?=
 =?utf-8?B?S0N5a2tpdjJGWVRLa2x5ODJ2OW1SRmpJOUZKcFFjWjF4akdQdjNaQUNtVmhZ?=
 =?utf-8?B?YU1hTmdGUDFaZ2RIQUxiUjdGb3VNMm04MG9NQWMwNFZaNHlNdkZTZXRpWWVz?=
 =?utf-8?B?RllubkZhNUJNZkpINTRwZjZuaTB5N1ZJMXNzVENHdVdQWlNEOEF2dGxmRUJo?=
 =?utf-8?B?Y0JIdDFyUTYxZG9zdDhZTHduZDJIWmQwbXBEYm5XaDIwck5ySlduVGt0dlVD?=
 =?utf-8?B?eUl5U1FvVzRBS2xCNXBrcFVxYVd0SXRyYkZzTWp3cXVJNTd6TzBuMitpeC9o?=
 =?utf-8?B?cHA5aVZHbSs1dzRDbU43MmxZcG5ZbXlUa0NySVFRSW5uQ0srVktISnA3a3BU?=
 =?utf-8?B?b3VZTnlLUzlRc3JEblE4Q0NQalFZdDF6UFhXdnF2N0t2c2QyYkQvb2dtRXRW?=
 =?utf-8?B?VGlmTnVZenhOUHRod3V6UDRST0t2RTZaa01neVVnZmh4QVhhWjV6M0UvZm1P?=
 =?utf-8?B?QnlZYTVkQ0paeGJCSmZ3czAxOUloeDd2TVpOTzE3UXd6WFd6T1JmeTJTRjUr?=
 =?utf-8?B?NUZpYmtXS29hV1RjZDBoRjl3ZzliTlJzTjNoUEhQSE1hak1IckhDOGZzTzRv?=
 =?utf-8?B?T3NVTmhYU3dtdXBjd0dld1ZNVVZXTTlpWEZXVVNsU1NsNmFVSDUrUlZqbndu?=
 =?utf-8?B?dTE4YXRWcTRrQnZGOGRldHBEN3NPR1ltTEZvQ3hCdFV5ckNJZkoyTEpnQzRj?=
 =?utf-8?B?Z0ZQamcxNDdUSkRoSkIzdjN6Q1llbVpCRktjelBvQ0x6N1d6T0Q1YU4yVjJo?=
 =?utf-8?B?cmxBazZTamNlYS93UzNjUXl4RUpRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d3f83c-ebc8-453c-3e9b-08de1d4c6eb7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 15:52:04.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CL1v4RDomvtyKxJMwcs+K/nN1sPkDoSbfc/hYuBcOls054XOz5mHpfz8ZPXGrKpc2v1lKZI8py+Z+0w+GReNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584


On 01/10/2025 07:47, Kartik Rajput wrote:
> On Tegra264, not all I2C controllers have the necessary interface to
> GPC DMA, this causes failures when function tegra_i2c_init_dma()
> is called.
> 
> Ensure that "dmas" device-tree property is present before initializing
> DMA in function tegra_i2c_init_dma().
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v4 -> v9: Moved the condition down to have all dma checks together.
> v2 -> v4:
>          * Add debug print if DMA is not supported by the I2C controller.
> v1 -> v2:
>          * Update commit message to clarify that some I2C controllers may
>            not have the necessary interface to GPC DMA.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index e533460bccc3..aa7c0d8c0941 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>   	if (IS_VI(i2c_dev))
>   		return 0;
>   
> +	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
> +		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
> +		return 0;
> +	}
> +
>   	if (i2c_dev->hw->has_apb_dma) {
>   		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>   			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


