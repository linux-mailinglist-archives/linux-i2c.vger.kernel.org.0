Return-Path: <linux-i2c+bounces-10528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83798A971EC
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 18:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0DC77AD358
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 16:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E3328F926;
	Tue, 22 Apr 2025 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Um1nWsd1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8305D283CAC;
	Tue, 22 Apr 2025 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338029; cv=fail; b=cwLjdXIkbLwuyx/1/sSEkX5ZGPqnpGHLsVujRbRuKWWZo8YEiBTbPKPnh0tTAZknC/gSEqpQJXpuOsAwJ7vyPfmOmyvjLQp/FG3DPxJMNyfiD8SoNh1FqLNJY/bda966WDqDaxhqA2XcJ9okCPB6EpixPhO21ut0K3oiL0fYU3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338029; c=relaxed/simple;
	bh=kPjWg8q2M5m14/FGeZhC5HtiTEaun8eAdD7etedE2Ak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d8MGLhIhsy2PgUc4EH+TmRO4UeRUwqvB6Ah76mt9w0sA9q4JikfNjVrNPXrNsWJj8yrN0cRaBv6/7rC2RhwTA5jMD2OYUV3iiB45/DCYM6E3CMdDlbH8WlmOl1r8N5EAe3uEuOliCOOg2liBof2fD/d4YdlR+FG21vUDDPeklB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Um1nWsd1; arc=fail smtp.client-ip=40.107.100.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h++it29Wn/Ykqdj1Iu6WDb6apZvBpCOVlZIhr0LqWEqG+AVmepC7y+zU1zj8yvtmob7PF4klG42gElGWIcOIjOzYODs5rVynwSANiyziSmvSLxzbRCU1aIQ+yidBzWfvWPJVdSxbVLpI8ZntUPGaQr83lUE2NxN5D0TubKeeDPwm7JsfsZ6BNXymNhhF1N1uxR5+EklGAfef39BKRpG9Q9xZc8LvECNsojbByeQmcz27R65lYlmsjG0ziuIiLbJWHVzy0JfAZxShM0+3JK0br/n8UirFKlpnxqnkjum2sxw6TSBR8/3z7vNq+utaraXnN2OuNmcIGUJD+BhKDCk0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC9W1DiFB+ojssbNDx8PLyksAqpOVCZDSrCIGpZ4mG0=;
 b=bZK/nxPGKPK31NDSYdGaZsSGa5azWqKXQoRU0zk2UOWgFcLBxml1aUNPwPA6u7MoSFpV7mHsXB9agDDUT7M0myCv4ta0K/etH8tOlljLuyFS5hhdUw0FmfS0v/BAgrFSCxEoyte7NCctbFNzrozHGcIFSYqpSvVb0ZZYryrwSUNT3YQJa/b11Ufx2EbGfWZi0E+cjiLlocJocFu56YBTAIR0q83sAZhmpAQgw5jtBpXWRYU1yI/8g3PMCrzKkhyDdu3+4rUSOfFSYJtwdXBp2vtg5HjsIGoZuXIzPQnZJDFTKy9XtW5gjP6MbdEcTyqc92CnzbpaJd8Hjlk+ia13Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC9W1DiFB+ojssbNDx8PLyksAqpOVCZDSrCIGpZ4mG0=;
 b=Um1nWsd1I+ze8XeTPyCl7g59kiUaZjoUfeghOIu79UREVgEhj+bUV3SBsCNFMC92SJXKPx1t3MRzLtEgMnoA/8dxyg70NnuuvGqvbogD/SfJ4eWbbAtn63c2mXIitUGwJSnTB6OkaL1+tzv6RoZCD9c6lHXPGrSm85ogDZZ0P00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by IA1PR12MB8554.namprd12.prod.outlook.com (2603:10b6:208:450::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 22 Apr
 2025 16:07:03 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 16:07:03 +0000
Message-ID: <bd1c7964-8f53-4493-9abc-19d990b63d54@amd.com>
Date: Tue, 22 Apr 2025 12:07:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dominic.antony@amd.com
References: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
 <0c714314-c5b0-4815-9e74-47d2402e8852@wanadoo.fr>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <0c714314-c5b0-4815-9e74-47d2402e8852@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::27) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|IA1PR12MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8d2a5e-1737-4838-3cc3-08dd81b7b89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGJZT3pWSG40blJDYytVM2pBTG5uS3F1UERYcnU0aU9tM1RJY3BBY09lK3lR?=
 =?utf-8?B?elJpNmQ3RFlwdGVXWDR4c2o5VVpreUR3cEttTzNja1JIY0xyclhjaEJVSWpP?=
 =?utf-8?B?UUVMRHRDbWpVQVFkMExzd09zTXhlTW42K241djduYzhvMVBFOVA2eFJuTGxK?=
 =?utf-8?B?LzRYc2pPTlpDSEVLcWlqTWhNWmo0eFpvWit0TllMTTMranpTYXAxTHpjZFk2?=
 =?utf-8?B?bk5KczI5dTNwNGtHNXhtdTFNYTh3cDJyMDlLbGFRV2xZL3JiYUNZT3d0SDRG?=
 =?utf-8?B?bmpDSktEU3ZmakhkZ2prS0YrM3NqbENzb2JNN0tlcGd4czdRWThHUzJIUWNv?=
 =?utf-8?B?SWFmbkFCUjM0TFNCbFZBSnpLZTBld2dVTm9jbGNEQllWMnMybGdseWtzcjIw?=
 =?utf-8?B?d2E1VW1tZk9nellwMVUvMDRGVzFmQVAwVDkyMjBtWlpvY2doY1Z2STR2emFw?=
 =?utf-8?B?NC9EU0JYRm1rOGxBU0tvSmJzWlAxOGVZK2FHN2s1cnhhdER1RHUyejlzbEZu?=
 =?utf-8?B?dTFCcGd0anZIUmlUVm5nVWY5TDBnMDVPOWtGQjNDWExMdXE5NFYrcVp4YVI2?=
 =?utf-8?B?YWZHSEFsNzFIK3FmSFMreFFJWDNGbFFNN01EcGM3NCtJOFFVU2hjaGpWZ20z?=
 =?utf-8?B?Q2JRWnpDRVJIUTJ1ZWJKWDJrK3N2Ym82NFJ1dWZ4SUVVN1VKZ1d0NG1OcWF2?=
 =?utf-8?B?L0t4eGs3MDVFY2VKWWlaVUhrT2FyenU2N25oclFMaDBYVzI2K1BHZ3VpNS92?=
 =?utf-8?B?MzJMRnJMRmRZN1FxbVN6WUE5dzZlREx6WFMyWmRpbEtYWjgvVDdGdjRuR3Rl?=
 =?utf-8?B?QzNhQkdKb1QveWxGdXliR1F3eTV4b2h4ZEtxdGdsNTZxREV1TjFhL0cxVHEw?=
 =?utf-8?B?YXV2V0djZXJNdzhTSU5ENllpMmFxWFA2SXNKaG5MVTBBbGhuME12TzlGNm1S?=
 =?utf-8?B?NnY3aWR4QUI4dm1oTUZNU0poNDNlNkxUd2lmY282WEsrWmVvOTlZUUU3d1g3?=
 =?utf-8?B?V1QydFJ3UDMyM3RHdzNLZlNwZkdIbDRmQWl1NHRkdmhnZDY4ZjllaDBKR1k0?=
 =?utf-8?B?Q1BQYUpnM09GOFVkQ1dqZ01XVmVJWkdTbk15VWlIcWVITDFMWGliZWUwZkFT?=
 =?utf-8?B?YkQ2Q1o4TTRlN3RyeUFsUWJuZ2ZRdUYrMGI0UEE3enp2UlZuRTlib0kvT3Q4?=
 =?utf-8?B?Wk1JMXUzaS9aa0ZqcFQyZUhhbXJsQ3JrSWFpelFXWE1IOVlIS1laK0hiN1hY?=
 =?utf-8?B?NG9oaUFHY05ycnpWU05uSmVzTmxLeE9Ea3JDdnpqSE1OV3o1OXNqN25XdlQ2?=
 =?utf-8?B?QkxjR0NYWWpKcEMrMW10MWtoc2JPZ2FkU3pLcTZwekNMdTViOUFVdUxoalow?=
 =?utf-8?B?LzF4bXVndStqSGp6dlRUWmN1OTlMamd5d2gzbVRMbHZqQXhpcE5xV3RRaGty?=
 =?utf-8?B?eWhxdTQzWXRNVEVpeHA0Yytpa05rWmEwL0NqYnI4eGNGOU1YS3VSZENWRXNR?=
 =?utf-8?B?TGFXSk12bERwWWoyVW40dmhsZTBUU3hvQkkvRmFpVUEwSGVSanJXS1lCY25i?=
 =?utf-8?B?Y3JGTEhNWDdpSndERTFDUkIxSFl6OW5XSnpHNEpEcU5Ua2c2bzBOSzltNWla?=
 =?utf-8?B?M242dXdlN0NUWmprSkRIUCtNeEQzbXdZRS8wWk9ObUcxMDBWWmhuaWVNa0g3?=
 =?utf-8?B?Y0o3UTArUnpwcmZwNHpFeCtqYnZ1eE9MMkp2Vi9tZWpQQjNoTFdxalZWVERm?=
 =?utf-8?B?Z3lkNkRaZlJHcG5VVmIxazlXMlptRi80RnIwbVJHdTRuUXZBWktLTmVyK1ZR?=
 =?utf-8?B?VEk3bVM3STRod0Z6Y0NmWWNHdXo2YmM5d2JpdVNqdnRuNW9pYXU5QUlyWklC?=
 =?utf-8?B?SW1BSFQ2UE9YU2FlT1M2T1FaZUQ2NHE5eS9ySVhTRG1hK0U3SnQwWTdzODc3?=
 =?utf-8?Q?EwJ74PgM1rY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0N3RWt2ZFNNU3lqa0gzUEpkcWFML04xT0E3Nlp4UHZPbXFxVTZEUHdYWFha?=
 =?utf-8?B?NVdxd3g0WHdBRXNJU3RxM3hSWWhDdXJoVlk1MTZ1WC9XMGtkelY4cDhwNUov?=
 =?utf-8?B?SUpWMTh4eXV6ZkEyUUczcVA1cVRmK2J1TytlR0ZEbU9hS1VTSmd5eDcwdGMv?=
 =?utf-8?B?TjZVMzBFazJvbUUxRnB4amxmcXJwamorWlZGMTlzUVkvZFVxcmphRmJnZUE2?=
 =?utf-8?B?M2hQQVdVRTlLUEJ2cDVLQ0pMdHFPb3VVVE1md3NueDdlc29mYjdwaTZGbVVY?=
 =?utf-8?B?emZ5aCtwLzlKRVdaN0JBWkdhZHhUN2s4MllXeUFoYU42bllBR2YvN0p3RFJF?=
 =?utf-8?B?NGxyL0FqZ3B6OHFic2FvVzA1SlhhOWRUWFRDZ0tsUW1Jc0FBd3d5Y3A4MWxn?=
 =?utf-8?B?NjlXNE02SjFNb0xmLytDRElORDVmdldqWXowNzhEL1R0WUJkd09zZHFLSko4?=
 =?utf-8?B?eGtzLys0UkNXUEg5ejZ0RHhLMCtDTEJaZEVZNlB3bEMxOVJBbnByRC94Wk9n?=
 =?utf-8?B?U3RML21EUmgxM1AxZmNNL0ZWUzVkdTBidVpQNm84WlB0SzNsbEJnVzlzcExy?=
 =?utf-8?B?TWN1cExNeVFTbldrcUVMalEyZnRERXo5cEttZUxRZVZSeUVOdkkweGpMblg2?=
 =?utf-8?B?U1dwRUhCc211aGd2TUw1dmVXYUFHN2o3eW93WmhtRTZoY2lpVjlWK1dBTUpM?=
 =?utf-8?B?OEJUY2R6bFZONmpkcytuQmo4Ny9jSGdxelYvTjlhZS9Qb0RxWFZYLytjeTcy?=
 =?utf-8?B?UWZCWThydjBkVk9HRVZ0M1R0OExaRzlmbnRnK0hGRmlaWXJlMjNOTnhsdkp1?=
 =?utf-8?B?YU5oWnI4Y0F3WWQ1anBOZ214QktaZmhvY2FvNzArNHZRRDE1VjhpZFdTK0hl?=
 =?utf-8?B?UjJsaUJVbmpydXcxN2ZObFJuc2FiTVpsZ1ZIMGpXa1Vkd3R6UUwwUmlya1ll?=
 =?utf-8?B?eE05RVkzTGVkaHZHSXR5TzA4ZHdoQnA0TVRaY2RsRWpRTVNEajR3YlVvSmI2?=
 =?utf-8?B?VEtjRUhTaGNwVmNsdUtSMUFsS1dvYmxKVFRFK2Iyb1M5RUdkd0tvUEhvTFF2?=
 =?utf-8?B?bEFUYy9hWW9IUTVtNmVWQUZFa1pVVkVtZ0Ztb0V2U0ZxSnJmSjRZMWN4N0Ji?=
 =?utf-8?B?VTRZOEpRY2JKcFVZclh5NlVIcWgxL1FXMVREaitkOFFnUHVRdExqMjdsbFlp?=
 =?utf-8?B?Ynk2VEFDTmx4ZThQYzlLN1JENno4VmtwUE56UTZyQndPTituVVBYcVlPYk1a?=
 =?utf-8?B?KzRiVVpmWDJrcHY4Z2J4amsxK2Y5Y3RMOTZTSVpoNHNiYm45Wi92T3IzbzQz?=
 =?utf-8?B?Rm5KQzZBWHFVbUtYZHR0c0lzeUFtWkVqVUdMMnlYNmRLWmdQL3hLZ1pxVWh4?=
 =?utf-8?B?b2kyNE1TWnkva3gxcjRBcjI5WFI5TmJkOVQxcVBjWXYrdzlRaW1SODlJZmRO?=
 =?utf-8?B?R0xPUm5jN21rMFVJTHdkeFpSZVNkOWFqbXh3UlVncVpLRzhLYkRNb0hFdFlM?=
 =?utf-8?B?bFRGMmxLTW5aQ25KQkRQdWw1U2M2ZmcxTjBXRWw4TjVkM083WkRtN2g0YjNZ?=
 =?utf-8?B?L3FUL05lZFl5SGw0djY3ZmhmV0d0clFqY3VYOU55L1lXOXhHZWhQNGkzV01x?=
 =?utf-8?B?VEt2TXFKdTg1SGxuaEtjVU1aTGtzRjZsT1pOU2hIZ0RzMzJkOEZ6eTA4dUFX?=
 =?utf-8?B?b2llOG0xZmRsREdXbnRQS3ROa2ljM0F5dUpDaVI5L3ZYcFRlYmFPYzE2dnVZ?=
 =?utf-8?B?alJLdnpUdHZ0dU9oMGNtYVdUejNKanJIbXVrTVc4S3JkbWd0K2FkaWdSL20y?=
 =?utf-8?B?bGUwa0xEZ05SQXJ3U0MwS1B1bitmeVd3SEphdmZnaTJzMWk4b0hXZy83dEE1?=
 =?utf-8?B?U1RRNUhvcnBobFl2RE1KTlJ4UjVyeVRiOW1vRU9HUkZOK0FsTytsMi85Y3ph?=
 =?utf-8?B?T1FwYTZzQjhHT3FXSHEwNFJTVFNRSkU0SzlGc1NnLzI0azRFYkp1elRtUk0v?=
 =?utf-8?B?RjhXM0V1enE3K1pHMmNTZTB5RlVvT1c1UlVqdW9NellYVHR2WG1LYTAyRHVj?=
 =?utf-8?B?NG56LzR6b3B1bFZFWWtGdE9yT05VV0VvT245U25BNXo0a3h4cEhETDFyV2U2?=
 =?utf-8?Q?vQigpfpa7qmvTk+gaNuce/WaN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8d2a5e-1737-4838-3cc3-08dd81b7b89a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:07:03.5103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF9ES4cur1XFMyZ4KoMPRoJT1hRqex9U/8d8XZA32epA7CRjsyXZ85h5KmiAnrQ5vD0h/bRZPpeGhJ2B6nLpBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8554

Hi CJ,

Please accept my apologies for the delayed response to your review comments.

Thanks,
Pratap

On 3/1/2025 3:32 AM, Christophe JAILLET wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Le 28/02/2025 à 17:45, Pratap Nirujogi a écrit :
>> The camera sensor is connected via ISP I2C bus in AMD SOC
>> architectures. Add new I2C designware driver to support
>> new camera sensors on AMD HW.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> ...
> 
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/ 
>> busses/i2c-designware-amdisp.c
>> new file mode 100644
>> index 000000000000..dc90510a440b
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>> @@ -0,0 +1,266 @@
>> +/* SPDX-License-Identifier: MIT */
> 
> I think that this should be // comment style for SPDX-License-Identifier
> en c files.
> 
Thanks. Will update in V2.

>> +/*
>> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
>> + *
> 
> ...
> 
>> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>> +{
>> +     struct i2c_adapter *adap;
>> +     struct amd_isp_i2c_dev *isp_i2c_dev;
>> +     struct dw_i2c_dev *dev;
>> +     int ret;
>> +
>> +     isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(struct 
>> amd_isp_i2c_dev),
> 
> sizeof(*isp_i2c_dev) maybe?
> 
Thanks. Will update in V2.

>> +                                GFP_KERNEL);
>> +     if (!isp_i2c_dev)
>> +             return -ENOMEM;
>> +
>> +     dev = &isp_i2c_dev->dw_dev;
>> +     dev->dev = &pdev->dev;
>> +
>> +     /**
> 
> Just /*
> 
Thanks. Will fix this in V2.

>> +      * Use the polling mode to send/receive the data, because
>> +      * no IRQ connection from ISP I2C
>> +      */
>> +     dev->flags |= ACCESS_POLLING;
>> +     platform_set_drvdata(pdev, dev);
>> +
>> +     dev->base = devm_platform_ioremap_resource(pdev, 0);
>> +     if (IS_ERR(dev->base))
>> +             return PTR_ERR(dev->base);
>> +
>> +     ret = isp_power_set(true);
>> +     if (ret) {
>> +             dev_err(dev->dev, "unable to turn on the amdisp i2c 
>> power:%d\n", ret);
> 
> return dev_err_probe() would make code slightly simpler.
> 
Thanks. Will update in V2.

>> +             return ret;
>> +     }
>> +
>> +     dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
>> +     ret = i2c_dw_fw_parse_and_configure(dev);
>> +     if (ret)
>> +             goto exit;
>> +
>> +     i2c_dw_configure(dev);
>> +
>> +     adap = &dev->adapter;
>> +     adap->owner = THIS_MODULE;
>> +     ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>> +     adap->dev.of_node = pdev->dev.of_node;
>> +     /* arbitrary large number to avoid any conflicts */
>> +     adap->nr = 99;
>> +
>> +     if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>> +             dev_pm_set_driver_flags(&pdev->dev,
>> +                                     DPM_FLAG_SMART_PREPARE);
>> +     } else {
>> +             dev_pm_set_driver_flags(&pdev->dev,
>> +                                     DPM_FLAG_SMART_PREPARE |
>> +                                     DPM_FLAG_SMART_SUSPEND);
>> +     }
> 
> Unneeded { } in both branches.
> 
Thanks. Will remove them in V2.

>> +
>> +     device_enable_async_suspend(&pdev->dev);
>> +
>> +     /* The code below assumes runtime PM to be disabled. */
>> +     WARN_ON(pm_runtime_enabled(&pdev->dev));
>> +
>> +     pm_runtime_dont_use_autosuspend(&pdev->dev);
>> +     pm_runtime_set_active(&pdev->dev);
>> +
>> +     if (dev->shared_with_punit)
>> +             pm_runtime_get_noresume(&pdev->dev);
>> +
>> +     pm_runtime_enable(&pdev->dev);
>> +
>> +     ret = i2c_dw_probe(dev);
>> +     if (ret) {
>> +             dev_err(dev->dev, "i2c_dw_probe failed %d\n", ret);
> 
> dev_err_probe() would make code slightly simpler.
> 
Thanks. Will update in V2.

>> +             goto exit_probe;
>> +     }
>> +
>> +     isp_power_set(false);
>> +     return ret;
>> +
>> +exit_probe:
>> +     amd_isp_dw_i2c_plat_pm_cleanup(dev);
>> +     isp_power_set(false);
>> +exit:
>> +     isp_power_set(false);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
>> +{
>> +     struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
>> +
>> +     pm_runtime_get_sync(&pdev->dev);
>> +
>> +     i2c_del_adapter(&dev->adapter);
>> +
>> +     i2c_dw_disable(dev);
>> +
>> +     pm_runtime_dont_use_autosuspend(&pdev->dev);
>> +     pm_runtime_put_sync(&pdev->dev);
>> +     amd_isp_dw_i2c_plat_pm_cleanup(dev);
>> +
>> +     reset_control_assert(dev->rst);
> 
> Is it needed? (there is apparently no reset_control_deassert() in this
> driver)
> 
Thanks. Its not needed, will remove it in V2.

>> +}
> 
> ...
> 
>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
>> +MODULE_LICENSE("GPL");
> 
> MIT is stated in SPDX-License-Identifier
> 
Thanks. Will update the license info.

>> +MODULE_IMPORT_NS("I2C_DW");
>> +MODULE_IMPORT_NS("I2C_DW_COMMON");
>> +MODULE_LICENSE("GPL and additional rights");
> 
> Is it allowed to have several MODULE_LICENSE?
> 
Thanks. Will use GPL alone in V2.

> ...
> 
> CJ


