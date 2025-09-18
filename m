Return-Path: <linux-i2c+bounces-13047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7BBB84B2E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 14:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E901C22851
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 12:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC25303A31;
	Thu, 18 Sep 2025 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FFr6sbFN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AE283FD0;
	Thu, 18 Sep 2025 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758200159; cv=fail; b=ZsUL/H/HgHsp10sPH0nWAjUbKIfvSRDxRelTmqiHl60dYr2wWGHLDDmsmlQn4r9X4ReD3LBA3GFuiZC8v8jbscgjt/c0RGeM69jFc2WQsZF6vHxhg8SKj/obGdYid9LjkZshITq+SgMLte9agYYxHGfNNykH3tOwSohXd0BLiyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758200159; c=relaxed/simple;
	bh=+5w3P1RTbFpBkwo5CUpOJIIDP6eK3J9smzfN81HrLkY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C4D2NuL6PGaou8fJnnvJ+bE7tmAVpfSmBdfXzzrZ9aCQ4RYh8+klySLCeBix4bC6lrhYWhiNZF8GbBT1oN19JFzf+CWQ7SD+uDCWb3OpzDxMGwv5dTdMGcfERGD3E4FdxNIkIzTr79zSYW/je3giLdhGPM4qXL1x0zGU4jPtuN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FFr6sbFN; arc=fail smtp.client-ip=52.101.48.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDklFZCeOdMMs5ZDnv0E7I+T3rWJFYG7HUS/wg6QKlQily5X0Ju2/OI8l0X0aApiiqqENiCLjnhtiHDdyNh0x019EhfJQ6TO8elEbkpLgRv0w5KrErixZlOff2g+qyCz+LV6/2gUWyNyQYdqMHjQMS8PWUTF6z6nZQcSDVNMzoBKGwuftQczj/bsc0Hh5BNhR5g3pKUPLPMaAONeTRgxkN88/+cOX+Q24DTAoGk+kwHDeWh8hL/rF6mrpex1Mbmge9L/6/1gZVKFMVax055EHc4j7zWMltF31V4+X+lkY2m/crdNwi9aGJ/jjq3lIj8uRqXz1HMejQj7nIbRXNCi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrK5MAHne1hpxaOpxqv8Y//YMwGGi4Xro5C/ysYdBy8=;
 b=Nwyrcx+qT6boJqitFtWOLJeuCC8sIwQpBTh0P3kW/wjFhy5VInSi6Ek44aV2l7MygrpXYKhJh5hXYF5MdGao58QbDZpFlSDsAez2l/ht39VcuTgfmiVhKQWCdVpsvnIAwzlknIZI4J/Wr5/ht8KnQNotRQGSG1GkuaYElwSVukJ79wsiPUy66NdqcFVERyxevqfIbJ6iLpEgdMxFr+tTj09y6CNMAA1uAhxSvjhhsJdE5eabaHvxoHqkVnvHCX8vC5qdn+eCATInBvrWFGsdqJyRZmCgyArOlDl+6LpouYvYQ8EUjbEq5BxnfvxbKDL0JY4KmGvG0CUZTGFOT6Vv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrK5MAHne1hpxaOpxqv8Y//YMwGGi4Xro5C/ysYdBy8=;
 b=FFr6sbFN77k8mVuezfXjPjKRjlCC2RyQWDjyDL/ulAFJymHaLmHRjKYAxwnxxwpiyfFq6LeefKwOiMRe9bkcsrWvLp+ox+85C/etO81MExeI/fkghQhv8Oz2bXefEYXG1m9FEgJMFx1GdVFzrk5I/s1dbpgLP+xIFjxaxVHZ1C4Q9RhdoT4Lon2RChCjM0V4ZZ1qIjuSi+NCVZ6PExluKzpbYK+9Vu2C8KXZscaLMJz5DK9BxNFHjmJ7DypgMO7bBzIANspBebBoRPsd7XcX2iVjn5Q1Ug4cjuj/997ifiFfBMTkwsKJ/RM910T7RB6DuXd4GBjwLGFp7udIw4GJmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 12:55:54 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 12:55:54 +0000
Message-ID: <e5c06b4e-3edc-4977-bbcc-2035cf11811e@nvidia.com>
Date: Thu, 18 Sep 2025 13:55:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] i2c: tegra: Add HS mode support
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, kkartik@nvidia.com, krzk+dt@kernel.org,
 ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, robh@kernel.org,
 thierry.reding@gmail.com, smangipudi@nvidia.com
References: <af2462af-5b6e-4eb1-b1a3-59ec5f96f1d6@nvidia.com>
 <20250918111600.25189-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250918111600.25189-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::36) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecc61ac-af8b-45ce-64c0-08ddf6b2b426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3BNTzA3TFQwWDlvdTF3Znc0RGl2NmVmN0VNRmljeVpCV0VjdWRvQ3N2Zkdj?=
 =?utf-8?B?ZW5ybGRkcXRwL0s1US9yczB5djBUWVE3TmpPelQvU1I3cnlneDVrVDhWZk5y?=
 =?utf-8?B?bTBaRHdQaTZyTjNxL1VPRGJmM1FXVTBvazVxaFNxUjVGVE5VaUNKQ1BPMk1w?=
 =?utf-8?B?VVRTR3NJZG9qOEJGK0M1QWd3UHEvTDNRMk4xZHFDZW1KY1E2dWJmVy9CZHor?=
 =?utf-8?B?d2xQL29RK1ZSWXAxN3NLNWVsMy8va3ZiRGlwMmExc3NDcGJjL1QvZUZwdlZo?=
 =?utf-8?B?L3Npc1h5ZE9FOHhTZkdqZE43cHZXbHAzUzFCb3E3UHQzRGFZUGtlanFocGJv?=
 =?utf-8?B?Smc2UjRnc3BBMXZwTENQOWtUUUVDZjhrNU5LYldMYTRjbkRuMWNlc0dyR21Y?=
 =?utf-8?B?WnVHaDcrajh5VU9EWkZ3VEIvTE1xUXduR200OThlUWdtZDdtVDhmNFI5V3RY?=
 =?utf-8?B?TlAzek42a0pPNExLOGI5MjNmZ3BtaHkrM1lZbUZZdG9FOXFEVjVhdTR2RHpM?=
 =?utf-8?B?WmhSa1JnejVZb0pZRU5kaS9wWkJXcXl2RFpSY04rb3FrQ0M5VDhBYWg4NGVS?=
 =?utf-8?B?T0lkY3FwR1dKc0tLMEUvYU55T3pTbHR1TytzTzRURWtkVDF5U0QrRVVKb3VB?=
 =?utf-8?B?TGVpSktFekVxU2lhZUZnNTk5WHZHUXRwZ2Z0US9nSUdOOVMwcjNnV3lraGIr?=
 =?utf-8?B?N3B1WjBRZ0hxaXo2QmpGNEN1ZktrNTFlQW5xMUJnUThpM3d6eXRqL0l5M3Nm?=
 =?utf-8?B?c0JoSDZESlBKOFVoOGM2cjZOLzJ0VWdlL0tXTkc3TElldlVvVGx5ZjNQTnFU?=
 =?utf-8?B?eHExclRoVnZpWXhnK2JRblpMWUR1NjV6T2pZUnpuekxKV3NiU0M2V2hEa21O?=
 =?utf-8?B?Y0JqelVMTE9VVFBaQUcvd0U2S2RTQkxZQlphSHMweUtpL245K0Yyd0tjbGFF?=
 =?utf-8?B?ODNEMHdoVzRQYXJ6Q1ROTlNPYUg4S2R2MDVDUDlXMzJhVTZ3cVRnZnlyb21q?=
 =?utf-8?B?NDZjRFExWGV5dVNPUUpLTWZWZnM0ZTB1bDB2YW52SWJQS1FXaGl5Q29nYi9w?=
 =?utf-8?B?TE1hOXpMSzc2RXlnNUF5RlV0S1Iycm0vcDkvRnZjcVBBa0VGajZTaUttWTRu?=
 =?utf-8?B?MHdtc1pRd213ZTlnRUlNMjY3eUFzMWcxcW1XRFlwZXFrZEVWdE5ycWtIbmFO?=
 =?utf-8?B?MVVsYmFtZHZJREJWdGdMTCtORGE0UUZTakF2NVpQWVg4aTZOeVNwd3pKZTBY?=
 =?utf-8?B?RjR1M1FJMmxINzBESGF6bnNBTWtGSmRJalFpaklEYXhXSEJwNDAvRnZXVzlU?=
 =?utf-8?B?ZG1XdlJoVHIwb0lRcTE4cXUrYW1zbjZzU1pSdlpTajhwMDd6RnhBL0RTbDJL?=
 =?utf-8?B?cFRYT3d5bDNTSEw3WWVMVmt2REpQOWhmWHBjSkVnOFZ1RXhPNE5rMEw0UTBD?=
 =?utf-8?B?cHdZZ1VmZWVHNnZDUjNjKzhRUzZNOGh0TW5uOWlwcEJWRk5CZit3VjNUMjl3?=
 =?utf-8?B?N2tXNGNsWituSnJWa2NZb1dWT2thdWg4cTJieHF6M1ZMOTdlRkY5RTVoVGJk?=
 =?utf-8?B?c1NscmZHdWo3aGJWclYzVFVBa3dBQTV6WXZ0OFllOFdqbDVydGI0SjRXRVRM?=
 =?utf-8?B?UGtheEZBcVhuZzk0WVA3MU5iQ1VPY1p0MlRYWEk0OVg1M0sxZzFNZGhYR1Vv?=
 =?utf-8?B?Q01zK3BheVpraFdPbXdzTFE4aCtib3JrNFRIL0NwMlo1cmxza3pBMjFTNTJJ?=
 =?utf-8?B?NkxkS3ZNMEVjd3llaVg5VFYrMTBURng1WEVxa0VxKzR3clJWVDZYNE9BK1lj?=
 =?utf-8?B?T0dIdHRTMnplSitrNVBteWlYZm0zMVJ2bWpmNjQyWEZ1YnQxZGhWMUZOS3pK?=
 =?utf-8?B?dEF0SjlIK25BOU5uN21Vb0g4TkkxbzZYQnlZTkpWZkhEbUpZZFF0anB6aXRB?=
 =?utf-8?Q?9z5mgvcn8VE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXNpMTh0bmNVSUVxRkVaK2J5RXFyV0lDWTZ1dXNZUzNwRHBaVm80ODR4bFRT?=
 =?utf-8?B?dmxMWENxMkdrYlFtVTJFN0M2RG5YWFVsaUlNM3I0MjM3a0NLdTBsOGJYc0NB?=
 =?utf-8?B?WTh2RjBEK0tLaUdiVW1aaUNiRTc0WUxPU1VFbjBwc3hjalRJQmJDL2dGRVRV?=
 =?utf-8?B?SzVOVURTT1pMclB4bXRSczA5ZVh5akxBb3RaMzdNZXdjWmNMQWxjWXBVQkFv?=
 =?utf-8?B?azhIUGFkODJIOGZkYTBEZ096NndzWXJwbkJKZXh0cXNLOWI1M1VPemlRSUta?=
 =?utf-8?B?aXphSC83SjAvWC9WS05HazFtTHNObFlPMkxTV0puaTdrNURKa2Rmb0FsN1pK?=
 =?utf-8?B?WW5UdnBqOHAyT3RrQ1NLb1c5OFRLZ1ZBM0RoUE1saU1PTmMvdURNd0pKaFNO?=
 =?utf-8?B?eGpBSFdBeDVoTTMvNFpxZkZubDkzSTNuOGNUN1E3Wm5Ybk1HTFRFZGdkZWVU?=
 =?utf-8?B?MitGbHJPK3FOTVk4WDJPK1lsSXdFdWZOc04zYkZtM3BzSlh0bWxTSFUxNFZj?=
 =?utf-8?B?ZGUxN2pFdHhaanI3MVhwak9rSlRFY1YxNmJvSmNZZXp6SEd2eU56YmxLYlU2?=
 =?utf-8?B?QS80T3JQbHBXajVjdVIxL3RGRThlRGNzSXVRWnlvcUVuRW5GMHRBakthTGtM?=
 =?utf-8?B?NjBGL1BVNWJOazVnWGQ0L2hSK09zYVltVmNaZmlXeUpNL1RQV01jeXpnYUVp?=
 =?utf-8?B?a0I2eFNSdlpyWVVvNDFUcnNQY0dlcEJhMk5oVXRBb1BnaklqSFBXZnpMZTBC?=
 =?utf-8?B?Q1dyM1BRd1dwTXp4NzdNbmVMbysvRmYxUDZZdlRuKzZwMHg5aU5iV0JIeHZu?=
 =?utf-8?B?Q1JROU1DWHJkUVR2WjZiZXNyKzg4RUROTUt5SjhoYkg0QlN0RUFZTExyb05P?=
 =?utf-8?B?dHlvT1FTaFdDNFV1K3VjSEFra0N0bFBja2lIUXlxcjlCNFNtSTk0VGZ3am1I?=
 =?utf-8?B?ZzRCTXF0RklCWVhkZVNuMktRRGRuYzhEd2IwSlJSc3g5dXd6eCtTMTBPanJZ?=
 =?utf-8?B?Y25zRU1YVXRaWkhyaWM1TWliUkJ0VzRzbVpxS000a3VnZzJkelpXUVVFd0J1?=
 =?utf-8?B?TjVnUExuMkdUQzVOTGprbTlXT0dMQ3J2UGJnY2N6Y28vTG9OY1lLdkJjdzJx?=
 =?utf-8?B?QmRscGIvSTNIU2VxT29CUlB0WThGVmNTK1ViMmpnUitSRTBiZEo5L0Nxbll0?=
 =?utf-8?B?RDA4dlZCU2hObXRjcXBEdUFCbnk2SGRIakZlemR5WEF4THRvOTEwcjk0aWg1?=
 =?utf-8?B?a1lDa2tyYm9EMWNBQU5XZ25DdWtJb1l6amg2VXV2VS9MYzJRQUJENG5FSUdD?=
 =?utf-8?B?YVMrV09rdFBLdnFrNHJEV0dnaFVlWWttQnRWcmZxMG5VTXYzV25meTg3RCtH?=
 =?utf-8?B?UC85bkpwdGZqNGJZQ3NiRlc3TDJ6R0R3QWVSWVdtNmN1c2FPaHN1dzFJZTVu?=
 =?utf-8?B?QUZJQVZhQjRjTjhSaG1DZGNVT2FHOW1jQUZKUHByaHpERnlqY3BRek5nWWdE?=
 =?utf-8?B?dWlWRGd4NGE5aDI5MEd4MzMwTCtHcTR1N3cyQjdkOEZXbXpzbTIzdHpBVHNE?=
 =?utf-8?B?cWNnN2hoN3RVaEJFWGxFWFhESTUzK2o3QWE5dkZGUjM0azB2SU94Y1JkbXhP?=
 =?utf-8?B?Mnk4cDJxTnliZks4dEJvbFJsOGdBYXRkUkFZZGtvRkJHaSs4TjJId1RDYk82?=
 =?utf-8?B?b251SlExa25DR2JZVFNkSm1iM1VCa0lmbkVRTlVHT0ZQb09tWmJnRS9Demtu?=
 =?utf-8?B?ZytJVkRoYkVEelFRc1hxbGxYR0doWDlyOWM1TFIybDBZUUpwbVdTYkRXQlAv?=
 =?utf-8?B?clJZZ0xrU21Oc1R3MnZGZUhHeHdodVdRYlAzMlo0dVFWYWdsenM2V1MyeHJz?=
 =?utf-8?B?YkwrVHNjVTRnSXMvbG5GQjVHdzA1QkR1RzgxdUg5c1o5TURmOTFGVjA5RTZY?=
 =?utf-8?B?YVhLS3VKU2FnQnpZR1gra2s0YlRQRFFEbW9pRUZ4ZGZyYnpXSE54cGRKcytD?=
 =?utf-8?B?MC9kVDJydStNWm9idUJOZFBMMjhTaTdPM2lZUjJ3K0dDaThlTkx3NUMvR3Rn?=
 =?utf-8?B?V3hsNEpBNmxJR0ROenQ2dDQwdFFlbjF0b2xmaEtlOFJhNy9BNkNnQTlmRU1l?=
 =?utf-8?B?em9JSUZiMkl2WWsrMmIveTNXUUF4TXAraGk1UzNIaFFaNUluTWlJMmZreGEz?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecc61ac-af8b-45ce-64c0-08ddf6b2b426
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:55:54.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtp/Vk3SoIGa9xBSb967wu1jMm3y7T1cg14YjPIq8CAWJoLUKomGhi9F3ZnPb9UOqSjc6RHrblxHs5W6KSFVmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647



On 18/09/2025 12:16, Akhil R wrote:
> On Thu, 18 Sep 2025 11:21:14 +0100, Jon Hunter wrote:
>> On 18/09/2025 11:04, Akhil R wrote:
>>> On Wed, 17 Sep 2025 14:59:54 +0100, Jon Hunter wrote:
>>>> On 17/09/2025 09:56, Kartik Rajput wrote:
> ...
> ...
> 
>>>> No mention in the changelog about this part. Looks like this is a fallback.
>>>>
>>>> Should all of this be handled in the case statement for t->bus_freq_hz?
>>>>
>>>
>>> HS mode timing parameters are programmed in registers different from the other
>>> speed modes. These registers does not affect the timing in other speed modes.
>>> HS mode registers being used or not is determined by the packet header.
>>>
>>> We may also want to program the regular timing registers, because it will be
>>> used for the master code byte to transition to HS mode.
>>>
>>> So, I guess, even if we move this to the switch statement, we might end up
>>> doing something similar outside it.
>>
>>
>> The 'tlow', 'thigh' and 'tsu_thd' are configured under the case
>> statement and so seems logical to also configure these for HS mode under
>> this too. I see that there are different timing registers for HS mode,
> 
> We are just reusing the variables since the fields are similar. If required,
> we can define separate variables with _hs suffix. Do you suggest it that way?
> 
>> but right now looks like we are programming both the normal ones and HS
>> ones. Do both need to be programmed for HS mode?
> 
> Yes. As mentioned in my previous comment, the normal timing registers will
> be used for the 'master code' byte sent to transition to HS mode. We need
> to program both for HS mode.

OK, I see now. So we need to program the normal timings first and then 
we are re-using the variables to then program the HS timings. And 
because of that we cannot setup the HS timing values in the existing 
case statement?

> So, I am not sure if moving this section to the switch block will add
> any benefit. We might end up making it more complicated that it is now.

Yes that's true. It was really this else part that caught my eye ...

  } else if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
   	t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
  }

It feels like at least this part should be handled as part of the case 
statement.

Jon

-- 
nvpublic


