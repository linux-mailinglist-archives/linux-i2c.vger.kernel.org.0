Return-Path: <linux-i2c+bounces-5931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDA896493D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 16:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DE071F22F4A
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 14:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57D91B011E;
	Thu, 29 Aug 2024 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TDbgkme1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2521A7AE4;
	Thu, 29 Aug 2024 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943346; cv=fail; b=XmfVsPp1LWYbJoqMCEOur3Rf4BHWqRZ+zn/5IHLhCUOSm4i5h/iB0msfrhtMDi7O9b8Ew3ds+aEQVVfrOcDNQ4VWHtwvIUFLtggRWbyCTLeDJh1zYgrLd8JbbZCmQLMy01KdXx69ljFT4zYgMx+VU+WMPxS/FnPeFAcXxfq3yjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943346; c=relaxed/simple;
	bh=LuswVS5Ia5SLEMC7kymB7AiO5IF6B/jqYX0UeeQFlUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PsKjD62N6fbWKl4aQyespFbwTtPYhg2wqP5yfMMQrp1XmQbf6pvqzXYAVM01WqD/qrBt8ukHOxBvHTHO+RqJ4vpYcCCTwxNIvEO/C0L/MU9QMFzw5GIPWXoJpcIBfyaXSRkH4PqpQ928PneSK0jx1XC6EOOPn+5bgR4gEAi8+wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TDbgkme1; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIBLYhx6Y12RZ2wkS2OAAIH4rjp25rLIfh0HC5Oe8kCoZCkP7Jx3EqcM+gXZTXYRJxuQsNU8V9j/NlGkl6uFbP/AzmR6AmCvT4S6ejwMhl9hrhTBuUVBYnLQ7BmUgt7zTPPJVnCgZv6zmCv0S+IWz49moeKZNBN7E/gu2Yb47kM0LcLmAbfZu8bWWsrstglgKXeyWI3KjFo0nWy4jAMb2UE8ubaBWM/GSj1Oj/+7oAHQh++ov7CWWaAcBs4zKocUqpxQCpgqz+f+kbmJmtso9zEnEi/gaKJGs0rfwAs8XC86m6mX0FUDxMWG2wlr2Oyt5r5b5CekrK3L8QMoBk6rAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQitDBFUh2gKJYiCRPcTu2kMygEeRGFuEtn47ddTtAk=;
 b=jjBUqD3mGXGmIiGvPWA/jS+nh7CmBS92/4lCARlxhEW4gpLyVPKGWPU2Q/QUqIMSpg2lVYEPC0pcsZPHJaTd12XND1WkD/DeuuTOUzgNItBrcQcg8IpYX4x//q9oQy/nf3IkrtDXrWxol6Jt+Yvr9HOWhmrYVhNbQpyCpj4wjO25mlmC1iida7/3NeCK2fFcGcA/E1Z5Gd6GjazTf7EFDFH4FaJJ0KeBKy8VHBavbNko/0aM2Xd74gcd7JnmR0Yh9lWhPI+LaSx+mVPE6pP4hJKmlHvwSzFJvTgKdH8lQ88dzrxP3JuUbs2irGfcYq5jKmJ02ptnsvjgYgCkIdYAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQitDBFUh2gKJYiCRPcTu2kMygEeRGFuEtn47ddTtAk=;
 b=TDbgkme1qL/zKwUoFOEQbo2dM6aaEfLQqilb7igBfGKpgCh/6xEyfEidt0x7mN/dWB8uZEOzkk5iDZUtjtjYK+EfXOWJnSiyvBOwLAJHMC98nvnyuoD+R9BoSC1XMpONSH02+QxZZ4WBbLZHFlooDJ2kua8nPD3WWrEWeWvcDpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 14:55:37 +0000
Received: from MN0PR12MB6102.namprd12.prod.outlook.com
 ([fe80::912e:40f0:1632:14ae]) by MN0PR12MB6102.namprd12.prod.outlook.com
 ([fe80::912e:40f0:1632:14ae%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 14:55:37 +0000
Message-ID: <9d424592-c157-417a-9d6e-d12d80e19829@amd.com>
Date: Thu, 29 Aug 2024 20:25:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: designware: Consolidate PM ops
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com,
 Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>,
 Shyam-sundar.S-k@amd.com
References: <20240827150101.2171107-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: "Goswami, Sanket" <Sanket.Goswami@amd.com>
In-Reply-To: <20240827150101.2171107-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To MN0PR12MB6102.namprd12.prod.outlook.com
 (2603:10b6:208:3ca::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6102:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0972d9-cccf-471f-2552-08dcc83aa446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTRJaTZPak1Xck0wKzc2RUZnRXJiYWJoWEU0Z2Fxd1F3TjhKaHFQQjRXZ0Jv?=
 =?utf-8?B?RklkSU8vVVdMU285aHRteFB1VUJYbTJDeGRUSlJrTFpDc0dDdmRNZHcrUkhy?=
 =?utf-8?B?blFXMGc5dkhFSWVkUXI0d1hTa1RLRHB6NHp3MmNwSmY1bXdybS9heFkvalAy?=
 =?utf-8?B?eU1KTjBIdU5LMGN2RTFpcnNCN3lQUFRtTUlWTDB1R2hqNVhDVWVmbVBCbjdB?=
 =?utf-8?B?S3hnZE5oMlJZekNRM2FFN1FHVVVEdHpTQ3p2Q21UdFQ5SlhmWjNReXBRclJK?=
 =?utf-8?B?Zkh5ZExsZzdsREYwT1FwYjhsT203N0lQdmlIQjdxeStaUzhoNTdXUDVqUVho?=
 =?utf-8?B?RDJqZ1JBTmFnLzlaMTJKODdTN1BSM3djTkdzSjh0bnZYSWc0YXVuc1g4YVVO?=
 =?utf-8?B?di9GRFp6QWl4V3VJWWJsTitiRldNVDJqbUhUY1JnNHRHM3p5K2QrbG5RSElC?=
 =?utf-8?B?Z2p6cDhFN3V0MEZkSkF3S0FWZzJnQ3dDK2syQ3ZVdmFRUG13enVTaElpT2hv?=
 =?utf-8?B?aitQaVlFNVNleVJrNWRyU3E4Qzk5eVVoM0lXbGNmYmZJK0lQcW5iUTI5UUVv?=
 =?utf-8?B?R21CZzVROURKVGxBRUw3RzI5OTZLYmJVVTRzOFRtT3BtT0Q2dmJ5SEo1MnAx?=
 =?utf-8?B?d21UcFZOS0xFdDhLNlZHazN0dkNRZUxNUm5EN2RVOE1wait4c3ZvZjlqYW94?=
 =?utf-8?B?ZWVQUFZXaG4vRWI5UktwWFpPMFdpUlFVRDRZcGc5M1RvajcyRjNDOFZTUG9S?=
 =?utf-8?B?QW9Dek5wUlhRaTZsdXo4Z3AxaTFibnFBRVFlS2t1YUlvdWlkSGpKbTZjY2hm?=
 =?utf-8?B?dFAxa1YxaWdKaWRCaUJ3WlIyQlpjZ1hhOURXT3JzMU8zb0lCU2JvV1FObWxY?=
 =?utf-8?B?QmtxY0VEM3d1M3NxWmp0Y1Nxa0R4MkJhaU1abi9pam03cjFCYTIweDN4K1JM?=
 =?utf-8?B?TDdFcE5VVEo4SkFzQ2lvTXdPQ2FrdGFSeFFreHNiU0taYTJTS3dlZmNpcUZM?=
 =?utf-8?B?U016WkdqclZIcWJYaW5NVG0rcytXRU9KMk9jaFphUEl5NnIzRFB6VlJtcm9F?=
 =?utf-8?B?c3NtQThpMVZRb2tDRzFYZXRUTnRyWmRjZEcxSE1oMzhKOXdJT3ZHd0F3QzNj?=
 =?utf-8?B?azVjMjNiUmhncTJJV0J2TGpCbnU1cldzUGhleGszTnFuaEJtWW1qMGtSNjdj?=
 =?utf-8?B?NXJhUUYvSUV5d25xQVVyK293bHhIZ3VXYkNoeitTVWx6TlplTnJOcEtYSXBL?=
 =?utf-8?B?NHZLeUZFZHpEUTJUYmNNRVVqSmFYbURlc3pEZUNXRExwbXpIb3AwempjdDJX?=
 =?utf-8?B?dkYyZGFhSjBiZkFSOGw5ZzJsczNTY1JsOUJDam5oSU9qYm9QTmdvMzdtS1Rs?=
 =?utf-8?B?NGRaZHR5TXlTamJNcWU0Y0Y3TDBsMGlUTTFjSFozc1NSMmxIZHYxV2ZjS295?=
 =?utf-8?B?aVBlSG5ZeHlxVUZPcEZPb1JHSFd3aVhmRGRLQnF3OVRQa1ZrcWc3UC9qelZE?=
 =?utf-8?B?NVJidVV4alNyazdjWHZ4bklqMGxPNDJVeHU2cFNUUk5jWjFwdWxvUGxQcUJ6?=
 =?utf-8?B?cjJWazZtRnI4V3dLWkppZFhaS1ovVWVNK3NhYkVjR0F5UkUxdFBRMUpKblox?=
 =?utf-8?B?WWJqV0MxTlhOZUxsTU1iZmZYWmVMbjlENEhmNGtDRElCTDQwZm0vckhKeWdq?=
 =?utf-8?B?M1o1aTNQZ29MR2Y1NmlGRkt6bWppMFdjZW5lUEZndGFrRWZJbU9uRlhNd0dm?=
 =?utf-8?Q?60I0gdH9TiZoizPgJE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6102.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlhWMys5WS9XMG1nckYwL3BQOCtaMmJHUGF4VjJJMTFYdk5Lc2NwNTQ1UTla?=
 =?utf-8?B?azhwY2tXRkNxeUZpTTI2SVRyMnFLcGtySG94c3dCcWtPMXVJbVJHM284eVpT?=
 =?utf-8?B?S2Y5cVI4R0h1OE9QWjhtTXdXY1JpOVhCOThvenh3SXhlMmRtbnV0U2w4VHl6?=
 =?utf-8?B?UmI1eHFqZ0xxRmh5R0xQUGhBc0phemhvR0VOOG5QZytuMGV5SHd1NGhVVHVE?=
 =?utf-8?B?VDFxMGljY0ZROS85bWwvSE1nV2N1b2lkRVpVQkpncUtsQ3QrWGdmMGNGNk85?=
 =?utf-8?B?aG0zRVA5VmI0Q1J3M2hhMHJ3U3hGRWcvYnE4cWZialNPWG04OVl4MzlsTWZs?=
 =?utf-8?B?VXl1UjZXMFBpdk9wRkllOUVpNjhaSFNsVTZHcUpFTWNFYm1kT1g2aW5YMDB4?=
 =?utf-8?B?KzlBMStFQUFGV3RudnY5RkMxM0lRVTV5VHgzNGhQdFBRWlVSaGxmZFY2VFhl?=
 =?utf-8?B?Tk5mbmtpM2E3dy9oTk5FNUYzdG94ZGNTczhDeHFiM3JoU1JBdEVkb1F5c2ZO?=
 =?utf-8?B?QW5kajBlc2htOEJDcWVHL2RCRkNxTUpYRWFsWWpNaUo0L0xzS3ZERmVPNTMw?=
 =?utf-8?B?aUlQTzUzVDhHQ2VUcFhYbDhYM2R2ODdaOWxTajFQK0ZIcjZoakNVU2VSYnd2?=
 =?utf-8?B?YVNIYWYvV0pTVERwcW1scHY2Tys0OHU5Q2ZiaGNMWGtHaFpVek8xWFdRV1Nv?=
 =?utf-8?B?dTVGYURDODNHdUdGaTk2a2JoSnUwaGt0T3V4UHZDZzE1eWtmR25KUGhaeGJy?=
 =?utf-8?B?Vlk0cXpkVzJ0NksyMUQ5QUw0Y3pHY2JnN2ZIWjZ5b3F5TFhvMGQ4a242Tmw2?=
 =?utf-8?B?VjlYZGQ4UU9uTFBMTGFEMm5mMElwc0FxTmlaMW13UWJXWkFINWo3d3lWbFVW?=
 =?utf-8?B?MFY4Vm9QQXZ3dnFmV3BUN2tRbEhsNXA5cCtzYUlqLzROYmJSWWVrb04ybGJ1?=
 =?utf-8?B?SGx0Q256NVVpbUZCUldSVEtkWGg0aDV0THBFZWlrYXF1KzV2d0ZEQmNNZkNM?=
 =?utf-8?B?QXpPZGhCMVJrK3JKSjIrVEdLTjdLSHJEcEp4dEQ0T0t2a3RENUNKTkJjOWd5?=
 =?utf-8?B?Nzl3ZFRORDBwenVVOVMxMk11RGk4VmtXZ3dscDljRjZybVdCaGxYajBtUHZ5?=
 =?utf-8?B?ZEwzMmR3VEFHb0ZGVnVxNFdGbnhuTTVOYURhUnFsdzBpUlYrRld1bTVraEor?=
 =?utf-8?B?V3NVdnpoencyUmhDNTV3S2hrZ2NBbU9manZTK3YwK2Z2Q3BFb1hrUnJUQkc4?=
 =?utf-8?B?bitNbW9xY0NYV0gybDNuVGZWVWloRS84ckNxMU51YWtGMDJ2czdnRUhEeU9z?=
 =?utf-8?B?SVliSldGOWNSajFFWmVqT09pSUtDQzBIZ3JHM1lKeFJyTDYyVm83UGh0SFZP?=
 =?utf-8?B?bnB6Z1pPMDBCek1tMUFKNDR2aWF4RlYvYzBlK29hcUN3ejdJQ2pXMFhUN05Q?=
 =?utf-8?B?RkUxcG5iaVpEMTRaRGUyOEx4aTlhQ2N2RUprZmZsRlg5NXZ4bFFpdU84VnRw?=
 =?utf-8?B?Y00vUTF1SGFxLzgvTGJrVEZWaWxabzZRQWZ4OTNDc2hXY25QYnN0QjFNMjFV?=
 =?utf-8?B?c0NTVE5BRkJEK1cxeDRkRnphZE9uZXM3NnJGRVhwN1FVN0xNbkgrMmVHTVho?=
 =?utf-8?B?dVpZekl1QWN2S0QyZDg3TnZva00xN3oxM2p1cUUzYklkUUtTWm9PTmZwYVhN?=
 =?utf-8?B?ZW5pb215NVczK0U5c1BKQ3JEVkQraXNjWjlHQzJhZlEwREd0bHAwWDd5Nytj?=
 =?utf-8?B?M3hjUUx1Y0Q1TXZwamhRdStNalJOU2ZiTUVBUWhiWWViYzZRV0p6a24wU0tB?=
 =?utf-8?B?UVdYRk1UWmFHdmU1MHZJS2NybFc5SWt3eUowY1JsSFFMcDNQWElnbi9ibjdL?=
 =?utf-8?B?bkhPVGY2RFR6eTZkU3luTkxEYlk5NktIVk5UNmtaR1FZcmtpSE1QckxWaUhQ?=
 =?utf-8?B?alU1U0ZQcGJoM0lUT0dQOWFPdXphellPamY1UzdUVkhPMlI2NHUyNDZsVkJX?=
 =?utf-8?B?aDJqeWdQTjFKWkN5cWVWTjQraVQxWTBOdG14WEJoZVVDWGNhT1BDVERoWGNF?=
 =?utf-8?B?aVVMbXRVSjc4dGw2eTdHMDlXU0hFa24zSzVJVk9seUVqdVJNWjFUQXMwRjBk?=
 =?utf-8?Q?YJ9VZdyJ94mKOdWZieW0vWtUf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0972d9-cccf-471f-2552-08dcc83aa446
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6102.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 14:55:37.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P48VWQmiWErdk6jQdEWaacs/18GWlH2VfE9Zs3+NQg1C+0bbGf+nsRwK559JWP+QXKu3ZNXBDfMt+q+xsyGodg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408

Adding Shyam (as he asked me to check this change on AMD systems)

On 8/27/2024 8:30 PM, Andy Shevchenko wrote:
> We have the same (*) PM ops in the PCI and plaform drivers.
> Instead, consolidate that PM ops under exported variable and
> deduplicate them.
>
> *)
> With the subtle ACPI and P-Unit behaviour differences in PCI case.
> But this is not a problem as for ACPI we need to take care of the
> P-Unit semaphore anyway and calling PM ops for PCI makes sense as
> it might provide specific operation regions in ACPI (however there
> are no known devices on market that are using it with PCI enabled I2C).
> Note, the clocks are not in use in the PCI case.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Tested-by: Sanket Goswami <Sanket.Goswami@amd.com>

Thanks,
Sanket

> ---
>
> This is just a split of a single patch from bigger series [1].
> It was made in no functionality change manner, except the PCI case
> described above. But since it touches PM and it was an area where
> regressions were observed I would like to have a formal Tested-by
> from AMD people to make sure we don't break their setup /
> configurations.
>                                                                                                                   
> Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]
>
> v2: fixed rebase issue (LKP)
>
>   drivers/i2c/busses/i2c-designware-common.c  | 62 ++++++++++++++++++++
>   drivers/i2c/busses/i2c-designware-core.h    |  3 +
>   drivers/i2c/busses/i2c-designware-pcidrv.c  | 44 +-------------
>   drivers/i2c/busses/i2c-designware-platdrv.c | 64 +--------------------
>   4 files changed, 68 insertions(+), 105 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index b60c55587e48..fb65fe6d8122 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -21,6 +21,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/pm.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/property.h>
>   #include <linux/regmap.h>
> @@ -736,5 +737,66 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
>   }
>   EXPORT_SYMBOL_GPL(i2c_dw_disable);
>   
> +static int i2c_dw_prepare(struct device *device)
> +{
> +	/*
> +	 * If the ACPI companion device object is present for this device,
> +	 * it may be accessed during suspend and resume of other devices via
> +	 * I2C operation regions, so tell the PM core and middle layers to
> +	 * avoid skipping system suspend/resume callbacks for it in that case.
> +	 */
> +	return !has_acpi_companion(device);
> +}
> +
> +static int i2c_dw_runtime_suspend(struct device *device)
> +{
> +	struct dw_i2c_dev *dev = dev_get_drvdata(device);
> +
> +	if (dev->shared_with_punit)
> +		return 0;
> +
> +	i2c_dw_disable(dev);
> +	i2c_dw_prepare_clk(dev, false);
> +
> +	return 0;
> +}
> +
> +static int i2c_dw_suspend(struct device *device)
> +{
> +	struct dw_i2c_dev *dev = dev_get_drvdata(device);
> +
> +	i2c_mark_adapter_suspended(&dev->adapter);
> +
> +	return i2c_dw_runtime_suspend(device);
> +}
> +
> +static int i2c_dw_runtime_resume(struct device *device)
> +{
> +	struct dw_i2c_dev *dev = dev_get_drvdata(device);
> +
> +	if (!dev->shared_with_punit)
> +		i2c_dw_prepare_clk(dev, true);
> +
> +	dev->init(dev);
> +
> +	return 0;
> +}
> +
> +static int i2c_dw_resume(struct device *device)
> +{
> +	struct dw_i2c_dev *dev = dev_get_drvdata(device);
> +
> +	i2c_dw_runtime_resume(device);
> +	i2c_mark_adapter_resumed(&dev->adapter);
> +
> +	return 0;
> +}
> +
> +EXPORT_GPL_DEV_PM_OPS(i2c_dw_dev_pm_ops) = {
> +	.prepare = pm_sleep_ptr(i2c_dw_prepare),
> +	LATE_SYSTEM_SLEEP_PM_OPS(i2c_dw_suspend, i2c_dw_resume)
> +	RUNTIME_PM_OPS(i2c_dw_runtime_suspend, i2c_dw_runtime_resume, NULL)
> +};
> +
>   MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter core");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 723d599cca93..c6bd6f65a2d3 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -15,6 +15,7 @@
>   #include <linux/dev_printk.h>
>   #include <linux/errno.h>
>   #include <linux/i2c.h>
> +#include <linux/pm.h>
>   #include <linux/regmap.h>
>   #include <linux/types.h>
>   
> @@ -341,6 +342,8 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev);
>   int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
>   u32 i2c_dw_func(struct i2c_adapter *adap);
>   
> +extern const struct dev_pm_ops i2c_dw_dev_pm_ops;
> +
>   static inline void __i2c_dw_enable(struct dw_i2c_dev *dev)
>   {
>   	dev->status |= STATUS_ACTIVE;
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index dd188ccd961e..04377533f3ae 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -19,6 +19,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
> +#include <linux/pm.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/power_supply.h>
>   #include <linux/sched.h>
> @@ -194,47 +195,6 @@ static struct dw_pci_controller dw_pci_controllers[] = {
>   	},
>   };
>   
> -static int __maybe_unused i2c_dw_pci_runtime_suspend(struct device *dev)
> -{
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> -
> -	i2c_dw_disable(i_dev);
> -	return 0;
> -}
> -
> -static int __maybe_unused i2c_dw_pci_suspend(struct device *dev)
> -{
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> -
> -	i2c_mark_adapter_suspended(&i_dev->adapter);
> -
> -	return i2c_dw_pci_runtime_suspend(dev);
> -}
> -
> -static int __maybe_unused i2c_dw_pci_runtime_resume(struct device *dev)
> -{
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> -
> -	return i_dev->init(i_dev);
> -}
> -
> -static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
> -{
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret = i2c_dw_pci_runtime_resume(dev);
> -
> -	i2c_mark_adapter_resumed(&i_dev->adapter);
> -
> -	return ret;
> -}
> -
> -static const struct dev_pm_ops i2c_dw_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(i2c_dw_pci_suspend, i2c_dw_pci_resume)
> -	SET_RUNTIME_PM_OPS(i2c_dw_pci_runtime_suspend, i2c_dw_pci_runtime_resume, NULL)
> -};
> -
>   static const struct property_entry dgpu_properties[] = {
>   	/* USB-C doesn't power the system */
>   	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
> @@ -402,7 +362,7 @@ static struct pci_driver dw_i2c_driver = {
>   	.probe		= i2c_dw_pci_probe,
>   	.remove		= i2c_dw_pci_remove,
>   	.driver         = {
> -		.pm     = &i2c_dw_pm_ops,
> +		.pm	= pm_ptr(&i2c_dw_dev_pm_ops),
>   	},
>   	.id_table	= i2c_designware_pci_ids,
>   };
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index e49c68c6e142..285ba4c1803f 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -29,7 +29,6 @@
>   #include <linux/reset.h>
>   #include <linux/sched.h>
>   #include <linux/slab.h>
> -#include <linux/suspend.h>
>   #include <linux/units.h>
>   
>   #include "i2c-designware-core.h"
> @@ -339,67 +338,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
>   	reset_control_assert(dev->rst);
>   }
>   
> -static int dw_i2c_plat_prepare(struct device *dev)
> -{
> -	/*
> -	 * If the ACPI companion device object is present for this device, it
> -	 * may be accessed during suspend and resume of other devices via I2C
> -	 * operation regions, so tell the PM core and middle layers to avoid
> -	 * skipping system suspend/resume callbacks for it in that case.
> -	 */
> -	return !has_acpi_companion(dev);
> -}
> -
> -static int dw_i2c_plat_runtime_suspend(struct device *dev)
> -{
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> -
> -	if (i_dev->shared_with_punit)
> -		return 0;
> -
> -	i2c_dw_disable(i_dev);
> -	i2c_dw_prepare_clk(i_dev, false);
> -
> -	return 0;
> -}
> -
> -static int dw_i2c_plat_suspend(struct device *dev)
> -{
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> -
> -	i2c_mark_adapter_suspended(&i_dev->adapter);
> -
> -	return dw_i2c_plat_runtime_suspend(dev);
> -}
> -
> -static int dw_i2c_plat_runtime_resume(struct device *dev)
> -{
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> -
> -	if (!i_dev->shared_with_punit)
> -		i2c_dw_prepare_clk(i_dev, true);
> -
> -	i_dev->init(i_dev);
> -
> -	return 0;
> -}
> -
> -static int dw_i2c_plat_resume(struct device *dev)
> -{
> -	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> -
> -	dw_i2c_plat_runtime_resume(dev);
> -	i2c_mark_adapter_resumed(&i_dev->adapter);
> -
> -	return 0;
> -}
> -
> -static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
> -	.prepare = pm_sleep_ptr(dw_i2c_plat_prepare),
> -	LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
> -	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
> -};
> -
>   static const struct of_device_id dw_i2c_of_match[] = {
>   	{ .compatible = "snps,designware-i2c", },
>   	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
> @@ -442,7 +380,7 @@ static struct platform_driver dw_i2c_driver = {
>   		.name	= "i2c_designware",
>   		.of_match_table = dw_i2c_of_match,
>   		.acpi_match_table = dw_i2c_acpi_match,
> -		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
> +		.pm	= pm_ptr(&i2c_dw_dev_pm_ops),
>   	},
>   	.id_table = dw_i2c_platform_ids,
>   };


