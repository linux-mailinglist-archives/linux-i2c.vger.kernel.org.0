Return-Path: <linux-i2c+bounces-14993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A0D01DAD
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 10:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F36E73008759
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 09:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAF036920C;
	Thu,  8 Jan 2026 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X2XSO7Aq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C56366DC3;
	Thu,  8 Jan 2026 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861265; cv=fail; b=STfjuku/m5n7k6DABnbCxobaxj7Axo0J1TjvP5UbfqCwjDO9YGPJx8cEiwS53CAttx0/JV0Lp7F9g2vp13+vMxrl2bVU7Fg4V+s8Fpax7TqTG26iGKrHha6+GLzMQEYjNMgePuNAcjTM5c32D7NLF2IUNrNUx6C1CFAzdEnUwJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861265; c=relaxed/simple;
	bh=QbRPP1lB8aw9N5rws4f/o/Ms7tWVUrP5NHkpoSxsz70=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VyRQH5RVs7UcdpFXo1lhyr3U2r96vyX9GRBXZ/wQefItOhSR+Q/LMBS6+oeMqHsWTHukNGs8gZbwPxJv7/Htt9BJHezd6alnorgPJteaKvgzrfPHDanBXSLgRlcvuFJXQNItDwoWg9+uMov3PgZQjg12cpj57CoaUvZUZGDBd4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X2XSO7Aq; arc=fail smtp.client-ip=52.101.56.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QW+wCJBy9SihbmOhzoD/b9jrYGn5HG9kqYf9SOYGBfFHYbZI4ZJidUjSTy10Oocxx2XaA9+zz1+LaGImdP7Lt/fO1XwCD1chaFVwiBPo9eeC50sENG+Fqw7QtZbQJSNVpB3fG/GJjXC/p7YRbQC+tbndPqyiEvdd89irATK5Z7AxK7YBeGYvUKtNfvkZ8rZKlaVMNz5yAZisPvDntaZwpAzlVN+htrdPpcaE9Q2EJnshiG0T62rcDDf+C6uWQOqcMrB2z/pHLCVfh/Lmc234Izge+hl+H6Ai+15HJPuuNTe0XTm9eqnbXioNHfJ4V/ILOC+UxuuLYrWYULfqf8djcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bS+eVcvUN2XH43oy3ErhE3ESS9T0qw6LjFRHSWptrq0=;
 b=w9b324/DWykVBB+HgMBin1RZR9+UVGbVKeW8GgifiKbCb7VIXyAg0zfGVbwvtMFpIeS9vXIgfjYiK+/WTeX7vTwjP6a+GnSyT0jv4e3734W9gZAntDOgTD/8MZdSjMFWryPhrl+xJ8/a1gOTmC1QV2wmJo2su7gMVJsG5AFpcDFrVAHxz71em4td0xXVJTXX8kNeEn7E+Z/2SPW8krN/8vJPU7omZdj9Do26EHrVNU7JdX83LwgMmXSr6YUezqpV+xpGdTw8DDt8J4rLNdUrO9pEzDeaF/uwtPuJTHlMyKQY0yn5ge1Y4BOVi4fy/SGyLE/XO+gqqSr1H3m+Hu5kWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS+eVcvUN2XH43oy3ErhE3ESS9T0qw6LjFRHSWptrq0=;
 b=X2XSO7AqCwjA6Jygw3ZDYdGZd1ojUyHGtt/X6PiQ3rOWvpL8MOAuJqpzgmw1G/awR2VNHhcQqJ6R4MQD+ZQ8VEigzkDqaI2J3sac0dmAia+QsUmYneqLLlrlgAS5YpwCUM9gP3449crCScXrR9ioZ8BLzMcLWTrRNVkzrmwAy4mQyPYaV7GAI2WCR9nVyxDllX2YZRbCJuoDs8VnHRjgXia1YJ6eaZoAinanP9jNjM3XHbt9uFMSPKsqZSBX/95FNdUOT6+8TboFstKBu5LbAWmdny8pY6w9w7eEsVQzTRI5i5TNtQd8oEqsYGZ+5rSl6CJGlPteWDcQZPY8bR1SoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 08:34:02 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 08:34:02 +0000
Message-ID: <69d4316a-f841-46a3-89de-6fa4412db25f@nvidia.com>
Date: Thu, 8 Jan 2026 14:03:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Jon Hunter <jonathanh@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107142649.14917-1-kkartik@nvidia.com>
 <20260107142649.14917-4-kkartik@nvidia.com>
 <85d5583c-a679-454e-959d-438e7726ffa4@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <85d5583c-a679-454e-959d-438e7726ffa4@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:266::8) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ee178d-ffaf-4063-c1d0-08de4e90acf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk1kWUh3RG50UisvRUVVS1NBS0pnTGlidXlZanF4cnc3aVR3QjJmc2prdmla?=
 =?utf-8?B?ZFVjQnE5UVVBTmtNTk0zT0JjUXBDL2FuVTEyRkc0aEgxTVNDRmNjbFpmWkk2?=
 =?utf-8?B?NWttWElaY0hkazBBemY1ZVVkRGs5WTNZNHVQWXVaTExPSldJQW4yS2NTWDlG?=
 =?utf-8?B?ckpXQmk2UDhobXJUT1Z0M3NPS25ZN3hjY0hNQmVOQlpheTRJSlM3aHlWa01o?=
 =?utf-8?B?cW5GenpiZDY0UTFSL1ZkRG1RYnM3cmsxZkNUK2J6S2pueFpCRmRQQmdsbEY3?=
 =?utf-8?B?ODJ2RmFwTGtTbm90K0huSUk2NlZzWllTdUkxY1JFb0srRitnME4wNmVMQVky?=
 =?utf-8?B?V29VTTZSK2MvaWtWbkI3SGtqOHhDVExrakU2c3gzQWNhUEhKTkt4OWF6NEo4?=
 =?utf-8?B?S3ZrWXZBQ0tRYThpUUVDU3NmY0lhS0lGMTZERGxvbkQ5ZnowaTlsSEs4UDZR?=
 =?utf-8?B?SmFzTmtGR0FQMVB0MFNnSndYSVRpYTFCb1FtU2VUTUxMQmNVeEtuMmhuT3Rw?=
 =?utf-8?B?Z1RhU0tLODlMczM1MWRnSUw4a1dxeTQ5NlpyZVV0blBTUTFoaFFUNFh5RUht?=
 =?utf-8?B?ZXVyV0kxbVcyajloNkx5RGp0eFBzN3JZdWdwQWtQbnNGRW83STNzK3hUL2h1?=
 =?utf-8?B?RGVlek9idFNvZllsd0I5YU5lRUNUNGhZZmJ2WWh0WmxPZVkvUEFLY2VjcGFH?=
 =?utf-8?B?U0VMNlRzYUFZNUdrWVlMRlA5UkxmUEkrVjU0cFk0ekw1OXlWK0ZBS3NlODFp?=
 =?utf-8?B?bktpVkRtVFVuclZ6bGRWcU90RGVSOFBJNk1lVTZTZGIwcEFYUXdKVWhYdzl2?=
 =?utf-8?B?UDc2M2tNTGVHMkhEc0l6ZldTdmhiZi9LZUptaFhWa2lmUjBOa002Ny85cisy?=
 =?utf-8?B?ZEUyQ0NlY2ZUbDY4QURrR0MzUDZ3NlBuNzVBL3BBVFRaOSthaWY5dTR2L2lE?=
 =?utf-8?B?NVdBamFHSE91M3FTZE5zalFoNEs4ZS96VmkweDJ0cGpRbkN1UVQxTWJlUXkz?=
 =?utf-8?B?UzNaU25iWm1EeHROUkpSUXlFRzRXZGs4UDl6UHpMTWF1Y01KRDNKaTIySS93?=
 =?utf-8?B?OHV3d25GcElNMWk4eUJ5SzdHQ1p1SmVsYnhUMmRFMjBkR3dtdml3b3hVNWhN?=
 =?utf-8?B?dE14M1FtQmVmaVVVVFBKMkFIWEdCejFyM1YzQ2wxQmRDSEpicGJUT3dmakI1?=
 =?utf-8?B?aXVlQ0RtRThtYzVOVWpLenhXOWJTV2FaZk1CdHR0TXZGU01pTFB2Y05DY2o5?=
 =?utf-8?B?L0Z4VzR1VTlHMU1vMHVWMDUvdC82R1lPd2U1MFpKa09TUUN2THVRdFBEVjF1?=
 =?utf-8?B?cENiaGFSTE5WUmNXQ3NLSElpSUlPRmRGaWxoZHNNamFSODZ0K1VIWUowSE56?=
 =?utf-8?B?c2o1SU1BUVZQNThEeEFkUklpczZxYzVQeVg5a0xleW1qYjFpWFM1ejVZS3pz?=
 =?utf-8?B?MmdUYzdleVliMHpGZGQyeEhtWnhqREd5K05CSGRadDNCM0ppMXAyUW9PK1FD?=
 =?utf-8?B?ZU5vYURvcVNzUTlmN1lpMjd1cy84VE5yenk0SUpRKzE3SU10dGJib1FGVW9Q?=
 =?utf-8?B?MVI3bWdZTjExV0pZenR2MitQTy94Y3ZKc1MvRVZBZGtKNWRTb2VoZ2pKeE4z?=
 =?utf-8?B?L3Z0VVRNR0V3ai9oK2JQMnJ3N1VNZEo0L1hvS0taNGE0am1yNTFScitIL0Rk?=
 =?utf-8?B?QW1VS0NmUXhHLy9Oa0NBQ2V1UXg3SXY5VFUyMGZCNFQ1RkZSOUUxL2NuR0V4?=
 =?utf-8?B?bkppMnNPNmhnbkVET0RTSmFReVFERFZLWjZNUzJMb2ZtZzBBK1RNek4rQlpY?=
 =?utf-8?B?YkUzTnBYMUk0TkkyN1Z5TDJlTGdlNE1pU3I0emlCTEpUQXR6cWEzYkptV2ZK?=
 =?utf-8?B?RGdYMDJqeWhzOWlqeWxmWC9sUWpjb3BRWDZFanZodE9BUlhGYVQxSFFUbEpO?=
 =?utf-8?B?QlFQRFY4Z0dXRm03NjdPWEhtSDArUkpJQU90bE4yTkdVWDZwU2ZUMmxqSkxX?=
 =?utf-8?B?QXBwYzk0dENEaTFCczN3Y0JFVURDRUw4SCt0NnN2QmpsbURLZ1BhelE5RW1X?=
 =?utf-8?Q?yKYtow?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzVZZHZvUisyRFliRXpkNlVrM1V4Z0Rjb3pRUk1NbHd6M1NHVHBoZkN3MGl4?=
 =?utf-8?B?R05Rd2NLamhYNzV1Z2R0TjdwdDlCT2dQZWlyYSs5Y0E3RkNqQzRYL2NSOVEx?=
 =?utf-8?B?Tyt0aDFvM1YxYXhOMThVUi9TM0duMlVVeno4NWJSSXgvZGVrT3JpazRRclRS?=
 =?utf-8?B?UDRlYzF6ako4RUh0OWpyREYyYmtXNXJBSHVXa0Q1d3RSUW9MMFhIMEtxdVd0?=
 =?utf-8?B?SUp3YkJJZW54RmlQTks4OE5FRXZDb3BRNFpXWWpLRzhFZ296T1ZqKzEwT2xO?=
 =?utf-8?B?c0tPTDhIdDVvUXM2ZlFvbDN2Tmc3cXl2cjlnbnBzOGhVOWlyZ3NqNzRRU2V4?=
 =?utf-8?B?TDNkU01kL2tOQitOcUxqZUwrbkQwUG9BZ1VxUnVOaWlOZ3NLUGF4NTFqK24v?=
 =?utf-8?B?R2UxcHVmNkJBT3FtVmx0VmxtZDljeDhwZmdOM1dqQklQVUpTUW9ucHdETmpz?=
 =?utf-8?B?bnAySUhwckNXWlZvQ0JsTnpScHFETEZiNWQ0TmFaS1IzZmRyZ2ZhMklsNklv?=
 =?utf-8?B?MFYxajI5cWZOa05WVkVUeFhpY3FpN3NQQjNmRHZUV3NKMGFrRzFXL2krRXQ4?=
 =?utf-8?B?dXh1T2JxVVpuTHdsaTR2Y1RIcW9NQzBOWi8yOWg1QmFIUGNZb0s4ZDE5WkdV?=
 =?utf-8?B?dG9ZSWJFNWpScXNCN2RIanl3alEzWjdUYjZDQ2ZYOHp0aFZSeWVBSW5KNFFP?=
 =?utf-8?B?MjBaakM1UmJ4QzRJSkRQS2IzUkhmOEp3TWg4Ny8vZTZhM24yb2dNRVV3bTlt?=
 =?utf-8?B?ZEt5aDc1UUgvU3Y2RUNBNHBFem5acUJMYUxFNFBpTDZKcWpBTEExV3pIR3lx?=
 =?utf-8?B?S0UweVpoaWlISUN5VEpSQUVXT2NIcVpYMXJoczNUQWVVQlQ4cU5MalZmYlB4?=
 =?utf-8?B?NTBqVVNjV0p1SlFobXk0c2laNlpVUzdOVDRBUTgxY01hekVLRWdmK2hzNXdV?=
 =?utf-8?B?akdpWjVOZjJzcFFHWXJwREpKUDR6V2VEZXVwd3Mxanp2SkNGa21ZeVdiSnlE?=
 =?utf-8?B?bUR1VWVEZ0Y2bEovRjZ2cWFzdkFTZGM5U2R6NnA5WDBtWDM4bkxneC9JbytT?=
 =?utf-8?B?a0ttL0tKZnhsWUFzWjlkaEhWa3Y2aE9KU25haHBpazY3cnJVMzhDaU5SRTFP?=
 =?utf-8?B?KzdnbDhqMHd2Mm1tZjB5eFAyNy9JaWc5dW92NTdmWkVjcjBXTENSY1pIZ3ZU?=
 =?utf-8?B?SVp1NEVHa3FCcUF0OVkvekQxdzNpTGV6b3BxY3JxYUpYMFEvb1A5RkhXYUIr?=
 =?utf-8?B?SlVpL1JRQ3lVWlRJdWFob3htZ0FrOXp3SmJGM2toWjVPNFgzSjdUMS9Id2Fa?=
 =?utf-8?B?d3E3QTVidFY5a3ZEcEloZzA4bSt6c21Ya1p1bGVBalRXek1uRDQ3dFJZVWdn?=
 =?utf-8?B?YXFFR0x1RVVaRmtWY3dNWWx3WG1BTTBhWG82NElIWnlOSmVrRGtDeGFFVi9B?=
 =?utf-8?B?N1R4MWhVNnVHdUt4VU5idzFVKzRXZ1hWUlg1QXZiRlNZOU9oelRRUnJ0SldF?=
 =?utf-8?B?ZXAwamNibFJNQ1A5aloyS2tQeGkzbFZIN24xZGxoejVranJacGFiKytSd2cx?=
 =?utf-8?B?VjRWS1hVZkQrMXB6VFQ0cms4dmhCbVJRUUg0c3VtZXhJbEpvM2FaczIxS0Q0?=
 =?utf-8?B?eFdMREh2c2JNWGFXUDlUc2pNcXdHUndKU1grQ0pPWnkvRVhpNldxV2NlRE9w?=
 =?utf-8?B?NmVEcGoveUg0WTlKU2FYTko2Y0FZR0JKVTNEOGpydzZneFBQNGpPU1h5U3c0?=
 =?utf-8?B?L0daVm9EL3NXK3QzdXJ5R0tmRzZhZ1NVYzhWQmVFaWo2U0hZSFhzbVpPRi8z?=
 =?utf-8?B?V2x6TUEyTlpCZTFRMER3TU0vNE8wamY4NU5abVMzK1BaRW10bXJSSDg5bmt6?=
 =?utf-8?B?OW9VV2RLVlAyZHZLSm8xTG91NDY0cmljQ1ozSHdhMkFqa3J0N2RVTDhhQTRt?=
 =?utf-8?B?N0FQaktZaldCUFJsSmdTTUdxMWV2eEYrRnc4R2VGUFVITG56WDh4SFJ2YWJS?=
 =?utf-8?B?Q1RRWHNJU0E3ZVJVdkJ3K0NZNnU5ZDZRS0hNNlpNajNmeml3RDJaa21FWFBP?=
 =?utf-8?B?U25uYUtmL0RCdENabWRYMDZ4RWRiWmFHeWlyb0haRGtFTUtVRlRyaEM1TlRr?=
 =?utf-8?B?VVdPcmF6KzAyRVU0dTd2NWgwc3ZRRGxTMkNyUXM2OXg5Qi93UTFFTHN2d0RF?=
 =?utf-8?B?R3BEZmdla0UzUDFJZXhUUWI2ci9qQTdnd0dXSGQ0ZDd1VU1velgxWVdGNVFv?=
 =?utf-8?B?ZGprTy83WDRuZERCOExmMDFpSVdKWEF6ZHN1bVF4R0tPQlRMN05RbE9OS2tq?=
 =?utf-8?B?a3Q2VWRiWDNOWXBIRlNDN1V3c3pZTURDNm9JZFFDckwxODcwOU1hdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ee178d-ffaf-4063-c1d0-08de4e90acf4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:34:02.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqzbSyZiXWaC5NHoa8Hf/mZeGuPcyeRLmgMvaKfyM930DuSg5WkoX2+DFdqcPoxArgpFzDrNLfafIQMgKtnmxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861

On 07/01/26 20:41, Jon Hunter wrote:
> 
> On 07/01/2026 14:26, Kartik Rajput wrote:
>> Tegra410 use different offsets for existing I2C registers, update
>> the logic to use appropriate offsets per SoC.
>>
>> As the registers offsets are now also defined for dvc and vi, following
>> function are not required and they are removed:
>>   - tegra_i2c_reg_addr(): No translation required.
>>   - dvc_writel(): Replaced with i2c_writel() with DVC check.
>>   - dvc_readl(): Replaced with i2c_readl().
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> Changes in v2:
>>     * Replace individual is_dvc and is_vi flags with an I2C variant.
>>     * Add tegra20_dvc_i2c_hw and tegra210_vi_i2c_hw in a separate
>>       patch.
>>     * Use calculated offsets for tegra20_dvc_i2c_regs and
>>       tegra210_vi_i2c_regs.
>>     * Initialize registers only if they are used on the given SoC.
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 393 +++++++++++++++++++++------------
>>   1 file changed, 251 insertions(+), 142 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index cb6455fb3ee1..821e7627e56e 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
> 
> ...
> 
>> @@ -159,6 +137,149 @@
>>    */
>>   #define I2C_PIO_MODE_PREFERRED_LEN        32
>> +struct tegra_i2c_regs {
>> +    unsigned int cnfg;
>> +    unsigned int status;
>> +    unsigned int sl_cnfg;
>> +    unsigned int sl_addr1;
>> +    unsigned int sl_addr2;
>> +    unsigned int tlow_sext;
>> +    unsigned int tx_fifo;
>> +    unsigned int rx_fifo;
>> +    unsigned int packet_transfer_status;
>> +    unsigned int fifo_control;
>> +    unsigned int fifo_status;
>> +    unsigned int int_mask;
>> +    unsigned int int_status;
>> +    unsigned int clk_divisor;
>> +    unsigned int bus_clear_cnfg;
>> +    unsigned int bus_clear_status;
>> +    unsigned int config_load;
>> +    unsigned int clken_override;
>> +    unsigned int interface_timing_0;
>> +    unsigned int interface_timing_1;
>> +    unsigned int hs_interface_timing_0;
>> +    unsigned int hs_interface_timing_1;
>> +    unsigned int master_reset_cntrl;
>> +    unsigned int mst_fifo_control;
>> +    unsigned int mst_fifo_status;
>> +    unsigned int sw_mutex;
>> +    unsigned int dvc_ctrl_reg1;
>> +    unsigned int dvc_ctrl_reg3;
>> +    unsigned int dvc_status;
>> +};
>> +
>> +static const struct tegra_i2c_regs tegra20_i2c_regs = {
>> +    .cnfg = 0x000,
>> +    .status = 0x01c,
>> +    .sl_cnfg = 0x020,
>> +    .sl_addr1 = 0x02c,
>> +    .sl_addr2 = 0x030,
>> +    .tx_fifo = 0x050,
>> +    .rx_fifo = 0x054,
>> +    .packet_transfer_status = 0x058,
>> +    .fifo_control = 0x05c,
>> +    .fifo_status = 0x060,
>> +    .int_mask = 0x064,
>> +    .int_status = 0x068,
>> +    .clk_divisor = 0x06c,
>> +    .bus_clear_cnfg = 0x084,
>> +    .bus_clear_status = 0x088,
>> +    .config_load = 0x08c,
>> +    .clken_override = 0x090,
>> +    .interface_timing_0 = 0x094,
>> +    .interface_timing_1 = 0x098,
>> +    .hs_interface_timing_0 = 0x09c,
>> +    .hs_interface_timing_1 = 0x0a0,
>> +    .master_reset_cntrl = 0x0a8,
>> +    .mst_fifo_control = 0x0b4,
>> +    .mst_fifo_status = 0x0b8,
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
>> +static const struct tegra_i2c_regs tegra20_dvc_i2c_regs = {
>> +    .dvc_ctrl_reg1 = 0x000,
>> +    .dvc_ctrl_reg3 = 0x008,
>> +    .dvc_status = 0x00c,
> 
> Why do we need to add the DVC? These don't change.
> 

For consistency, as we are consolidating all the regs in `struct tegra_i2c_regs` and moving away from static macro defines.

>> +    .cnfg = 0x040,
>> +    .status = 0x05c,
>> +    .tx_fifo = 0x060,
>> +    .rx_fifo = 0x064,
>> +    .packet_transfer_status = 0x068,
>> +    .fifo_control = 0x06c,
>> +    .fifo_status = 0x070,
>> +    .int_mask = 0x074,
>> +    .int_status = 0x078,
>> +    .clk_divisor = 0x07c,
>> +    .bus_clear_cnfg = 0x0c4,
> 
> Shouldn't this be 0x094? We are only adding 0x10 if greater or equal to TX_FIFO.
> 

You're right, I will fix this in the next patch set.

>> +    .bus_clear_status = 0x0c8,
> 
> Shouldn't this be 0x09c?
> 
>> +    .config_load = 0x0cc,
>> +    .clken_override = 0x0d0,
>> +    .interface_timing_0 = 0x0d4,
>> +    .interface_timing_1 = 0x0d8,
>> +    .hs_interface_timing_0 = 0x0dc,
>> +    .hs_interface_timing_1 = 0x0e0,
>> +    .master_reset_cntrl = 0x0e8,
>> +    .mst_fifo_control = 0x0c4,
> 
> So now we have 2 regs at 0x0c4.
> 

Actually, the mst_fifo_* are used if `has_mst_fifo = true` for that SoC.
These can be removed from DVC and VI regs.

>> +    .mst_fifo_status = 0x0c8,
>> +};
> 
> ...
> 
>> -/*
>> - * If necessary, i2c_writel() and i2c_readl() will offset the register
>> - * in order to talk to the I2C block inside the DVC block.
>> - */
>> -static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
>> -{
>> -    if (IS_DVC(i2c_dev))
>> -        reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
>> -    else if (IS_VI(i2c_dev))
>> -        reg = 0xc00 + (reg << 2);
>> -
>> -    return reg;
>> -}
>> -
>>   static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
>>   {
>> -    writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>> +    writel_relaxed(val, i2c_dev->base + reg);
>>       /* read back register to make sure that register writes completed */
>> -    if (reg != I2C_TX_FIFO)
>> -        readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>> +    if (!IS_DVC(i2c_dev) && reg != i2c_dev->hw->regs->tx_fifo)
>> +        readl_relaxed(i2c_dev->base + reg);
> 
> I am not sure why this changed. Why is this now dependent on !IS_DVC?
> 
> I understand that DVC has a different I2C_TX_FIFO address and but don't we just want ...
> 
>   if (reg != i2c_dev->hw->regs->tx_fifo)
>       readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> 
> 

Because dvc_writel() only had a writel statement. I tried to avoid any extra reads/writes
after writing to dvc specific registers to keep the logic same, but this changed the logic
for other registers.

So, looks like I need to revert the change to remove dvc_writel.

Thanks,
Kartik


