Return-Path: <linux-i2c+bounces-10530-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2830A97217
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 18:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE5043BB1DA
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 16:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41882900B0;
	Tue, 22 Apr 2025 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PRPnAUwv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE1028F956;
	Tue, 22 Apr 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338336; cv=fail; b=iDcDVK2Rb7qg9uFPFZmQb3bP6Ze8Z6efQAmXbYVrSYoR3qUrTZ0KUy+gmBgtX257DGsSsE0U0PC3d7tuPByqqnYcIrmO3z0k6RqHdzCay53qMVV7qITVevpuzAtM2nGR22L9pK+Z/P4L1rzJ54ZQw6MRVROESw8AFmVgpux73zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338336; c=relaxed/simple;
	bh=/smjEqUq1qnf+gKnqHgXGhkiCazJQDVxL5O35kPHuSY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t+FR/VnL9QravTkjn1fDAtRlTAA4W+wZGcWn0cvio9DXfF+xqwvb+CqlGkrpjavIiarqHHCm9uYYjArmBY2cVqYPClFS/MBZz7K8FeodXIgHgh+v6qmTz4ndXdeLbWg7pVgpRyS/0ah0240dvBILc+MKv+XYLmM592S0HYtlbCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PRPnAUwv; arc=fail smtp.client-ip=40.107.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3CZg+J/tW0la48jLmDq3aMYQuXe4EHZ4xaEy93f/rMWussDbjj4ai8TPOo90muN2Yc+eruNT5xE9npaEZgEYO7OQMdxBTEk1EfB2HnYxHVNyTJqJ5FDQFeKf6PcbHTWPcsLcd0NoQs+S3QFtyaG7+t8EBPZyzF0OxDv/UmZApPtXBM4I++SU/RYiV98rCb+axPDua9hdW4NVr8P6fqCZxi6Hu9DLY7otp2ALPCB1eJkDQMuFwCUjCu4KQ5pn+pyP8/2tCLhGkDb1dZvf2xxU8HnBYFlLi3dGT+KNFxoJTzoV58Xzm5jtiQ7Agaw6qkP/3/Bc3c4W1UrdAZqtUpbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3GQp4WIHI4eZGfD6ikJbfr7/Vix5UVYJxQ8F5qDjMg=;
 b=uezlHydSIEg3Gp7VhTsUo+DYErTy9Cog793MpfzwZJ+gkr0m3RETd93o/CQY6F2dPNx1ppeAi44SYB2JOUPCruwriWEYQtLIPSMpLyXb4xTBkQ4ZEVn3WoIR2T89VBv7uLg5Vfsi09a/KlksfFmVQ4bfJrfbQt045NF4auMZyHWbXz0lH/aVceMJrsxjVN5uoOG176TxoARFS25XXwFhpsamQTiw530ZIZcUXDYZWn2q44WgfMC/oUKZwXz13s1zw3vu0VTnha5HMUVNxBsTKH/1mepBP1SE/IeZAYkJg+J0azguEVuojteSuyojJ7dnOyCx9kDveZvf5F38QLLezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3GQp4WIHI4eZGfD6ikJbfr7/Vix5UVYJxQ8F5qDjMg=;
 b=PRPnAUwvhQIl+xoHmmpG4X1pcB4EJ/FZmJ+CFkXJ5a5CoCsHk9aU8eXebecHUzgpsUtugXy8QdhGQ1V9rU3XTu5szXSKh5bBv7iHmu3ygMXeVNgG6iJG8+AF8YeCsatO+6CfrBaVJ3xOm3jjThhMV67mm98bRPekbxgzErCv5fY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by BL1PR12MB5777.namprd12.prod.outlook.com (2603:10b6:208:390::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 22 Apr
 2025 16:12:11 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 16:12:11 +0000
Message-ID: <cacba7c5-9e06-4471-91ed-ee0fd6d73daa@amd.com>
Date: Tue, 22 Apr 2025 12:12:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dominic.antony@amd.com
References: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
 <3b2c9842-8910-4ab1-84af-01013289c3b8@kernel.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <3b2c9842-8910-4ab1-84af-01013289c3b8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::13) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|BL1PR12MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4e8a77-67c9-454e-2885-08dd81b86fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTRKaUk0QWIyMEVBUStmKzdhTy9xWXFCcnY4Qlc3d053T1VZeTZ0ZldITXBY?=
 =?utf-8?B?SThJYk5EOFRsb2M1S3hpNjIwcTJXL0NIQmtBQk53R1FrdXN4cjRzRFUzMkc0?=
 =?utf-8?B?N1dTQUNRNXJYNDBEVzFmM3p3Z0lSdVdVSEt2RmdJd1V5Tm5HUXB3alJEc3Ar?=
 =?utf-8?B?VWFMbjRtNGZTK01hZDZMTFlpc2lLeWduaUplSklLOHRrR2dPYWJIOTczOHF1?=
 =?utf-8?B?QTZBbEZhdmxxaUpIMmdqQmdvOEt4YS96QjR5aHNnSGFrdG02MHZ6SDUxZUtz?=
 =?utf-8?B?dEt5Tjc1YVZJUmR3QVdRUlVJVXdTaEdnZ3ZYWFZkV3RwOFBFR2lJaW9uS1ky?=
 =?utf-8?B?cThqdklPSFFEa0pwdkVwSGorVEJTRzgwMnZVcUpKcnNCMXdpSHY3d0xqVE1n?=
 =?utf-8?B?R3kyZFN0VzZnNHNIby8rRStPcjF6S3A3VXByWXpUVS9icSt5dnBPMHRVdmIw?=
 =?utf-8?B?RmlwSEZoL1NLWmNvOHlZYlVsTlJ2TTEzQ1RMdGoxKzBUQUkzdDNyNjRqeDBW?=
 =?utf-8?B?ZHhvbVV0bkd3QXRXV00xb3NwVmw2LzVaYjZtMFR4akVhaXZsL0VVc2ltSHlM?=
 =?utf-8?B?aGduZzhqRUY0Q0phT0ljLy9ZYkxkVC9kUGdtRHdRY1dsWXpubURuYmlnMVFC?=
 =?utf-8?B?RUZxMkx1SHFBN0hCL2tzZlJLQkZBSGFVNDRnN2Naamp4SnV0QnFiWEhiRUl0?=
 =?utf-8?B?ZExNYWQrWk54WFNtUXd6NHJFL09aSnViZkV3V1dDdXNmY1l3VjhHdWhZdFFt?=
 =?utf-8?B?SFdodnE1SmVVM1ZrbmdMaGFERFRSTmttTGx4QzE1aE9YSW5LRjY1Vy9rL2tV?=
 =?utf-8?B?ZElyNE9NMjh1dDZwVnNBZWJ1YW1DSVpFdkZmUlRnQW1zWGpwZUpVcnBsdEZa?=
 =?utf-8?B?VTJrRmloVEJTSmJRMkxoc05OY0dqTGNRTE1Va0JYSlc3RU85ek9VRlhkOGdN?=
 =?utf-8?B?ZnZnSnpZSWdESlU1aXY3TnB6NThFOE05dlMySFZGU1o2MU1DNzFQckFIZzNP?=
 =?utf-8?B?aXcxZzJPTE1VWXhPclNlVVNQREV0cHJLb0c3YndmWjh3S2wzNENyWUtrZ0ww?=
 =?utf-8?B?bXA0QTRsSWpKeXc3ZXkyVXBqZzM3ejUwSVdBMnlxM2ZjVFBTS0tKU3AwZkln?=
 =?utf-8?B?Ykd0VWtOMDlhS3ZnOHJKNGlwRzVpL2JzM3dxUGVmaUFQYXl4ekRTeEwzZEc2?=
 =?utf-8?B?aXNBaG1WQXM0MjZIbzlWN0dTeHdnSWpSZms3eVUvLzhETFpsR0pLMStQRzRV?=
 =?utf-8?B?MlNKeU42a3BmY0lpeXovbHprQk5XTEsvNmI1NjQ4dFpWcnlVOVFGQkJ6ZzNQ?=
 =?utf-8?B?a3BYeEdpUjk1bHcrUzMraTIvVU9OWDAxSm11c3hrK2dTQWhVNXAyU280NkI0?=
 =?utf-8?B?a0w2L3NJWW1LWVU2MkFTSUtJbEpoNU9KWEJSTWhQaW90NDhrREhHa09YVzRH?=
 =?utf-8?B?MzBmOVRSZFJNS0c0cGltMkRUZlVWMGdqcUFFZEpBc3o4Yi9qblNVeDZ1VWJr?=
 =?utf-8?B?NGdIdkdlQ1I2aWwvRnQxcmdTS3ZGazVTVHB0ZTJYMk85Zzljdm9rUWRINjM3?=
 =?utf-8?B?ZlR6RVVac1IzSjhMelBzSlFoblUxZSs5WjFiZkpVZ3EvMm0rZFVRcTJ1YmJY?=
 =?utf-8?B?dk1pTU9Jb3BQNzhvM3p3cFdvOTlYRWZvRnlreFdaeFBid3ZUNysvL1JiTmhK?=
 =?utf-8?B?K3h4bXc0THV2VzZzVVdRNnlDNnFXSUp6YnZoZmR2d1hrajl3WVNIYTdmeE9D?=
 =?utf-8?B?STcvaG0vNmRUL0NFellob1BDc2VibzNNR2tEWGs3NjViRG9tY2NaTVdMTHZV?=
 =?utf-8?B?cEtLOTA0TkZCTGxOQ3NSMXJwbHNRT3F1MmptT01SVWVwN3FwRUUzSkdJYW8x?=
 =?utf-8?B?K0NxVU5IN2p6WS80bTY3em5LMWNxVG50T3g2Q09Rb1lZdXlXVlZYQytUeERa?=
 =?utf-8?Q?LSigBVwlsNE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzV0QWFCZDFjUnFoSWtabnV0N3ZxTFBTUFRIZE1UaituaEdhNWNlbTlSMUV3?=
 =?utf-8?B?Rjd0ckZQU0d5eHVXWDNneGVNRjNVYkdURFkzYkoybzV0UkUrU0NkYkF3NndN?=
 =?utf-8?B?OUpFMEpSMU5Ic2xuTFVNdEU0VGpzcU1LMUVEa0ZTU2d2RVBBTGlndm9wTkZp?=
 =?utf-8?B?ZTQ2VHR2dWNEeW9tQXhYcEdrYmZ1ZDFzZExmSlp1djZaZEtwSkM0aUxXL1do?=
 =?utf-8?B?d3J0c2JLck1yVmhFbk90eERoWEdaU3llYmJPT3hyOTlPN1lUZ1RsVkxrSGp1?=
 =?utf-8?B?Yy9XTUhEU3FJSW05REM0WVA0K1FTa2JSdS8xUVVsUGhpNThyMyt1OEpPKytk?=
 =?utf-8?B?ZVVhTGUyd0xFdjU4QmYvbzNuZ2pQdFNzRndqOVJuMjZBRXpibjk1NVV4RUd2?=
 =?utf-8?B?ZStaM0lsMFhjL3VFbUY1N1J4ZlBwSXI2elJqYWovRWFWNGhNeldwYk9EQkZi?=
 =?utf-8?B?VW1GZGQvalZqTTlNcTdXcXJmbEx5M2FITXN2TzQrSEQ2ZXdodXY4ZDZWY3Zs?=
 =?utf-8?B?SGNEbEwyOGNONG5DQzBiMjVkM2RhdjZWWlJrNzVDTlNONUlzT0hGcGVubmlG?=
 =?utf-8?B?R1diMmlVMTh1eWtTQk0vaGhnSG1NekN4U1dMejJZSit0eGlQSG1RZnZwdHNm?=
 =?utf-8?B?UlhVTWdVbitSVklOcEJQcDliejBrTjc5ZXRQRkRqNU9yRXNvUlUwNGt5clB2?=
 =?utf-8?B?VFpMcEtZd1JQVzgyT3B2Nk5ScXVWWVhmTUlxdGlQNWRNcDQ2b1RUVnRaZytn?=
 =?utf-8?B?RXFRcG1LMEtneFRQTXVHeHBIeWVaTjVwTGN3NFhFWEdDWGowRFQwOW8wL1RF?=
 =?utf-8?B?L0VIWXpGSVI2ai9nYU0weDJnUUczK2JzVzhFaUpDREZ6WmN6aFI0ZUFDc2hG?=
 =?utf-8?B?dkw0SDJKZ1kyOXMyYk90SytvMHpJSkxoaWszRlVrcVdFQXhWcGtIbmFtTCtM?=
 =?utf-8?B?S3BRM2pwT2pyUzlsaFlDbXl3S1krUWFVR1FORXRzSWlEQldyRVZuWjA3alpZ?=
 =?utf-8?B?Tk1kL3p0czJERFBDZ0NtbmJMSDNwd0RJVmRyR3lGbVphcllvamFWVTdLbU5l?=
 =?utf-8?B?RTIxTUpSY0I1RFN5SnJYcVFibmowdmtzdnBLS1lTaXEzSG1yVDNuNmRvNkVP?=
 =?utf-8?B?ek5MblFPQjJhWXFnd1RyTjBHaGpnaG5zUGJFaFp2cmN1ZFZxRUhoOWFyNnBs?=
 =?utf-8?B?enY0RS9YVmhVelI0blpYdnBRWW5lNkdneGNZTEFxMzJPenJoaTNxVENldGZx?=
 =?utf-8?B?emtKNDZCeUhpM2o5VVRJSXpPUXQ2L2E3RWtYSXBFL1dUbW5zdzRaWndxdXVQ?=
 =?utf-8?B?a2dyQ3ZkQjUzNit2eXVBUlNHcGdGWEpkRUl0RG5OdEkzR1Z0Ukt0QVpqTjli?=
 =?utf-8?B?V0ZXd3drV1F0RTIxR1NQUkM2Y0h4cFo5TzVLempsQ0tzTW9EK25VSEJvY3RB?=
 =?utf-8?B?Y25qVlAvc2FpbytoVVRnS29jVmZUQzR2Tnh1QmE4K1plR3BnR0VueTh5TXda?=
 =?utf-8?B?aVpzSFRlUE5haFkxVVBLdHp6V1RwWURxTVd6eEtXaTZKMmhIblVNdVFrVnhT?=
 =?utf-8?B?TE1qd0kzVG1tbmZwcDRoanArN1pVOHhhNVJXcjRjVEwxbytlQjE4aVFRcWIx?=
 =?utf-8?B?ZHNMd3ZvRU5vVXZzMVdHb2JXd0pTclppV21ZY0xBSmxBa3BvenRMcXViR0xa?=
 =?utf-8?B?N2NGYUFaVlEyZEZ4L3kxalBQTjlmYjd2TWZ2cFlDOUp5V2Rqc0hGUjF1VXgv?=
 =?utf-8?B?WHE1Tmcvb1paVVdGbTZsbTBzYmJQa3lRaVB2QmkxMHRJT3h5QUNubVhvR05x?=
 =?utf-8?B?L0ltSjVVVFFoampaakJYY3EzeWJNREhRL2w5ZHQ3Uk8rd3BSajFCSlJJUytX?=
 =?utf-8?B?eTFpV0tNTDdPdjczcGlhcHZTdW05cGRsQnp5T2cwOEhpajlKZzVEaVJpdG5T?=
 =?utf-8?B?MC93WTFCNVBKM29vc0dEMXJiNDdQQzRKWStEOG9oSWtGZjF5cUQwWnpKZ0Y0?=
 =?utf-8?B?dWlhamZUY09NUlZtNy9aWUtLd3FLOU9pZ1hZVWxLYm1HRWVlNHJJUEhyc1d5?=
 =?utf-8?B?RXNFZlBpTVd5S3NCWE9Zdzk4VWpPYnJodkM4N3RRZ3NHSk1JV2JGN0MzM0ZU?=
 =?utf-8?Q?m/jppa7b5/3Cs65h3/9dYU2t6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4e8a77-67c9-454e-2885-08dd81b86fee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:12:11.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/jm+FRghVIfrj80/wUtAwdqeFZYijiuBxz1esdnI3yKyweBTnmn0NIqJt1dg205PmR1qGpLACGhR6eJXLExsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5777

Hi Krzysztof,

Please accept my apologies for the delayed response to your review comments.

Thanks,
Pratap

On 3/1/2025 8:26 AM, Krzysztof Kozlowski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 28/02/2025 17:45, Pratap Nirujogi wrote:
>>   config I2C_DESIGNWARE_AMDPSP
>>        bool "AMD PSP I2C semaphore support"
>>        depends on ACPI
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index 1c2a4510abe4..cfe53038df69 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -58,6 +58,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)                       += i2c-designware-platform.o
>>   i2c-designware-platform-y                            := i2c-designware-platdrv.o
>>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)      += i2c-designware-amdpsp.o
>>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
>> +obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
>>   obj-$(CONFIG_I2C_DESIGNWARE_PCI)                     += i2c-designware-pci.o
>>   i2c-designware-pci-y                                 := i2c-designware-pcidrv.o
>>   obj-$(CONFIG_I2C_DIGICOLOR)  += i2c-digicolor.o
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
>> new file mode 100644
>> index 000000000000..dc90510a440b
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>> @@ -0,0 +1,266 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
> 
> Don't add custom license boilerplate.
> 
Thanks. Will remove it in V2.

> 
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/dmi.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/property.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/suspend.h>
>> +#include <linux/units.h>
>> +
>> +#include "i2c-designware-core.h"
>> +#include "i2c-designware-amdisp.h"
>> +
>> +#define AMD_ISP_I2C_INPUT_CLK                        100 //100 Mhz
>> +
>> +#define to_amd_isp_i2c_dev(dev) \
>> +     ((struct amd_isp_i2c_dev *)container_of(dev, struct amd_isp_i2c_dev, dw_dev))
> 
> Why do you need to cast? To drop const? That's poor coding.
> 
Thanks. Will remove it in V2.

>> +
>> +struct amd_isp_i2c_dev {
>> +     struct dw_i2c_dev       dw_dev;
>> +};
>> +
>> +static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
>> +{
>> +     pm_runtime_disable(dev->dev);
>> +
>> +     if (dev->shared_with_punit)
>> +             pm_runtime_put_noidle(dev->dev);
>> +}
>> +
>> +static u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev *dev)
>> +{
>> +     return AMD_ISP_I2C_INPUT_CLK * 1000;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>> +{
>> +     struct i2c_adapter *adap;
>> +     struct amd_isp_i2c_dev *isp_i2c_dev;
>> +     struct dw_i2c_dev *dev;
>> +     int ret;
>> +
>> +     isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(struct amd_isp_i2c_dev),
> 
> sizeof(*)
> 
>> +                                GFP_KERNEL);
>> +     if (!isp_i2c_dev)
>> +             return -ENOMEM;
>> +
>> +     dev = &isp_i2c_dev->dw_dev;
>> +     dev->dev = &pdev->dev;
>> +
>> +     /**
> 
> Not a kerneldoc.
> 
> Please run standard kernel tools for static analysis, like coccinelle,
> smatch and sparse, and fix reported warnings. Also please check for
> warnings when building with W=1. Most of these commands (checks or W=1
> build) can build specific targets, like some directory, to narrow the
> scope to only your code. The code here looks like it needs a fix. Feel
> free to get in touch if the warning is not clear.
> 
Thanks. Will run the suggested tools and fix the warnings reported in V2.

>> +      * Use the polling mode to send/receive the data, because
>> +      * no IRQ connection from ISP I2C
>> +      */
>> +     dev->flags |= ACCESS_POLLING;
>> +     platform_set_drvdata(pdev, dev);
>> +
>> +     dev->base = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(dev->base))
>> +             return PTR_ERR(dev->base);
>> +
>> +     ret = isp_power_set(true);
>> +     if (ret) {
>> +             dev_err(dev->dev, "unable to turn on the amdisp i2c power:%d\n", ret);
> 
> Syntax is return dev_err_probe()
> 
Thanks. Will update in V2.

>> +             return ret;
>> +     }
>> +
>> +     dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
>> +     ret = i2c_dw_fw_parse_and_configure(dev);
>> +     if (ret)
>> +             goto exit;
>> +
>> +     i2c_dw_configure(dev);
>> +
>> +     adap = &dev->adapter;
>> +     adap->owner = THIS_MODULE;
>> +     ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>> +     adap->dev.of_node = pdev->dev.of_node;
>> +     /* arbitrary large number to avoid any conflicts */
>> +     adap->nr = 99;
>> +
>> +     if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>> +             dev_pm_set_driver_flags(&pdev->dev,
>> +                                     DPM_FLAG_SMART_PREPARE);
>> +     } else {
>> +             dev_pm_set_driver_flags(&pdev->dev,
>> +                                     DPM_FLAG_SMART_PREPARE |
>> +                                     DPM_FLAG_SMART_SUSPEND);
>> +     }
>> +
>> +     device_enable_async_suspend(&pdev->dev);
>> +
>> +     /* The code below assumes runtime PM to be disabled. */
>> +     WARN_ON(pm_runtime_enabled(&pdev->dev));
> 
> And how it could be enabled? Drop or fix your driver.
> 
Thanks. Will drop this in V2.

>> +
>> +     pm_runtime_dont_use_autosuspend(&pdev->dev);
>> +     pm_runtime_set_active(&pdev->dev);
>> +
>> +     if (dev->shared_with_punit)
>> +             pm_runtime_get_noresume(&pdev->dev);
>> +
>> +     pm_runtime_enable(&pdev->dev);
>> +
>> +     ret = i2c_dw_probe(dev);
>> +     if (ret) {
>> +             dev_err(dev->dev, "i2c_dw_probe failed %d\n", ret);
> 
> Use dev_err_probe()
> 
Thanks. Will update in V2.

>> +             goto exit_probe;
>> +     }
>> +
>> +     isp_power_set(false);
>> +     return ret;
>> +
>> +exit_probe:
>> +     amd_isp_dw_i2c_plat_pm_cleanup(dev);
>> +     isp_power_set(false);
>> +exit:
>> +     isp_power_set(false);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
>> +{
>> +     struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
>> +
>> +     pm_runtime_get_sync(&pdev->dev);
>> +
>> +     i2c_del_adapter(&dev->adapter);
>> +
>> +     i2c_dw_disable(dev);
>> +
>> +     pm_runtime_dont_use_autosuspend(&pdev->dev);
>> +     pm_runtime_put_sync(&pdev->dev);
>> +     amd_isp_dw_i2c_plat_pm_cleanup(dev);
>> +
>> +     reset_control_assert(dev->rst);
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_prepare(struct device *dev)
>> +{
>> +     /*
>> +      * If the ACPI companion device object is present for this device, it
>> +      * may be accessed during suspend and resume of other devices via I2C
>> +      * operation regions, so tell the PM core and middle layers to avoid
>> +      * skipping system suspend/resume callbacks for it in that case.
>> +      */
>> +     return !has_acpi_companion(dev);
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_runtime_suspend(struct device *dev)
>> +{
>> +     struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +     if (i_dev->shared_with_punit)
>> +             return 0;
>> +
>> +     i2c_dw_disable(i_dev);
>> +     i2c_dw_prepare_clk(i_dev, false);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_suspend(struct device *dev)
>> +{
>> +     struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +     i2c_mark_adapter_suspended(&i_dev->adapter);
>> +
>> +     return amd_isp_dw_i2c_plat_runtime_suspend(dev);
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
>> +{
>> +     struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +     if (!i_dev->shared_with_punit)
>> +             i2c_dw_prepare_clk(i_dev, true);
>> +
>> +     i_dev->init(i_dev);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_resume(struct device *dev)
>> +{
>> +     struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +     amd_isp_dw_i2c_plat_runtime_resume(dev);
>> +     i2c_mark_adapter_resumed(&i_dev->adapter);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct dev_pm_ops amd_isp_dw_i2c_dev_pm_ops = {
>> +     .prepare = pm_sleep_ptr(amd_isp_dw_i2c_plat_prepare),
>> +     LATE_SYSTEM_SLEEP_PM_OPS(amd_isp_dw_i2c_plat_suspend, amd_isp_dw_i2c_plat_resume)
>> +     RUNTIME_PM_OPS(amd_isp_dw_i2c_plat_runtime_suspend, amd_isp_dw_i2c_plat_runtime_resume, NULL)
>> +};
>> +
>> +/* Work with hotplug and coldplug */
>> +MODULE_ALIAS("platform:amd_isp_i2c_designware");
>> +
>> +static struct platform_driver amd_isp_dw_i2c_driver = {
>> +     .probe = amd_isp_dw_i2c_plat_probe,
>> +     .remove = amd_isp_dw_i2c_plat_remove,
>> +     .driver         = {
>> +             .name   = "amd_isp_i2c_designware",
>> +             .pm     = pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
>> +     },
>> +};
>> +
>> +static int __init amd_isp_dw_i2c_init_driver(void)
>> +{
>> +     return platform_driver_register(&amd_isp_dw_i2c_driver);
>> +}
>> +subsys_initcall(amd_isp_dw_i2c_init_driver);
> 
> Why this cannot be standard module initcall? This is ISP, not a critical
> boot component.
> 
Thanks. It need not be subsys_initcall. Will use module_init in V2.

>> +
>> +static void __exit amd_isp_dw_i2c_exit_driver(void)
>> +{
>> +     platform_driver_unregister(&amd_isp_dw_i2c_driver);
>> +}
>> +module_exit(amd_isp_dw_i2c_exit_driver);
>> +
>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("I2C_DW");
>> +MODULE_IMPORT_NS("I2C_DW_COMMON");
>> +MODULE_LICENSE("GPL and additional rights");
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.h b/drivers/i2c/busses/i2c-designware-amdisp.h
>> new file mode 100644
>> index 000000000000..f98661fdaedf
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
> 
> Don't add custom license boilerplate.
> 
Thanks. Will remove it in V2.

>> + */
>> +
>> +int isp_power_set(int on);
> 
> 
> Best regards,
> Krzysztof


