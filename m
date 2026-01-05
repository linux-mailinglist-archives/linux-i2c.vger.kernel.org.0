Return-Path: <linux-i2c+bounces-14904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 315DACF55FA
	for <lists+linux-i2c@lfdr.de>; Mon, 05 Jan 2026 20:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73D95306381B
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jan 2026 19:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2297340A6B;
	Mon,  5 Jan 2026 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aLdQEDHD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D61F1518;
	Mon,  5 Jan 2026 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767641174; cv=fail; b=gwpLD11IYlBRIRxe4xL6uQZ5spBVGnXlJi1FmEfhKhqcA9nyxjJppAygKIZVHniHn7PR9HhS0i52uLH+r3234+S+M84/vA9b26Hsb7QWmtI/0KYccOfiZ8QQuz1E3EhPYzGwJU70gA1F4LSajVyaUrsBQmcbK0jHD/KN23Z4KQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767641174; c=relaxed/simple;
	bh=WnfjuIMtadopYcvubs/2ma6lBsOQ1ovRlBftgWnZ1Ig=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a6vIsVWshYNsHTpxFmiKda2rO7xzRoxvKsx73Z8WHpkc3C2sykMZcv/qup8DYxRfKNHAjFZdl0E3O8zuItb3TdzOLgax/o1IrvRxuGP9d0vZuTX1kw4DZ5KkMiSOaFjgWVRtdbKwKFaoUZW8P+MEAP3uaLUk2nfhk5EvCPGQQro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aLdQEDHD; arc=fail smtp.client-ip=40.93.198.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTMlgDkeT90YLo77LlPtP7M4C6kQx2inhTp7JKi82/ZShenXkll3oH5Lt0R24S+htPG5hnfdelb+hXIG7xdNcwVeYyAX1Tln6QpBS4T4NOFwGWUbyLGJF1LxYaOibfUnVwt7yBmj4Tm+kIqT8bekLwGHTgJ2wUDTgPm3R7SC4O6GDAO2qZbVl4YBw4OKDwQVuvS9rEyLPulgc6aUUYe6JTqG62EOLClVv9wbV7MoGGG3t4axhbLqUOT8O7PWGjPV/bZIb+fKXyEP2uiu5e2ohvKadDJOhVhWGMybhAClf2xWllTjyBk1CHPT7qj857BxULaPLMPtYnejRGlHgPa3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiuEmComyr8YW4LIuew5AEKPKA6s6EwXyjBq0CSur20=;
 b=jh/GmkBPM6rZXwahC8qYjowJ+stl0jRCcL9Rxs5na0d1ihlkPA/pAgz5qaS/c1cWKNpOjwAZbDFPwlIZkD0bqr1088vEjaNVTzKmSwaZlgTEIM3GEu601gkAnBMmiOnCL8Klzd2ysU6+X4P5zKgFjfB52vGPU4k4LApQqWGtsOV6cHHZ68vg25nbSrB2aRUOyUeDdcR8oWBJuYWwWYVNDzSDKT2h3roEDxtGj4fM2YT1zUORwnw9ywGs/k4tEtGmWEGnqBHdjxcKuv4czUfDpYY2dFHnBRtzwYpZOkRXWqEO5WU65h80r8E+7Kx1Hv2+UFk/ce2HmnIqRyymh2Xh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiuEmComyr8YW4LIuew5AEKPKA6s6EwXyjBq0CSur20=;
 b=aLdQEDHDV458eyVT0HUksQxitfLsnAQN3KSwavejWoeBrZzy4UKIsWpW25G6GfXB7XzbhQZnhskRxjiFj2DFuBebRVjiQ8OnJNYJJTAzPam7JjJQ9aZv/VBWIwDuadUe0kMvzN1P6aMm9MR9UwrfnBPWalljTJbJQtIDGRGHexI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB9492.namprd12.prod.outlook.com (2603:10b6:806:459::7)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 19:26:09 +0000
Received: from SA1PR12MB9492.namprd12.prod.outlook.com
 ([fe80::a866:904d:73a1:d65d]) by SA1PR12MB9492.namprd12.prod.outlook.com
 ([fe80::a866:904d:73a1:d65d%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 19:26:09 +0000
Message-ID: <1622683f-6afa-4743-8a93-ba49b38c6f95@amd.com>
Date: Mon, 5 Jan 2026 14:26:06 -0500
User-Agent: Mozilla Thunderbird
From: "Nirujogi, Pratap" <pnirujog@amd.com>
Subject: Re: [PATCH 4/6] i2c: designware-amdisp: use i2c_adapter_dev()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
 <20251223-i2c-adapter-dev-wrapper-v1-4-bcf960a48fa9@oss.qualcomm.com>
Content-Language: en-GB
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-4-bcf960a48fa9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::13) To SA1PR12MB9492.namprd12.prod.outlook.com
 (2603:10b6:806:459::7)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB9492:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da7a4f2-d590-44d3-73cf-08de4c904787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGptcHQvZ1FDaWJQR3pUQkFxS0FxS2ROR0psZCswdjdaRDMyNk5JMUZLSHpt?=
 =?utf-8?B?dFJuVS9tVWpVQXJqQWRkMFo3dFJqdlZ4YmppK0s2WmJZQ0hHVTVBTDJ4Nkt1?=
 =?utf-8?B?OTNqUTdqN3d1UGFzY2JDNXl1c1pqSGhtb0h0ZDhjOFZhenhCcVdPTjNoRkxZ?=
 =?utf-8?B?UEsxM1NTL0N2a1gwTEhxdERPUkR0TkVPQ2hhcUVnMXVEUXRPR0pweWtqWEtn?=
 =?utf-8?B?R212ZTU4MXQzQUNFcVBsU1d5WkJNUEVDRDFWZWVjck9heXBST0RCL2pDWU5X?=
 =?utf-8?B?amMrMGV5OE5WYkdrYlB6ZndWMk42ZUdZNU0zOHk2TExRcTF3bS9LSmNsTjdG?=
 =?utf-8?B?YVQ1OERwVG43MmdWR25LdmVsMnU1QWw1U0trOE5jU3MyREpOZStVMkNHL1Av?=
 =?utf-8?B?bndqRFhZdXJORGF4M2d0RmY1VGNaOVB6RHJka1ZkNlVtYkpUS3lPSnprbm9n?=
 =?utf-8?B?aWZFZUlueE5GWmFBUEV6RFlJbVhvcWU1MitMLzJnRVI5dEpBVVlEYzJieWRK?=
 =?utf-8?B?aTIwN29kUGprREVLaGs4bm9MaWx3T2pjM0luT2lhalZhUGRGMWVudUIxTnV2?=
 =?utf-8?B?M3N3ZGFjR1lkUW43NDdYT1VpVXM3OTdQUXFGb3ZKeVRTM28xZGNGMEVST3dS?=
 =?utf-8?B?SXRHU1U5UEVkelhLditvRjA0azF3L0ViQ0JHTmNkN29iTS9BeFNNSzYyL3JI?=
 =?utf-8?B?STkwNE9VeUZOOVJMNjlHWVZWSXhUR2hEUXpGZ0dOSEh0bnc3VVRiMDMvQU52?=
 =?utf-8?B?NlpOcG9CMXA3NHFCYUdZRFdDRG5QSEowVXJpZUM2SENSMno5S0ltK0dLOUo5?=
 =?utf-8?B?TUlZQ0JYWDlQVTFBdnR5OHBIU2tweGZwVE8vNGlWMWVTOCtJejVabmtac1l4?=
 =?utf-8?B?NHFIYjNkdW8rRVE2TUVMVkNXaGpQTjI1QUwvZ2I4U0JVR3kybzE4ZXNGVkk4?=
 =?utf-8?B?eVhVUmhqYjNERFEwT2pMVXFZZy8rNnJhdHVJMlNHRHB2N1MwaXdFNWpueTR1?=
 =?utf-8?B?dHhHdVRHNHFJOG9CYStXdnhMSGpVQ1NTK09RWW5FeHo0M1lLYWFxNzYxRGY3?=
 =?utf-8?B?cFdFbWdQTys2RG1qRkpuVlRHZnE1eW15M2hsd1h6R1BWdnVwZWFJN3FyaGJG?=
 =?utf-8?B?SUxKUVlVY0ltaURjT0Zzd3lsV3ArTlpndjNzSHljY1pnc3h1cXcvM3JqM3oz?=
 =?utf-8?B?TnVtM2ozNFhTNnVkOXZpTWwvQ1FjYXpZajlyTitoNmZYbVBtREtuaWFVbGZi?=
 =?utf-8?B?b0dZT3F0Um5wNGpWUExnaFpFZVozbGZrbThnM0k2bzBrV2RGSzNCRVMydG14?=
 =?utf-8?B?aFpwSHRWOVltVlFBYUlka0kraUlWMGl4VjdoL2ZMZHc3WE44d2RXUzJuWVB1?=
 =?utf-8?B?THNzYXljbUZuc3hBNzZDTncxZkJsRXJtZkZ0UkliK3lpWS9yRldqUXkvckRD?=
 =?utf-8?B?WDllcENKTjRYSVJGblBBK055eTlnNWo3YUpHMjgvRXZGTUVDMG9CZmNSdGc0?=
 =?utf-8?B?SDBHam5rYWVrVVBaVFJWVEhlb0tWblRDT2phcWpVU09DTVMxVFB1NnR1WU1K?=
 =?utf-8?B?dWRVUitVcXE5L01meEszQXJla2pyd3EybTNiaUFybHptcXFoSDdMRGo2OEh5?=
 =?utf-8?B?blNJWFNKZEZPejZXT01VY2Viemo2bTdMdzVnSzRRRHdBVnJBeERUS09ZbU1L?=
 =?utf-8?B?ZElrdDFmTUhtM0ZScVFTeXN5cDJqZnBiWlNrQlFIRzQxb0c0T3BOS2lScVhP?=
 =?utf-8?B?TCtoSmZqaS9IcHBKejhaVzFPL0tNcUFFVXdMSkhoVGlWYWJSRW5BRkVZMXBK?=
 =?utf-8?B?cmNwUStaTVJUMFcxV3haU21zS0xPZlRuZFNXS0E4WkNOVWRzUVJJV24zemdL?=
 =?utf-8?B?blppaWRVWElScVBERWRmSThXdEtPVVRWNkNKVGNZaENKM3hSMTZ4V0U1Tlgy?=
 =?utf-8?B?czh2NFFUdEZNVUpIYmdOM3lZOHRhVFFwUnlSY01xdTdFaUx1YnVVeTNLdGM0?=
 =?utf-8?B?RTh4Q3dKQ0VMZ1U3NXB1aFFGeld5WFlhdVV3bHZFZ3Q0dzJnc3pjZkFkRVJ5?=
 =?utf-8?Q?l54UXW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB9492.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1VTcG5jWnRNU0ZUSVB2MS8vZitYazMzWjF3ZCs0MVFQR2tuaUtkZ3JwWnVI?=
 =?utf-8?B?a0hMZ25Ua2hISEd6VnZWbkJMb3ZvbCtyS2FxWjlUcHVCODVNYkFyMDFKNkYr?=
 =?utf-8?B?NEMreEZWY0N3eGtpSG1yR1J5aGNwQlNyeVFydHFCeUNwU1M5bDlxcGVPclZS?=
 =?utf-8?B?Ny8xOURmYjBRb1I4VUpTdGg2UFRUdWxwdm5CWDhmampRSUZOeVhtaDhXaEpn?=
 =?utf-8?B?djA5bTlOTXVENFdBb0d3RExoQlZ2SlZwaUxNSEVpdlRjNzNFeFZrTzNNR0Vl?=
 =?utf-8?B?SktvMEdpUFU2OEJhZU9RK3FQNnVGdGdodGtiNXF6bWNFKzBSSGdOK2E5RHhJ?=
 =?utf-8?B?UjR0a3FObXNvWTBEc05CdmpkVUYvL1JhMUtpMURZRGNDMFByUFk1Y2M1cHNt?=
 =?utf-8?B?NU5jV0xjQW1EWVFJRXI4L2FVdVBPQ1IyeSttT0ZhTUY0Y1VlLzNTNW5SYThl?=
 =?utf-8?B?ZUtxSHZDOU1LUDlQTWdOT2piVFRUWEtka3FaQU8zWEprOXg2L2thLzczdFR6?=
 =?utf-8?B?cXU3Ty9VeXBweTI1MHRZTWV4ZDBmSlg4QlhOYXdUbWdzeUNoeWRvVjdaOVpO?=
 =?utf-8?B?QW1UQkNYallJZ0dIL3U3bnViNmdVMVpZYXpURUpaQWxLYUpjZzcwN0Y5R1Y5?=
 =?utf-8?B?dGV6LzdDbXd6aWRiam42dVBxdXEzaVpXTDZwVVhFUko4NVNKL3ZoMHBGcXI0?=
 =?utf-8?B?MC8vSnY4TDV0STBmQnJoUFhTSkFZMUg5UTlMRmVxVkJBa3kzK2Y1SCtJeWlQ?=
 =?utf-8?B?b0tRc1JlZ0krNEROYVpPZGk1UWJYZHVmcjRZQjNxSUQ1T1p5RVlONUxVVkQ3?=
 =?utf-8?B?YWQ5RlhsbmZvSldsWjFEdjlSdCtubDZIY3ZIL0hMWXl3KzQwVUswRlJlQmhH?=
 =?utf-8?B?WEtITDVUVDNWd29FWlUvU2lZK1R0Z3NYcldveWlxMWY1OUprZnpQM01rOTVE?=
 =?utf-8?B?REpCLzc1eW5jR3hkSFpDenN2N1lRM2xiOEFtbVpkVW54RFRTTDRldkhtbjRF?=
 =?utf-8?B?TmpiOEJSOUw5Qi9mWUJTUUNDU3IrU0tNeW55Wk56K29HN2FEZzQ2Szlab2ND?=
 =?utf-8?B?OGpMbEMyQmxlby82UWp6N0MwVXBDaXZkZXRYREMwVmw2VWd0dHJoZy9jYTM0?=
 =?utf-8?B?MURRejVaN2pjSE54M1F5SG4zUGpuOXBjK2hTQ1BPZ1BZZFRaakZlOEZrMHAr?=
 =?utf-8?B?a3hCNG9STFhkckZoTUZRUTl1dkI2aXRuZmpPSVZ0bjRlMk1nWE9QWlZzQThu?=
 =?utf-8?B?UVBGOTZUVkZBZGJPQWtIdkN5VENRcUZaR2lueDI1eGZsUzdZMWEvQ2R5aGwx?=
 =?utf-8?B?RjVOdHkzNzMwcVJiYnBOZHZHNW5LdEVlUzdPK25WUUcrZkE5YmdzUC9WSVRo?=
 =?utf-8?B?dFcyV3BSTGFObVVqcFFYQnRZTHZ1NmdYUmtmK3dtTGllRVVFTUwzNkVwbk5h?=
 =?utf-8?B?VFVqOWpCcEtBUTVlYThERmZpVHN0Tk1SQ2dXeUNPbTBac3dRTmIrb3NkYzRI?=
 =?utf-8?B?RUlKRE1CZVdOSGRHNHpsK2ZGL29kZzMyWmlxVWQvNjE5QVlIL3djTEtudXAx?=
 =?utf-8?B?L0tOR3ZKNG8vV3I1T2Yva0xrQkZDKzB2YjlJRUd4QmZqR3BROHRjMlBGTXdr?=
 =?utf-8?B?N3YwdzMrV1NRTVExbHREeUFKUlpFMW9jZzhxaGt0NFZFR1Z0VFZkbUdTMHBs?=
 =?utf-8?B?UFlnTzhzdVpFQmtJdlNGMHhyZmdGdkZxQ2RwcFczRWUzcnFCU2xjZHREdGRP?=
 =?utf-8?B?bHg0dm1YYVBheEdrUFlmdjk1L1ZUVXpTdVNGUW5qRnE4Y1BUanhDL3dPbFlz?=
 =?utf-8?B?K1lrQ3NvczdPRkxJK0lvNVJ4c2lib3ZFblA3SjYxbDJhTGZoT3Z6eTExSXdR?=
 =?utf-8?B?QWU1NEJMK2NzQXJHWmwzekhLT3EwRmlkM0orSk03cG92Vlp1cmRoczQ0UzVC?=
 =?utf-8?B?ZHN0RmFrdHVtakUvYjVVcjFhNW44aDY4eXJxQkVQK2tzaFU5QktvNW9xdjFS?=
 =?utf-8?B?eFVYdmZ3UGVONkNoMm5yTHdFVTFvUXBmSjI4TmVla0lEcjc4UFB2MkZhRkV1?=
 =?utf-8?B?L3IxZTVwTGd3V3Q4TzhxVzNSd3ZBV3M1b0hTVlJnSXllWjlOTzBOMjVML0dn?=
 =?utf-8?B?K21TbXNjMm8rNG1ydUlPeVVpb0lQaEZ3K1lWOTJiMHR4d3VnQTFGcHlvMEs3?=
 =?utf-8?B?eVcvZnp1NWhvZThJTjUzVVpPU2N4WUhvZERpa1ZNMzduTDZWS2ZSbmNESmUx?=
 =?utf-8?B?WUhyMU84Um4yUTFkWXpWOUp1alVUTUxOVmJDbENFZ1pCZFR5c0wyZ0g4bWRK?=
 =?utf-8?B?aWEwSC9GMWdMVXB0N0plN0FaaFpRazZUZEpsdFZBQ2Nta2k2MkVLUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da7a4f2-d590-44d3-73cf-08de4c904787
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB9492.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 19:26:09.4717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haiZ5Z4Rm+04KtolXSaKI2rJbyXViRkXbTJB3E82hzk3DuPAhjX7XMTzBlHhkA9wGDUl6MyUGp3fK43DYIYM1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995


On 12/23/2025 5:08 AM, Bartosz Golaszewski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Use i2c_adapter_dev() where applicable in order to avoid direct
> dereferencing of struct device embedded within struct i2c_adapter.
>
> Signed-off-by: Bartosz Golaszewski<bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Pratap Nirujogi<pratap.nirujogi@amd.com>

(I'm assuming Andy's suggestion to use i2c_adapter_set_node() will be covered in the other patch series)

Thanks,
Pratap

> ---
>   drivers/i2c/busses/i2c-designware-amdisp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> index 450793d5f83921ac9a8c6d00414890779da49c07..67772bccb71927e870c11fa88340caabcb07f264 100644
> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -64,7 +64,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>          adap = &isp_i2c_dev->adapter;
>          adap->owner = THIS_MODULE;
>          scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
> -       ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> +       ACPI_COMPANION_SET(i2c_adapter_dev(adap), ACPI_COMPANION(&pdev->dev));
>          adap->dev.of_node = pdev->dev.of_node;
>          /* use dynamically allocated adapter id */
>          adap->nr = -1;
>
> --
> 2.47.3
>

