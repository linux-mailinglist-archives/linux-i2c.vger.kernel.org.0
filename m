Return-Path: <linux-i2c+bounces-14730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3775CCD9167
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 12:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACEF0300B821
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA74732BF55;
	Tue, 23 Dec 2025 11:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z1u84RDQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012067.outbound.protection.outlook.com [40.107.200.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA82DBF76;
	Tue, 23 Dec 2025 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488893; cv=fail; b=TOMqLu/JRmrcsjfbwpXhZsCVGoQnRDqVsKDCS4O3VYL5LBcLjCWxQZ6JocTEbIkQkVorhItfb36NUTvH/qAiSnl6AhI4m/Xo+zYXtN8bJcxsVwFAPvijfSEIoh9sp85DESIDZ2XWAQE4ce3ClcKMfRVEeHtSxKkQueRJ867kSDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488893; c=relaxed/simple;
	bh=nGSwAJTnLbWxDA/tjp2xrP1OX4fLxSxx0s23wNAhpX0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nIEKAlikIF4srcDfCeogwOL+5BKZBDSR0iTV2XmERIrmR6/opinRx2DGUeBLipFqndwTrCEcrweGbNKcM113L5nme99pvvPRDT5Ykj5O3M7wEfHOT6sJEl/9jSCBL8XWy5MKLfG1BiAPxNl7H/fdAG94ATLiT6xtvG9UD2LxZ6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z1u84RDQ; arc=fail smtp.client-ip=40.107.200.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMioanekCXDystKPv+gHzsRom6suu040Vdbw/cWetA+1QW6bTvFPIQ1qNJBmNvvxDkjM6kBU59QpAMYnCM2kInksqTR6d8pPVUFHvt6SiVK288aVlIFMhD+b0E61I1lc+9lV0xIju+mBhp7YsS3KrKzForiesx8rKEq1cL/yWgfrlOrzOqd9hYgXpCHFvaeNkGItDyA/bZuw/G8lOfY0D2T4X22uM9cBmPyPnOglksSPboCA7Tw0/p5Hn/X7CW2E0XYYINsjBaQIU+8GQppaKcRdxXloHnGe56VhK5tK8Ejaoh0143YKVTqv/nwnajyNUl973X+Kq2TW2v4NuUXiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ad9vc6Z78II5RmIB+tddjEqJxzkRHz05pWfdQucNtEY=;
 b=wUsXAwk8oBGVWVpvqTWT2IbSoTZDUv8Vy3/w/7rUPFcM5j+BLEQGTT372jpiU6vp2p1rtWMExc9rNgmNlbQRRGYnqBtcg/c3i7rcsTYr95RgLwrZ+OWmQwJody31zpjPEyEH8zcQcfwlf0xTIsRATTrPfdf7oc1muL7pwjkq5NPHggeYv7dEmagSv7GZTIb7xZthqmYUIjifPnu7vA4QPt9mygXiCT0hD3IyQmtEB6mdHaerK+YRtv192g6ZUW1YwjbIddp9T65ttbN2obnZjw6xpleW7W3L1DKX/eKLPfQOW2+hFnrh7IBM2N/NXY7ZH+JY/pvP5RTiMzY/1gs1cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ad9vc6Z78II5RmIB+tddjEqJxzkRHz05pWfdQucNtEY=;
 b=z1u84RDQnUru/pqCi2XpxAd+QhzN+/oT4P8m5fD6RbTfD4gM45zbTONqHjfTIq2D8HGkEuKcYFenMxj3jkHDc9eJpQvwDy/FM8/O7gVmvFusTO/MA8nojwPlAZrHVh0JCDfyV33zDpcYvZS+oXpZUPdLp/b/M27AqRpM25NWqT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN0PR12MB6269.namprd12.prod.outlook.com (2603:10b6:208:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 11:21:29 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 11:21:29 +0000
Message-ID: <5ec59326-fb63-4236-9c10-3ee37763129b@amd.com>
Date: Tue, 23 Dec 2025 16:51:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] i2c: amd-asf-plat: use i2c_adapter_dev()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
 <20251223-i2c-adapter-dev-wrapper-v1-3-bcf960a48fa9@oss.qualcomm.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-3-bcf960a48fa9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN0PR12MB6269:EE_
X-MS-Office365-Filtering-Correlation-Id: 641b3026-be5e-44d3-e9e1-08de42156b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW05Z3BhWEZwQ0M1MVVpbFJtMzVZYlhBRmRTbklJY0pIKzNkR3hBaUhldGtV?=
 =?utf-8?B?eUNCa0plZ3g0UXY0RUo3dFlBRVRjdFY4eDMyVTh5YllKclhLdWUweHd0SGlE?=
 =?utf-8?B?NXJZMlgvTFAwRllaWHZIa0ZISzFlNUF1T0dJYXpqZjhOWnZ5c0xqQ2drUnIx?=
 =?utf-8?B?eFFHV1IvbXd2VHpoN0lwWTVNRHlVZmw2Yk5RK2ZFQkZoaSttTWR0SUw2OHUw?=
 =?utf-8?B?ck9zVjJQczlkdm8wVzNJU0d4OWRqYnVtZUsyQmRtcjM5UHAwanVJeWQrdjRX?=
 =?utf-8?B?Wk43c0h4SmxUZ2d5cEtUelZyZEI1NXlyUjdDY25vZjFzUU1ycDlPNnRjVGJV?=
 =?utf-8?B?QnNERWVvZ01yVFJWUWhTbWhvN0pWUm9RRlk4ZktzaHc1UDI3elIyNHVzR3Vy?=
 =?utf-8?B?c21waGxHMXNudDBRTFlramswUHhpNHBITVlsOGhaOGpNTmIzMWtRdE5WTWFo?=
 =?utf-8?B?Y1o0S1ZmcHc2cFJrVndnbEdEUkNrOFVCZFI4VkRrUWV4TFVEOTRVSkJQNkU3?=
 =?utf-8?B?MVB5WGdjM3p4bVdtWXV0TTZxSTNQRGgvN2xyUUU5RXJ3ZFMwM00wSzM3VVM2?=
 =?utf-8?B?bUxSbHpheGM3OFN1VTdodk5PNmRZeW5aWHJrSHFGSEpKMTZjRmhpWFFTZWFV?=
 =?utf-8?B?VlkwenVRMDRRZXM0bkxyTTlTaUY5cTR4SnlSYjRjRGNGQ3ZuZklhVmdKWEhm?=
 =?utf-8?B?c1ZzZzZxOWFtTWtmRUY4bHptYnA4OGZERjBPMFQxRGpOdndKMGVqb2Y5MEtw?=
 =?utf-8?B?cGRwcjhpVXNkS2ZqKzhnOFFFeUkzZDRLbmFEOUJIM2NDZWhDdnBJQ2lld0NU?=
 =?utf-8?B?WjVTVlFISEI3ZTgwRHltb1p1RmN3L0ZKTHJEdlZiUGpHWVd0TzRKWm1KWS9q?=
 =?utf-8?B?TUhkdUp0QTRnV1NkTlVtZVJ0cHhUQnFLeGFDN3VGMUtZSlJzVDVUQ0NjM0I5?=
 =?utf-8?B?WTdyL0oycXdUaDNsM3Q0RjRQVy9KV0EvdlE5MU1sbVV2VXk0MDVRbU1tUEp0?=
 =?utf-8?B?M3BXWWF4MkdSVGc3SmtMbFloczhtQTA3S3hFZlV1V3czKzJNdC8wREw5SFZU?=
 =?utf-8?B?SnFZWEdXM1JnQW0xNlRLR3V5eW45cG1ORXVBdVpUaGQyMjIyQVpXOXlOOXBT?=
 =?utf-8?B?cUVzSmd0eE5velA2WTdBK0N4cUI3Sm9aVXduenZheDhMSmp3dDFHa29BSWxj?=
 =?utf-8?B?ZXNZTmtJTjFDaGFQU2w0RWttQ1NuMG93dVZscExXeFpkRzkveVNtRTN2RjFv?=
 =?utf-8?B?cFhaRnBINWxwMnN4WEpOMk1kZDJ1N0F3WlZvVklrWTVmT1dsNVNpcWd1MnMw?=
 =?utf-8?B?Z3pGN0w3WENjM284aVFEMDVGWmQ0eG5uYUJzaSt0SXVkMkV2em5XOGVOUHZS?=
 =?utf-8?B?d2RYNkt1WFA5c3oxNzlJekQ5MTlvdXlyTWFZV0JuektXbWRrKzJ5WjQvZzM2?=
 =?utf-8?B?R0dYMGxHcDdxUjN2WG9uQ05tUW1aU2RITnE4dUZWZ2dhTTN0SHVyczdmbU4w?=
 =?utf-8?B?ZG5mSTkraE9LOWJBcnVFdGZ4OVp1OHRjVHRhQkFQL1JYVFpuOUFOdnFXeE4z?=
 =?utf-8?B?dUJoeUlkRktzM1pZZi9rZDhrRlJXQXArOGNqbDdsaUw0QmRUb2M1K2NNUDBu?=
 =?utf-8?B?Um41bWhYeUorM1h0Y2p6djBrNlp0OVdHaGErQ0ZsaDBCSHYySmljbE04UWtU?=
 =?utf-8?B?MEdKaldLanRBcFRuMzhFR1laRHc4dDROemwrL2pMazZOQjhjaHpaY3dkd0Za?=
 =?utf-8?B?djZ5RVZWczk1V0ZDWnJIV056Z3oxV1MvbklUQ2FscTJJRTJVWmRBYjB4cGNs?=
 =?utf-8?B?eDNHT0J0dFMxdnRXdk9taXN4YmZxcTh5c3VzWDN5dnVYSTRDQXZCdWExS0FE?=
 =?utf-8?B?WGxZaWgxSTBQTTVmQUl4THR3U0V6SUdNMTUzeFRCT01GczlBRVYvQ2VwK01N?=
 =?utf-8?B?eE5tSk9VMnNGby8vSzhSNTJqckJyRWxMVHJueVdIUDdVWkxsOUgzQ2k5emZN?=
 =?utf-8?Q?TVYJEVh7qEw0X1ecPIZKOGGGs7TlPQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RldBdkd3dHEwdG9tbUV6ek82Y0RIMWRlMzdrUE1LZzViRzBkUVZnMUhCQ1VS?=
 =?utf-8?B?cVU5M3dxWVBLYWlHSkxOK3lYVHZEUjNmSDFLUHVKQ3hyS0I3ZkNJWGdrK21m?=
 =?utf-8?B?R0VjMUJPZlJJUVFtaVFHUTVxVTZQU2lzcjZwRDZEalBSSEo0TGtESi9lbEJD?=
 =?utf-8?B?UkZhOG9YVzZ3VU9zTXBDaktndEFMMmFTd0E2QnhJMEhqRjA1U0hTcStPQUJt?=
 =?utf-8?B?am5OMVkxSUwvM0JwbGFNbzZZa0lwaVBUcGRDK1k3Njl1ZWp4anNhMERkNFVs?=
 =?utf-8?B?eHZOUnhlUmU4OC9kaWFzWXo1c3A1MjlDdVVnZXIxMjVKaGVrRzZDZ1R1L01K?=
 =?utf-8?B?Y0RJaFhReExqaGN0d0lrZHp1bVdXQ2gxOTZGSVVaaVY2U1BTRENSeFJZYkZV?=
 =?utf-8?B?WmlmUVVDTEVIWDVKNkhUanhaTkZlNnBvVUVab3lTMHErdGVrRzBYUEVpVzk4?=
 =?utf-8?B?cSswWm9QY0pIYWRaejdmS1MzVkx1anJjcE5EQkN6Y0ZrWnBGbG16cmV2ajZR?=
 =?utf-8?B?TkhZUi9jdnRVWVV0VU1ZWHlJbU5JNDluWVY3VVlLNTJCZTdnM3Z0UlVZc1F3?=
 =?utf-8?B?S0g0dmpHNEN3VXZhdEh6V0ZqZVV0dGVFbjMvZkw1ZVc3aUNPbmJmVWx3Q1BP?=
 =?utf-8?B?dUh5b0JiTkRDMXNZSEIyV3k1QTUreDJaUERSRlArZTdqY3V6dEJIa0xFV0lF?=
 =?utf-8?B?UkJqdHZ3QXhWRmh3Tk5JM0dkWUVXRllwZTh6aWN4QklkdFVuUWlDQjZaOEZj?=
 =?utf-8?B?aU1UYVpmYlZPV1pUMDdwQ3YrZGMzakpkaG9IYlYrOVlZZTVtM2E4eEdtMXE4?=
 =?utf-8?B?VTRRVnVsMXloVCtIeWJmbjllRzZTZDVzdDlkRHZhSU85MWRDbWpWcE52d3FD?=
 =?utf-8?B?cHYxTnVKajkwV0x6QkErK1g0UEpVZWh4WWZzNmhjVjNtYzZtN2U3d2dReVhY?=
 =?utf-8?B?WDM2VFFtSVNOU3FRYVRRN1Z0SGNSMW5kQmJlMVhRYnZZL3IyaW9TV3ZKUTNL?=
 =?utf-8?B?a1o0SC91eUFYK1ZJekRCVGhTdFFFZVJzb1J0V0NmdWhXbXpWdXlOL0dnMjhY?=
 =?utf-8?B?TkJHVnB2eHNnVDdYckR3bTl5VEtQa1pqallCMVJwSU9nSm1IQm5QVDY2UlA0?=
 =?utf-8?B?TmNzOG9TbzZzOG1McEp6MHhzbmgrd1BHeVBGaTUzWit2cUE0TUFzZ2J3VDFH?=
 =?utf-8?B?cGpVOVhYSElEZzVVaU5DVkJ1b2dYQ1ZxMkMxQzdKVlNGOHptMEVwcnhseXp6?=
 =?utf-8?B?YVd1aStUeld1SmRmM2RHbnhQbkcwMFBsbXYrZjVUcWxYZzMzeXVoNVRUYWtO?=
 =?utf-8?B?eERHTVFpMVZsd3NWTzVZRDBIbW5Wc241elNGZEd4cldFRk9IbGdydnVSR3E4?=
 =?utf-8?B?ZnBadFMxUWsxVVVXV1U2NVowcWNyYzBQVEsvT2paMHg0QnVQOFlMTDZYM2JG?=
 =?utf-8?B?cEZNQnNqN1RIRDRDN25KT21mNElVamVHdDkzdENQRW1JOUNpdDUxMTBqZjln?=
 =?utf-8?B?cCtNdXAwcmdaWlRuQmZ0VC9aM1N5TEJsaG5YeFZod29uWFJWbTRhZERsR1Y2?=
 =?utf-8?B?bjlJRzFvMmVoS2M1RjJDWEIrall6TFFxUXFTSWJVSzdGSXlQcURiTm5ISVVw?=
 =?utf-8?B?VlNycXU1MEtxTG5JYnYyU3hYU2RVeHlhNTdGdWdGOUZrT3c2OWRRbE9meW94?=
 =?utf-8?B?d3cyRURCNHhaU1NoMXFjdS9pWUJBQWNKdE91TkloVkVqYWRBMGtCdjdZUzMy?=
 =?utf-8?B?Nkh1VzVsV1dQOWZROUJCdjkzRDRKaE8reDZKa1FlZzhMbjdvbGhQZU9IN1VR?=
 =?utf-8?B?R1FnRkd5TUJhNGN6MWFGbHpzZFA4ZzFBOWhrSjBSUG1NYlNNTEk1MHNBOUpr?=
 =?utf-8?B?bkZIZXo5Tm5Ldkl5WXV4WkJTVnFQTnJoWHVGQmVqWkk2ckdOVHhmdm5Ec0FZ?=
 =?utf-8?B?T2ZTQlU0TUxyYlNlelFDNGV6MTMxb0dsTWFLTmtjaE95aEpKeXVOcG41bmRD?=
 =?utf-8?B?OEVLMHJ1Y05hQXVUcTlwQ2pOMXdUWXFHdUcwQWFyTjNZelRTdWhPWXUyWFpV?=
 =?utf-8?B?SVJzMkUzN3pIblVQc2hEY3BTU2dLZUZtVVdjVmR0RThhelRqU1Rzd01CRkhB?=
 =?utf-8?B?YlFYcldjUkRGTHd2bWgzbC9nOGoyZlZ6cEVaekJmTXBqb2ZLK0diV0xjeHhP?=
 =?utf-8?B?QzdZN0dKYVNHcVpHN1VPdnlwcVlGbW0vOXVFU0tRT2lrWHY4K3BZR3NmQmFS?=
 =?utf-8?B?bUw1OWZsZjE4aU9ZN0RPbUNLRjgyc09BTzJ2MlZaaGFFblNJYU0zS3FEU1Q5?=
 =?utf-8?B?VElOaXVad0RYRjJocW42ZGhvS2M2d1RPUVVZSE9NeFNDT3lqd2tMUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641b3026-be5e-44d3-e9e1-08de42156b10
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 11:21:29.5497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVKEco+zXwklzgIAOxtT8bxr+sPr+B1REozDBhVfZhbkfTyYB43r8zV/LXZbvOtFnafYWUHhJID3dB8uzdTREQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6269



On 12/23/2025 15:38, Bartosz Golaszewski wrote:
> Use i2c_adapter_dev() where applicable in order to avoid direct
> dereferencing of struct device embedded within struct i2c_adapter.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam

> ---
>  drivers/i2c/busses/i2c-amd-asf-plat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
> index ca45f0f233210a3b03a16c4a240012bd524fefb0..271b1b24417d06cc87733268c3191aea16fa1d83 100644
> --- a/drivers/i2c/busses/i2c-amd-asf-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
> @@ -209,7 +209,7 @@ static int amd_asf_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  	asf_data[0] = dev_msgs->len;
>  	memcpy(asf_data + 1, dev_msgs[0].buf, dev_msgs->len);
>  
> -	ret = piix4_sb800_region_request(&adap->dev, &dev->mmio_cfg);
> +	ret = piix4_sb800_region_request(i2c_adapter_dev(adap), &dev->mmio_cfg);
>  	if (ret)
>  		return ret;
>  
> @@ -224,7 +224,7 @@ static int amd_asf_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  	ret = amd_asf_access(adap, msgs->addr, msgs[0].buf[0], asf_data);
>  	piix4_sb800_port_sel(prev_port, &dev->mmio_cfg);
>  	amd_asf_setup_target(dev);
> -	piix4_sb800_region_release(&adap->dev, &dev->mmio_cfg);
> +	piix4_sb800_region_release(i2c_adapter_dev(adap), &dev->mmio_cfg);
>  	return ret;
>  }
>  
> 


