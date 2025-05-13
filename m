Return-Path: <linux-i2c+bounces-10965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D32AB5D95
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 22:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1DE4C0008
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 20:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489B41E5734;
	Tue, 13 May 2025 20:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hK1WFbOL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FA653365;
	Tue, 13 May 2025 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747167387; cv=fail; b=rzYIugTBW7nNqgQ7Dq3dixqdTU8nVM1isfg79g3fyrZnEEUkI+jltU2WKKy7+viyvzpTCtaaNgOU3jO6yrF8Wm7WW9KuqnzVQw3g1W6gBaslzZjx+73+ZcyB6mjbIlmBTWGQe2iLfrGhZVJW65tFAUo6+/JUmZT+Kzoy21Zzyqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747167387; c=relaxed/simple;
	bh=cvmoz1O2f8zw7acPiweHC9zgiXOFDJUgmNye7R6BBY0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XPFYgI7cn/dfWFaO8Dwhx1NK3J72CZIyrkbzJl4nkN2cphC/SQTQ+pJ2Yk166Uvg3PjwGiBCvPnVuXHu7Y2qTOJjmXn7UZrAnd04ykJvA8UCIAfKieriguDlktcPtMTaY5QRUYkzYRPcDrfsqdqibFk0Ctk1m8XnTWBK1Ba1KzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hK1WFbOL; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfEuetijY1zuJ8Q0s64pSim7YcgEZW/DXDR3R9YR+nfxIzlrJPritW+fi+ZOP7GO9kTqLfFYVmYaX/IP8jQVYOkx6NKpeP7cyunOgmUimJ4BvfcZ65Iz9qMDlweDYKok/uubK0ISWmRLbeGCT4fO3vx0eryGuq90DFPnYfE1cjT5dd0p2JoSxUNkHZaycfI/ZhLUfJ0i01MdPqfszZoxoyRTFGkzzTch2xYM7gJ/OTeURnjyR7wsa/tC69PD83w2DhX6igpVjsm+rDA2bMY6OruzoQhQ98o+DvvBlJmYGpMzkQkSCECtZRDhW46rDM2nvIud+hTHPvDxfuJnuAFUMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGXVFnsEPojOM6fu8l2bcODfAMdpKwrBBvvwKeF3BcY=;
 b=kwUlIC67w6fn+sR3E7/dz12j0/wZEGzcWdvX/H7tYS84mfIT9r8v9t5Su2u3zSOjV0V8XkoG0XPDELvzbFofZkN7t11OZRlW2qsoeUxmHtSnRDMnXckBIhZ7Tui6kj1A7ULpLedphjgH2chubgn7BAlILwRMbgjWE9UUiSRa0I7hhRZXP64tBJMNV0ErpXk8QL56LzF4MdAs0tCK3vGQVNtaSsZlT19Bef2VC6F1OCJ/9QAJGYz5WDECiT/NTX+5gDnyxfsKFZ3UTdiAkaOeRX5SXkMl24sfaxhrUiMXC/yAWxv83uRWHIMVbIM46MunTHx2RGGSZ25G++h3mZTNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGXVFnsEPojOM6fu8l2bcODfAMdpKwrBBvvwKeF3BcY=;
 b=hK1WFbOLZsdiBrJgyXspjxvEjnYaeOYUJIB7tayuVLGlIY9ZUleIlo1e9LiYDVxsQb5FpgZbRYFoK8wsDMjGNResnQUr1PVdBvfYJeHLs760Sy7kV05ZKKeOhVylwB/l+TQR7nY+lVh/XzqlsjLEuVwXYEV1ino13kB0jHXeMvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12)
 by BL3PR12MB6524.namprd12.prod.outlook.com (2603:10b6:208:38c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 20:16:20 +0000
Received: from BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4]) by BL3PR12MB6426.namprd12.prod.outlook.com
 ([fe80::3e7f:241b:d574:95b4%7]) with mapi id 15.20.8722.021; Tue, 13 May 2025
 20:16:20 +0000
Message-ID: <cef4cd8d-5973-4bf2-a5be-30bad044817b@amd.com>
Date: Tue, 13 May 2025 16:16:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: amd-isp: Add ISP i2c-designware driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org,
 mlimonci@amd.com, krzk@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <20250424184952.1290019-1-pratap.nirujogi@amd.com>
 <fc126869-15f4-48f1-a44c-30c45f8dd2ec@wanadoo.fr>
 <b7a5e00a-a744-4824-bfac-fd9caed1726b@amd.com>
 <b0fd1c29-4f5b-41e0-a113-2b24527e5e73@wanadoo.fr>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <b0fd1c29-4f5b-41e0-a113-2b24527e5e73@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::44) To BL3PR12MB6426.namprd12.prod.outlook.com
 (2603:10b6:208:3b5::12)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6426:EE_|BL3PR12MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: c99498db-9c09-44a6-b1f8-08dd925b05ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0VQSnVQTmo5SFo2bXhPWG9YQjNHRHFjMDI0OWthQytQSE1JdTgxOFZRS1hm?=
 =?utf-8?B?bUNLLzhjbWFuaXNWK0cza1J5KzZtUzJoKzA2eG5yQ25nRjcrVFNWL3BLdEM5?=
 =?utf-8?B?NU9IYjFaQ2FSdk5NVmJZempmbDlLeGJ3QlZ6OUFsc1Fwamh5MjFVY05WWHhu?=
 =?utf-8?B?K1dmZWFhYlhXRkpTY25HeVhNMGVNM1ZXZFBOdkR1eDdMbEJaVjVPeHhSdjE4?=
 =?utf-8?B?R1dBL2VHSS9aaWRNQ3podlNXQnlVK25Ua3l5WE9WRlBYV25nNE1vMEUrc3Zk?=
 =?utf-8?B?Wm1xbDVleHVualpQQk1nU3lHd1RlVlJnYUY1NnRrQU55V3haU0dpVUJmbUJh?=
 =?utf-8?B?eFM2NEdkNVZoZnRiWjRBKytxdE1DTXVlWVBMMG5UbGxLOWQwVC9JcnFBT3ha?=
 =?utf-8?B?dEZ6dFNyNktDRWU4RUVFUVRneDlBNWNnYXFCWFUyMnp1bzdJa0FZL0hLYlF3?=
 =?utf-8?B?Z1lSZWFrZ0UwRzFWVm1qOW0vd0V2cXYvU1pYSEJXMkFGOTFCaWxkZ1BxaFNK?=
 =?utf-8?B?ZGRMNnZPV2t3VzYzdFRZaUp5OHc0RnRGWXVIV3FKWGlabjNMclB2VWhLVWU4?=
 =?utf-8?B?SzlvcnhxbmFSeWhEOHdvbitRYm1UUVpCYkU1R2VqS1ovSWRsTkkrTFU1Tndl?=
 =?utf-8?B?QkUxZEpPNDBPWjBGeXdRMGNHUFJUUkZod3lBckdhSEZCdUNKZU04MDh0Q1ow?=
 =?utf-8?B?RFdOYzBFeVMvajlrL3ViQ2FrRW1NQzZqTmovcElwaEtvTERlUmI1QWNFbzZI?=
 =?utf-8?B?YWExM3pSaEFqSU40WnpvamdWb2dWbWY3WkJTeTZ0eFkwdGhsRCtjM0lVOVo4?=
 =?utf-8?B?a2FBZzNyRnNSVUlhb0cvYlJQVlpYRU5LRzB0R256WlpPT09sdW0vbWIwUlB1?=
 =?utf-8?B?Qm9ndlhnK0s2YktNVld0N3lMaG9WeTM4NEtUQ0FhRDJyNURUWW83NmtOUldD?=
 =?utf-8?B?R2JXV2V3WDhQNmxUeVNTTll2UjNEaCsxQllWY0N3aDIwWld0bUVEVEM3UGEy?=
 =?utf-8?B?anZ3ZWM2RFVWTnptWU84ZlJSUkd4QUdNSCtaSEFhRElxcXlaM0JKejloUmdy?=
 =?utf-8?B?b2Z5cE5BTldyclh2bWtOLzNXcEhFN0RnMWg2WGY5bjBXQzdheVVtUFY5VFk2?=
 =?utf-8?B?Y0RacmdxSDNFTk1zV0swcWZBU0lTOVRKK1RHSmlLT0l1aEthdkRYN1BibjJz?=
 =?utf-8?B?a0V4eGUwM0U2alU0cjhCMFBqQldDOFhwTkorM0VGeVpESURaU2JGQ0xXdlQx?=
 =?utf-8?B?NVJGWEhDb2JGVW9kVXV3MWtzWGp3K3NxRnpBRytxQkFwRHNRUUpCY3VKLzVi?=
 =?utf-8?B?T1AzTThwUmowdHh4MDFlQ2JTZ1R2N2NaUVNYYSt4TUtBRUZOdUN1clBweVpp?=
 =?utf-8?B?bXYzT284L2VDblFab2NjSmc3NFZpN0pJWUJnNE9uY3BFc2V3SUtRUWhlYTRJ?=
 =?utf-8?B?RkQ0V0N1ZDVwZ212UDM0ZjJXWTFsb2JwZTRLcmZCN0d2QXhHYUI4RWRSaURU?=
 =?utf-8?B?cVRmdFAzSjk4SUVXS2VQSHlzU3d3OUNlWHR3UzV2dEsyczAwMlpoNXpFbUZU?=
 =?utf-8?B?Y0JPV0gwcUJMZlE4TmYwY20ycmhudzk5akkrS1NqWFRoenBtajdLK1hlajJJ?=
 =?utf-8?B?OENKRDY5eHB0N0NzOEdQa0tESUNsK3N0am1PV1ZDN1pXOENVMVQzZ2RkNnRI?=
 =?utf-8?B?M3VCTjRhWDFuSVhtSi91UlpUN0Nxa1JnaysydmQxOWNjd2RKSk50cjZadzA1?=
 =?utf-8?B?dG1xWHhCbDZDdVNqQVRRRk56dDE2MWR3OVk4ME91eTY3RkkvZ0lZbEpPelVW?=
 =?utf-8?B?dTNnUGRHVTFaWDhNdE1odFQ0Vjg3SytFdDFMamlodEgwUStwYzQxTUdqU1Nq?=
 =?utf-8?B?Z3YrUXp5anZ1WVoySmNnaS80R0pSS1JoeUxTOHVudmNoNHl2Sld4UUpoemZF?=
 =?utf-8?Q?ZR8Usj/Mvbg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6426.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N21YdXF4SmhyNmwyQys5U2hHK0ViaEtWKzdxMjlDY0RrenlUOEp1THhxSjlr?=
 =?utf-8?B?NHlleDJzaDdyNk1jeGlOYWtwc2ZiZmsxa0FhVGYwMUlGWHd3SExKQ21xeUF2?=
 =?utf-8?B?S2xmSzdhT0dnZjdLSGw4YW5QcGVnbmhYc1BRWVl3R2dFdHhEUHFqOXk3a24x?=
 =?utf-8?B?bGViWEZsRENybUc0ZzQ1a2xqdDBFOFBJMjlvRnMxN3QvSU85alc1eWNja1JI?=
 =?utf-8?B?Z1MvYWVET0xPeS9NOTZlQXducE9Ib1hXczZ5bDZMMitjZlI5aFdpNGl4NlJV?=
 =?utf-8?B?ZWxzZFcxQ1dOb3pjd2t1ZUdtSGJmMGlxdVdIUjBISEZ0Y3RhY1BROVBCYndG?=
 =?utf-8?B?UEFueHRYMUlrejRCYU45UUFobjJGSHhqSWNPckNPQTZOSndsTlBiaDlrS0Zh?=
 =?utf-8?B?U3JMTjZNdUx2UDFZY0JPbzZxbnEycm50YVhPSVpTUnV4OXdCN2VrTXZYQXdT?=
 =?utf-8?B?MjlzSkxyK0hFRC8rTG51RU9DZ2ZPMit1RXRRb29ZRldNQitSSFcvY2xNRDAz?=
 =?utf-8?B?QVhnZ0lSMS9ZMS9GZHBwWHVYaFAxUktOa20vdnp2NTBBOXBpbGY3WmUrTDVk?=
 =?utf-8?B?K05tRWJTZ1dWVFo4UEdwc1paZk9HTWRhbTFkL3VmeXYwZEJCcE1KWXBoTExM?=
 =?utf-8?B?Zk90cVJ0ZHJhMGQ1b2FTZmxyenAyU2VIVlA4OHFhZTJhUEtVU010b0dCUzRo?=
 =?utf-8?B?SE03Y1B5eVY5aE5IR1BBWHBWdUtTOWhiMTR4MDdFRUpwVWpTZlRkaU1uemNs?=
 =?utf-8?B?Vmt6UEZsZHR3OXhjQ3VnWE5SaEh0R0N3eVNOTGE5TVlrTSs2U3ZYdFZWNjBi?=
 =?utf-8?B?TjZOOUVZbWZzTHFXdFdEWXY0bTFhcFRDMGNSalk0SW83bTBqK21GU0dBMjA5?=
 =?utf-8?B?d1pxK3BYUFZYWGRsSmpLbGJRTzFXWk5zZExQQUpPcE5iRGNCcGlsRzdmWmxF?=
 =?utf-8?B?QkRhaGRkRmJiTTN3TnRhS0YxSmdoVDNUM0Q3RHNzVkNOVFVic0RRWERucmE1?=
 =?utf-8?B?L2hKenJtTnhuYlBIc05iZXpMR3FOeFRvRHhFQ3F4T1ViZWJJaVJqNGd2YnBO?=
 =?utf-8?B?dVlKNTFLSnROcHlRTWNja0JYSG8zazVlalF2aDdHc25FNkcrSnFCNDd5SGk1?=
 =?utf-8?B?aEVrc2FDYWU4RDdzL2NUaUpVYmJCMUE1RDZUbS9JZmE1Vy9nV2J6cGV3V3l5?=
 =?utf-8?B?YThqVEFkNjVLTzFERTR0eFFrV3J3ZitPZDFTcGZNVFVjNGVmcjV5OVNtakxr?=
 =?utf-8?B?QmtpV2Q5M1lrY2hicnI0dUQwLytSUHBtV1FoeGlHeUZSRnI5WTZ1M0g3SktB?=
 =?utf-8?B?aFpDMEc0SHRWMFlHT3pxSm9DN3hnc0VqODdIS3pFQWx5Y3hIbWdKa1hLZ24y?=
 =?utf-8?B?MS85RHY3eW9QQWozQXJ0Ukc3eFM3RnBwYlIxTXdpU0tqZ3V1NUUrVmFpMVpU?=
 =?utf-8?B?dDF6Wm5zbXpiRTdjN2l1ZGh1SnV1UWZIdjMrNzU2UFlraHFnSy9GZ1FFbkEv?=
 =?utf-8?B?ZmZCYTZidzV1NGJxMHE2Nmh1TVZpMGoyeFhXWExjSXZxSkNEYXFsR2tkUWpG?=
 =?utf-8?B?SjVJdHNSaVJFbmw0TUdjclQxdlEvcC9DQmdzM2RCUXF2Z1RFVDdYZGwraFh2?=
 =?utf-8?B?TFcwbDYxLzBjcnM2RS9oMnN4bDJKV0hxeEU3S1czWFpITGxueW04QnROSDNI?=
 =?utf-8?B?Rm1oS1NQY29EV1RJcXpXRzF1YlpWVGk5MUpLc1ZBWG4rWTFJWDFIQk5GUHQ2?=
 =?utf-8?B?VXB5UU1Sc3RwalVSUzhrYXNCRDRuRnljVjhEb0w0VnpmNHBWY1VObDFSSFkw?=
 =?utf-8?B?MlVIWnlTK0w1WUlhT3prK3lQWFhkL2FZMS9ES1AvVG10VkQ5U2VvZTFkUlBi?=
 =?utf-8?B?VWdOamIxYys4bEVnQWRRblUySXliMENaMkJqOHF2cHBuNDlOQmZuL0ZZN1pw?=
 =?utf-8?B?bU80NWkrTE04TE03U2Z1WmMxUUJOanVFaklWV0hhZjl3SWJtdUpNaWFVYTVJ?=
 =?utf-8?B?SU1jaVIxTlpUdWh5MEJESW00cEEybzZtaFlIcGwwYm5pNjJOM3k3UXpxYU0z?=
 =?utf-8?B?T0UrMXIxNHBuVFJBbzdFN0RSYXdsT29MRFBoYUQ2WHlXSUUvNWxLSHRkZFhI?=
 =?utf-8?Q?nryabPo+DYCoys/XX2TC4UWsL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99498db-9c09-44a6-b1f8-08dd925b05ff
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6426.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 20:16:19.9296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0glwof2Oz/NzcTMqtmxNz//0zvZLaRU3KbrfxggJWh794t4CGDn5dOywLkE95iUWOlLK0qv1n/DKYxTZgK5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6524

On 5/13/2025 1:23 PM, Christophe JAILLET wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Le 13/05/2025 à 00:24, Nirujogi, Pratap a écrit :
>> Hi CJ,
>>
>> On 5/9/2025 3:11 AM, Christophe JAILLET wrote:
>>>
>>> Le 24/04/2025 à 20:49, Pratap Nirujogi a écrit :
>>>> The camera sensor is connected via ISP I2C bus in AMD SOC
>>>> architectures. Add new I2C designware driver to support
>>>> new camera sensors on AMD HW.
> 
> ...
> 
>>>> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
>>>> +{
>>>> +     struct dw_i2c_dev *isp_i2c_dev = platform_get_drvdata(pdev);
>>>> +
>>>> +     pm_runtime_get_sync(&pdev->dev);
>>>> +
>>>> +     i2c_del_adapter(&isp_i2c_dev->adapter);
>>>
>>> Usually, this match a corresponding i2c_add_adapter().
>>>
>>> For my own understaning, in which function/calls path is it hidden?
>>> Is it needed here?
>>>
>>> CJ
>>>
>> i2c_add_adapter() in this case gets called in probe. Please refer the
>> below call sequence for details.
>>
>> amd_isp_dw_i2c_plat_probe()-> i2c_dw_probe()-> i2c_dw_probe_master()->
>> i2c_add_numbered_adapter()-> i2c_add_adapter()
>>
>> Thanks,
>> Pratap
>>
> 
> Thanks for your feed-back.
> 
> Maybe having a i2c_dw_remove() which undoes i2c_dw_probe() could help?
> 
> or, if feasable, having i2c_del_adapter() be called by a
> devm_add_action_or_reset()? (note that i2c_dw_probe_master() already
> uses a devm_ function)
> 
> CJ
> 
Hi CJ, good suggestions, I agree either adding new i2c_dw_remove() or 
adding devm_add_action_or_reset(i2c_del_adapter) in 
i2c_dw_probe_master() would simplify the code and avoid the explicit 
i2c_del_adapter() call in amd_isp_dw_i2c_plat_remove().

Thanks,
Pratap


