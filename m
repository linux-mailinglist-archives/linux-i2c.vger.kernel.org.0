Return-Path: <linux-i2c+bounces-11004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 849B9AB9E12
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 16:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398C31B6479E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 14:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC9613A3ED;
	Fri, 16 May 2025 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nn1yy7g4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC42581;
	Fri, 16 May 2025 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403994; cv=fail; b=ZxNlNnWM+HzEbrbTDURHuWmGxjnDhD3hNCXgAbpCTF2t9pu7Jof0pjPaBKQYppyr31kqEbiI8xUzit5r0sMk69DNmxhlHHsmryS811CYSfgI2vADXZC0eo6ZR30cmW0+8/s5JjjSGNaHHn952DkxqEpnTgzKlDBXzw5G+zJZwMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403994; c=relaxed/simple;
	bh=ZRoTet4WJ4K8L5K3OURpgHRz8yWe9yCN4z7wOJYiE1Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CA0e5MqNahdfzGRXkrYP8u3TS/brW1buEPEljOHWzagbzK8F4mUmjqJio5Bc6FsrY85N8Ep4HwL8M/7lpQZlZDEGam35k0xNjWpDcrH+ZxyGGW0TYXPuIVpUa2SykXr4D5Kye+aukt7BmrSqbrhRFFM+5v1Akd837GGtTlHDs+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nn1yy7g4; arc=fail smtp.client-ip=40.107.237.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLwJ7mfgdwDFiIWfb4REifOQPJOOWTU7ucHR1ebcRjZToKVTLC+BXvm+MxQW0oCSRM5vOMH2BbnqEoFgTgMW62Hqa7V1dgYTWc/SsW/EqOZ5Py9RKnuPEuMTFqxZpKsZQ5UzAobJ8GkaGtv1Cm0LFZmLP4PebIhpry9ZbMjmlKNAs2ScFsOcxLyl6vCjzY7cRezucF0A4EkAsVGwVoZdSkvw7c8pR18yHBIVPLstd9siebj/Q3DDCeTOH5oeDuvkxuO4fkaJ3Pt3RTK/QYCxDQh7bYV/00dLSKF5/oA2kFpYVQwB/JZPuXUM83WagmfB74w1UCRog7Q8JsL8WL7uAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99zXMhW8hsECTHnhlYqBihVOJKbaa9TEjRgJTvZSb9g=;
 b=nLJxTe0z4saRiJzypYToIUKS8pTPKrzw8ZfOnfAj85lX0upnv/O50IbAQRp6lJNoh4cv+XaejG9LzmomEEPxQR4sbc7xWU8I4KVapfQnm+1az1fDge9CDihDR8nC5FBN/uz8mi+lrmHF4owksLQacWvceiv8aJt4zbvQ1tMDjvPO8juXY9xLqUrrh9aOtHWjrL9NPaTAvh4d2X7THNkUzjfpg5qJ67h+Z+31gu2pGQfjxahxfLazs9VgLEi42eOsWjHtEJRWGVOUfOzj1+sqMkWhKjW/rudYJQxs2kUwbP6CowCZ+qmQYny5LiNnh7Upih4Wb9qgSfkgK5dv9BptFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99zXMhW8hsECTHnhlYqBihVOJKbaa9TEjRgJTvZSb9g=;
 b=Nn1yy7g4e11YJP+QTIfp3kU38ANONlEwN/VNWTrLNTRnBx9pDEU+Ng+uBzJ4V+nZQQhxko4/nL7JptZPWAKa7vnsDK4QudthMB9d8ssEI1/5bBGGkdUKIyf/7nsckJSZT4W0E9PN0nPKnrdAUGSIHmatXoadoXp3UyfZOBfZre7LvQ5r/tGQblEKjyJ8u0Ty2KgGEOq85wiekvslM98T9GtGV8to9xuABotgjLeyx4GmjWw4Iqybvzc/X3ZyFMtQgy874Nhw2RLwwdPkumGwzwDOHz9/nRhsEUgiYVBB20WKinGcUU/wlt5ZHs3RqtjM4zARsKM/vBMZM9vZ0U7rfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 13:59:49 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 13:59:49 +0000
Message-ID: <e24f406d-dce1-4201-9fd5-69dead1a90ed@nvidia.com>
Date: Fri, 16 May 2025 14:59:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: Add required properties
To: Krzysztof Kozlowski <krzk@kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 thierry.reding@gmail.com, ldewangan@nvidia.com, digetx@gmail.com,
 p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250516124349.58318-1-akhilrajeev@nvidia.com>
 <31cf95ec-ef19-4f87-a27b-9ff183f5d257@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <31cf95ec-ef19-4f87-a27b-9ff183f5d257@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::12) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bba543-523d-4571-39cd-08dd9481ec00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkNHYVFrUTltSTEzUUp4cGJjQ282UFdRd2tJd0IyR3lwVTIxUHJCeXYyOW1y?=
 =?utf-8?B?Y0xXZ3BwZXRQMTd2eHFDSEt6b2laYnNNeEZQT0lFNDZtMkRCTmVWNlZScHBn?=
 =?utf-8?B?UythM1hJVjZ6cTRyL1FyTUNHaGo4RTBlUEM0UnllQVRrVTI3azVoMjB2WHds?=
 =?utf-8?B?bGpnOWcreGVkQlhZalRFaWtmemdTc0xtb2ZvN0RubTRiaDVzWTRjTHBFeTNz?=
 =?utf-8?B?V3Y5ZVBzdFdCb0xiS3ZOdHdQUVp4ZkdlQkZYaC9vbXhDNjRFanFnTmR6L1Vr?=
 =?utf-8?B?Smw3K3VMWTlVcVVuSmJua1NieFZ3cjJFNTdlS2x1cE4rNFg2b0psNUJMMEll?=
 =?utf-8?B?cDlxWnkya05rczJIY09BTUdXNWEwVDlDejRGdjBCRnJ4NFhjd2lBWS9KeVJC?=
 =?utf-8?B?b0lOMnJyT3JMTTl4TnJmeTlPbjN1MXorRndZM1dneDViVG1Jc0szSXprbGJJ?=
 =?utf-8?B?SmVKQWRmOEJ0OEpmTEJPWmMxYUVNdlJpRFl5eVlNVE4yNG9qeGx4OTIzYXRF?=
 =?utf-8?B?S1l4cGNVWlMrNG9Zd1VGNlloZXN0cEZ4eU9rMVNjbE81WE9xL0M1cDd1VWUw?=
 =?utf-8?B?cmRiUVNUVnR0UWJlNTByYlMxbFArYlRtK0FYVjU0OEtRYjZQTGV0OTQrRWVW?=
 =?utf-8?B?bW41REphZ3hxT29HVHVMcWg0NFRSdU1ITDlveE5zUmVGbENFY21qeHU4ZGZP?=
 =?utf-8?B?ZzFueExlMWxaQkFhM09pbnR4R29iTThZTk5LR0JMcU9URmVIejByUHdDekht?=
 =?utf-8?B?VFFweWdUc0JaTjcvc0wvS09uQXFKdDl3N00xNHYrVjQyMmx5YnZGbVhQMGll?=
 =?utf-8?B?SEdzbGJIVG5nUkZSb2Z4MUVIMVJVYThTdjM3K0x2eHpIZEphYVpoYU85dXdN?=
 =?utf-8?B?M3prZmQ2MVJ1K09pZEFBUTRBb203bThySWQwekdNYlB1K2RFeGpXcHN6aVZt?=
 =?utf-8?B?cWFVTW11a1M0SFYwUWJsaXRDcHIwSTdEUkp3OW83cktqUlBkT0ViaS9tTitm?=
 =?utf-8?B?WXlJSEJNZ2liM2NqUWlnRkhtMVNRNHRibjdJOWxlblI5M0hHU1ZJOWRCcVFE?=
 =?utf-8?B?THc0aytCb0x4WXJKYmNISi9FeTBET25TNTU4clc3Zzg1dmYyQ0R4aTFGa21H?=
 =?utf-8?B?alNjdEtCRXBkVXdLcXpYVWhNM1pFeW9CdjBZWnczcEtIeTFZZkxmelZUSWZl?=
 =?utf-8?B?VTZnb1R5Q2t6WjJVQTM3Qmd6cHBoQk94NkRlQ1pXUVc1SWUxUTJVMkJSd3lU?=
 =?utf-8?B?dzFTVFZ4ZHNyOG1hUzBIMGQvWGZXOE1DYjZycWM5aU85MEhrdzRMS0I4OEVO?=
 =?utf-8?B?M0Y1UlQwcHA4ZEJrVjYxaE1SYnhqR29NU1ljVEthOWdNL3NQVUJHM0t1Yktv?=
 =?utf-8?B?d0pYYlp2RHQ3MVBibmwyaS9iOVdFNnJBUHhVT2FQQWE2RjlUeGtNbDNtd1Vv?=
 =?utf-8?B?T08vNFRvNlZOdExmT1Q5eXFQVldjODFJbFU5bjNCMkNCQzY3enVsRlNGYlBx?=
 =?utf-8?B?eGhQemZxS3lUMGNWRTNUc0I3YWJPMVJyVDFzZHVnOWV3eWF3ZHRKREFzNlZ6?=
 =?utf-8?B?dDJKLzhadmdGU2VqNTdIaDZIaFhhUEQ2WWZpS1BhdlNKTS9rRDVRSlBaOEFw?=
 =?utf-8?B?ZytXdGVSQVl5c2pBWFhTbllBWjlNZ2NzOERhSTliZDBjeVhYUkYxb0cxNW45?=
 =?utf-8?B?RHcvK25RVlNtK3l5NTRaTjVzNFJ4MjBYUDNnNll0VU1ycHMwYWIrT0F5bGpR?=
 =?utf-8?B?czR3YktRVUYvb0dFdERkNDNqd0RxcFdBUXZycEd0RW9jcWVnQ0FUMkdQR2d1?=
 =?utf-8?B?SmVoOFROekJXOHRsaUtSSmdRR0lYdTlHNU5mZlRubjdnN2VnS1J2WFFWbklI?=
 =?utf-8?B?SXhHcnFyenR3eVNzUjQzUmJqSHQ4UlhrbTRWR2wvVncrT2hObllBSFNXdm5B?=
 =?utf-8?B?MlpXOEo0Q0p2dFk1NmVjWFgxZHdJT3I2ZnRlS29mUTlUTk8rR3k3ajNjdVVW?=
 =?utf-8?B?bE9tZUVvUEdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amR2RUxPRk9oSnFqWDZweloxbWs3dzZMTi9wZjZHSCtiSzB3TmFpSXhOeTVs?=
 =?utf-8?B?TmJwbWk1K3ZBZE9DU2UvMHlPaTM0VjMwSkRTdTFjMjFBMEQzR0M0YTZncXg3?=
 =?utf-8?B?NFZuK0l3UUw5anRFK08vTVRlVUx0dkl6VTF5cFE3T3JZcklMN3liTE84MUFo?=
 =?utf-8?B?Yi83WFUzMEJhWXpUUUpqV2JRTjBiek11ajloWTFpcGJPS0xXeXpNYUJnZDJE?=
 =?utf-8?B?b3NpOGhCWVg1REJkanJ2VE1hQzVXcEM2bkkzazdGeEhESUE2ZlRVK0NzWTMx?=
 =?utf-8?B?djVHckRVYzZrZW5remI0VTVBQ01STDd3WFpKcEVGMXFNbmZvcE9Va0s5VkRM?=
 =?utf-8?B?RVRtbnVZb2tqY000UlMxMGk5NWRrelB6Q3BEOHV4WVRPUjhMaHNOMTNXRnA0?=
 =?utf-8?B?NW9LbFFrNkJiZ0piZDVOTElvdjgxNC9qQXRqQ2dSOVl0ZUdMVFk2QnRpWDdW?=
 =?utf-8?B?OUdzR1VCeDQvOTdqUkl3ek5UQ0haSnNGVVRlckVJaTVmdWJtU2t2eWZPWnRJ?=
 =?utf-8?B?NjM4ZVAvMFJ5UGh0T0FiN2Fna0FmSFB2YVJRdCtmdXoyTmxwMFRYT21NbTNJ?=
 =?utf-8?B?MzVzZVp1QTh2RWpVRW9uSEJ6bmV3UWtnQVI4NEgvY21TTitVQllXVWhISmQy?=
 =?utf-8?B?UHAyVDA0ZmxOcWYwMGxiWTRPcU9GZmtOVHAwWFRUSFhpajdpLzdRVHBHaDhQ?=
 =?utf-8?B?S1VPWEt2T3NONDJnaFJlaU5za3hXNGhLVWFVeDd5OVFrREsvUjY0V3ZIbm1M?=
 =?utf-8?B?S2ZLZkJadzhjRXlQbHZwK2lzTGVEZ0o3TmpYSWwxb3ZWaFEwSmlmeUsxcVE4?=
 =?utf-8?B?OTU1OWtySXRoaVJUZGdqQkNWZS9BME1lRCsrbTdPSktMU3dpRnBIbitCWm4r?=
 =?utf-8?B?bHlGK1RQZmZGK1VNekt3UmJOMXY2eXJQS1ZhMVRtU2xHVFBqWEl4TEtpYnlx?=
 =?utf-8?B?TkVNMmFkRWxtdmkyY3hxK1NiY0FlaURhaGtESHVxdjc0S3NYQndLZkNLTFFY?=
 =?utf-8?B?TzJEWFpGSmpvb0EyNmFJUnI1WlNZSTlxODVVeHdTWDc2NVBWaUQ2SUx1dnFm?=
 =?utf-8?B?Z0kzRk9TTWFvamwvaGFWRityanNhZXo0a3cxWG1tRHR2TGpvajUrTVpTb2tv?=
 =?utf-8?B?NkhISnhlZms4UlJkRjl4TVQzMm9iekJNZWFQbmRDbjE4RWVEK09Qdis5alk0?=
 =?utf-8?B?UGZETTg4a0J1RVViM29tVEd5RWJDcmhJUkMyK1FmOFZBM1BDV3E5RmpXTmtM?=
 =?utf-8?B?OXZiMVlBWnZTb01hRHlyMzMzRkRBWHFiT0F1eDBaQ01vSlJjYWl2c3cyRUxk?=
 =?utf-8?B?eFlpbjl3WUVNZktSd0lhMG16dC9tbWkwZTRxN0ZhZVN3d05Lbmszbmh4Mmhq?=
 =?utf-8?B?WjROMGl2UndTS3o0a0VJNEU0NkxwazIrby9QWjBZWVpEWUJSUWdHTGMySEVR?=
 =?utf-8?B?NEs1U0dtSE9Qa2ovTWYva2g0K1lPSVkyVlltZGp0Mks0RDcwL0Iyc3RPLytu?=
 =?utf-8?B?VHpYSDJ2bXBXMTRaZGcxRFNWUEVZWHBEcmIwSzB4TDRBT2lCdXN1UHBnWGxx?=
 =?utf-8?B?MmRQa0NYSElxMEhSRFhsRG1DNGxmRVJCYlUyUXF1RUV5SFRqSzlHbHIvOXZh?=
 =?utf-8?B?TzdzNzEzNEZZL1lvaURiL0RVZzN5VTBzYmpLZTVPZWVia3ExWjVmRmNEWUV6?=
 =?utf-8?B?RzVXWEpXaGJLQUsrT3U2VWxCVmUxbE5tQW1YZ2U0LzhvZTJIbS9PMFhQTUJG?=
 =?utf-8?B?bjc2cFcwSFhwZ2ViNGNrQVNWUGJjYi9qeXhxSVlmYVhiY0o2dUppcEM2SEZB?=
 =?utf-8?B?VHdXZUZvTVlsM2VBcVlzdVZ3cHFRRDlkMVZVTFRha1VuY2kwMFhraCtoY0hM?=
 =?utf-8?B?TDNFUmJlRmNETjlLRS9GdUsvMVJ1c2hzNlI3Z0tWQlZObE0zVFoyTVU2QWh6?=
 =?utf-8?B?cXdhNmFwa0U5YXJQMjJRT1hSVHNHdjBHNmpmVEprSTZtaUNWczU0QXJIaXlM?=
 =?utf-8?B?Z2JmZmlrMWNTZlRwN0prZ2h3ZnZpT29Ec2xUMHdjanFlOXlGTUh2YjlkQjR2?=
 =?utf-8?B?L2o2aGx1SkFDVU9mZFY5V29RenVZTXAyd25xYUVpWlZWeVhkQVNIYnc0ZXZt?=
 =?utf-8?B?Y0J2THlqRHBBdEdpYyt2ZGs5aHc0SW5FeHdlR2F5TDV0VVlpMEhwamh0NEZC?=
 =?utf-8?B?VkQvTGxlNldFWDY0ZmthYlBSV0NHSzNaYmpBOTBsSUZyZ0N1bjllenE4WEh6?=
 =?utf-8?B?YWR0NzdGdXZncnZ1RDF6dm5nV3pRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bba543-523d-4571-39cd-08dd9481ec00
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 13:59:49.0503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kOOgD4xkn8JXFCNkUSTdst6476IQjVjz8aQUMXeYbFsKXb+XGZg3ah4aXxygLz3s4u2C0jwODD3/eM3cxDpTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512


On 16/05/2025 13:53, Krzysztof Kozlowski wrote:
> On 16/05/2025 14:43, Akhil R wrote:
>> Add required DT properties for Tegra I2C controllers.
> 
> Why? Required by whom/what? Some context or any justification is needed
> here. Are you breaking the ABI (means: prove that you are not).
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
>>
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> ---
>> v1->v2:
>>    * Added all required properties
>>
>>   .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
>> index 19aefc022c8b..0717f2304cfc 100644
>> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
>> @@ -118,6 +118,13 @@ properties:
>>         - const: rx
>>         - const: tx
>>   
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +
>>   allOf:
>>     - $ref: /schemas/i2c/i2c-controller.yaml
>>     - if:
>> @@ -171,6 +178,18 @@ allOf:
>>         properties:
>>           power-domains: false
>>   
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - nvidia,tegra194-i2c
>> +    then:
>> +        required:
> 
> Never tested, so quite dissapointing.
> 
> Test your patches before sending, not after.

ACK. Clearly we need to do a better job here. It is noted.

Thanks
Jon

-- 
nvpublic


