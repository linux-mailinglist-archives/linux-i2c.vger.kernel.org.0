Return-Path: <linux-i2c+bounces-12997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D610AB59D5C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 18:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D8B1C002BF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 16:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A64374261;
	Tue, 16 Sep 2025 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HhxQUhna"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013055.outbound.protection.outlook.com [40.107.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8869372614;
	Tue, 16 Sep 2025 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039609; cv=fail; b=JLsyah6xjvo/ePrk7lyapDUR2O7T43CyxJ+doV9bKe5YkRthOR2mMjcX9wolwAl5cknOP7pG5+bpXOIsgO8nevx12FhQXIhhV/sqk4gvUXjPrEb6XwlWtSNRQAOPNPefW0odOeUatS5Ea9fGMuTq0TTpG+aPzxtKvxtXRxWX+jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039609; c=relaxed/simple;
	bh=bSKsfbs4/jo4L83+2WcHcbe34prcI4OmqDWbY5O1uUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u2yWxoN8CRhdFo5kYOzED5+Aml8JJBuJBH+H3adoV2uGtgcBdHJDCtxjlfU3FR3KXVpwqK/CfTcrzJ2veB1hpMa9dvmK93+j7IM8slqlsGqPWehIwn2loOe3XAN2aWXBrp3XQ40QLEFwRkSmJs+bYeDTKaKjHMEcRZefkvX5TsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HhxQUhna; arc=fail smtp.client-ip=40.107.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAupG97D6UF0wcleKlu0KcPAJ8REwGveKwOble3B/K7cm8iqbxZQ5i42XRMcwPt6xabzwh1PRpgM4XY6kpwTA69okvvXk7ytN+7N1c4JjWJMDhWC7AquKzOL//lEXA1AhZdIvU7H40z4Lbu84zCG0lkBnJcl1KUS/SV/6syBQTAraH3+wntbBOF3xL3I4iHz0wEfPUK8zy+932H1UjyIhn0Ic3Nt1sJTXAFOPf/1xxPLZ1UJOVl+w4nbb8334SjIFF68xv58CSxsJxriFa6r4ulgtRXGwVVVFLaVsZxthztHOnBbaL+7WDYMWbyNve4VItK7wU1Ic5i0OJTT6/scSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfjN7sf+hcJNhYIajgqt61ggk+jgYSNbuZ+7e5OH+es=;
 b=REg8fjW6kcfK/iNPcrqH481A7+BwKfwzCjqVjnyF6LqOXFbqFe6A/ewdF5BeBkiiLWV9aCLj0KuTSSmp6llEY1Wr/yPW6w5kPHeoz5zI901aA/LizASDpuplKUlyQ3C7idBkhJBuWciDfQMBLfPQrOPNMd8tFcOsErybYHLowGJCaLLhSPANb3kuKwWFotLD7gYASbgp3o9zmLKLDehVJu6qHd8omLyZPxkwCyeEwg8oQm9PHNPG7jr392Z4xvYuxbKPJYcAPo4wYj7H1qE5jwDtLVKFGv2KpXnRFuoVEtLlQbBsgc4XQnSjv9lYvF3oA5Z05hYc3Wk+NmEIchHOBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfjN7sf+hcJNhYIajgqt61ggk+jgYSNbuZ+7e5OH+es=;
 b=HhxQUhnax45V2CrZ7UTgmBAr/susxJAlPfDGo7fTuaRy7RE467p4Rd5IeIkw9z8uCNiWWsZ0P0zHHhVMYi1l3o6phNiwvMWVoD5A/nSeh4STSvbsCfRnFzSsBfOab01Mcodex7fHkjEfuTgUDE0fuwY/mkdwejb88QUw1aNkKtbVHzkor9O8v1L4BkR2pDa5v5qCkK4IpqJ+RShZzH41J/8egfgi0iDzkwHbHc4pSaSyPzrHHxZa4eXOrfsrPC50NoRgzTYoEL3e+meDvUPcC7L95RQWFecubAeO45XOCPWhqvZX6zkvjpsjU3SeUaE2mYQOXxhTCJ+v92YqtbOz1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by SN7PR12MB8104.namprd12.prod.outlook.com (2603:10b6:806:35a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 16:20:04 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 16:20:04 +0000
Message-ID: <34a91470-ad7a-4a57-bf9d-33b68b0a4473@nvidia.com>
Date: Tue, 16 Sep 2025 21:49:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] i2c: tegra: Add support for SW mutex register
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 "digetx@gmail.com" <digetx@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250828055933.496548-1-kkartik@nvidia.com>
 <20250828055933.496548-5-kkartik@nvidia.com>
 <l4po62bw6672xpaabkbvu6snyg4hrgcdxaijpt6evizortwjok@jwg2asezj3cb>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <l4po62bw6672xpaabkbvu6snyg4hrgcdxaijpt6evizortwjok@jwg2asezj3cb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::24) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|SN7PR12MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e54003-242a-4f2b-e54d-08ddf53ce478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW1EeGJ2b3kvOUhSQUM3elE5VjgyOEpDK0J5U2JURkoxTmErTXFxamkwUXhM?=
 =?utf-8?B?UURXbDlZdkl6RjlHQTQwSkpFZUFvYi9Rb09oZ3RGa2dHQmc3eUR4dURvQ2Nn?=
 =?utf-8?B?Um9obFZCekRlUlUrOTVlVy95d3pta04wcm1SVlg5TEFBbFF3L3pRelFuelBD?=
 =?utf-8?B?VEl1cHJOd21OdENBOTdFSWhMK2pkck91d0lnY3pHYkJzMmY0TTRGbmFhRkZi?=
 =?utf-8?B?eGdJV2l6Z0RsL3pVdG1wWHc0SFdnbXZMTUJCbWJwb2g0ZHIxUEk2T2d4TGUx?=
 =?utf-8?B?b1FEVE0xcld6dTR5U3E0U3BTZlRtOGJJUDRsbGRWQkFQWmxvZnFqZjhrbDN5?=
 =?utf-8?B?RE52dUNST2tVaXkva2hScElWcFNkcFFDbFNMQ0Q2VnBuVlVNVmw0b3JKZzBw?=
 =?utf-8?B?V2g2Sm5nOTBiU0I4NkIyeVJFa2dGOUI5UmVLMDVwQlVlSFRlUHBvZDdDemhO?=
 =?utf-8?B?TlFCVzBGN1pKdnZjZXYzL2hLeEkvVUk3YlU4L0crT2RML3FyTjB0RFlBK3VW?=
 =?utf-8?B?THpxN0pjTnhsN1dCeml4cWpBTllYUWhvUVkwQmxlSjE4K1dMMnlpelRHZG94?=
 =?utf-8?B?NHBJTlQyWjhtd3BLQmI0bkhUd1BxVUZySGM2K21veG8vRkNxWSthZjdXRmZ1?=
 =?utf-8?B?RmhjMVQwd3JyT2orNUxYQW5kWHo4L1JEYzhlbTNldlRHelY1a01FMWZSbG1T?=
 =?utf-8?B?MkdGYVJoWlJPbkU5amN0dk5Na0x6U0FEZFdySTgvRkFRa0VyQnNnR1EwelI2?=
 =?utf-8?B?V3owOS9UMEdGL1YwR0NFNmRBTjFBTiszODMwdDdPYlhveDRHWDV0QldNZ21H?=
 =?utf-8?B?TnRZQmtMRmpxU0N2QWFPNmV0cjN2djh4M3puYTVKRGFjZkdzS3lBYzFBM1Ew?=
 =?utf-8?B?S24yeTNXK1FpNXg2T0ptN29xeUlKeGs2Rk16NmZWQ3IvWlhuWXpCS1lrZmor?=
 =?utf-8?B?L3N6ZllxWEVFR1RaU0djNWtZL2s1YkFCaXV4NDIyYk42TGJFOVlydkdZVE1Y?=
 =?utf-8?B?Y0ZuV2VzS2czeFRoSkZnRDJSL2ZEbkpLRkh4TUpmYmNpb3hYa2U4QktYT0ZV?=
 =?utf-8?B?NFZ0bVdLUUhtZWVwZncrUE1ldG40aUQ4aEZtbzNFUGQxN0pYSm4vZzRqMEpC?=
 =?utf-8?B?TDMxdzM1WVhCQldBQllSUDZTTFVKRTVWNWxKL1BKS3J0OHdEeTZwdHRLY2pG?=
 =?utf-8?B?UTJ6bkxHQWcrS2QxNmF3c2dTNWRoTEhiNnhVNnpwc0UySWFiODJFTndSNVpp?=
 =?utf-8?B?N3ZLeTZyS1VhNysxaFR5QmpjOGJGOFRsaVc4UGlMMS9UWjF3REpXczdwQWtm?=
 =?utf-8?B?RGVJQnVteWFNOGlvcXRheXd2Z1h6N0FZNnpwN3VtZjBFNGoxcm9WMXpYalZF?=
 =?utf-8?B?NGd2bm9YaWhONmhwTXJmOVZ1Uy84dkgrVkg2UlFrWWsyeGJ2SFJMK1JxNmlk?=
 =?utf-8?B?dCtyTDhuQncvdElQSnZMRTNDQTQ5M3JKa00zaERIMW42OW1abXlISURhQUJm?=
 =?utf-8?B?eXYrZGNSMjc0RTllV2w3bFJHd2V6eHY0MTNqN2I1RVlZdlVoTXdCTml5L00x?=
 =?utf-8?B?WE5VUlhlS08vVkxVdFVtSXhyUFVXM1hLeStoU2E5SHJtOVJTNHNYY2NDT0FB?=
 =?utf-8?B?ajJzRjVaZjJsbDR5V0duVTZtWXdBUlFLalpmWEdhcmpvQjVpMy9QbmUrS2s4?=
 =?utf-8?B?UWR0K1pPZzllYUtNcitQMUJRb0pHeENQa0ptTkFJeDBkNGk0Q1lnU1dIU0lr?=
 =?utf-8?B?UGJmaERWRldpcGZKVVR4cWJ1b2toNFo1Tm4rSTB1S2prUGx5SnVrR0FyaXkv?=
 =?utf-8?B?dW0rUkRuTTlUSk94dlpKM3hjZXZndHlCQlJkellJZDdBbzk2WUtnRkw3ZTlU?=
 =?utf-8?B?aGFlUUVacm95Z0ZHZXMrVjlVaVM2VEt6V1BxR1pNVVpzYzRaTnhZeVJNR1BE?=
 =?utf-8?Q?HqtnWetL4J4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDRjSEk0TXNtWHd0eEdTeThZWU5BbVBPZlFGRG54cmhuZG5GcEwyZkU1SWQx?=
 =?utf-8?B?dVd2R0xEaGVSSGs2OHhUZlEvRStOMkVHLzlHdmptYUw3bTN2NjExUHNYSUl6?=
 =?utf-8?B?WGFXSmptU0hzSmxoMjRJREhFM0FuTERjejVxRkZFbEZRZkVsUVkvQmpLYytE?=
 =?utf-8?B?bE9ZVHAyWjVvMWNMckdoK0E3NzdyY0FtSVdqYUpoNk9jakZ3blMrNFhFL2JY?=
 =?utf-8?B?ejFaNmM3R3BmdWF5Q1JhS0dBTHl0YVJuUTJKdkI5eDNIY2YyTXZlMHBZV0Q1?=
 =?utf-8?B?Vnp1M053L2dRL1ByNndnZUM3bHByREZBMmFIbEZnRnR1eVA0MFl6dEcyZUY0?=
 =?utf-8?B?VDdIUCtxWkVBaGtPSTN6ZGYwNXViSDFqVzdLU0wrM2E2TEFUMkVyNGV3QTZm?=
 =?utf-8?B?YmZtazNxWjZuK1djNnZnOEgvTWMrNmVLeWRDd0F5QVJEYTNabmxjZnFNOUpV?=
 =?utf-8?B?V285YWhzakhqRzRlY1FpTkhxM2RsWS9WeS82Z2l2RU5YT1NOVW1rS0NINFBV?=
 =?utf-8?B?dG1QUDRvWCs4MWxOblV1dW9TME4xQUhYcjV5WW1TZlRsdGQ2OTBRdi9JT0Fl?=
 =?utf-8?B?cWZneGFUNGY4Z0J6WERqeFNOMXB0dFEyWHFvZ0w1Q1pKcXhPN2FPSXcvam5I?=
 =?utf-8?B?dSt1YWE0YjhJOFYxd2JpeWdZSjI2enpuS3hhekU0b0NQWEFxcWtjVWNaVnp0?=
 =?utf-8?B?SHJHZmlNNkI4dCtWeFYwSWVidCtBT2hWbm9NWUg1blZsUFhCWndaRHBmeW9F?=
 =?utf-8?B?WkpUUXNWNExzb0tRQTQvcDI0bGpuZ015bWxQdU1UK2o3Z1E5aWpmRnpNUzZu?=
 =?utf-8?B?V0RoU3pDcm1xblhvMExVRXByUy9ScFlCZFRrSEpEMXpyVGVmb29PL05kcGZK?=
 =?utf-8?B?RE13OGtkUnBoUUtjb1ZGRUFHU0lzNnlXMEpRbGhkK2hVL004YWU0OFNSOW43?=
 =?utf-8?B?cmU0djVJU3lnMmNHbjZkQlVTWlhsMFlzY0pkUVMwTW9EbExlT0FnYWtsNi9Y?=
 =?utf-8?B?RnV4di90VnVmbUkyd2ozZnNrRFpGSWFTeHpiaEx2cjBEbE0wSTZua3BTVzRQ?=
 =?utf-8?B?MVB3dDNMZXh2aW50WlZoTHgrYU45T3B5VldGYWsvckJpQ0xlcHJlMG5scDZi?=
 =?utf-8?B?MTJJY3B5ejFqT2hIOVhTOEZHZ1V6TmlhMy9oSWo2aHdoRzJ5NC9OMlJYc0I1?=
 =?utf-8?B?eHFpNHpDOXAweThEL1F2ZVZid2ViTFY5cHJ6aGVycnc0YUVmMGRaeUZUaDdZ?=
 =?utf-8?B?WnBZNC9FTEsyQ0Nzd0NsS1BPM3REL2pnTWh1NkRGdWdNZFZ3TlBVVURzYm1Q?=
 =?utf-8?B?L0RCZjNwNzVVd0tDbnNQQ1FmOTE2MlVUTUFaMUMwcHo2d3ZWdkppLzI0RnFP?=
 =?utf-8?B?eWJpbVlSQllVZ3RneWpoeERwZ2xtZVRKWG8weW5TUEJ2SXRUMUsvUkl1OHdD?=
 =?utf-8?B?dU5WR2cwQXdHOW9rMS9aTjNzY0VYOWs4TmZTcFh0S0VsZW11L0oweWdNVC9W?=
 =?utf-8?B?VHZnZHhRZENwOGhPdGFTTHJQM3QrQ0swaFAvRHdMVnlzNVd1QzR3em0wSW9V?=
 =?utf-8?B?Q0wwcmQ1TzEzMGQwcnA4RHpPd0VkU1MrVVdDSngvUFFOakhzWlVLcWh6MUpC?=
 =?utf-8?B?YjlqK1A1bGJxUDNXUjI3VElZeWl5amdIaE5BV3RTYjQvKzZMZGZqTkJVdkw4?=
 =?utf-8?B?ZmMvbnhpY0RXdTR5K1hsemw0MS9uUVQ2cVNJK2dYMVhvY09ud0VMWmZSU0c5?=
 =?utf-8?B?Q09aYUFxeXkzY0pBNjRaZitaK2JHOWZXd1ZZV1JMVXFVVTFWNEViUDJWRWxN?=
 =?utf-8?B?Z0YySC9Sak4zc3pNOXp0L3BPNlJWVmxIa0MrcHd4dmdoalRoNFQ3OTluZlNY?=
 =?utf-8?B?a2VpbkZwUHk5VzQ2bVhsT1JlTHJ5YzdmR0U0YzUxR1dxRnNCc1BpcENCdE1o?=
 =?utf-8?B?RWQzU2dlR2syMldZaHFlc25BN2U1VHZoY1l4MFhSNnN5aVJxYjgwUnEzVzVZ?=
 =?utf-8?B?a0UxOU1WeTd0TUZ3d2c0YWlQMWsyTkVrbFhoNzFoZTJGd3ZpcjdUNkNvQ1pL?=
 =?utf-8?B?M0dFVjJwQUxIa0tmRElIcVgrTlFuWmlHajRtV1RzUVFMVUNYVytGeGdPZFl1?=
 =?utf-8?Q?eUprzurjiICOlO6AKx0EZM/ak?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e54003-242a-4f2b-e54d-08ddf53ce478
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:20:03.9613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzSaPHDUEBrZS1OHIJztBmNTGz05e50tOzirUxi5pbM6Iu2UgXkD7dgnTTKM4s8bGz8t+8zmGqB03Z7AaP67GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8104

Hi Andi,

Thanks for reviewing the patch!

On 05/09/25 04:58, Andi Shyti wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi Kartik,
> 
> On Thu, Aug 28, 2025 at 11:29:32AM +0530, Kartik Rajput wrote:
>> Add support for SW mutex register introduced in Tegra264 to provide
>> an option to share the interface between multiple firmwares and/or
>> VMs.
> 
> You could add a short description on how to use the mutex
> register here.
> 

Ack.

>> However, the hardware does not ensure any protection based on the
>> values. The driver/firmware should honor the peer who already holds
>> the mutex.
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> 
> ...
> 
>> @@ -381,6 +391,73 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
>>        readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>>   }
>>
>> +static int tegra_i2c_mutex_acquired(struct tegra_i2c_dev *i2c_dev)
> 
> this is a bool function.
> 

Ack.

>> +{
>> +     unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
>> +     u32 val, id;
>> +
>> +     val = readl(i2c_dev->base + reg);
>> +     id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
>> +
>> +     if (id != I2C_SW_MUTEX_ID_CCPLEX)
>> +             return 0;
>> +
>> +     return 1;
> 
> return id != I2C_SW_MUTEX_ID_CCPLEX;
> 

Ack.

>> +}
>> +
>> +static int tegra_i2c_mutex_trylock(struct tegra_i2c_dev *i2c_dev)
> 
> I think this can be bool.
> 

Ack.

>> +{
>> +     unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
>> +     u32 val, id;
>> +
>> +     val = readl(i2c_dev->base + reg);
>> +     id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
>> +     if (id != 0 && id != I2C_SW_MUTEX_ID_CCPLEX)
>> +             return 0;
>> +
>> +     val = FIELD_PREP(I2C_SW_MUTEX_REQUEST, I2C_SW_MUTEX_ID_CCPLEX);
>> +     writel(val, i2c_dev->base + reg);
>> +
>> +     return tegra_i2c_mutex_acquired(i2c_dev);
>> +}
>> +
>> +static int tegra_i2c_mutex_lock(struct tegra_i2c_dev *i2c_dev)
>> +{
>> +     int locked;
> 
> I guess this can be bool.
> 

Ack.

>> +     int ret;
>> +
>> +     if (i2c_dev->atomic_mode)
>> +             ret = read_poll_timeout_atomic(tegra_i2c_mutex_trylock, locked, locked,
>> +                                            USEC_PER_MSEC, I2C_SW_MUTEX_TIMEOUT_US,
>> +                                            false, i2c_dev);
>> +     else
>> +             ret = read_poll_timeout(tegra_i2c_mutex_trylock, locked, locked, USEC_PER_MSEC,
>> +                                     I2C_SW_MUTEX_TIMEOUT_US, false, i2c_dev);
>> +
>> +     if (!tegra_i2c_mutex_acquired(i2c_dev))
>> +             dev_warn(i2c_dev->dev, "failed to acquire mutex\n");
> 
> I would try a few times before giving up.
> 

Yes, we are retrying with read_poll_timeout_* calls.

> Besides, is there a chance where ret is '0' and the mutex is not

In case of failure ret should always be set to -ETIMEDOUT.

> acquired? If so, we are not signalling error if the mutex is not
> acquired, but I think we should.
> 
> I would do:
> 
>          if (...)
>                  ret = ...
>          else
>                  ret = ...
> 
>          if (ret)
>                  return ret;
> 
>          if (!tegra_i2c_mutex_acquired(i2c_dev)) {
>                  dev_warn(i2c_dev->dev, "failed to acquire mutex\n");
>                  return -ESOMETHING;
>          }
> 
>          return 0;
> 
> Makes sense?

I agree, we can simplify this logic by just checking the value of ret instead
of calling tegra_i2c_mutex_acquired() again as tegra_i2c_mutex_trylock() already
checks if we have acquired the mutex or not.


	...

	if (ret)
		dev_warn(i2c_dev->dev, "failed to acquire mutex\n");

	return ret;
}

> 
>> +
>> +     return ret;
>> +}
>> +
>> +static int tegra_i2c_mutex_unlock(struct tegra_i2c_dev *i2c_dev)
>> +{
>> +     unsigned int reg = tegra_i2c_reg_addr(i2c_dev, I2C_SW_MUTEX);
>> +     u32 val, id;
>> +
>> +     val = readl(i2c_dev->base + reg);
>> +
>> +     id = FIELD_GET(I2C_SW_MUTEX_GRANT, val);
>> +     if (id && id != I2C_SW_MUTEX_ID_CCPLEX) {
>> +             dev_warn(i2c_dev->dev, "unable to unlock mutex, mutex is owned by: %u\n", id);
>> +             return -EPERM;
> 
> I would try a few times before giving up.
> 

Unlocking the mutex should fail if unlock is called and CCPLEX is not the owner.
In that case no need to retry.

>> +     }
>> +
>> +     writel(0, i2c_dev->base + reg);
>> +
>> +     return 0;
>> +}
>> +
>>   static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
>>   {
>>        u32 int_mask;
>> @@ -1422,6 +1499,13 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>>                return ret;
>>        }
>>
>> +
> 
> no need for this extra blank line.
> 

Ack.

>> +     if (i2c_dev->hw->has_mutex) {
> 
> I would put this check in tegra_i2c_mutex_lock() and _unlock() in
> order to avoid two level indentation here.
> 

Ack. It will look cleaner if the check is moved inside the lock and unlock functions.

>> +             ret = tegra_i2c_mutex_lock(i2c_dev);
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>>        for (i = 0; i < num; i++) {
>>                enum msg_end_type end_type = MSG_END_STOP;
>>
>> @@ -1451,6 +1535,12 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>>                        break;
>>        }
>>
>> +     if (i2c_dev->hw->has_mutex) {
>> +             ret = tegra_i2c_mutex_unlock(i2c_dev);
>> +             if (ret)
>> +                     return ret;
> 
> We are skipping pm_runtime_put(), though.
> 
> Thanks,
> Andi
> 

Yes, we skip calling pm_runtime_put() if unlocking fails. I will fix this in the next revision.

>> +     }
>> +
>>        pm_runtime_put(i2c_dev->dev);
>>
>>        return ret ?: i;

Thanks & Regards,
Kartik

