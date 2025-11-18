Return-Path: <linux-i2c+bounces-14138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E6C695C4
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 13:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 652872AAAF
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 12:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF9E33B97B;
	Tue, 18 Nov 2025 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KlJT3CLJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74422FBE13;
	Tue, 18 Nov 2025 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468738; cv=fail; b=j4WP8nJc05sFeVzY8fX0aNAGtwL1Yrh1ZRF32RjyRb4jzAD4KC2JsYbHeLV483ZUbniMHGKNL0ozivlA2j2ymWzzTEqvl1WuR9GXN4buSzS5pK5QD1IedichFn/aGxN3xZsFTVGhdZjlkjSNumeIRJdlY+qlyt1ZK+YHnxhDlK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468738; c=relaxed/simple;
	bh=rrLq2twNmJsu6usoRssjkc1z7e5lrHYr3hP9q0gJfSg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dwm+gNIN4Pb3fhSyx0hXlbbYzKkqbbZ/buucFvgVWCwQuL+GtDwv11O0y6WaQMPBar1cRHJJDxyS/Mi++uvlg4Gr8gzbqZmycMAMwDmuf62i09yyLOZ7oDQ5xhMHsyOrh3SCQZ5oD58jZYJbav5ZOIq6an2nm+zhBI+rKbA2ur0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KlJT3CLJ; arc=fail smtp.client-ip=52.101.52.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbuOQzzhYnv6Yur4z6NUVUNMMsW502/RP0/oGyqziTMD/lJrzsTsLOTXEExW0wrKYeh4eLhkjCOND8VEb4z7VNrnqv6E4L6ZxAPieEcohWHDazUjczMEToW5xAONltUvgIAAUwWkE0VbSHqP1ec9ftvhdbY8Wp8BLVcRH5HtLLmVB1wnceZnvY/MNFGDhuQ0DfLlR/d9z1KjQwlTft2jbOYBLVejFozGLHnywWa3SaiCst7jfPyZjytMpaH2R5ovorJcpIqQ3uNKeZQ3ys5s0S9bmD/wdf9knG61uCPuA7Fac5WrTrJzp1P67KOFTF5eFge5Cbp9jQrB3o4rjxkkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3wExYyAAXaxRlxUDkHUaTZ4AvIEIz7fJCSzBWRkJpM=;
 b=DEcUJinyM4IaBosajKq1z0UacogploV0wxThopcwfQ9r5zKIsJsT09YLSw6Bo5FNiWFyVxagSNpIjtBlIitsEAAv3E+QR41TRBXUPGqR7QE0d0ciKxvLbuwAlYzPkGVZhicgC2iEOdq2P0fn4D+zuHi3EZtdP2tapoz6Kbk2+H1v6E0ddDmv8HPrt7mJwq3/DpBIGF34AkZUhEg87TGiNvDdE00x9wqYc3As5q1LPmFz7qbjMsYxKQBSXbh6BxCSYO/8D+pObwi3SRih95yEpov9Ucm4e5SyOS6OqV5nTfX2+xWsmpWRYqXxSoLS5INqOrqFsMyZGDqAXZyWiUlxnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3wExYyAAXaxRlxUDkHUaTZ4AvIEIz7fJCSzBWRkJpM=;
 b=KlJT3CLJUtEVD9ORxbLu21j0zyeHazhKdKcvEKJw5sKrY7YjZqE+klu4YJNGIYQi43i5aRiOURfMpy9Rt/U7+SViT8sEVZLgkpfUy+7OoLnlOTwa7B9vpc3c93t0B2SkUVD6YUFe9/7a7puwuOtZ2jFZB0h14+hm4mP8TxDsckJr0RB5gZrPPq1JvfXKGKdbJSt+wMJgRjj1fcP3ZLIjV+mRH+dvNMeNyO8tOwFaobrlhF3ZcymbqOlsVtBkzSAxU5WxShGNPVqgKjZiO+va3OpezB0RNA52NtoFXrKj/z3lpJIeHIqqX+b8I7xRwlKmp4GvXEWoA3FSBkZmNc4UiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ5PPF6D27E3EA3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::998) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 12:25:33 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 12:25:33 +0000
Message-ID: <926d94d9-0719-4ade-910b-6042a2a8171b@nvidia.com>
Date: Tue, 18 Nov 2025 12:25:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] i2c: tegra: Add HS mode support
To: Akhil R <akhilrajeev@nvidia.com>, andi.shyti@kernel.org,
 digetx@gmail.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 wsa+renesas@sang-engineering.com, wsa@kernel.org
Cc: kkartik@nvidia.com, ldewangan@nvidia.com, smangipudi@nvidia.com
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
 <20251115042632.69708-5-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251115042632.69708-5-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ5PPF6D27E3EA3:EE_
X-MS-Office365-Filtering-Correlation-Id: e76f2a67-7187-46dc-366f-08de269d91d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWR2Z3VEQ3dhVFdwOTF5bzlWcmgwdzFWbys2UStGblUrQVJOSlNWb05nWjRG?=
 =?utf-8?B?ekQzTVFLRTI2TkE0WUlJT2o5RWo0NjdaQlJlckZmYnUra3NFcmgwMi9JY3lr?=
 =?utf-8?B?RXk5ZkE0QUg3bUhQOXQ2cEpiRHlFaXZoOU1OWG8zVzhPeVFjVTE1ZFYxL3Yy?=
 =?utf-8?B?V3hqb1BwdDNjWXNhdjdWbHNHMW1yMUs4cFVYYkJQekN2bk9KYThTRWJHZ0Ju?=
 =?utf-8?B?RlJvNjFEeGtpdkZNZXVSbzhNdlIwSFdpZXJxYnZZNWVOaHhZblZpbXhkMWZB?=
 =?utf-8?B?cGV0RVVOTnpxYVpVVUFGZVZHcnhKTHdqSlVhSHdVR1JRUXRVQ1I2SjNnV25G?=
 =?utf-8?B?a2F4YnVXemkvR0gxZlMvWUtxVmkrQlZEeXBBZFRkbWYrQUkyd1haT0hBTFBr?=
 =?utf-8?B?SHZnR2FMRVlGSHZ4QVd4NERQU0dLaG05dE5FWERQZGJuQURtYnM1cUlMSGN4?=
 =?utf-8?B?MlFsRzRYNXlYV1JpUU1QRnkyMDlQTDFQVHdHQUdxTXllS215OWlzbEQyUlNz?=
 =?utf-8?B?NFdLcjVoU05FZlhnS2xYWkpCNnlhMEVZQXNlU2ZLUGRTNUhySTFiQ3JUWWZr?=
 =?utf-8?B?Qk1YWHkwR0M4eTZJVWNXLzlWK0hNRGFETnRPc2kyQjhPbmM1S1EyQ2RyQjJs?=
 =?utf-8?B?VTdsUEJtZ1c5VUVoUkdLMzdJVEQrY25GZmFNNEhFdy9zZ1pmTVk0Q2pJaTBm?=
 =?utf-8?B?WkZ5eVV2NHRlYm9SZjllQnBzampVSSt0ZkRvOU9ZeDZQNDhPamlFN25ZL3Z1?=
 =?utf-8?B?dk9KM1FCWFI1VE0vMUFFWUxDT1FjTmJVbmwzeUFFL0UwOGRzR3RPYTNBYjhs?=
 =?utf-8?B?bE1kdFROQmdxdFJuZ1RLVGZkZm5RNFFlbUUvTDdrWlFkbFZyUVN4MVB5Mnhi?=
 =?utf-8?B?c0RqV0lwRVpKSkIrbkY2RW4xRGIwYW90RVRWcDNpRmczc1d1K3JSWGZUemtr?=
 =?utf-8?B?MDlYcEE5UEtRM0I4YWFPRlJ2YnRSZHJIbk5vOHRFZkFsZGNSZmJmSXFLemYw?=
 =?utf-8?B?V3lCdlc3VU40YkRpdllZVGlhVTNpdXZwcTlnUVRJSUhHY1dTVWEvOFB6Sy9Z?=
 =?utf-8?B?SlhMM3ZqZ1dTcWtzNGVXRW9wMWJxTEE4VE1HUFVDcThHdlBrT2lFaVFGa1Fp?=
 =?utf-8?B?Y0M0MHdtaE1QeDVQLzVUeE5yK3VPdnNSMmcvQ256K2xMTllvSnh6L3ZBUGg5?=
 =?utf-8?B?VEppRHN3cGQ1T21qcmg4VzBpQ3YrSFNzU3F6UGlnMzBHSDVIRDBlT20xalQ5?=
 =?utf-8?B?bUdkVk4rNGJwQngxTGN4bkNSdm9FcUQyUWt1WndkWjBRc3JqOGx3Y0VBWmsy?=
 =?utf-8?B?Vk5BRmtieDkyY3NBUnF4d0FSc0ZMWkxPQUlSK2tmOExoRW50OHJCOXk0V3lp?=
 =?utf-8?B?SktPajFiZlhTYUZjbldFSkNwWTNRd1hmNGVxUDF2eFZlZ0x0aHZsZUc3ak01?=
 =?utf-8?B?NlhWd1ZCWGdveGRzL3JibEhnTURhWnd3SiticmF4UmppTzFvK2k1VEQxNmFW?=
 =?utf-8?B?ZU15Q09LUmZQeXNGUGhVbHdvd3RCamJ1RFRoZVNMSGkvVVEzc0I0Z3dOeFdF?=
 =?utf-8?B?cXM3VHdVVllabmxXRnI5N0FxclVUNXdNNDZucmFMZTZCNmJmU0tJYitZNWty?=
 =?utf-8?B?V21sMTJnTGxEVXBZRGRzQTZycFB3eW1NNWE0UTJyNHd6V2JMYUxWaGNBei9B?=
 =?utf-8?B?elZDNS9DMFZWTDMwb3Jmck1VSzdTSmZLZGptOCtTN0FMVEhtNm9iSkxOYkMz?=
 =?utf-8?B?bzBpU1B3YjE3djBQaW9kVkFOQ3IwUFRpbk1uVVdCOWt4YmxFOWFqak5GTUQr?=
 =?utf-8?B?bUpNT1BtR3ZucXdRbWJzbzBlc3EzejZhcWtYenNVOEJVb0RLNXFPazJyVEM2?=
 =?utf-8?B?TC9kUE0zREwzV2Jld3M2Njk5dzJ5MlZkUDVrT3V5aEpPUDh6NlEvTnRFLzdx?=
 =?utf-8?Q?3lb01BPJbh2MDZ+e/OpZvMNIWC1Bsvan?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R21GbGpyZHhnOWZNeGVxMkFIeFU4M25iSW5wdlhuUmU4NnV0Yzlsa2lETlh0?=
 =?utf-8?B?NnZzODA4WXA2WHowdjJ3S1ExaDB6anN2UEdBMkdyVDk2bkhTcjdjdmxoMWRm?=
 =?utf-8?B?M21NU05yaU5rcThJMGQyTXVtbnpsSXZmVTJIbTdWRk54QldhYUZDMWNHZmtT?=
 =?utf-8?B?citlK1AxKzNBZ01qUFRZV0xKRjYwMzE5NFZCME4xYnV6VjlKZ3dVS0paTWhY?=
 =?utf-8?B?WmpneURrUUROSEFMd3ltV1h1M2NjVXdlaDFrV2twZGhWVXhyVTJ0QlVtVHIv?=
 =?utf-8?B?ZXV0YmRQalo4RE9jL2I2U2JRUkFUR3FRNkViMCt2ZkJ6SHhGZCtLUkd4c0dm?=
 =?utf-8?B?QXpJZ0ZPSDc3ZmF6eTFWQWFnMnYwdFFZOHFWMkNtbW9yYnl3MCtmNmo2OVQx?=
 =?utf-8?B?VCs0cjFTZ1JCTjdMM3h4R2VOekVNY3N1Y0dTSTdVTUZDeFBuZjg1U3F6QU5x?=
 =?utf-8?B?NmgreFRJZTEwcTAyUno0cW5IaG1Ja0hWVWZmN1BHSi92aGFwYmtORlVlZ3Fu?=
 =?utf-8?B?REtoZHRxOUJhV0UwNUlxMlRxUFhRSm5wZVE0TENoZWdIS0o3MkVKWmlILzZq?=
 =?utf-8?B?Wmh1NEhKeStBdDJtZ2xLSEVXUmZod2psZFBBOVdaUUFGRzVodjkwMW9kT1Ez?=
 =?utf-8?B?VzR5alV3KzJiOU5qS0lnT1l4elhHLytvRlVsRm5DRjVmKzNjbTVnY1pyRmZy?=
 =?utf-8?B?UkpQakkwV1ZYN3QwcXVmU3k1MzVqRkRCU1c3STZ1aHI0bGpycjF0eHJtY1E4?=
 =?utf-8?B?NE9hbS9wckkySTdXUXBONk5DVTBIbE5HT3F1VjlieWpLaFcxait0dlRUZ2Zn?=
 =?utf-8?B?bkk0ZkplRFlmKzF4WkdMS2pRS2pPZlJ4dW91UTNSRWVhQURvWWR1Vnpac0Vk?=
 =?utf-8?B?blQraTZ1R0RNdDd6NDZqdDZwZUhFQ2VENGlqRThHbFVLbVBTY1ViQ2dpbTlm?=
 =?utf-8?B?NTJyWnpMbElJclM3NG1QaDZRTVNvY0N4L2ZKVG0xQ3B3c1dNNkxnM3hBNkti?=
 =?utf-8?B?N3BpeDlIWkRXdXlkeWxUSHA3Si91K1prMTBqZ1JPVkZ0OWVSckpHWGVGdko1?=
 =?utf-8?B?c21ob1llNkJ3dTFNK3ZMMWpwN1Y4SVhSV3M0dEJNZGV2SmhaRytrbWZhaEY0?=
 =?utf-8?B?dXJSeFB1UU5MUEtwRUJPYk9Wd0N0T0V1bVJoRkUvNTFlY1BIRnBUYmxxTnFz?=
 =?utf-8?B?L1RLZTJuR3BCQWk3aHI0eVNtTFFuUW1BKzJSZXB0NEU4b0hIZkJuRGtZeG0v?=
 =?utf-8?B?a0pwOEFON2RSbzFyaVZid3FzeUxMRzRreTFidVZVZkRPcFhyVjlmcEZMaGUw?=
 =?utf-8?B?Zk5obkFHTFRHNjV6bWpYcW1naWRtT0czNjZ1cU5abVdiTWd5TWdtYmxxSE5y?=
 =?utf-8?B?d29EWllHd2NNdEFWdnk0RUxTZm1CbjYzaktyRVlOY2ZDNFJqU3dJWXRhU0RR?=
 =?utf-8?B?YzQ4Rm8vZVZoeDBjT3k2c3RHS3ZtdHpiWXFhc1BsWk85a2FwdzlTbTNPV3lB?=
 =?utf-8?B?dWVtYnlKUVgycnR3SEpLbmwvcVcxQW1jNFdGUGtPdjdEM0VGcTVkTmVMd0Js?=
 =?utf-8?B?RU5iaFpmaUkxVk9WeXBTa3J5MGNqQXdKUDhCRHBtL0FWbSsvK1NXbHY2TXdz?=
 =?utf-8?B?TE1Bd0VjbktCekZPV09FRmJDdmNGbG1TUkMwUnAxQmJQbjF1ME9RaXlCVytT?=
 =?utf-8?B?Ylh5TEFEckFZUUVLWUZhUjREdVBqMlVwODdpRGNRaTgwdTFmbWlFb05ybytX?=
 =?utf-8?B?OVFLdWxnWCtIQ1Q0WEw2UUtkWWNaVldHY2xJcGE2UzBWaFJJWi9RL1ZRU0hH?=
 =?utf-8?B?OGlkcmEzZFNpamRHc1c0b3hZai9vSG1PWEdNbmRmWlZXLzdmc1BPeEc1eDY3?=
 =?utf-8?B?QllNNnd5dEt5NEtxVDVJQzZpNjRaaVArZlhHUEpBQ1JQckltMEhEY3JMTFgz?=
 =?utf-8?B?L3NJb01acEp4YzM4S0hSTnhEOTV1RzBwRWw3RzJvUThQYlhEbmpYSWN2Nmlt?=
 =?utf-8?B?NUdnbS9ySkRINXZ4ckZUQnJOUWJzbjlJM092KzhOQ2RCa3RNMzFaNVlmRkth?=
 =?utf-8?B?bnkyOFFTQUV4d05QMjd5OEx1YmwybHJFNVF6ZDBDNTJKNXl0NGs2NWpzWTRl?=
 =?utf-8?Q?SKIYxA7PDhmtCMHLXS7IIP+0j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76f2a67-7187-46dc-366f-08de269d91d1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 12:25:33.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyadnB8Xde6RPymWSWu6ImMACEdd2Y/mso74CgkjKzr7qhlVjYEnTOnJW7nL38AJ+yXC+HH1GIXaBzqXQsjbZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6D27E3EA3


On 15/11/2025 04:26, Akhil R wrote:
> Add support for HS (High Speed) mode transfers, which is supported by
> Tegra194 onwards. Also adjust the bus frequency such that it uses the
> fast plus mode when HS mode is not supported.

Technically, Tegra20 supported HS mode (according to the documentation). 
However, from what I have found, it appears that HS mode only works on 
Tegra194+ devices. So Thierry suggested that we document that HS is 
broken on devices prior to Tegra194.

So the variable 'has_hs_mode_support' is a bit misleading. It might be 
better to change this to 'hs_mode_broken' and reverse the logic.

Jon

-- 
nvpublic


