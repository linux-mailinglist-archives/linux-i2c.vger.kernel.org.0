Return-Path: <linux-i2c+bounces-14979-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB7CFE8AB
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 16:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76C94301C347
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 15:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0F3332912;
	Wed,  7 Jan 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S3mbUHgG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B4321F5F;
	Wed,  7 Jan 2026 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798757; cv=fail; b=NX0RbjFL868KmdH7jsgylLAnmNnbY2Q3uY43CRZvM0CupzicNmK+ECjv8eiSzK8rCqLLT6LHyZ4WW485nWPc6sP0wjsgpMRsIE+lYTntaw2zVVCHJ+0VqLRgq5yCijL34Z60gyMhgYdDVzXxYMuxHd1ZNTWyczd137074KsMfT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798757; c=relaxed/simple;
	bh=W6WlAItRSsVmUAJYUKo/R8kje4xBgao1n03LwAVVfuM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E5Bwn0NHPyQssaUmi/wJReFf2e8xd80lh7nHa6MbetUBbJFdzvCYXE84EwXv6Kk7HG1ePTfUdH1Ps3byk96wmHD6wjs3SZ5aopsPWKz2T/PmtEJ7QwbmFO0wsp+ozCjgzJRiFgNjYiRnKxvmFAquAgUdxweToLkdwmQn2fLybcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S3mbUHgG; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wj4dwtUSBFeCa0CHfJ+9hv/91BXI4p+2t8ikdSgFHBzpvQpEExbKbbNiADgkFcsvSaGEnM5dVvh+/ffXm4tDKXaq4Vl4v8UW55im9DRrqbjpH412ym5O/pktSfWiU5RCRZmAytLnZZiXvzd8Pkiu6Ef30OZ2UacnoxMWAWzjhG5dpHCN2rCwXGl/KeRPvnTPNHpdvsDYjjESkxUAhOJEGA6wAJy6voJDxvAZnFbdxNkAEl8l4I+3uOzgmPvLLkzMxHD5qjTLyvQw+AmxMW3wsxNHbP9ki2MT9U1OVZN4WAC3km7tHkM/PYWyx/V3Wajbxi4kRJjZTdV17HV5qpH0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZln9J6enVBlM1mkhwxOCzIaPsa6ZRIxuN+5pesyoak=;
 b=dBdiaMNpQ43PSQ4E/94UXZoH8Q8JNJO5n0CxnDRQRisM0LsYsz500nmJyig8uJK+8G7MTcNjuRTLgUn4cZUvy8x9uxEYC+quDoNmkwFDHBTXu6GcNZslDBenG6syTJZEzFPkuCLH5aSxdm8IKGm9yV93bikciPH6WN2PVok2U7uO0AF1Y+2wGWks0kwxtr26YIrIfCNZ0VmaOkwTfhikoouCOrwSKC5A9g5Xk7yw+jx90aYuzo8y4ES3HPGhgSl1QXFLmwgJsonM78NfOrrGYqceeXS1CFooKEgRFQ1eKD9CnV+Rbch0OR5ywnkI7OLfLS2sE6c8OtSH56BVgU1g+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZln9J6enVBlM1mkhwxOCzIaPsa6ZRIxuN+5pesyoak=;
 b=S3mbUHgGfxARTYuSPN7edcb95c7ZsPGtA2/+Uo3raV7vn+8NumJSjXzT+jZ8Y4apPKX0z9nFppt2OFWyswQg5S2bIYPwgtHCe1knUVTzvhL4KZZDlW2zYfNpSmZuhzOKVE166uI45BaNoVSfT2UyzjIQOWiimTEsorawI7OHKFdr30lRwNMFAiy4pbpcR7TmmG0rQ6layw8u0dQlL4Us6tCnpCDbKpY6Z5eYyTlxdh6xwVrDttvUBoxwzy9LCHFiTZgcS5CmA4z4wn99wTXbZzc+mcB1QHoPHMsmWCAR89au3qD3Kn5QOHkEWUEOH8MgjtJO3TMS9wSMIChkgUTw/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 15:12:05 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 15:12:04 +0000
Message-ID: <85d5583c-a679-454e-959d-438e7726ffa4@nvidia.com>
Date: Wed, 7 Jan 2026 15:11:58 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107142649.14917-1-kkartik@nvidia.com>
 <20260107142649.14917-4-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260107142649.14917-4-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0544.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::9) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: ce867c2f-3bed-4895-a01c-08de4dff1d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXdRZ1YxQUxLRUo4L0Y0RkV0N1Q4SFcxRVJmak1KdE10TUtYeDB2MWpZYlVG?=
 =?utf-8?B?MGR3UEVFdGFTL1l6OWN5dk1RSzJlS00vd3VnZ2cvTEUvamIrOXJQc1JDMWEz?=
 =?utf-8?B?WmJJalJhUjhMUU8wdVpja0kwOWpSdHZ2SnpnODU5VklqeEEwUGFMdXBEQ2sr?=
 =?utf-8?B?OHpPdlg3TEdLTFlEUERqY0E3aGdoTnBBeTdFUWtvd1hWWHF0MDd0aExkbEs2?=
 =?utf-8?B?a0pHU1RyZ1FPMWFoQ1cxUE93Y1lEWGptcFpldXY2MnJXeEtsU2t4M1FYOVVQ?=
 =?utf-8?B?eEdJN3p0OUxNYmFHRElQUHp1amhFd3BsNEE0SWxMWG1yaDJ0cW1ZUG1pVVR2?=
 =?utf-8?B?YjNsdnFCTVk5enBzY29jbmJ0ckp6RXRXM05sVjhOREpUZEFhdmg5ek5YdWFN?=
 =?utf-8?B?ZHAzZFdUN0lEbnlha1hxRHV2VHMxVkt6SFFpNzNFWmJ2MlVULzQ4cHkxU0lm?=
 =?utf-8?B?QzJjY3dvN3JTUWZOcERBcVBzVVo2UUljenZraEZZQTU5MlJNMGNQTWorbFBY?=
 =?utf-8?B?UW52R2RYNFhxekQybGpIRFRZNUd6bHltcFUxcThxM0RzeHhzQloyc00wQ0E0?=
 =?utf-8?B?d1dBYmtJcmJZcFBkcU9jMjdXNUExZXVWallZUW5NQlRUNnRMTnVUOVFMNWg4?=
 =?utf-8?B?TmxDbGxmcFpvbkc1STJpSmtkOGw5VjdUSkZ1QUN2OC9qL0s4S3c4SENDQVlw?=
 =?utf-8?B?OXdLaHNrZjdYaHZYb3RHTkVEOG90N3diK1B4a0EzbjZmbVFlMmRUbmhxSGw2?=
 =?utf-8?B?eWpSWDcxZmc1YkFhckwxSlpsYmZQK1JRUmZoTUVKcytzL290ajYwV081MkVs?=
 =?utf-8?B?SzI1Skd5S1hpN3UyeVY0Z2lSbzdqRFVvZlVwS3l6ZUswUE1NNWdLeU1YRDkr?=
 =?utf-8?B?dzFteEcvRldkMmh5Q3Q5cnMzWC9VcGo1TnhtTHovTUptcmk4WEFiR0hDVnVN?=
 =?utf-8?B?UURwcjFwVFVCN3FXNHMxREthVXJ3OTNlRDdsNTFHbnF0QXltSDlyMERyZWQw?=
 =?utf-8?B?azdxNFZtaDUzaVpSU2I1UG0wZEZyTEFjTWc3OVZtcmFwdzcyUnJ1MXRkVEw2?=
 =?utf-8?B?N2EvdEFWOENGcThrbXgyYTVYb1R6RlRJY3RabWVsTm4wVXNnOHpISEEza3p1?=
 =?utf-8?B?bHRRVFlHMGxhS2xLN2hveGtJVW9SVjdJZU9lYzZ3SzRPVkEvV0NkWTBSYmR3?=
 =?utf-8?B?NTVRblBXNzl2Q2wzaElVbndFdjdzYk40WTNIemIrUTQ3aEZxakdTeExpbnU5?=
 =?utf-8?B?QXZnWVRrNHRWZU4wQXV4UFVBYXpJUnd6MlB5VExnTHBYVjNweGZQQTlteVMw?=
 =?utf-8?B?ZG0rRXlkcG5velROa2pQeDZjaTNYcnZsbzJvZ25EYU5TTlZBOWYzWXVGempC?=
 =?utf-8?B?azRnL0ZacWkrZE9jekpXQ0JPcDBlTGFHMlUxZDJWVU1mK042dVJONXBDemFK?=
 =?utf-8?B?aU9XMG4wWS9GNXdoNjd4a0M4Ui9oL3Y4ZThYSEdYT2hpajl6RFpEU2t6alNJ?=
 =?utf-8?B?TWgxYXltS2pZMlFKS1BUSklTT1NNUEpaZkx2Q0tscUVPVkZsTXdxN2NVcGR0?=
 =?utf-8?B?WFppUWRaek53YWppQlBTV2lHUUMwME9UZ2dJRzFYVjlnYlRIeGtzTDNMaldJ?=
 =?utf-8?B?YUJydVBwSWs4QTNkZ3FVYzFYUEtSMzVlSDlaOFdxMnQySEk3bDdkOEpCTkN3?=
 =?utf-8?B?MnRDZFpYR3BBcitsUW44WWtOdU5WcmdlMi9lQmNBQmV3T3N5RlNYbFo0L3l0?=
 =?utf-8?B?RXJLVXZnZHd0QnllTWhmVHpUL0ZFbGFwQlg3ekZNc3BneXE0NncxUnpRNG5o?=
 =?utf-8?Q?+wCTLeYD311Z88sj6PW11+PQ+/P1HmSQ6jD7k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OC8wNWlXWm5JV3hDR0F1U09ka29IODZlYlI4bE01U3duTEhhbkFzSks1UklF?=
 =?utf-8?B?MnhhNXhhK2UxSWlpZWlPSkI5S21FUmNlYldSckYyZ0NEWk9DanNNUmM0WFEy?=
 =?utf-8?B?Zmw5WlZRWDQzdXZrdkxqNHFTK1RVUkhlNFJ1U2dLcEVTT2pPR1BlQXlKc1JC?=
 =?utf-8?B?YkVkU1pTY1N4WHNkeU5OLzBlNjRlNjBpdGxHTk5OVXRxVy9HT1hMVi9ZQkNK?=
 =?utf-8?B?dXFOYkR4UUFNKzVXZ2trWnE1ZE1UdWJpejJjcXJmK0orbzFGOEJOZW52YmhM?=
 =?utf-8?B?blFhQmJBcnBISFJqNUhnQlhhbTZGN0hLYXViRWdCdDk4c1FzMGRHSEsxSk9R?=
 =?utf-8?B?bmVvQXFnUzhtZm5GNEJPRDVpUVVtWFMrL2hmS1hvWjlEQ3VBWEVmbjdGYU0w?=
 =?utf-8?B?a2E2R0U2d0hFMUZJbUJPQkVXTEJLZjh1dENxcDROcWJ3Qk4rVjM1TXlxeFhY?=
 =?utf-8?B?c1JCWUFZclBZOVd0YlJaM3VzMzdXYU0rTGliT3F3Y3dMREs3YU9rR3FZN1Jm?=
 =?utf-8?B?ZDhkRXB1MFBYZVhWK3EzcG9vNEQ2MmhnNkxYemdBZjU5c0hwR2lKQ3pzYlhC?=
 =?utf-8?B?RDNqbWdLbnJ1M21lamVhUTFvOEhOaExacWRUbzVvTWZqNzQrR2t5SVVoWUNt?=
 =?utf-8?B?S2xqNkc2ZlNwZ2dlVldSY0cwa1M3bkJiUUFHbjhCbGFiSndIY3ZsRU0xRDVS?=
 =?utf-8?B?TERzWUc5YmtVK3lRdVpscnFvbmVkdjBwNmJnUHFERjhGMDZjRGhmRzY5SllI?=
 =?utf-8?B?MGVOK0MrK3dhN25OcHVtcDhjNEt4ZmtmNmRYeHVBaS8yenhubTVPR3BNNUZG?=
 =?utf-8?B?SjNua1lsUGhmSVhSYkNndVZkSUdIVStSaEVZUmJXaGhCRGpQQk5EcUdLK0l6?=
 =?utf-8?B?TzNaUkNuVTZCTW01cXJZei9tZHlub3VTYzFoNDN0T0cybTRrYlBRNGFHbFhC?=
 =?utf-8?B?RXNXcGpOM1NDYk05TXppTU40Z1RzUkFGM3pCWEFvNmNIUDNqdzVwbytRNUtK?=
 =?utf-8?B?VVg3QWZYdnZMM0JTN1RmZVV1dDN5Z3NHZGNIRGNvV0tLZHBlTnNzSEhDT0Fl?=
 =?utf-8?B?Y3R5cXlhZ09DM2oxd3hmVjI5YVkzc3RIaTduUUwzUVFYcitKYVFwTXFKOTJt?=
 =?utf-8?B?dW9TdTZCd0JucnhnNk1pWHRCVnJoSk5VZzNDQ1NoSGRuOTZWYnU4aEcrcldv?=
 =?utf-8?B?VnFTeXVxKzhPU0p1eTVyUUFXY0NZdW41K2JrOEVlVHpOK3pkYk5TTzJxNGpN?=
 =?utf-8?B?UWM3SGFzTllZVTFoUGtBSnN2cWx0NGtGOVV3YWFkeW1YMUlhdGpQd2Q2Ullj?=
 =?utf-8?B?blorT3dPWENDbW0vM2xUUVpTellBTzBkdXhUL29SdFBFcDY2dDF2NnY4VFQ1?=
 =?utf-8?B?bUwxemZwNnFOejlXei9xSGozdVRoV3RsZkdnQW9Bbm9VYnhsdzV5RGFOb05j?=
 =?utf-8?B?MnFkU3VqMDF1VkV5eGFaMk4vSHF3a0tkUTdJOEIwV2xHTTBzc09NMFhUV2JO?=
 =?utf-8?B?VHRHbjNRUlk4M2RsMDd5R1k2MHZJTW0zT091L0tLSUJXRUJ3d1pFRjJ0N2Yz?=
 =?utf-8?B?NXZFb2pac2txaGVxSEJLenJsQkZKWGt2VTlRS3dYWFlWYzlxbVU1VCtOSmMw?=
 =?utf-8?B?VTZpNy8wNEtndk4vcVFZcktBSGVIQnluQU5zUnkzR0J2U25rN1IxY2xsS1ps?=
 =?utf-8?B?Nk9vSHZ0aHRMa3l1STk3OEtrQzZxcmxnYjBlZ2xPWVNDRmwwUld2SmZGZnJl?=
 =?utf-8?B?TzEvTm1INkdlS3FPUWVSZ2UwZTlEOWlvdGY3d0xONnIzdkpRTlFKSkRDL2FL?=
 =?utf-8?B?eHJxeTF6SDdmYitpbSt5RUxYL2lvM25jbjJORXNOU3ZlSmo5akU1a2hCc2dH?=
 =?utf-8?B?SzkwS29rNEpQQ0lxMUtzSkJLaDZ1TkNZVnNXa0hic1BwdzlZcVJSWVpPV2p3?=
 =?utf-8?B?MjhqMUk0dFRiOEI4R0daM1QrRzVoSnphem1nY2RRaTlMQmcxeDRsT1hZS0JR?=
 =?utf-8?B?SXcycDhzUUorRDJvcURHTVdpdnN2SVlJUjdtL1hvc2ZxTW55MW91OGpVVUlz?=
 =?utf-8?B?dWtzdzBhdGxFSEVpaXZFRXo4bEs4MEp3VWEyZGhIWXFSTnlvMnRFWWg5Y0du?=
 =?utf-8?B?MzQwTXAzQlFzbHBlSThpQ2I4N1BmNnFkdmR3b0xuSHZSejZodWRjMHZZNUlw?=
 =?utf-8?B?aDZzcTRTNHhURG8xaDFETmdwTWZQWHRKQVRWOUg4TytvanRHbndPSFJxeEhH?=
 =?utf-8?B?T3JOSGM5bXZNSmZSbVRMNHVldVZTTGIrcGRWRzRxK0RxYy90S29YK2hweUov?=
 =?utf-8?B?ZWhJM0p5SWFpU3hSb1hReXArSXp5UDlaUGVNVmZIbzlMS0I5aE9xUE0xZ3ZN?=
 =?utf-8?Q?O31Hx68OnzgB9T3jGYZm1uAbMQoo7nD0lRGAm4vzRS7O4?=
X-MS-Exchange-AntiSpam-MessageData-1: EF4/0j6f6MqblA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce867c2f-3bed-4895-a01c-08de4dff1d4b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 15:12:04.4959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCc1lyzpBsJe+n7rpvLgYr4xBTvesQXxeyW5VezN8bTAjXLLsSwvWW8TuZ+BbVz5+Azy1OqaGX9rlJBXGSnW4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007


On 07/01/2026 14:26, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
> 
> As the registers offsets are now also defined for dvc and vi, following
> function are not required and they are removed:
>   - tegra_i2c_reg_addr(): No translation required.
>   - dvc_writel(): Replaced with i2c_writel() with DVC check.
>   - dvc_readl(): Replaced with i2c_readl().
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> Changes in v2:
> 	* Replace individual is_dvc and is_vi flags with an I2C variant.
> 	* Add tegra20_dvc_i2c_hw and tegra210_vi_i2c_hw in a separate
> 	  patch.
> 	* Use calculated offsets for tegra20_dvc_i2c_regs and
> 	  tegra210_vi_i2c_regs.
> 	* Initialize registers only if they are used on the given SoC.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 393 +++++++++++++++++++++------------
>   1 file changed, 251 insertions(+), 142 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index cb6455fb3ee1..821e7627e56e 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c

...

> @@ -159,6 +137,149 @@
>    */
>   #define I2C_PIO_MODE_PREFERRED_LEN		32
>   
> +struct tegra_i2c_regs {
> +	unsigned int cnfg;
> +	unsigned int status;
> +	unsigned int sl_cnfg;
> +	unsigned int sl_addr1;
> +	unsigned int sl_addr2;
> +	unsigned int tlow_sext;
> +	unsigned int tx_fifo;
> +	unsigned int rx_fifo;
> +	unsigned int packet_transfer_status;
> +	unsigned int fifo_control;
> +	unsigned int fifo_status;
> +	unsigned int int_mask;
> +	unsigned int int_status;
> +	unsigned int clk_divisor;
> +	unsigned int bus_clear_cnfg;
> +	unsigned int bus_clear_status;
> +	unsigned int config_load;
> +	unsigned int clken_override;
> +	unsigned int interface_timing_0;
> +	unsigned int interface_timing_1;
> +	unsigned int hs_interface_timing_0;
> +	unsigned int hs_interface_timing_1;
> +	unsigned int master_reset_cntrl;
> +	unsigned int mst_fifo_control;
> +	unsigned int mst_fifo_status;
> +	unsigned int sw_mutex;
> +	unsigned int dvc_ctrl_reg1;
> +	unsigned int dvc_ctrl_reg3;
> +	unsigned int dvc_status;
> +};
> +
> +static const struct tegra_i2c_regs tegra20_i2c_regs = {
> +	.cnfg = 0x000,
> +	.status = 0x01c,
> +	.sl_cnfg = 0x020,
> +	.sl_addr1 = 0x02c,
> +	.sl_addr2 = 0x030,
> +	.tx_fifo = 0x050,
> +	.rx_fifo = 0x054,
> +	.packet_transfer_status = 0x058,
> +	.fifo_control = 0x05c,
> +	.fifo_status = 0x060,
> +	.int_mask = 0x064,
> +	.int_status = 0x068,
> +	.clk_divisor = 0x06c,
> +	.bus_clear_cnfg = 0x084,
> +	.bus_clear_status = 0x088,
> +	.config_load = 0x08c,
> +	.clken_override = 0x090,
> +	.interface_timing_0 = 0x094,
> +	.interface_timing_1 = 0x098,
> +	.hs_interface_timing_0 = 0x09c,
> +	.hs_interface_timing_1 = 0x0a0,
> +	.master_reset_cntrl = 0x0a8,
> +	.mst_fifo_control = 0x0b4,
> +	.mst_fifo_status = 0x0b8,
> +};
> +
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
> +static const struct tegra_i2c_regs tegra20_dvc_i2c_regs = {
> +	.dvc_ctrl_reg1 = 0x000,
> +	.dvc_ctrl_reg3 = 0x008,
> +	.dvc_status = 0x00c,

Why do we need to add the DVC? These don't change.

> +	.cnfg = 0x040,
> +	.status = 0x05c,
> +	.tx_fifo = 0x060,
> +	.rx_fifo = 0x064,
> +	.packet_transfer_status = 0x068,
> +	.fifo_control = 0x06c,
> +	.fifo_status = 0x070,
> +	.int_mask = 0x074,
> +	.int_status = 0x078,
> +	.clk_divisor = 0x07c,
> +	.bus_clear_cnfg = 0x0c4,

Shouldn't this be 0x094? We are only adding 0x10 if greater or equal to 
TX_FIFO.

> +	.bus_clear_status = 0x0c8,

Shouldn't this be 0x09c?

> +	.config_load = 0x0cc,
> +	.clken_override = 0x0d0,
> +	.interface_timing_0 = 0x0d4,
> +	.interface_timing_1 = 0x0d8,
> +	.hs_interface_timing_0 = 0x0dc,
> +	.hs_interface_timing_1 = 0x0e0,
> +	.master_reset_cntrl = 0x0e8,
> +	.mst_fifo_control = 0x0c4,

So now we have 2 regs at 0x0c4.

> +	.mst_fifo_status = 0x0c8,
> +};

...

> -/*
> - * If necessary, i2c_writel() and i2c_readl() will offset the register
> - * in order to talk to the I2C block inside the DVC block.
> - */
> -static u32 tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
> -{
> -	if (IS_DVC(i2c_dev))
> -		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
> -	else if (IS_VI(i2c_dev))
> -		reg = 0xc00 + (reg << 2);
> -
> -	return reg;
> -}
> -
>   static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned int reg)
>   {
> -	writel_relaxed(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +	writel_relaxed(val, i2c_dev->base + reg);
>   
>   	/* read back register to make sure that register writes completed */
> -	if (reg != I2C_TX_FIFO)
> -		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
> +	if (!IS_DVC(i2c_dev) && reg != i2c_dev->hw->regs->tx_fifo)
> +		readl_relaxed(i2c_dev->base + reg);

I am not sure why this changed. Why is this now dependent on !IS_DVC?

I understand that DVC has a different I2C_TX_FIFO address and but don't 
we just want ...

  if (reg != i2c_dev->hw->regs->tx_fifo)
      readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));


>   	else if (IS_VI(i2c_dev))
> -		readl_relaxed(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, I2C_INT_STATUS));
> +		readl_relaxed(i2c_dev->base + i2c_dev->hw->regs->int_status);
>   }

Jon

-- 
nvpublic


