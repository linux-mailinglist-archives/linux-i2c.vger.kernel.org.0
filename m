Return-Path: <linux-i2c+bounces-10660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC90A9EF9D
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 13:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4156D3AE38D
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 11:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E32F266B63;
	Mon, 28 Apr 2025 11:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EA6TOIpB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E81263F45;
	Mon, 28 Apr 2025 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840932; cv=fail; b=O68U5xUkZq/5n/4vb90iAN6sZkNtseF/F4wY1wBln/4Cm37l821cPtjgLxWoCKE91/89NKZb2mvuzKdsj/LaEiOWRmb2N4cGlNt5ZOrxyAhRfvngnjDtT9LNUy478hNeTEvIqdAx493MTqtvj5LE4LHron+TJtLivTgY0zmf7P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840932; c=relaxed/simple;
	bh=APWqGgBEOYV61VkOgIGPgX4IrKwTSCfnYzfFKe7n0tc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bBzSY/i/Iy3/di0TN61qZIthGUf1lCYKKy93/TsjLRS7MkOIlD9cr92mQkCLu0j2xKpIO2ukUHomALGx7I2WJWEntK8U6rGIRYJTUbgtLnBmpCYfmO6khVYMVZ7GleJo07nzdXT/wQRVqUovkys5WKStXvG6IKJp6Q0KktcYAZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EA6TOIpB; arc=fail smtp.client-ip=40.107.220.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANYtPE1/6mRNCHMqSTp870BjQwbtkUax+ta5V8mHaNVm1iPuosp+ThAfHO+BO8MzaSd1tZW2XdKCMj1lskeIqSMjbOqi3UK3a0ROe4Z4AcG4Ag8E9OQqb7xWYhkdpGNs01pSnGoQtEWESUmKRFe2tAczb1DiBVJZ/oGNxC6/svcZ45/Pya9vskjH7jGbaueHajpUEBTLgP87V3D8PQaZRT1osr3sddLfqgcnbEgpLfkRYqTgmDmXi00R3frZdpKX+GA8yd+JVm7Vkam5M4MqAN/lH9A+00vQf+iWVQdrmeW2FMcRD5hUDJSbdCdcLkvL7s7xeA3+8Cz8zUii+l2D0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52YiM4fwiuvxGgp5MWQwUCjCOWVZdsLY2wiqrFlt+VY=;
 b=b2tyDRYzzT+vGQ7ahEIqbclEskltcpBWyEP9wqZ3wrUV9AdaDVWAWreEJD6g3IYsK4Jo6lD6HKSdluGer0IIiM+pk+ylCC3C2Dt6TOZdPs1IjwDYZwfe3KHHtqL8ZiuN3EYzIdYXpJ5on/xySgB/tOWw65AJmq7CZdAKs/mIHz5ZonjGgHsv9HWWa2Y5PPlTRrnX/Tpb1hd+IyfSwNzK5Mr/gZFooCEUFtoWbsk1gXNP7uXAzyj5KUQJkRlV0B4+I9B0d1pXT79uYwEaXxIqlHBYCA2lHFcSaqsUHqhyrnriwJVrQ7eLEUFC6B70E2wDJGawRszQNcLH6rC/GbRVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52YiM4fwiuvxGgp5MWQwUCjCOWVZdsLY2wiqrFlt+VY=;
 b=EA6TOIpBher91fp9ZvRVHv+DoDGPold5ZXnBb83WDLiKtuNBNa1fK2sscQjwNkPsF3Jc36spFvYvjW1A/1D5KBxja1Y0Ip8Bh3nl9Dbk7BHHBIrSdXHQYVG6UJq5YigLbm5tB4jnDJItprrkxNUk+3IIjnQePtdjy5p96S9LX5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 11:48:48 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 11:48:48 +0000
Message-ID: <ae5b76fa-cc5c-46dc-a8f8-46e14034e2f1@amd.com>
Date: Mon, 28 Apr 2025 07:48:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: amd-isp: Add ISP i2c-designware driver
To: Andi Shyti <andi.shyti@kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: mlimonci@amd.com, christophe.jaillet@wanadoo.fr, krzk@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
 <i4fqptobrabmsok6eaphyte3ihwgqnz6ar6k6h6tw7d5ovimek@vjp2tjlzm7oh>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <i4fqptobrabmsok6eaphyte3ihwgqnz6ar6k6h6tw7d5ovimek@vjp2tjlzm7oh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::24) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|LV8PR12MB9620:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed67cae-2dcc-4864-d164-08dd864aa30d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE96Ri9wT3p3ek1NYlVCMitDeSttR3d3SkF1MHpnL0dKRmp3VmpUODZ1Tmpz?=
 =?utf-8?B?azF5M3pDTGdLSnM4OFRtZEYxS3I3MDBDRGtBSzBjY0FhZXhBbWFOaURZUlZi?=
 =?utf-8?B?Q2NNK1AwRnhyRit1TEszazBTSG9yR0kxMlRjVTBUcEt4NG1UcGs2V3VZT2k2?=
 =?utf-8?B?N2YyaG1wUVZEY015M2pTUGthMXhzaGZ5R2tLelBHd1dZNHUrbDk0TWdBOGNZ?=
 =?utf-8?B?L1JhaVBzMWJYckdQUjZJSjViVk1PeFA5emVaNDNvNngvcDU4TDMxTlN5VnpE?=
 =?utf-8?B?NWFwOE1xUVpIcXBUR3l2c1JJdzFKckdIWnFJUnIxOU5PSXZsZlFHLzkzK3Jo?=
 =?utf-8?B?WUV1WHV4ZFYyL29MZzlFeTdzM1BYRGU4QTEycXc5dlRzaklaYnVEcE5VQzA3?=
 =?utf-8?B?cS9FTGt6THE4cGIwZXgzZmpvdWFHUG1qR3ZHT2kwWlk5ckhWVy9nSGdQRldv?=
 =?utf-8?B?blBtMWl2L3JBT3VkV2VwdG1XRkJGcFA1M3pEbDZpcmRRZVRLWkM1azdlQlF2?=
 =?utf-8?B?VThCNkREdjJXWHZYZE1sbWVCR2VGL1RTVzBQeVJiUU0rTEpFWTJraGFNSm9h?=
 =?utf-8?B?ay9JTXI1QW8wR09DV3lidS83WHBTcUthZUswMkpscVlFUkc4V2ZtOThXYWJo?=
 =?utf-8?B?SnZXRjE1TUxzUEpDK1dsTlhaT1JCLzY2SGZpank4VnhkNkhOL0thc1dIWE9m?=
 =?utf-8?B?SlNYenR3MU9vSXVOUUx4RThQNElXQ042LzJtOXVkRk8rZzZZQmlvVjFqMitY?=
 =?utf-8?B?a21MZWVJOHNMcEczc3FBY1lUVTlnQmEvOWg2WXRpZjJQemRJL0JxS3B6c21B?=
 =?utf-8?B?YXRkd3R4NS9OSEZpQkNneG5FUzFITTlhRzR6Z3NwZmxMemFlV3cveXlWTmVQ?=
 =?utf-8?B?VGtiaVorQkx5K09qVlZNK1VoOEJkcVJPWmdXR2puM2Q3MmtZTmdLVUdCZXJn?=
 =?utf-8?B?OG40SjNoZjFNVmJxbG5rMU1OMzhZYXhqYTZGc0VHaDcwRVJGSldPeEM1RVV1?=
 =?utf-8?B?ekx4VU04aEhDR29tS3djL28rMDExekdRNjJ6a2FOUW5ldVFtUjRqMHFkLzRs?=
 =?utf-8?B?MFhPK2NxeUVQLzh5TkZlRDhRWHNxcldjWGdicU5QY3pPaWtKUkRwT0FHMUZm?=
 =?utf-8?B?bHA5WXh0Z0pHMUphRGZuUTZTVHlJREdkYVR4ZDd5b3hnRmZWcjNDQVZTd2s4?=
 =?utf-8?B?M0hvazNjUitkdkNtSlFXK3BXcjlLaERrR1R1Rk9XenVuUmt3cXRHRyt3OVdJ?=
 =?utf-8?B?ZEtxeWhtSm92WFVZSzBLOWdHaFNzazEvT3VlU2d3QktMME9wKzZJNlptUndn?=
 =?utf-8?B?NVQvdmpLTndLbDV5bXlQL29QSlJ1cXNqYWhCYi9LUUVnTkk5UE1FcFduU1Ry?=
 =?utf-8?B?WUQzUFZLbG9yWElXdVQrTHNQOXNxclk4bk9KckRlcCs1S1ZmVENtOEtBNUkw?=
 =?utf-8?B?WDhYUW9Xb3kyUXdvdGQwOWhkQ1pXRlI1c3lzNEFmMWdOZHlvMm5MS1k1SG9L?=
 =?utf-8?B?b1B6YjJ5Skxaa2RSVUFKVlNmVmRJWHRDL3FLcE9lQTIybHhqVGxYc1dybTVG?=
 =?utf-8?B?S1FGS1VCSWwxckNTWEdPaGFZcDdYNVNLaFFxeXBoRWNNcGNzTjVhUG93Y2U4?=
 =?utf-8?B?TFU3dldwRnZZTHdLUVNqVW0xQzBidHB2S21xWXFBY0hFdmFJaWNWVml2Z1Ez?=
 =?utf-8?B?N2paVkM2WlRSWlNzckN0N2FPU2laTkZWYTNnRS93VXFPN1BuaXYvS3BVbmNs?=
 =?utf-8?B?OFU5S1NjMytuUjlTamlWMnZVRUptWm05WVVSL3EvS1o1VkVsZU44M1Uyb0I1?=
 =?utf-8?B?QVpIYlJ2SjFtTFpyWCtOQlNCbmVlS1BzRkEybEkvSWEva2VCdHBQTk5ta3Qy?=
 =?utf-8?B?dVEvQ0ZZOVQ3WnRLRW9CdXNFa2VJNmtKLzdiRm1PUnF3TXZHSDFENmZyejls?=
 =?utf-8?Q?kv+KR5fT14E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjIwUnNRWml5ZVRHMk53Kzh2anBHeWt0V09MTklnVm53dW1lRDZZR3BPSUNk?=
 =?utf-8?B?bFUycmpNeW9FNXpHTWh5bEF0b2R6MElyUzNWSmdWZU5wWmUwSUcvVHRvOFMx?=
 =?utf-8?B?QmZRSFJEc3Z2eW5TdzhrTGtDcUQvSmtJNFBwa3J5ZzNZM3hiZkY3SHc1TURY?=
 =?utf-8?B?M29BQlYzNVBmOVZKUVgwUm5TVGtOS1NJSmVhdWNVNXViU3pyVmZFWnE1TkRp?=
 =?utf-8?B?aFdPQUdDUkhxUmljVThTRExnUDBFSCtNd1ArNFpjbUdSQzQ3dnRQTm9wOWNJ?=
 =?utf-8?B?c0RKMzRrNzFQMHB1RFhoZlVjZDdpcHl2ZitGNjVQZ0c2MTY1QTE4eXRpRGtv?=
 =?utf-8?B?MFowWHh4VGZGdjNwZlQ0aVV1R0Y1eWh2YmFqRHFIS0syMU9MeGRWYzRZbG1Z?=
 =?utf-8?B?b1g0SXMyS240anEvVUdwT1Z3aEpSdHpvU2hwMnJ2QUZ6UnBqdHVwRVZ6RlFG?=
 =?utf-8?B?ZFZ0VzBPeUl5dUtGK1RTeGx4MU9yc1NKQ0lQc2RUZzNBRDJuR0crWnFwa3FL?=
 =?utf-8?B?L2pCRjd6VWVlUHk4UDBSTTNkQ2EwcUxSQy9tZzFGZENvRlE5VkprbmhuSGl2?=
 =?utf-8?B?Z0l6RjFmTUNZVTU3WXp5MkhlSk50dG51SEJaQWpvUHBYSk5MSGxDUXZlM3pT?=
 =?utf-8?B?WndPZ1BpbDR3SGlXZEtWNkNONklVK3JwOWdHMlduWmRPUHN4Z0hNVVI5Y0ZU?=
 =?utf-8?B?NVdwMlpDTmo0Rk5say96NlR1a3gvbFlOWURPTm9NaHN5dzN1QVVBdkNheTFa?=
 =?utf-8?B?ODNNRVhzWFZVMkdkc3FkYWIrdm1zWEJQUFBSdUNzUjhtVGFIbk1HYlN0MEV3?=
 =?utf-8?B?ZWI1WHU4dHFFczZTNXZ3RGx2V25rOHZtZ1dnQVdIRGpDb1BLemJuZW5ySWRZ?=
 =?utf-8?B?UnROdjNydFNIY1NvUlNhWFZRSGxwaHlmK1RtU0MwZU01d1hSRUswVG5wQUJs?=
 =?utf-8?B?YjRhcFNkbVdjWHVGQit6dzk2MDhpRzBaTTJoNkpmZU9kQUxBQkw4YkphaElx?=
 =?utf-8?B?dmcybXhMRFduL29SYW1reUI0a0pld1k5NEttUnlSWHYxbGxsNURoam80aHN5?=
 =?utf-8?B?eFJJbUQvQ3pTUWh1a1I2SUREY01XcGVuQklZNE9FMWRTWWk5VmdlQWtuUjUy?=
 =?utf-8?B?OGZHOTN0c29EblBIRjdVbmo5QmwyNU5sVHJPWnZ4OC83V21FZDZ5YUpZZGF4?=
 =?utf-8?B?U0ZpanR3REowTlV1UkJzbWpwSWlRZ05KajI0NmYraUVyTWRQT1JwV3c1MVZY?=
 =?utf-8?B?Wk1yRm5uTmpWQnZldkpacVZKU2dxcmc0Q2Z2RTY3YnVIRU1DTjNtVmd5dlhJ?=
 =?utf-8?B?VmNFNGJiNTlHdmVobjZzK3lNYTJsQXhDa3B4OWFJN0NKcDFmSGhYY2dkZVRv?=
 =?utf-8?B?T211ODBhWmlaRXJ4RXNsSWtzdENRMzF0OEZMQVdPWGpsUy9XS2Q4Vkh3Ym5p?=
 =?utf-8?B?SkM4RUU1T0lOZ3NDQVJBY3U2eHJ0WkltNk00RloxMm5qMEluVDdjblFlL1pU?=
 =?utf-8?B?QjYvQkk0cnhRTFl5cko5K0NUMHM0UXJQV1VlbkhYS3VWcnpMVkV5ZFJhUmhy?=
 =?utf-8?B?QmFxclZZTkNVbXpZQ1FoV0RzRnBWWXgxNG5VYmZ2M0F4eVdyUGVULzJXUm5w?=
 =?utf-8?B?NFFTc2pXM1JRQzFZbnhpd3M4eVA2dVVoeEdYVkluZUtRZ2d5NTdXQjBVc05n?=
 =?utf-8?B?WnNNcTUvRVYzRlV0VDJZYXQzdUpNWGxDcDBXV204TmZJbE04MmE3NnZlcDNt?=
 =?utf-8?B?a2grcHNhMTdZMHU1bUNqNlp1SXBIbXRlcmFxQ3M3ZHc0ZVFld1hmUlNBclp6?=
 =?utf-8?B?cnA1TGxLb2EzUG51ZFR4T2ZUUUI3a1doTWRUenkyV2VCWXlyYkg5WFNONDA4?=
 =?utf-8?B?UDEzemFnWVcrN2hpNE0wNHF3ZHlnWnRuRlkrRHJYKzV2KzRtRUlqek1sWWdv?=
 =?utf-8?B?RGdZazJzWTZCbjZTUit5SDVlajBPWUgwUk43MjFST3pMN1dMa2gveG80MnNF?=
 =?utf-8?B?MDM3dldQc25DQURxZU1ScXVOOTc0TkdnSDNHV3RLQ2xvMVVLRTg3TVY3Mmla?=
 =?utf-8?B?VlZPMmJwTFFRMG9QTmhjSWd5a3F5dUcxVk1wZkU0d3NlWE9ZT092Vzl6dGlE?=
 =?utf-8?Q?ReKGlrXKDpaD7RUitpd+vSHgq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed67cae-2dcc-4864-d164-08dd864aa30d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:48:47.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFgFJp1Ejw+D3aFH1HCRzBLfCy0u5TFZi6QhKXMoMoH2v3FJV8hzx7wYjh8prxPlJ7WjvC9XLDFX9dgYJr65Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9620

Hi Andi,

Happy to see this patch is accepted and merged. Thanks very much!

Thanks,
Pratap

On 4/28/2025 3:30 AM, Andi Shyti wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> On Thu, Apr 24, 2025 at 02:49:26PM -0400, Pratap Nirujogi wrote:
>> The camera sensor is connected via ISP I2C bus in AMD SOC
>> architectures. Add new I2C designware driver to support
>> new camera sensors on AMD HW.
>>
>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>> Co-developed-by: Bin Du <bin.du@amd.com>
>> Signed-off-by: Bin Du <bin.du@amd.com>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> merged to i2c/i2c-host.
> 
> Thanks,
> Andi


