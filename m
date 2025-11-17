Return-Path: <linux-i2c+bounces-14113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B93C63626
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 11:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D85414EFCEE
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 09:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6693A25F79A;
	Mon, 17 Nov 2025 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g2L0ZN4V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DC026462E;
	Mon, 17 Nov 2025 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373164; cv=fail; b=VRTeDMd+2dV5Hs/baW9QwJnqswt+6kPdl9Km6wEcfIu/hcViMUXwHcd/Oq1hEcyXHSB0vDHR/hdcGf5/zx2St36QuSTVxO33apt3JF6l9a2kuZ9CCsc+FFm9vMYgBFH6QRLat8y97lS1R+FfFE9mN2oXEpofz9QffZv+Me46IUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373164; c=relaxed/simple;
	bh=G0V1QKLx0kUhiYffcK00sY/x0zXIDnwfvertkdXOPbQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cEW8UVMJbxIq0gt01BPVlIgM8uyN/TYc25iWwjb349B3U1ywxqtofWBL2DU2A3Gmh7uRlYmTMVu17J+EBmgZGh894/nR33uOcVGQCzoBzlqKmPDnEmklytyDNQItdC1sOXnOKxUO4KE8hvqk69vJ5kHsM8j0BmJiHuTO+cmImt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g2L0ZN4V; arc=fail smtp.client-ip=52.101.46.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEBFCfvO3Ve95Ayq6GXEJq4cwcckjUYlbL9gk74kW8o7MMXjuOgvsRNpI/zP23xq2RsI2Rb/6O6hxparq/CZysf3PTBPvfo+gB78fY/8Tlj7rQj0RbRzw+Cqb9Z0U9nURHEojKDgRGZGCDVSzoghTrSPefvc1NSsC8dQDiv5f/Ere3GvkhMfHC4GcHXCvVHcdhGDKQCwNn11sv6buyxWvendSvuIHaPgxQ5wz7c7+i8b+iUpm50csiklYO0Rmbgbh/ZBjqng1hSl/FbuHIiS0l/s0auTE2QMaa4dLM4+6REho4SupWXWVa3Y3ePBKMdw9H27s+WrEssGW33U8/ihow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO/eRYbYMcvOfLXjC2sYo/OetS/mg/kdrGR7Iym9aaw=;
 b=exgceRc9pMYXNNL+W3JI5G/+OROu5s9KqZ15RnohmafU5AUURrR6sd9p4M9PvhkNffnbSO0KV9CscA9IY6hIA2gu2pB1cgIuP39HPq0Hw6oZJ37L+/XQx9EzLjp9yR/8MDzEEOiJPzytxzdNmv9SIrh3jQgeT6/e+bp61ZL42KrOECaR++wlhDEIDVfeGqqijYhPU1pWZ5iXMeupP3ZvZUukC2m0c+GYS86CccTgrO5hq3v0+/kW+GziZwm6aMgUp5OV2RCt06lv2ig+ddJ7oxRwLUlyT1HaV9Q3lJ9lNcsznIeyTr6oLA5lXsrkXKG174ZNoEmEGFo5axwx8GSa4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO/eRYbYMcvOfLXjC2sYo/OetS/mg/kdrGR7Iym9aaw=;
 b=g2L0ZN4V4sr02n/zINxQK65zPGDb7TIpC8lyTQS2Xr/gIDyhOqst+IN3LOV8PewhS6NG1FdoRBYAODjzrRsyORwifbTS/9tVZD6ecHGFtETXrf9rhJnyc964eezzA0RvRLnGHXT4neItdbgwKeg4RkOQsw5y0QjDNrl5M6WHhKLVgGCRCWJhM13nA67G464UTlixj2LzjN8L9n9v6vyWvyMZstBG19Jm58kagm2S2PAGz+Mu4w8q4sj5zHrul7lfo1Y4xc5ZfX/PZK3q5yu7hBrtYNHReS67dZ161lmXdAwowrMsAUtQeWZcW8h0sAYfPoz4iJRH5tTC98xSO/lt4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 09:52:40 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:52:40 +0000
Message-ID: <811e364d-319a-4527-a4a7-627f3c926490@nvidia.com>
Date: Mon, 17 Nov 2025 09:52:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/6] i2c: tegra: Update Tegra256 timing parameters
To: Akhil R <akhilrajeev@nvidia.com>, andi.shyti@kernel.org,
 digetx@gmail.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 wsa+renesas@sang-engineering.com, wsa@kernel.org
Cc: kkartik@nvidia.com, ldewangan@nvidia.com, smangipudi@nvidia.com
References: <20251115042632.69708-1-akhilrajeev@nvidia.com>
 <20251115042632.69708-4-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251115042632.69708-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::30) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 620d0fcb-2b5f-4d9c-3f73-08de25bf0baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzBxZE9nRFBRWSs1V2dvcFA1ZjlKTEdWQ0RvVXpYMXJuZU9IRENSVjl6VHg3?=
 =?utf-8?B?bnUyc2RsTDBOVkovdkVYdVRLNk85QTBUMmJwOVF2UVptcWRtdTFweDVRTVly?=
 =?utf-8?B?enVSSlp4S2NuNU9Oc1JobUszME9hT0todEwzYTkvRVBId0s3TVM3bnExLzVG?=
 =?utf-8?B?cFBaa2hVZjhkb2tYQ0JIOE9kZ1JxY2MvL3RxVUNqalRPblA2eElUVVRpN1NW?=
 =?utf-8?B?a2hSb3Q5Ym12U2JlQVdNaHBEZVNCZmRFSlB0bmc4eUcybDYwVVZad3BEUnJu?=
 =?utf-8?B?Zm15djl4SlQwWEppWWpJWW5TMUc1WWsvUS8yOEF2cmVHbUdORCtxUy83Q3B4?=
 =?utf-8?B?STNSeGFRSUd4dlpJR1RONXdUazRtMU9yUjBkTnJpYzM2dnZNdVo5djROSUxW?=
 =?utf-8?B?MnhEUzRkYkxtQmxNR3A2RmF2bzNJUXEweWFRaG1tUTc2QjZUK3dQVnJybUsz?=
 =?utf-8?B?dkF5cXAvVkphVlZaYnNtN0RmMHc1VWhwZXNhUWx1ZEJZeERJc2J5enhEWGdL?=
 =?utf-8?B?dWljYXhnWGFuYXVLWW5KTmhPVTE5TkZqL1k0QXRieVJFajRPdE5lMUM1eDlx?=
 =?utf-8?B?cUtSbGg0eGZobkZtL0htWlBlRGEyd3JMd3BNa0xzTXJHUklxTG1VNTM5bFk4?=
 =?utf-8?B?eG51SGRWUjhHcWdaKzZMaGh5VW9ZcCtja2xKRHJoMUhKODNIQUVMV0szQmxR?=
 =?utf-8?B?bkhubFE1NmplMUR2akdPN3RmOGkzVWt3ZjNWQzZ2Y29uL1Nlemc2SE83VmFX?=
 =?utf-8?B?OUZsQ0s1c0k5aFNCbU14cGI3NTUvRWtNRGswV1BVczhYUjJFR291Y005bzVC?=
 =?utf-8?B?TzdaaVgrQ2JvYjFKS1pQMzB4cEwyeUdwN29WWkVuSUN0dHFqOEQvWW52SHJF?=
 =?utf-8?B?SDdSOUxseGNiSC91KzAwWHZQV0dnN3lZc0hHSnJFSm5yR0E4S1F6U0duS0VT?=
 =?utf-8?B?TmlpV3VtcDlXM083cWtxUXZzK0VVdDhSakF3aEVTU3VSbVUrbzdDbVlMT3ZM?=
 =?utf-8?B?dHd5SVJ3UXgvd3lackMvaml3Y1l3amRtakpxS0RaVDdZV2Uzd25XYk95WjRQ?=
 =?utf-8?B?b2RGVldnUUpoVXQ4UzQ3aHBlbWlnQ0Q5Qng4K25zQkI5a2taMGRQUDlYb3ZK?=
 =?utf-8?B?ckg4bEJOSnVUT0czN2pxSi9Xamd5enNXclBZTHZORVdmbGVkWXNwVnlIcG9E?=
 =?utf-8?B?VGVZRU9oZUFubHNYRUJCWHpURHZWS2UvSHQyZHZjR3k2K0tScHZwN0lhYU9t?=
 =?utf-8?B?NmxHTVkxM1pRWlRTZldyRkVJMy9TQlh4bGZFSEN3RDRSV1lYVXVBdFJoMUFU?=
 =?utf-8?B?VlZYRzluUkVGd3hJWEp6Sy8xOS9wb0lFMW9IeFRKM05CNk1qTWlIQ2tLQlF2?=
 =?utf-8?B?eVl1bVRseHdEQWNMTk9md1dPMWQ1RjJMcjBqYWh3eXJEc0l1T21lc2h2Unlw?=
 =?utf-8?B?clRWRzhFejVvQ1RpczRkOXZMb2VybjRXUUM3Z3g5MVdUc2ZxRWhwT0lxb3pP?=
 =?utf-8?B?d2IzRUtVeXRSQ09TM2tBTTlIQzBTNDh0UXpSUE5zRTFEa04vMElJc3NIOUpF?=
 =?utf-8?B?MDEwOUJiSk0xOW85cDR2ZFlTV0VxK3lCU1FuLzg4Z0JoNWhtZ1U3aDdjYk9Y?=
 =?utf-8?B?aW1WZkZFVkF2emRnQ2NyQjZmbm9tYmlEa3UyNnVuaTRlVzJZY0l6Y0tRYlZ1?=
 =?utf-8?B?ZUtPdmV3LzJZQ1RhQW1mNTFnWmlVTTNWdVo3eis0cC82bVNDRTdEZVN2b1dW?=
 =?utf-8?B?MWxnd2lMQlBnODBDQ3JvUDhSYUZ0d0JPRnVPeWh3RVJRa0hlY1ZudFcrUjNk?=
 =?utf-8?B?QVFwZ2x6WU1hUmRCTWxmR2FTbFc0MGdQU0tlcUFjTzlxSWdpeE0zZ1VKVzI2?=
 =?utf-8?B?RDZRVis1RVcvaTlKVG9aNktMa20ya0lSV1NFV2E4UEpKZnZVdWc5MFdPdGQz?=
 =?utf-8?Q?TNY3DCu0/oPdq6RoQnV7+AJwk3dBr8cy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTF5aGx0UFZZOEcxQ25xYmJCMG5hK0M3eWVhU1RNZWZOUUtWaVNYeDdQYTdO?=
 =?utf-8?B?SlR6bldzUWFWazdXU3h6NW5IOTBNN1RpdzVIdlZNRld5MURwRWhpSEJ5SnlJ?=
 =?utf-8?B?YTBFQStiSEpXQ21pVkR3M2lXQkNZZng1RWF5Z0tpcGR2NVFKRzFvd3JpTG5m?=
 =?utf-8?B?M3ZORzBJV1B5bDBGemU1Z0JaMEdILzd4MDJzUi8vTHFRMlNleWNFRXRFWEVq?=
 =?utf-8?B?d1hTT3RyQTJLN0xsMFNYUU5iVGdTd0xZNlJYdmJDN3NqZjQxa2pKU0ZLOGJN?=
 =?utf-8?B?cklydW1KRzhINnUxeXZlV01FOFJZUExyeGVYTVdyNjhySGRTM2EydU1QK0lp?=
 =?utf-8?B?VGE2emk0TXhGVVhuTVJ4clpiVHVmNmxDYm1ZODF3SlIwU05jTk9IKzdaTUx5?=
 =?utf-8?B?SXlzelBOM1RzTllyR0hJODJjWmNlVzltVkpDSmN1dUhZUEM4ZDdXL212dnc5?=
 =?utf-8?B?emYwY1JXSEJlM2dQbzEyRXBnWTV4dllNWjNjOE8zQkpUNW5pUDFVcHRSUnB0?=
 =?utf-8?B?bFA4Q0FwQnJxRmR0UllLZFNUVmVDK1RpeUExbysrZzN3c2NSRmtTbURSeVBS?=
 =?utf-8?B?RXNYS1pYUEpPaThDazJGQjZOMHpxSk0zdThqbHJNZ3Qvc0FKcGNWdjN6Q3RO?=
 =?utf-8?B?NjBBd1NDeExHVU5DMExRMFFjWnJyYnZuVDRYdWZhb3BHendHTWRQWmVwemRE?=
 =?utf-8?B?NWhPNEFHVUVsejRQS1pEL1RkZUY0L0JWWmVWcWRTUkx1UnRsZ1BQaDFkTklZ?=
 =?utf-8?B?c1NwMU5PSldzNTVpR0hVY3hDNDlZdmZaQ0t3RXJnYjNCY2hlUDlmZjhLYTR4?=
 =?utf-8?B?bzEzN1E3L0M4RFB4ZTQrVWUvOGdqTUpBQm8xU0pnQlBycFo2MmxmNWpVaGdW?=
 =?utf-8?B?dFlZRkxraEtLUHFTTEgza05OVlhGNzhTcFgrU1d3N0svVnRINHR1T1RVSjdz?=
 =?utf-8?B?ZjRjM201VGVUUjhWaXlOM3RLbFhoU014eFlwOXFMZlBxdWVseUUyRjI5Qi8w?=
 =?utf-8?B?Tlc1ZmVzSm4zU2Z2ZWNkYzhUQ3Iybi9JcmdPdHAzV3VLYTFyOGxBVkdlTm5x?=
 =?utf-8?B?a0pOTFo1R1MxWUNxenN2WUs0UUdUbXo4czhGSU1QelBWc1dYT0xKK1ducXkr?=
 =?utf-8?B?R3drRXF6eGtzWGkyZXN4blhaN1FRMC9sVEwxZnBwa1F4Ky90Q1A4UlRvUWdH?=
 =?utf-8?B?dVlwWE0xZE9iMTI4ZUYxMHlNbm01aHlpUEpaNUIxOURSdTAyQXIrQ3JtQkR3?=
 =?utf-8?B?eHBmSmVwck5seml3WlFUbmF0MFhRTVpsenZyNUpuYzZDNUdhRzZieEUzampM?=
 =?utf-8?B?Yk1oT0gwanlLdmhyeXBUSDd5RVRqUENkK0ZmWXQ5K28reVFFVkZ6NFNTZUpU?=
 =?utf-8?B?aEJTbTRkanZUYkZRMHpJaE8rdHY5UXlmQWl2RUJ1RGtXT09hVDhvUGlsZkly?=
 =?utf-8?B?NzgwOEtwK3FZWEJQSjdWZkxUZXVwZFp1RzZOaUVPcEdPbXVzZFF6WTdOdEo5?=
 =?utf-8?B?LzFuMy9KMUkyQzZNKzFVbEQ4ZG5jcEd4WGFQUnpyZjI5NXVnMkpBUTNPRTAw?=
 =?utf-8?B?OFJCZnhzNms5MEVEZTJPRWF1K3dxeWpETktzUXZsZUxSYU1IMm9IMERiczFE?=
 =?utf-8?B?cTZiV1hMQ3loWlNRQldWN0pscTZkQU5BYVNzZFdVUEUycmpkemRDazJQY1Nl?=
 =?utf-8?B?L1dTbDhLaVZEU2dXa2NVcnhrUWFJOVFJQzRFS28rSjE5dXZMaGYyb0Vrb1dE?=
 =?utf-8?B?Y0JnUkd2RGkvdnZyd0VKUTZKSkgrUnBuL0tHdkRuQmpSMGQ1MGxBYnlSV3Iv?=
 =?utf-8?B?UWx4cVBrSitnZDFpR2dFeksvZTRPczY0aDRydWwrd0Jwd3ZmMWNLdWVGWlkv?=
 =?utf-8?B?NWZVWGxXeXB1VElobURTNW42b2c1b2VaRmdDNmJWYktSd1YvZjh6UVNDVzg2?=
 =?utf-8?B?VXUwNUFwQjhGS0k4VzZWZGZBQ3AyU3lCRUtxaHc0R1dkRHhJejNZQ25sekxP?=
 =?utf-8?B?OE41T2NscloxNlJPVm44MmxXOHRxaWhPaGVFZEVPQmg0QXZZNGFVL2NuRVZJ?=
 =?utf-8?B?TmwrZFpFQVU2dnpVazBLaE9rYXk0OFg4aHMrUTFTamdMSWYwcWxKTTlBek1C?=
 =?utf-8?B?ekFMK1J2WjlmQ01EU09xekRSeCs1aHAzbzJMejJoSVVxaFhMNnNxcWRHNDRP?=
 =?utf-8?B?aWhPN21SeEpTRTNrZkxFMWlXZVZQNWRHYVk0dVpkRDYvRzZDU3NuU28wMEJ0?=
 =?utf-8?B?ZlFnZFdMbE5nK2xMQUk2UWdQT2VnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620d0fcb-2b5f-4d9c-3f73-08de25bf0baf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:52:39.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhXn4cMC6mdZ1kmyfh0+c3bpdd2yzUNNQzMfGiIJZvsLRUY7NKRkjzfvFm9Qt0HV42zZPDN5cm85JtGoLLs3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546



On 15/11/2025 04:26, Akhil R wrote:
> Update the timing parameters of Tegra256 so that the signals are complaint
> with the I2C specification for SCL low time.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c0382c9a0430..8a696c88882e 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1677,14 +1677,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>   	.setup_hold_time_hs_mode = 0x090909,
>   	.has_interface_timing_reg = true,
>   };
> -

Please don't remove this new line. Otherwise ...

>   static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.has_continue_xfer_support = true,
>   	.has_per_pkt_xfer_complete_irq = true,
>   	.clk_divisor_hs_mode = 7,
>   	.clk_divisor_std_mode = 0x7a,
>   	.clk_divisor_fast_mode = 0x40,
> -	.clk_divisor_fast_plus_mode = 0x19,
> +	.clk_divisor_fast_plus_mode = 0x14,
>   	.has_config_load_reg = true,
>   	.has_multi_master_mode = true,
>   	.has_slcg_override_reg = true,
> @@ -1695,14 +1694,13 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.has_apb_dma = false,
>   	.tlow_std_mode = 0x8,
>   	.thigh_std_mode = 0x7,
> -	.tlow_fast_mode = 0x3,
> -	.thigh_fast_mode = 0x3,
> -	.tlow_fastplus_mode = 0x3,
> -	.thigh_fastplus_mode = 0x3,
> +	.tlow_fast_mode = 0x4,
> +	.thigh_fast_mode = 0x2,
> +	.tlow_fastplus_mode = 0x4,
> +	.thigh_fastplus_mode = 0x4,
>   	.setup_hold_time_std_mode = 0x08080808,
> -	.setup_hold_time_fast_mode = 0x02020202,
> -	.setup_hold_time_fastplus_mode = 0x02020202,
> -	.setup_hold_time_hs_mode = 0x090909,
> +	.setup_hold_time_fast_mode = 0x04010101,
> +	.setup_hold_time_fastplus_mode = 0x04020202,
>   	.has_interface_timing_reg = true,
>   };
>   
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic


