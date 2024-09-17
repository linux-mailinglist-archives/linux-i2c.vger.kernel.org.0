Return-Path: <linux-i2c+bounces-6835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B4C97B413
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 20:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A80EA286AAE
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 18:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37A117B4FA;
	Tue, 17 Sep 2024 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2CNr6ytl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E27013BAFA
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 18:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726597301; cv=fail; b=qfRuyB24bLy+BmTaOY4xHiFpPwKyTjY0S+V+CJ2qhxA2nf8k61fb3NUJIz4vCR781cPTO/XmFJLh6QW//wr96AGiKpvw8AWqalKh9zqmr076JJkniUe/OvOa9RkUs+br3KjmXr5A3ADcZLO6oeuUzy88XGh523XwXxcU8+5n75M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726597301; c=relaxed/simple;
	bh=7xByqII5pEB54kSeduXk+obBNBUG+stuEvz5i32klCU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R6xNmHFpbc3t/wUvsSv7JNVKRU6zjX0ljRNdMOsjgawkpQU2uA5maso5vUCi3hks2IdjlwZIq0sEk+hVLbOZy/uQ+sJZb7FRC8MmI81TUP6ZpljddT6tpEFmgIiNTMxyVemkRvm9HvmgXR+56B2V6DIJ99G8SaykQPeolQ/Ji5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2CNr6ytl; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZswxy4dqZVOQByC2vUmf3wGR6aU8Y0xRGBVih//Sia+ADos5YODNP2hV0+cMNVvw+wXW1SF02+0MdL2ODdXtlhkcZGkEUE9gz8nzeH4duiebSQJuW8Ia4bYCkAIB4eCQasb97fXQ7HOQ9Hr2cXnqW2uPCKo2kwM8+PvpKurgSazmyOQfaWo6oQUTKt2v7VTfNzMX0Fo1ZgF16AqEoh9TpWVAXCD+KQdxlJjBx6tUDmI/QEkePju2QQsNzycYxlua+nq37Rts1s8SQl/HGvpjnfaesrezHY7bVsv3gal00xA4W42SWeqJhSqW5bfJ80DATLtbe21ImmqsIdCvjv9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiMw1tR7CdFoVD+qI1l0dPTFp97kMKizPvJEfsrH8Sk=;
 b=IoJVhzFW5kG/OU+5IarhJaQ2YifBZai6AsNZDw911jwCdu0xtfwbGVhmXfKZeV8BhkCqZ02oRfdJnBGTnz4MilCtQMgLvV7s1PJikjSVMI9cH9oiEA9TBtSoSi4N/SzZqBZJqD8xj2JeD3N4VXNIOApsR0K8qWU/mLyDur6Ha7KFeOWFsxgLwRRPobiOSas7yyT36v6velgaJoNWgWEsNl6JMX6JcBTB86RDTovoOAj8NtHxgF8qzH/E3SmRDqjkyqgXoTvl4k/tujj5QcjRH7U+Bf8z2DdkPt7LG8sxajRyuHH+d0spjBfH4hBjn5vkXZPFwByLNq2SomsSgIH75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiMw1tR7CdFoVD+qI1l0dPTFp97kMKizPvJEfsrH8Sk=;
 b=2CNr6ytlOUiMl9XYo4uv5RTF6S/3f0uTJZweav4DhqumllCAEcChZJ9yUCKmRvxnGSDxcwxEdC4RErZAHwlCnhU2NUzYZI0Xgn3MWP/EP/qUBiICfGAIPxOEpgHaRPwggw6doeL1v6LaHMUT8Ofxo2MP1lopmBxExoWNUtwCCx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS0PR12MB9039.namprd12.prod.outlook.com (2603:10b6:8:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 18:21:35 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 18:21:35 +0000
Message-ID: <8378c4e5-0164-43a9-89f6-aa53d2ab4738@amd.com>
Date: Tue, 17 Sep 2024 23:51:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] i2c: amd-asf: Add routine to handle the ASF slave
 process
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-7-Shyam-sundar.S-k@amd.com>
 <ZuSP3ztZ9G5-Y7G0@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZuSP3ztZ9G5-Y7G0@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS0PR12MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 772099a1-c2bb-41b7-6012-08dcd7459027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ky9wYmJUdXBTbU5paURZMnFSL05ic25uWHoyUUxMYTdQNVpWcHVYdGpBZHMv?=
 =?utf-8?B?MEZvVG5OSmpUQjkrU1hJYmRsZWduMnlSRUl6ZDZJTjcvUlU2QXoyK1U4WlNv?=
 =?utf-8?B?MmRLeDZHaG1xa2oxY1ozaEZzdnZCaFp0RmdoZFFuVW05VkkweDhmNU11L1Nm?=
 =?utf-8?B?Z3g3NEhuMEtOZklOSWdwckl5SHBSa1JtSFlrMGNIYkxhL0RxZldhMC83emdr?=
 =?utf-8?B?d3ZNMEFLTlBaVS9zOTUzc0sraDlNdEYxdUVLUjJNdC9xcU1PSVFuWVdVT0tL?=
 =?utf-8?B?QmZBaTlITGVjNmNOOUZGWk15WHZrSnVoZWVRcG9tRjFIYWU1YmxGSnVxY08y?=
 =?utf-8?B?WmVZWWo5V05sa2M0TzU5cGFaN0ZPSDZva3JXaHVBdFdqRzVjbVVqelF0b01n?=
 =?utf-8?B?TmVSYXV5RTBoc09LQmVHbG0yeXIyRVFYS0FxOTBIUGpNclNzSVZGbTJiVU5H?=
 =?utf-8?B?UHNGNFIwcFdpRnQ0YjNoRXB2SlE0OHNqZEQzNTMwbDhnOWxSOWxxVHFybnVX?=
 =?utf-8?B?R1poN3dGc0FMOVIxa1FjN21EejhQcHdhaW9YU0hocDdjMkUyRVJRZGhIekU4?=
 =?utf-8?B?bGxHNVpjaWI1MHZvUEo4YWZNdUZBU1BxZ05MVUlRWitBdHBHV0R5aGFKS0ZH?=
 =?utf-8?B?V3ZkNlV6U3REcE11NzdxVFFRYXNqZXhzN3R6VXF4alBKWkZuVThQc01HWjBE?=
 =?utf-8?B?RWdwK1VodGdlZkNiNHQ1SWhZTGpoeGg5OU5QNjRrSGxZYVZSeG0rd1pSdTJF?=
 =?utf-8?B?aTRMc0dWd3ozcStFZzZtckRLYlpVd0FDUXQvWEZtOVZCSk04YVdjRXYyMXBa?=
 =?utf-8?B?T3o2blFIR3YyUlpZaG9JbHc2Y2U1aVcvWTVwbEdPV09UcnFKVFhQRlMzSzUr?=
 =?utf-8?B?VUJqQkx2ZEpTek1VRXJuN0ZHTHliOFppMlpZR3kwc2VvNDN2dmVocmc2RWwz?=
 =?utf-8?B?d1gzVStLTmxkTlllWnJvOGxwYXN4TXlTdEt4QUNOUkh4UmN0bDdCd282V0dQ?=
 =?utf-8?B?UHN6RFlmazhLMFpVejlMUnJkbHB5dktzTklydHQ5YUoyYmZmUzVkdmpsVWZT?=
 =?utf-8?B?M0FZcXFRVXRXZ0Z0Y2NiTTNlTkdqRkJUeTE0am8wejE1SWhZU09nZlp3bXJN?=
 =?utf-8?B?SndCeFZKeVFLd0tJYSthMk1sSmVTWXRHK1BTNmFGaVJ6R0podHUvUG5PNjFM?=
 =?utf-8?B?V2pFTnY0clkveXh6NUErV2hxN1pyZXZxSXZsNWJvdUw5ZEpjemcxd0dmb3N6?=
 =?utf-8?B?MzZXMFRVUEUwV2MvKy9Ucnh6dVdaVUMvTVY5cjVIWFBuMHB6V0kvNXFidjhk?=
 =?utf-8?B?WWI4ZHcwSGFEMjRseFhqMndId1hRQjBMQ1hKNmhxQ21qTzY5NTl6WXJkZy94?=
 =?utf-8?B?SDQzZWc2ODFkcXd6K1E0Z2d3WGluZFk3RXFyZHdWMDVnL2xSZWE3NFp0ZnRD?=
 =?utf-8?B?SytEb3ozQjVqTUNhNEtSY0h3Z0VSMUVjV1VnM3R5UGRjNDZlQlAzYVdRZ2F0?=
 =?utf-8?B?eHdWK1FBVmFMckRuQ1ZhWkxURkVCUytMN0YrcnJ3TC9EcTFoZ1FVMUJQRkhj?=
 =?utf-8?B?bVRSeGF0NUZCZU51TFdEdUErRjQ4S0pBZXZoMklOV0RQV2lTQXRONHg3WU5x?=
 =?utf-8?B?bklualVxcHZXeG5xODh4eFBOcU53YnE1NVM2VFB3R1dXMC9XTXJBcXpSZnpn?=
 =?utf-8?B?RVNOTG9OQXVXOFpnNGN3UEcxS0kzTW9aL1BsaXVBcTZyNTYyY1RmTjBQZm0r?=
 =?utf-8?B?SEhDT0J5M0pENG1Gc1g1UWpVaWdZQWVkeENYSVJJRzZHeE44TjVHcU80N1BP?=
 =?utf-8?B?Q1lyT0lhMVgzZ1l5MWRoUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEU4K29lbnJ4dXd0a0hJUEUvV2JWSmYzQ24zR0lrOE1PRjZaOHhsTndhMmFo?=
 =?utf-8?B?T1dLdDMrNm50UzVWWXZGMFNCNnprWUlTNlBRRCtKUUJkNkxwT2FjY2dwWG9h?=
 =?utf-8?B?VWpibUlYSWJEeHdXVitRYWx0bHo4WGM4c3BjMzZXbU5IRnVVTEl1U0JtQllH?=
 =?utf-8?B?QlY4WGlDU09vRXV3RUE0NldpOU1DYjdTcGR5Njg1azFFU25wc3JnM1BKSFRP?=
 =?utf-8?B?T1BoYXhQNTNuVVVRV3BMWXZJRHJBSElFVk1xOUpxZ1dHclg3M3Zsa051K3g2?=
 =?utf-8?B?anJDdDdTVURWekg2Tll2Sk90OUpkUnpiUUhPVlMrcmRXckRSbU1KbTVLcEty?=
 =?utf-8?B?Q2ZvdThHV3l2aVAzbUZPdnpNSGd5bkNaQVBtZmJ1UzhNbERjYXRuMFI0amFx?=
 =?utf-8?B?a29HYVdxNEhORnRwU0RaL1pMZHE5NHlZUy9SQ2ZIOG9EMThVU0thM3B5U3Bz?=
 =?utf-8?B?dUErcDVRdStudFl5bjRNVFZYcHdPOGoyRUI5blZNR1F0UjZYeDdMcG9rdHUw?=
 =?utf-8?B?cDhvUWMxWnhDcDkvVnlCU0diYVZpZEo5MmlNdktoMDQ1KzRrMURIbUhhRXNM?=
 =?utf-8?B?aiswM3BZcHRQNEpiZlR1Vk9YcERQNVI4VlNpWjNZazIyKzNoTUs4bU9lY2tH?=
 =?utf-8?B?ZlFVYk5GREdyajRBdmxkNkQ0YTdXaGxnWnlGMVpEVEY0d2NMYVBib0VPazVX?=
 =?utf-8?B?UExYQWpPTExwempaMGh6SndVUVFYOGVST1JUMU9wM2VVWW1xS0liL1ltMHJh?=
 =?utf-8?B?SXlmOTJDcUlsbXpUcUc5TjNaWDRyRUxZeS80VmViUTByNFJ3WVZsKzdNVzZm?=
 =?utf-8?B?T0lSZFpMNFJZa040eTFjYlN3Q3RCNUFyU0tXWTNKUGFtdDdLc3VIdWR2eVJ1?=
 =?utf-8?B?RUNwbmtXcVRua2hKTzJ0a3dFc0IyMTdIUVR6dU5sNGpyRUljSmx4dW41YU9i?=
 =?utf-8?B?MTBiRU96eS9KNlNIV1QrcFduNzBJdDB0dkJuZG9KMUtMakJSOEpJVEt4ZkJT?=
 =?utf-8?B?S2cvZ012WWNZMW5ieXRoZzg5VDRPVHFJR2lNaEVNWlJTcEVCWHFCY2JQSGcz?=
 =?utf-8?B?K1RPaG9nRDJicjRnSTFoZThuZEFIQUpPTjZmVXA3V3NlM0hmVDNsU1psZ1pw?=
 =?utf-8?B?OTlwNCt6dnpiRU5pQ2hjdU8zanFVa1BteFB2Y0NOK2U4Nyt1cjV6V3QreTUw?=
 =?utf-8?B?QkU5TzJHMTRqRUQ3OUU4eCtQS2szb3hORmpqcHhESWtvWFNHSXNWd3R0ek9u?=
 =?utf-8?B?Y0tUcWg4SGdoaTl6VGt1MTloc0JmQStXTE5HT3p3c0VrNkh5MnRIYlVYNXRR?=
 =?utf-8?B?Y2tJYW9FMUZtaWM5VndUcHJyaElnL1k1V3NMNTlpUHFKS0lrMDVtdmxxcnNl?=
 =?utf-8?B?NmdDTllYRS9TaFIyTlMxNHNoV1pFRTJOQnJRVXZmL01SRU9WYTl6YkJrOG9s?=
 =?utf-8?B?RGs1dDhxSUlCbHViVzlJcEgxcjlwcUt5NkZtYW03aWhINURPRG5JaEJLWCtu?=
 =?utf-8?B?VCtKaWdXdFdML0Rvc2VleVlLakU1bFpRV240cFc4K2F2TWJ5Zk1PaXBYdEwz?=
 =?utf-8?B?T2dLSGdGdlNpc3hnemVCSXFuMEgxSElac1E0RmRrbUdJK2VQSVRZdTdUQm1x?=
 =?utf-8?B?c2ozQUNFelMzajJDd0x5KytCVmI0WTk2SDlTM0F4KzN2Vk13eU5IenA1VzFo?=
 =?utf-8?B?SERMNE5GSmo4OXhDYnI5TjVMZ2pESUxqNDdxdWJHdU0waUdQRHQ0bFBBZzRy?=
 =?utf-8?B?cE9RWFZHTVJGUjVpbTNyelNCMzdXV0c2LzFwM1MxSGNmbnhURUdLa3pHL0Rs?=
 =?utf-8?B?Y29mdFVzZHRrUktxcldwcWRzMGkrWC9RazBWNFFPMklvaHBhVmk5OTd4NHB1?=
 =?utf-8?B?K1d1T09VNm1aLzZhMjdLYmVGeWk3cTl1M2syM2NYUVM3Z21yVHNxdVlBOGRR?=
 =?utf-8?B?aENEYTRCK2M3OFN0UE5TSXdVajUwYzV6MXl3aiswa0plT3FQR2luWC9JT2do?=
 =?utf-8?B?bTBFNndEcnBhbHJqYnpyY2ExeG1vVjF3TlpuOSsxSHlLR1h5WG9CZHF3eDFT?=
 =?utf-8?B?YnZOa0JlMkpWK3o1NXpHU09HNlBPVVFhL2QrUG54d1hIekdZYVIwYmVqcWFQ?=
 =?utf-8?Q?gG1Af0jnj9Wp0Oin6bOgW9JGj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772099a1-c2bb-41b7-6012-08dcd7459027
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 18:21:35.6128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQzIzybBH/+EYqjfnZ+cINS3EorfpIweYNf/iuwfhshGPbkxwcO9LQfeaYKf7hwC/4IZktSNN7jHYPgjJNJorw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9039



On 9/14/2024 00:47, Andy Shevchenko wrote:
> On Fri, Sep 13, 2024 at 05:41:08PM +0530, Shyam Sundar S K wrote:
>> Add support for handling ASF slave process events as described in the AMD
>> ASF databook. This involves implementing the correct programming sequence
>> to manage each ASF packet appropriately.
> 
> ...
> 
>>  /* ASF address offsets */
>> +#define ASFINDEX	(7 + piix4_smba)
> 
> 0x07
> 
> ...
> 
>> +#define ASF_ERROR_STATUS		0xE
> 
> So, according to the usage this seems to be a mask, then perhaps GENMASK(3, 1) ?
> 

GENMASK() works here.

> ...
> 
>> +static void amd_asf_process_target(struct work_struct *work)
>> +{
>> +	struct amd_asf_dev *dev = container_of(work, struct amd_asf_dev, work_buf.work);
>> +	unsigned short piix4_smba = dev->port_addr->start;
>> +	u8 data[ASF_BLOCK_MAX_BYTES];
> 
>> +	u8 len, idx, val = 0;
> 
> Hmm... Does val = 0 assignment is due to false positive (or missing error check)?
> 

I can remove the explicit assignment to zero.

>> +	u8 bank, reg, cmd;
>> +
>> +	/* Read target status register */
>> +	reg = inb_p(ASFSLVSTA);
>> +
>> +	/* Check if no error bits are set in target status register */
>> +	if (reg & ASF_ERROR_STATUS) {
>> +		/* Set bank as full */
>> +		cmd = 0;
>> +		reg = reg | GENMASK(3, 2);
>> +		outb_p(reg, ASFDATABNKSEL);
>> +	} else {
>> +		/* Read data bank */
>> +		reg = inb_p(ASFDATABNKSEL);
>> +		bank = (reg & BIT(3)) ? 1 : 0;
>> +
>> +		/* Set read data bank */
>> +		if (bank) {
>> +			reg = reg | BIT(4);
>> +			reg = reg & ~BIT(3);
>> +		} else {
>> +			reg = reg & ~BIT(4);
>> +			reg = reg & ~BIT(2);
>> +		}
>> +
>> +		/* Read command register */
>> +		outb_p(reg, ASFDATABNKSEL);
>> +		cmd = inb_p(ASFINDEX);
>> +		len = inb_p(ASFDATARWPTR);
>> +		for (idx = 0; idx < len; idx++)
>> +			data[idx] = inb_p(ASFINDEX);
>> +
>> +		/* Clear data bank status */
>> +		if (bank) {
>> +			reg = reg | BIT(3);
>> +			outb_p(reg, ASFDATABNKSEL);
>> +		} else {
>> +			reg = reg | BIT(2);
>> +			outb_p(reg, ASFDATABNKSEL);
>> +		}
>> +	}
>> +
>> +	outb_p(0, ASFSETDATARDPTR);
>> +	if (cmd & BIT(0))
>> +		return;
>> +
>> +	i2c_slave_event(dev->target, I2C_SLAVE_WRITE_REQUESTED, &val);
> 
> Can this fail / return an error code? (I haven't checked)

i2c_slave_event() returns an error code, but here it is done with the
workqueue callback context. Hence I skipped the error checking part.

> 
>> +	for (idx = 0; idx < len; idx++) {
>> +		val = data[idx];
>> +		i2c_slave_event(dev->target, I2C_SLAVE_WRITE_RECEIVED, &val);
>> +	}
>> +	i2c_slave_event(dev->target, I2C_SLAVE_STOP, &val);
>> +}
> 
> ...
> 
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (!irq)
> 
> Incorrect check.
> 
>> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing IRQ resources\n");
> 
> Shadower real error code.
> 
> ...
> 
>> +static void amd_asf_remove(struct platform_device *pdev)
>> +{
>> +	struct amd_asf_dev *dev = platform_get_drvdata(pdev);
>> +
>> +	cancel_delayed_work_sync(&dev->work_buf);
>> +}
> 
> Wouldn't devm-helpers.h APIs help with avoiding ->remove() creation?
> 

