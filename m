Return-Path: <linux-i2c+bounces-4893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE69C92E32E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523BC281600
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 09:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C921534EA;
	Thu, 11 Jul 2024 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irtaYPnl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482CD653;
	Thu, 11 Jul 2024 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720689282; cv=fail; b=HXufZv97nfxjgr7sfuvWKvDKIffU+2n+rpZUkOLX4+v5Z9TN0KopqNLbLAsBqJ7vvWuYryYWEmP6UJxzMWYrT4adGmwpUD8MeUkqkobBchtVb7ZhsapE8m2IrA3GuscmCUpEKdzDtLs7GVLGM68ZtaYY5bBcROEWC2PfXK2nTMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720689282; c=relaxed/simple;
	bh=rRWisK9jo88701lgtq0xqSn0a3q8YQvYaGJkQA3Rjiw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HiuswwP9EQEhFomRnFhJWDdkc/FxMYNeexB+XZ33Jooe11MZClZC6SgpYPalrW9CQAtKX9tGNwUrfst+g4refUZ9hYd8Y3Rn15opURNXylhARfnTL6h1grw2Ww4NSLgSORyMyqLNnSevdJTbwB+LOi/7cCrfkWH2+2KpxwcSfzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irtaYPnl; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720689280; x=1752225280;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=rRWisK9jo88701lgtq0xqSn0a3q8YQvYaGJkQA3Rjiw=;
  b=irtaYPnlnqEjwuqqxqBEbhmXgZYAyyddWsewMz7nsaS/8+OtyI3Gjm8t
   /HZqZFWU57QBesTfUN20pHSHIZv+wpkT4FsHd2aYIpDmEr3XhPVb7ADQV
   h2mY6kyINz4upxjJF0PpsbDJuxEfkLd7S74xqy3deZrEFk1T2ZpGvOcdY
   ndBroeHNXaRZIw+O/OfPcGtZn/tKjYjnb1CdyvY1PMyuzrhP5F7oCgmsC
   i+VLt30YIpCAiPThbmnndG/bM8pi3Wti8Sn63u7n36S8da1z9tRM4tHDu
   w0OC3uGpFBzlCTToU/qOwDeYqIC4VMoTE3nLZ/hXJhzhNKqukj6kJkHcx
   w==;
X-CSE-ConnectionGUID: fhrusCDASbyzosPRYFDSZA==
X-CSE-MsgGUID: FuQ/MlfETPut3X9/2DcjBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="21928653"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="21928653"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 02:14:39 -0700
X-CSE-ConnectionGUID: eP54PizySzmvL58eDH4cbA==
X-CSE-MsgGUID: OGtqSSMtS2G75y5tBMqCWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="48939905"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Jul 2024 02:14:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 02:14:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 02:14:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 02:14:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 02:14:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yf8NuoFFNOum6NxfMmtETfA/EgeZFvnDafC2gazOa6gKGBtlePnIr0DC1BRZeMpOftvoUBcv2DZQnPWnK0heXWRK0wkF2itgOJ7iYmKGWNS/nhF8jBrEnC73gDAJMTsyQJjsvSweJenYqhKC7dKrQpnftOl6CpHermto7yp4cHfgHFhVecKf5NhJAMJMEl+E4ucnviiPDoLZBLwY0AjprWm1mdk6otMYDc3VvigVpdpq+sr+w+4trMZhaqa3UCjMHykz2oJ/Tj2JL3ara4abQssO7kMkJY/mY3MLuCfceebKZlgv1lZu7r9alPbpUcPqNsxcovRarwXlzMGBFP8Qxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRWisK9jo88701lgtq0xqSn0a3q8YQvYaGJkQA3Rjiw=;
 b=BT5upyyBpYPaZ3wvScsbXlD9CkdWOt2x3UsiAIRQNNLHp6G1TERCGAmQTEgC1Au644sib9AY3v8kucMxO/9BFfzHHAkrj6EQil41WxXuRLK/hXyE/ME00h9jde6TNTzKmODMtGazoOWnF0Jp1Oiz6S1SjMotOukGUOBaXGBqQm6NbQuYaafSOJfYL8wrfXyGkmjXHE7TTg2ph3S1YWB7ZZP967bVXzqn29dw4qwJMHXpZ0NpVV9Un5W48wU/hssliPc4ShFrAh0AbWEOxYx6CwR+oIUD1yrdEvbtDmV+Vti7oIItqWq9j/5WUWLoXJSQB34Oaj6FwivyugDEjJhCJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 09:14:35 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 09:14:35 +0000
Message-ID: <1d339c92-edd3-4373-93f5-a612db452277@intel.com>
Date: Thu, 11 Jul 2024 17:14:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: delete entry for Conghui Chen
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20240706144150.2668-2-wsa+renesas@sang-engineering.com>
 <20240708061937.p7lhz7eho4dh5bv7@vireshk-i7> <Zo-cGVD_mvezDMoZ@shikoro>
Content-Language: en-US
From: "Chen, Jian Jun" <jian.jun.chen@intel.com>
In-Reply-To: <Zo-cGVD_mvezDMoZ@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SJ0PR11MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 271847cf-7379-4534-4304-08dca189e218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGlySGFlZ3ByMGtIZHQrbHVoV1dkK2dCRXZQakovclZGS2xJdzBuV21mLzVv?=
 =?utf-8?B?Nm1RQ1ZyZHZza1lZcU5YLzBqN2NHMUp0Tnc4Z3BLWjVMSHQ5VDhHZXJFdGR3?=
 =?utf-8?B?eWhUVjFZZDRLQVlxbDlvek9wQlBDYU82U0l2dEkwNTliVXVrYmRLdDVGbkNq?=
 =?utf-8?B?bGZtelFqUVJlK0l5T2RkQ3JWT0xrYjNVeGxvZHowR204bVpBVCtFeDFmWDFj?=
 =?utf-8?B?QTJwbkRXQjBucXg5QU9aVHhVUDJaUy84cWYraENza1N4YWlaVThwUUw3VXRH?=
 =?utf-8?B?NFlUU0ZKb1pUa2NZREVDQzJYd1hKVWxOcGN0cWNmQjlDU1ZHKzZVTExwQjlv?=
 =?utf-8?B?a00wQUsxeGF6TFVxRzJGSjZrcDZLbUpDQ1kvd2RhaWU3Z21KbHJ2UGRSUlB1?=
 =?utf-8?B?c25EbUNKRHB5UURHTkhzMkxna0dZL1doSjh4cTBRNWU5cGdSZ0ZKalNweXds?=
 =?utf-8?B?bmlUb2o5MDQweXBXdlIrbVJINm9KWjZYR0VvUDRJL1JqZGM1WGM4bHN3RmZI?=
 =?utf-8?B?WU5WdjBaVWgzdXdXa1YwU1hNRUZJRVRISTRDdCtFNG1kRTdxdnM3cWo5NlRP?=
 =?utf-8?B?azNneVRTUHlmdWJYV0ZuRTZoU1RnS0VFTFlBRVZtUW1DSUtGaWFLd2xiVWVa?=
 =?utf-8?B?dUl6Q1M1Ty8xRC9ybEdZMXdKNlE2akNrYW9nN3JveGRRQWpsdkhXOTloOEZL?=
 =?utf-8?B?elFJelpDSXo1ODZzSWdMRmtVdE5xS0VFT1pjenhhR3VuWGV0c2dNUmN4V0xL?=
 =?utf-8?B?SXRpeGNhQ1VFMHE1THAzc25kNElMV2kyMmZ0ZzNDNzJweWk2K2tmL3lzMGtB?=
 =?utf-8?B?UG90NzNjV0tSVlVkUWRqOWZTNFU2a1RzeEhoczdrZjduV1QwNEJsUFlSS2lm?=
 =?utf-8?B?YWRyaThVNlRvQlh2dVRVYkluRTI0cmxveEd4YnEzZzNVNldIVm4rTS9OU1BQ?=
 =?utf-8?B?M3BFbzBCSWJEMmZmblN5Vy9MaVNPUUVmTlkxN0NYQzdta1BHT3U0M3hzMURo?=
 =?utf-8?B?MWZpMDRyWktvVjU0am13S2pIaDhlcXNoZGQweFZwWURqTGpyRVk0anh4S2xz?=
 =?utf-8?B?UkFOdTM0Q2RoVnFkS0EwT010U0JWSHJTcDBLc29rbDNnNVRMdTVVeklrcnRV?=
 =?utf-8?B?WUxET3gvbzUraWVuR1VBSUtmRUx0VXRLUVVBVnV2TlZsaDBZRm5oaXp1b1c3?=
 =?utf-8?B?ZVl2alQxVlUxdEU1Z2hFcFRsalAraHYwRkp1QmYrTWxFQWhaNUJrZWVmL0lM?=
 =?utf-8?B?R3R2Y0JDODRBNDJSQ29razdoR2traHBsak13YnE4ZnIvdjdPS1VOSUZ6MkN2?=
 =?utf-8?B?UE1xS0VRZWNnTjdxU0Z2UVpBMER0dkd5WWZzZjFoZXJJYWFmZ3JPRnJZOXlR?=
 =?utf-8?B?djVQbjhxa2JHL05RQjdKbFF1SGVnbHREOEFVVlg5bTQwbHNqNmNWVTIxMjdT?=
 =?utf-8?B?VHAyeWVNQk1EczVpSE40YlNOM1BuQ3Z6dTU5VW9sS0k5U3huUU8zNm42QlVG?=
 =?utf-8?B?UThMR3hEbnVhTUVWRTZMUjRxWHZnenE1QlIraWx0MHJHWjErdTJOSnZVM1hu?=
 =?utf-8?B?K3BkOFg5cnBKZ2FtTnA0cVl4MjE5UXk4R1JpeTRNRWFpM2FzeGVWbHVSRkZj?=
 =?utf-8?B?SW9KYTlJdXMxYVZTSXFDWG5URlBoWDk3WnRVbEhxY1NNYW1IV3RoU0FSOXFE?=
 =?utf-8?B?UHo2NDByaS9oQmhJeWdGOWJ0bmtnNE8wbzRzd1pVdnQ5ZWRlODdkNy9WUFlt?=
 =?utf-8?B?Zjh3Z254VnFWbUROS1M4NjFUZmllcXMvTFBWQ2FnaUUxS3hsQW1TcTdTM2Jw?=
 =?utf-8?B?MWF1SDZQZ3JxTVI4c0dXdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6053.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3hQandiY3F5eUJqZWcrRW5TamFWY2p0WU1OUnBaYmYvYVhHNU9pTlF2cUJo?=
 =?utf-8?B?dG1ybmVmdm4zWW1nNWxHUS9KV1ROM1JpamhFK3RPbzN6b3BNMlhyZ2MrN01K?=
 =?utf-8?B?UWM3R1FlOUNXSGZ1am13KzVpU0xXdFd5V2FCSldCZVRBeTlhZVM3R3k1MTVT?=
 =?utf-8?B?Z2RlVklNLzc3L1MyYThIc1VJUUR6MGhpNlM0QS9wbEVNUkxXRDhnNElXOVVR?=
 =?utf-8?B?aUJPeFRCQ3YyT2FuNUd1VHBJRHhYMVBBVkVCZDI3Nkpsekl4K2dDVEg0eGc4?=
 =?utf-8?B?eitVdTR4cURmanBaSzk4TnJldnZEc3FOc1Q3NHJPZGhVR1NqN1ZKbGVSK1o1?=
 =?utf-8?B?cUFQaU1GWkgrdHlQVjFTdktIY0I3NWduREhtQnFNTERkT0Y1b1pIeFdZM3g3?=
 =?utf-8?B?Qk1xV3BReWRkMzl2V3ZiRTJ5RkU3K0IweXA2bGFQdXpXUnlNVmdHR0laeDFq?=
 =?utf-8?B?RkhpdnlRMTVkZitZOG94MmVSbng3Y1NVWXp4ZkdlSmMwUE5vK1IyaEhiTFds?=
 =?utf-8?B?V09CUTRYT1RRTXNlZHBNYWJVaWY5cXdiYVdWWnFRR0Q3YVJaMnhGZmJjcmpl?=
 =?utf-8?B?WUd4Ty94aVZsaEgrZGZGYm1NRmkzdzlrYlVrQlc3Y3cxek8wWS94TGxSUDJV?=
 =?utf-8?B?cEh4bEplbjVDWkc0clZGdHFMMW5jMHlEY2UwbHBVWGVPcHRRUFZVVnNmODhQ?=
 =?utf-8?B?eXlaQjk2WTE5bTN2MFRmUDMzb1BISVRXM3hOeXlmN0QvYXBLUC9WaUttVTNC?=
 =?utf-8?B?a1hmWElHc2ZaODkvazVvZEZha1dKY0V0bFdrMmMzVkpBY24wejU1M2dFMnpq?=
 =?utf-8?B?RU1zK2R5SzNodWNFMTBwcnY2YU01V1ZwV2tJN3NOR21JRzlsVlIrZytXV1Z6?=
 =?utf-8?B?d3dFTU51VHZsdVBOYzdOWnJlNTZnQmRwcXpGZFRGL2tPdEplQS9lRVp6YWVw?=
 =?utf-8?B?STMxelVkK3MxVEZPeVFqemNaWXhSbFdiY25Da21FMDBlZ3dVOUVvd3k1YzdO?=
 =?utf-8?B?d0F4Zmk0bDRXSlJpRTJ0dEhRNlJoWEVnU3p5Qmw4QTNCNi9XaktqcFRNSHU4?=
 =?utf-8?B?bEo0L2JJendlRFdqMXd2dVlpaVNTVThYZUduUXh5YmNtS3RyKzRlR0ZFdysy?=
 =?utf-8?B?Skg3U1dzLzMrcDc2VmI1VXVLaDRLeGxHTS94TUlFTS9nMVVQdjIrQjQzK0M4?=
 =?utf-8?B?VUxweDhQRk9PZzdIUTFYWklMSmN0UDJGZXVMc2V4OHZ0dUtiQk96RUxPSURC?=
 =?utf-8?B?ZnVmcGJWQklaN0o5eis4d2IyZ0dvOWJxbktjaXVZVktKbktva2JZUmF6Rk1l?=
 =?utf-8?B?WCtVZDFsemFXZjdjMjkrMWh6czNLMTBRa3c0Y3U4OUhrMUV5bGx2WW1QeE0w?=
 =?utf-8?B?WHdSb2ROOHRjQ0RhU3ZnbUliUmZSd3l3d29EQW5OVS83a01MZGlKaFhiOEJ0?=
 =?utf-8?B?TmRWSXYrMko0dHp0TUNCQUVDWXdsVmVmalkyWGRNNEI0MUhYWGQwTXZmaUp5?=
 =?utf-8?B?WTB2amxrZjJ2ZHJyd2hweVZ2dDRoRDh5NUFSNFFzNGVhM2VJTjFzUDEreC9z?=
 =?utf-8?B?QzRzSk4zKzJ1NmRVMTB1RW01eUNSUXZHbndtMXQxdGlqdk4vbnlMdmtTSXhJ?=
 =?utf-8?B?UWhMdGxXTklOMHBIL0RFbkQ0YkRuaWFMSGQvY0VPNjh3MjhTUk50Mkw0Wlk0?=
 =?utf-8?B?cWIwZ2tEOEpUNks0R0pZUDNKR2NtUjN6RHl2MnI1MjdKeExnMDhQcEVGdXNB?=
 =?utf-8?B?Q29mSFNBcWFXby9FMDVDOWI2MEZaRmErTWIzY3RoMjZxei9tZHN6VCt4aTBt?=
 =?utf-8?B?R1dnS285T21iUEV5NGRtUzhCYVdrMFFyKzc3bFZ4RFh4bXJoRlRtZkNhL01y?=
 =?utf-8?B?eTJ2ZkdzcDhWcFBmQlJ5blZJZTlYYTVaYkdHSXNNRmZJK0JDWUlPaEhuM21z?=
 =?utf-8?B?aWpXeERDZHB0ZEIxenpYVVNOVHRXUjNhVFlqdkRGcERwMlZ6VGRmNHI5MmJM?=
 =?utf-8?B?OUJ2aEMvM25NMjROeURZK29BRWd6ZnF5NmJKR3lBaHJqeC9TenhJT1lKWG5n?=
 =?utf-8?B?YU5ZZldVYUg3RTVQb0dabkNEUUdJWFVMRHI5OHJZYk1wZEV3encyOG8rZ3c2?=
 =?utf-8?B?V1dzeXFMeXpkdEhuVDRXdkVxVGVkR3lNNnR1blorZ1NDalpxQm41VUY2dUNr?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 271847cf-7379-4534-4304-08dca189e218
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 09:14:35.8750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3dpSfttaTVi6305W3gScZ+GzemtClwece9Q0rYk4Vx4sFTkI004LJHYeeXgmT1CVgBWhg/77umQk2newtnTtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-OriginatorOrg: intel.com


On 2024/7/11 16:47, Wolfram Sang wrote:
>> May be we can add Jian as "R:" here to keep someone from Intel in loop ?
> Yes, it would surely be nice to have someone from Intel in the loop. As
> Jian did not respond up to now, I suggest to add him with a seperate
> patch, though. Let's get rid of the bounce first.

Sorry but I missed the previous mail.

I'm honored to be as a reviewer.


