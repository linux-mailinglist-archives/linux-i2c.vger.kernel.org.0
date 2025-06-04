Return-Path: <linux-i2c+bounces-11236-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59244ACD591
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 04:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C5617CE4D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 02:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6EF145B3E;
	Wed,  4 Jun 2025 02:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R2YrXCJ0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360F03BB48;
	Wed,  4 Jun 2025 02:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749003908; cv=fail; b=GEvdARqkmDH0raKStDFeqNjIxWVLbfiAyUvg7CTtMdsT3SNfT4SUovRIvsE2839T/D7VAm+RmbABVRVnQxoHNSFx5AKXOh81qwKMeDAe3HquT8gdWvw4eaO8E/gfxtmUp/vxJ8RJWNY2cHuhsluDUZ1bp8tttMNBdZHoizUhoHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749003908; c=relaxed/simple;
	bh=y7bZGM3WYMrEm7EMXOf9BpYF1XNDypdNpuP5kc4H4HQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NQulV4IRkjAY9BPVqvhpvgwB/juo1vnpjPR0chEoQk9g5yigBbiLn2E4i6ey9QefKrKrm9Sc19sqMF2P+XlXnZFMFZcnS4kQz3EoGlbCTDufunIPXyi2oTlIE+4Oij4GsyKmNHQ54j9ax4cG09GNfgo/prZNaTeaeQbb5WBhvzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R2YrXCJ0; arc=fail smtp.client-ip=40.107.236.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlarPxiwcpZL02nKzyCUx4hb+qAQbcaCCNRyGQW7lsFb6/kRzWLIwOn56T5UJHb/qFbiEVQCNV1GFq8nfvlSUc5gI7JroSo47l6Gfc7mAUGGhv1Yy3OscBOMQKHT6Agi2PfKHYHoyjANxAf5bz2WNTNdku55TIzY9M892qPft1meENzp0Xux2Ej8uw+oNsPlvAsZoKRzG/z4uz8R4w9DbpOXlScsc6ta1DKzlYHoFMCb9x5c6qamcdoqsj7RWC6e3IVCf6/SUHnJVVv/lPcbUdeZDWStXts8yLeRmzRVvAINpaRoPGNkQSnUi68F+ZMLSuku0t3nAYQBTQtyJl3j2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2qosL2msqR3/v+7vc+HOK9aauhYlcU5wVs8F8YlZUg=;
 b=qQ1F6Kca9I+17IJCdQMJs/MZX3pbowHX3sDqRLZhO2PR5ToIPH/RKYHPS/pFwRXHbvtkFarJkUQaN1TM2shn/aJDx5tRT+bC0XJmfJwuVnmwCBATT1Uz6VJXP6+IK/sikBfjV1Z7AyQR2Ry7Gl+MiV6laR39QmtlQ4MCWHJCfwoUx/+m4zN40genvOGwkOQqxuCAHMDLtbfW3SP7jYiPpmc8HgB3emtNCooLpR/sdUmoTyxHWW9oK4v1Cd6xd6jZFr1T5ci90gOgH9QnSklkwYPib5vTaoX+OKrPa8YljXfgYzAk2hM6rmSCVEZeNpVT+ZGi1An5dvkLPJtcefnRog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2qosL2msqR3/v+7vc+HOK9aauhYlcU5wVs8F8YlZUg=;
 b=R2YrXCJ0ZGfJe8JGV2xRmXXx2fu8WWY7SgUQEbJ2MmvSpcl2ygosXSwtQGfK0j36dXVJx0mgP2kyjjBGKP9lyar/RuY8k5Pd02fakjT9Ogc4L1+fcRg5fvGk0iDrTGPQ6WBroUmpPuoq7szMrPiG6x16Q58zpzQVUFL0Ezg1ZPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Wed, 4 Jun 2025 02:25:03 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8792.033; Wed, 4 Jun 2025
 02:25:03 +0000
Message-ID: <25b88913-8d52-4d0f-8906-699544d4abb7@amd.com>
Date: Tue, 3 Jun 2025 22:25:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] i2c: designware: Initialize adapter name only when
 not set
To: Randy Dunlap <rdunlap@infradead.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250603214611.3039787-1-pratap.nirujogi@amd.com>
 <20250603214611.3039787-2-pratap.nirujogi@amd.com>
 <0993ec4e-c0cd-4e63-a0b3-3b9db0082279@infradead.org>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <0993ec4e-c0cd-4e63-a0b3-3b9db0082279@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0453.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::14) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: cac3b370-ad86-4769-d7bc-08dda30f034c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUQxQ29ZS0xpUFdrdUVEdCtOS2JEQ3hTZi9EbDhiQ1UxdjdDZmpEajBzMEJV?=
 =?utf-8?B?dndHb0FhUkhuNlZFYnJ6RFoxTkhJY0E2WVkzVWZUMCtFY3RYK1loUlpNeHpP?=
 =?utf-8?B?SFN3dGZ6d2FxYmFyLytOS1UrZWNEZ0VaeEw5K0phdHpPRVdNd2JqYW55eEs0?=
 =?utf-8?B?OUFMU2NYRC9zTWh3aW5qalRVYk54S2VtRFZMQTVRQW02dFVQU2tuclpqS2tj?=
 =?utf-8?B?K2pRYW5Sdk5uL3dQZEtDc2l1MnRUY01IVVBzQ092bGRVZGcrNmJOREIxUlFl?=
 =?utf-8?B?UWsxSGU4NjQ0MS84TFM4N1BLcTJnditwRUpWSGlKVHk2bnV0UVhzS1l0ZUU4?=
 =?utf-8?B?VkQwUE5JNWtlTUUxSWxjbjJUSGVGaFhiaVF5M255VGs1MGdqdCtsbGZheFNt?=
 =?utf-8?B?TEpuSC92dWxOSUlITTJoYjJNanJYUlRyYmc0UFhqTFkvRW90NHVGSU1nNm1w?=
 =?utf-8?B?S251dVBJbmljbUxpL2FBRG5UVTU2Ync2STlhWnA1SUtscGlFZitFYlZZUjZ5?=
 =?utf-8?B?NjN1empBajBPVXQ2WVA3d1dBMHNWS20xZDZGWEUzcVEwTWdUQko2c1RvZTEz?=
 =?utf-8?B?aVVlU1ZrN0UzZEZlMzJ6OElzci9qdnZ1dVZiZGpHaytUeURPdHBreDhQS1ZY?=
 =?utf-8?B?UENjS1BCZHFjb3VsOGZlQTVWcndWY1lQTWtBOW5nVktxWFIrZjRnVEU3a0Vw?=
 =?utf-8?B?bW9VSFRuMlJWN1Y5T1lkUFhFMVE4V3BXdGMvVWhyVFdFcU9yV0kxOFhqdzQ0?=
 =?utf-8?B?aGVFY1UwWHNVSm1yY091cVFwYVVKWUw5Z0FCU3JCcUtna01kcUhTRC9rbStn?=
 =?utf-8?B?WWs0alF4UDlWUGxHWkpVYTEyUFdVU3VkYi9HOHZFRnB2ZktMOVJlM0JaeC9H?=
 =?utf-8?B?eEdzWkJISWw2MUYwcFZUcmlub3dSempCb3F0aWFDMWtMaEZCajVpaEl0Rjdu?=
 =?utf-8?B?dG1Jb1JHL1k2am1FNmYvV1ExelZOdU0vRFc1YnhkYkJ3Y3JqZWN5RlZCOWNn?=
 =?utf-8?B?YlRtdWJ4a0tiVXpEMHZuZExUR3U4U0pUKzd5bGJlU092WFJxaHk5cTg0bjN1?=
 =?utf-8?B?SE9lYWtrVDlJeitHckt0V0REalk1a0xlOFprK3ArcGZWNjVRbDBkR3BWZUJP?=
 =?utf-8?B?RUcwSEJxR3FzL1UzUUNJMVE3T2dScXFzNWpQUm43b1JWOUd2eG9jWXduQWw5?=
 =?utf-8?B?MmNiaFBrRWlJc28xVG5uNEhaMFNEd1g1dWY5cVBLZVoxZGdaSFgrN0VUTkcy?=
 =?utf-8?B?TjMyRjR5cVJXWHgzZDl0SU0zMndUaXJnWTFXanhqNTdMaVFYZzJ4R21HajhV?=
 =?utf-8?B?VmRaNUpodlBTeEo3bDUyaTRxRFVZYnJwTEcra0FkQ0hPY1BCUHk3bFNvWlI3?=
 =?utf-8?B?L0h4cGRZTHNlazBFY21KdzBLZ2Qvc3Rwb1NEeG9WdDFhOTgrYVU5RkkxdzNz?=
 =?utf-8?B?Z1F2S1J3V052N2xRZnZOaHR6bVdrWmRVandyZU1BSm1tQjViVzl2SFltQ0l2?=
 =?utf-8?B?ak9LVnB2N3cwMWRTaGQreHRTcGdlVXJDTlJXYUdUU09WSnM0eGxZR0hpbHRw?=
 =?utf-8?B?UWJTZGwwUmpvdC9NTm5BcHZka3YzUmdjSEQ0SCtYUVkwenZEdjVyKy9RZ0Jw?=
 =?utf-8?B?S1pZOEFJbzQ4aGdIalplS1ZiM1ZCdU84SkNvUTZ2VXpIaDE5TFRvSlJHTlRs?=
 =?utf-8?B?RHJCQVJQZVlCaUU5cDZRL3ZBWjhoOCthR3NRT01ldG5KT1krSkFzMkZPbktH?=
 =?utf-8?B?UzBDdlk4aS94Q0pnRnVsMEFSNjFzNXFGR2hURVpSREdFY3lMNkpEK2VvTnZ6?=
 =?utf-8?B?amVzR3VXNnNSa0lyZmtmYVArd2RsVXRHUU1ES284THNWUUF3TmNBL2NmdkFr?=
 =?utf-8?B?dGNMa1E0OEc2a3l5VkxkZ3ZKWmhyUTArZlMzSU1md29BN3ZYODJZQmtxTTla?=
 =?utf-8?Q?UDJW9Zn77LE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzcxVzRwcnNzVkdwWkF4WnRpdGsxazY3OXBmNit4Wk9hRXJiK2Jzb2VlalAx?=
 =?utf-8?B?YUZFSHBheVAvMGU5RndsTmxBQTFmSU5MTTVJLzlqL2VzUkNzNG9CZjkrYW9D?=
 =?utf-8?B?NnNOZk0zODJIZFhRQjVVczBsWlpwZzJKczFwbXZyY3JEenhHUHk4TFhnYm1Z?=
 =?utf-8?B?QldCWVBiR2UvYmlNVWUzVkZBMFdva2lmMVRMWEtnNEtjWkVUbU9jeXdmcXA2?=
 =?utf-8?B?VHhEQ1ozY0J6ZlowSEk1RFI0azFsZU5XdFIxRnVCL1VROXpBSzlrMStUbmhu?=
 =?utf-8?B?QzNHbnhUOURRTGcxUU1vUDNFYW5uTnFYbWJCQ1JiQzc1a0VMbDBxV0JxeWY5?=
 =?utf-8?B?MmNKOGJmM1k3WTRDdmpBSi9paGZBS3paYmY4VUluYnFlT0Vtd2lkNWhSa0Jw?=
 =?utf-8?B?ZGVlYXFuQzlYcUh3T2FiUW9IOUZiUWVZUUdwYlY0UVdsY2RSM09waVo5L3pI?=
 =?utf-8?B?L2J4Tmd2RWxKRWNwdFlEeWNZQUt4c0Y1SzBMaXRsbEVQa0NRa1JVZm5BVVNs?=
 =?utf-8?B?SXR6TmVLbWdnZmZKdFhTSEhqdHdXRUhLNUlsNVJ0L25lc1N6QVlMaFVhaWQw?=
 =?utf-8?B?a3llV28rc0VzOVhxQ2loWHlFSk9VZjBRanljblhTQ2FySW04RnhuL3ZMeitt?=
 =?utf-8?B?VFpWNGVyeXA1TVZvNGMzNXZOWE1sNGRLKzhLdW1acHJVY0p6RVNDRHVKMXpX?=
 =?utf-8?B?Rjk3NVNrcFYzSFBqdnVMR1RpN2VnVExpa0VCRmptYmFleWJCR25FaVJIZGEz?=
 =?utf-8?B?UXlBTEtONEI2MW9CdUcyMFNMM3BYanpmaURKQkJXZTc1ZVFtaU9BZnNoYUFp?=
 =?utf-8?B?c283SlZWTUZUdGsyQ0ZvVmt4VU5MWUplM1llczg4K29sbkJDZXdaOVhMK1hU?=
 =?utf-8?B?dHU2dDRvUzdMSXd0blZDQStzallRdXRPMGNqS08yU1VCRGtVRkh5Z05FNThz?=
 =?utf-8?B?V2d3Mm9UanpJYURYaTlHcm1FZmNXaDdwUnNKeEY1eG9LRXpYSGVhUzFZZzdz?=
 =?utf-8?B?dTdLaGk3MjQxNXBEZnQ2RnpUMXg0OHVwVW54dHFKZVlTN1U0WDRzZXZJNlhm?=
 =?utf-8?B?RnA3VjJhYjhhSTdDVnU3NnZJUURqQjlYdk1oUmpzekd5QzlLeHlLa0lEWG5u?=
 =?utf-8?B?L2xOdVlLNHZnazJraERxUzhPeFo4R0xvTkY1N0pUYjg1V2FoZk15VnJSOXcy?=
 =?utf-8?B?dlpDcU81V2haWktQNHg3REsvdVdpZ25ZdlZ5bFJIeWRTK3htYng3ZU5qcXIw?=
 =?utf-8?B?OXJXNzJnSHpYUHp5bnhWOFk3TzZrdHhjcVNpSDV6TEtqVEFiQ0U1U05XNXlS?=
 =?utf-8?B?cDcyQzN3OUZtM2Erem5HeTJQdkQ0S3pZSWUyTVNFYmF0WlBVbERtYzFORCtl?=
 =?utf-8?B?bW1IV29NQWxhMy91NzZWRzN5bGMvMDdwZ0hIZy9Wa2wycjZ1cElLTTA3L0Jj?=
 =?utf-8?B?cTV2V3hOUzlTaUtXVnBoY3RTNitVb0xJVkY0bWxyUmxVazlSS3FlMG45eUtQ?=
 =?utf-8?B?MGVmakVTSStSc0lySzExUWR5SzhNUlZxa1Y4eFpuY3NaRjMycWhxWWcxS0V6?=
 =?utf-8?B?S0hTUjlpR0psUFlheE1RRWUrWksvenBJcjBmR0tBVFpVTVlUUUtDS055ZUJX?=
 =?utf-8?B?U3JWbDhkaWtBSmRlZlJocDVlNFNOb3k1aCtBTnNQNXo4bi9saVlqWjJ5c1NJ?=
 =?utf-8?B?Z1VpNTExRnovRDU1eEI2Zm4xaGZiSngwTlFFM0xoaU9YZkdvT0JHeW9jbXU5?=
 =?utf-8?B?SWRqK1R4SmVlYVVwa3BSSml4MVRpSTl6M1ZxVVZMaTFOTE5xUDZOcENpUUVY?=
 =?utf-8?B?eXErb0M4TCs0djZEcUYrQ3VRN1F0dm5TT3pMSGhwakU2aS90TEUzd2JPNHRx?=
 =?utf-8?B?V0Ftem1iSFZyUUhCSnRjTmFZSnVsTVF5cE1uN3VtRWpQNk8zUlhkK0hhU3NQ?=
 =?utf-8?B?RzdTQ1pzemRJR2pyNzJQcGpBU2hzakdtNWNhQkdXVVZ0R0NPSFE4ZzExaVZi?=
 =?utf-8?B?R3ZhbWdTQnFYTjJrU05GMjFQS1JxazhVRUtEOUt1VWdLVTg0K1pjOEtpYWh6?=
 =?utf-8?B?R0YrdmQzYjE4NmRiOXp4OGVUc3BycWlWVmdOdzQzeVZRdlZjd2NIOGF5VXJX?=
 =?utf-8?Q?Vt9a/nuUkLO97ZHM076a/6u1/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac3b370-ad86-4769-d7bc-08dda30f034c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 02:25:03.4768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26TFxoTtoVll4Wd/4LW9enkk5JjhdrnaziymVJqbENqS6ZOyBoPFDJ7kkBm3/ObSEPlmyAyxnT9rkMj3nccoZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023



On 6/3/2025 6:50 PM, Randy Dunlap wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 6/3/25 2:40 PM, Pratap Nirujogi wrote:
>> Check if the adapter name is already set in the driver prior
>> to initializing with generic name in i2c_dw_probe_master().
> 
> That explains what but not why. Commits should also explain
> why they are doing something.
> 
Thanks Randy. I will take care of updating the commit text explaining 
why this change is needed in the next patch.

>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks.
> 
> 
>> ---
>>   drivers/i2c/busses/i2c-designware-master.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>> index c5394229b77f..9d7d9e47564a 100644
>> --- a/drivers/i2c/busses/i2c-designware-master.c
>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>> @@ -1042,8 +1042,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>>        if (ret)
>>                return ret;
>>
>> -     snprintf(adap->name, sizeof(adap->name),
>> -              "Synopsys DesignWare I2C adapter");
>> +     if (!adap->name[0])
>> +             scnprintf(adap->name, sizeof(adap->name),
>> +                       "Synopsys DesignWare I2C adapter");
>>        adap->retries = 3;
>>        adap->algo = &i2c_dw_algo;
>>        adap->quirks = &i2c_dw_quirks;
> 
> --
> ~Randy


