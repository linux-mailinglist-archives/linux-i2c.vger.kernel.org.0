Return-Path: <linux-i2c+bounces-13044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D4B840D8
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 12:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B562543C91
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 10:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653FC2FF67F;
	Thu, 18 Sep 2025 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XIHIFPA5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA152FF666;
	Thu, 18 Sep 2025 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758190885; cv=fail; b=GX5vjKKYGPGks/5w3bO8FNNU/sUM2xn90hCiyrr0FnDLhL0rRMEtY+h8WmoZ0KI8EStEeFcBsbT0lPJ7u2tqQmRsJEDhHu8X1yry9DW5Uf89J6YWFQiSsnjtQJU3m3oKTu6n4Y1QPENd3nl+r5Kkd5FeU/7OLMrW5iAiha7xWUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758190885; c=relaxed/simple;
	bh=Tn7ENYjzHz1+RoURlwk+2sVYTDsnXtInWR5nFwkCrD0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KQ2ya7sOOB35ebu7Zv/jPwUFIXKBX8FeRiGHJD39ttUzWw0aheg0nKP9ZN0PQeExRcnSTbLvOdfkLCyDDUad7xc9oz8CkpX2f/oUmvankDRexc6b2LSDdGy+Bp0vk7+vKywZZgcT/5gCnVqmonS8lMlyxt+Lf+rOKixKeIMF82I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XIHIFPA5; arc=fail smtp.client-ip=52.101.48.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srJEBvaP/oKe8tefIgLYO5AhzKhAYC25UtWnbQihnpfSjs9hmqXe7e0LyYybPzd+fZzSeuS485EcobJWRglmgz9tnzMVbnLuHwdcBqbByxhHrmtvV5hC4WydEDclTDamSn5IxFOIuWOfsGOcz8L1hrMQhhU7bdR9LbnB+1IaMxkhNAy9c2RifxyK+YE0Bun+N+rE4DLN9XN95dhsaI9JrAnwNK++axmN7nu7zR6c89MVcylOpWk2VhMgvhnOud9Vjdg+lAN0kLqDyl1O24VfYR1G6++ABwrEhfJMuXH2wvCdqbXJjvHZAgW/JPMEYZ7WGOUNnFH/X1Pt6ENvpTTYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7N0RSCwy2Qm96ceYg4g+DEpfHVAT/3JDNoGnmJeaDY=;
 b=ejLL15HJh5JRKVLepaNCgDl/L18Q4TLbXUC/TnR0HgEFz8XpSOmCqqnjx2dbTaISMRHS7XdPJuxQNrKpg7H2zrbvJo+jrC10vTdh8p3aztPW85TLWlaR2u9919L1o0JfyynElYYBifd7LJt0c0QxmJ6vIPk+XNnhBCz3GFwduXDLcgHf3DueC3OWiwY/QX3M45bFLI370Bzol17oA+jUfjbB4gSv5N1tO9H+w6tInfDM3nPey5gInVI+S5ZZS+uaGIjdy9waNhnGnA/KY23m5qNRIZvhwvlQNMaWWRHiJq/8TZVBNgc1NzIqCsTU4FwWgQXx/kB+AB19Euwqoseo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7N0RSCwy2Qm96ceYg4g+DEpfHVAT/3JDNoGnmJeaDY=;
 b=XIHIFPA5XU2ry1jfrvzhdwszXdThSZugwM60WbrL66JnPIdjueESyGyT4E46s+qassDvFhlTXYY7v8NajStX3TjyAs9IjI4qs27I+P0WAW/UsQglYBe6nsQ+kNXD3uu8TK2QnR/+2ApEfdVPfWg3Xuziqt8ON1/Rq9w26NhP//EESTbV3wbCmJJiYDxKE9+D0koF6CdK199bNKiaRGX6dnbFHuZhETOomkK7OGYz408RSj7TyIAAp6094O4PPO7E8mmnN/vwgLxvtjHUhgttUzNZ/VCz9dMeMlwGC6YcBWFCDyfoP0XqNa8xhMSFwU1oTdLry4PT1o/D3WlNFVVVWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 10:21:20 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 10:21:20 +0000
Message-ID: <af2462af-5b6e-4eb1-b1a3-59ec5f96f1d6@nvidia.com>
Date: Thu, 18 Sep 2025 11:21:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] i2c: tegra: Add HS mode support
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, kkartik@nvidia.com, krzk+dt@kernel.org,
 ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, robh@kernel.org,
 thierry.reding@gmail.com
References: <bceeb247-a8db-4ee7-9c7c-ea2f521ef376@nvidia.com>
 <20250918100452.9478-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250918100452.9478-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0463.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea592b6-fd21-4f44-aa63-08ddf69d1c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1k0TTAwMExVMTJPSnFQWFdOV2V5UitWOHZiaEVsU2treFJOWGJhZjlWdDdY?=
 =?utf-8?B?SHZHekVEc2I0Z2dXZndFL2hyT0tmbmVGTVk0NXFyM0x6ZmIvM29TR0o3K0hx?=
 =?utf-8?B?L2dpeGVKWTd3S2ExS3VtbkpwMUVBZmVsK21NNEVURElCQlFvOWx5MHB2MFl0?=
 =?utf-8?B?TXFPaC9QdU9iNjliREQvZjZmd2VNaGtPRzhybUV3WGV0cWszZkFGTWJjbGkv?=
 =?utf-8?B?UnRxUU1RcXZsemJtckd6aTdIZnZxTjB2QjdwWHVoWm1vcUtQc1F2Q1Y3R1lL?=
 =?utf-8?B?NEZmNXVrZjVwdXRvd3dUQmdwaXFvVEhDak92b2N2Q3gxZzI5d2x0L1NpMXJX?=
 =?utf-8?B?bnVUMk4xYlZsSE5iRGJFVit5NG9UcVRWRnljU1F6UmhTK3pMaXlqUHhXM09S?=
 =?utf-8?B?TndoYXFFcTJMY2VBS3ArWGd5ZHVHZDB0Sm9PRmdSOXdZMmtsc2owdmlNclR0?=
 =?utf-8?B?QjJQQjlhR0NsZFFUL3FHakIzTWVvRW0yandRWGt1Q1paM3FkalhFZ2Y1NGFO?=
 =?utf-8?B?YTVtU3FkellvZEdoQnVlWmNPNGlqWFIrYXhDbmtPZk95bGorTHo3RUxtSGZz?=
 =?utf-8?B?c1NEOXRadStkZVR5enN2ZUFSb0cxOXI3ZWJOVEg0eW1RZjNrTHQyYXNkYW9u?=
 =?utf-8?B?d0thZDlrUmd0RTlsSnlXUGtaMUtYMTNrWUtuOFdkVjNPSWlLVCtyOEg4NGFZ?=
 =?utf-8?B?U3ZFUXA2LzlpUE45czljSG1naytaZlR5SWg0bWx3cGlFWFp6OGZXc2FpWEJH?=
 =?utf-8?B?SnlVaVlzT3Z2SzJ5UlpxQnJnSitJMFRaRllVKzFHaHlvc2s2WGt3d3gya0tE?=
 =?utf-8?B?cGtLOTREWGxSRjJwL1ZSN3dwdFFYK1d5TkUxcHFnekVJVk5QWVVTNGlnaUdU?=
 =?utf-8?B?K2RiYzc0akZ5UjA1ZU85R0NLVU4rYURwME9pTFNkQVM4ckUwSVhtajROYnI3?=
 =?utf-8?B?TDhTMGdnZzl6KzhyMTZRRlUzRXY2WWhtbXVOZHFTVmVzVFNiNjg4aFlHcTNK?=
 =?utf-8?B?MU13TllTbDFha0hWR0djUkNVaGo4WGpUOWZWbmN2OVZXdWNjYWRpOTJ6RDVY?=
 =?utf-8?B?d1BMZ0dlUTE0aG1qOUUvazRlRWNHT0VOYXROUEZ3QjYvUGRCYlh2WVhGSCtx?=
 =?utf-8?B?T2srL2U1V2ZJdmd6ekg3dmhLaS8zdHdCbVFjdS8wQVR4bFZyWm9yM1BXMzE4?=
 =?utf-8?B?aTMwTWtsR1RLNThZUnl6Sk1RcU42K0pBanBmVVo5QWNBYTRVVjZPZ2JpMW5t?=
 =?utf-8?B?ODIvRFpLWlBaWEZXWk9FVHcrRWpJQ1YzZDdqcG9QSjRZYmtFTCtnN21DaG1z?=
 =?utf-8?B?SlA0U1hyU3NROUxlc1VPVlVuYkJHbCtnMGNZM0FIdC8rSUh0ZS95TFZzd0dO?=
 =?utf-8?B?YjZJQ1haUTgxb2l5LzltT0NHR25EaC9zK0thSVc2OWRLMWtMSUtYU3psZ2d1?=
 =?utf-8?B?bTRyNGVCQjNqVU9MTVJ4ajZkb3k2eVZvcXVMUnU4QWxWYlFXOFdQZ0E2U2tl?=
 =?utf-8?B?YUQ1dzRkc25uc2xLa1hnTG9YMVlUZnpseHJLWjMvTFJGeno0L2tUOWRPTFpB?=
 =?utf-8?B?dHNiNXUyVXBzdmdhR25mbEFLbEFxck5pVndJT3BVdXJjTjdheHhKWUwzaFhl?=
 =?utf-8?B?Wi8vZ2pOekhYcGpubkJpTk13bzBoN1dDOXcrdE5DWHZWM2tDZy91dWFQekI1?=
 =?utf-8?B?SHMvcDVmeHlzclNBZmdDNHAwZ0RyNkpDOEtrUGJrUlpuaVFGTTliYkFuTVVi?=
 =?utf-8?B?ckhlTE1kYWV5V3JkYVlXK0tFSldoNER3RUxjRVFvQVo5am04L2VmbFNqdHh6?=
 =?utf-8?B?SDljTWxsNHZmT0tyZ0czRnlHZ29ZeFlSR3pHZTJjbmZOcWQzSXRRdjBjWnBW?=
 =?utf-8?B?bnR2eDlSU3ViYWw4Y005V09ycHVqYjY0Z1dWTEErTk5Ec0MwLzhLNEU2YkNW?=
 =?utf-8?Q?WiNMCHiMGP4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnZtYlpYVFEyQXRFQ0s3dXU0L1BHYndsZW5ZSWNhLy9idjcyeVlUd2g5QWN1?=
 =?utf-8?B?YWl1RXZFRm9jdDkwU0tOWktaOGFveHk5Ym5Oa3poZWdkemZFSnY0UmFhT1lF?=
 =?utf-8?B?cHdOM2lYRSt5Z2lzdnlBek14VTVXbnUzUjZBRDJ2ZDNNNStGeXMrU2w4ZXVS?=
 =?utf-8?B?YVZQWGcyak5sU2RNOUZ5L01FU3dhcEd4WVJGc2Frc1loMm5BVEhmb3J3Yzha?=
 =?utf-8?B?STdjQUNmd3owL3hPVG1yeFFRMmVWT3VsOHNmRm9UM3FXTDYxdEYrWVpjMEJi?=
 =?utf-8?B?blJIMXY0Q3BScWs1dnFxckFZWThVTEszcWI5bjBRZkpJa3QvbVFtWmRSWXZv?=
 =?utf-8?B?YkJid2NSNGlDNzEwV3hRejc1RlJscDlqSVJWaWFHaldVZmM4eWl4N0QrSHBs?=
 =?utf-8?B?RFBXYmRVME54MmhUMSsrNTY3cDh0MlQ3M2JjRVFTOHhTZTQ1N2xCMUZnWDhV?=
 =?utf-8?B?cFNNWlRmaUNRTkpuck80Q2YxejVRK2NKaXcxRzRObFlFMXYyeUVyT0UybmxP?=
 =?utf-8?B?S1h2TnhZc2dQbERnQ0dRL1VuQi90SDJRSEVtSlJsVnU1SU96MVhjbTVDajFq?=
 =?utf-8?B?djBPaEdaZG9IajhGc0wzVVRKN0FpU3M5dmM5bWJML2tPVFZoYXZRbWViWmt3?=
 =?utf-8?B?R014Wkw5K1B0RlFFNzFqNGcvNkhsUEQza3pxcWlTTzZud2VxWW9zbE9NbzNV?=
 =?utf-8?B?eG9iYWt0eU9rKzF5dGZYNnBPZUllTlRQQWNqa2dPMnF2U01OM1c0OVQ4VkZJ?=
 =?utf-8?B?ZG04TUVreTZUSm9oV0FEVVE4aVAvdzlSeTlrVWFLVlNoU2Q5NU5EVVFJb3hy?=
 =?utf-8?B?MTlSb1d6TWpSTkV4Qk5hbFB2RmtFaXR3UlBjS3NLbUJhdTVmeER0U0tJaktH?=
 =?utf-8?B?QTd5UUlBa2x0VDZndTFucVZFZGVjVHI0S2JpRXdOeTRuNTFwRWlhOHVWNlJC?=
 =?utf-8?B?OHpaTTJTMm14eGc1QXlhaldubzlPaVc0OG1rN0RHUlBZd2g1YnBLQUhlQnVx?=
 =?utf-8?B?bXBwMUlyRm92M0Z5TG05cVc5TDlNN2MrSklrOUJ1M0o5cjZXczNRYzYydDFM?=
 =?utf-8?B?MENsbUY1VjNDMmpnKyszWDBzWlVhOG1Zc29vMWY1UHZsdjUwNm0ycnhLcTMz?=
 =?utf-8?B?bkFqTnFXMkVkSlo3K1hVSVh5TU00YWNpNUc2bFdTWGEwdDAzMVNsMzNKcmJB?=
 =?utf-8?B?ekpwV096dG45cnpWTTAzVHJjc2hWbnpkL3oyTkdDcWF5U1M5VkxsdDRib3ZJ?=
 =?utf-8?B?YVZUeTQ0c2dXZWU3SC8wQkwvS25XS2hQRlBnWFh1bnJwb2MxV01yNFcxK2R0?=
 =?utf-8?B?dWN6VTE4a2QvK01OVG5KNXdFZmtwTkdlOWd5VndOaFRkQzVjMGoxSkxqdGVD?=
 =?utf-8?B?aFIyZGl0L0dHdVo0YUVoM3p3d2MxVXIxdUpUM3RLN092VWlLL3NIajlrMzlP?=
 =?utf-8?B?UUQwaUszL1UxWHZlNXJhYVVjTHhnbHlnU2Rxd0pLaktmUHcyUXBxa1FPbkEr?=
 =?utf-8?B?cGRVei9sWkNrdWZvV0cyWGZjNWx2QnZUMllFeWV2N3I2ZWtFSGFuallGWUsw?=
 =?utf-8?B?R2U0STY4NHEzY2xuOXpjVFJadjB0NVNPM3ovMHRuOEM5NExBTzJ6OHQ1L3pv?=
 =?utf-8?B?bkhPMXRicUVDNnJZMmZiOFdQOExPMlVValh2Rlc2a1Y1QTRMNnJZS1Y4ajIv?=
 =?utf-8?B?cGw0b3lDcmtTV2hjRTlBdWRzbm13M3BIbEFoV0FGdmljVkhKdXdMMDU5d0Uw?=
 =?utf-8?B?eW1jU012RHlWdkxjVURuQjJUTGV5UzlIUkFJRWFOajFYMlk3ZkxiQ1JKalVv?=
 =?utf-8?B?M2o1OVlLZEtEdUgyLzNicnM5eWJGYzIzNDRocFA5c1VrZVJnZ2RUV3lmdVYv?=
 =?utf-8?B?UlhidUJ1WDNmUkU2Sy9zVUpHcDFwdHAzeDN4ZXIxQ1ZpT0E2NWwwc2xGbzZN?=
 =?utf-8?B?Z2s5TEZPWFlub2g4QUdQRmtqRDgvbHpMcGdwNnFRV2tRUGgvTVlhak9hWXhK?=
 =?utf-8?B?M3pmeFh2bnFVYjJyS0ZNNER0bWJLNENuRzlPOGxpUWs5QU9CR1pRbkNKYmtw?=
 =?utf-8?B?b3p6MFg0WnovaHNpUlhEM0FOU3ZCdlNya1NweC9sb1l5VGNKL1pzNFRzZTQz?=
 =?utf-8?B?SkpyK2ZYM3VqZzFHYnVxR1d2UHZYanhwN1A0UEpkTFhFNlZQT2RpVTRxbWNS?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea592b6-fd21-4f44-aa63-08ddf69d1c8b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:21:20.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOhChoIuPkazvW0lbFPqlMd0g/PxKpklz0f/+r9d0he07s2EEOsYROgV3YB9F2g0KOIzJ4pYP9uUaUb0v6bl0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012


On 18/09/2025 11:04, Akhil R wrote:
> 
> On Wed, 17 Sep 2025 14:59:54 +0100, Jon Hunter wrote:
>> On 17/09/2025 09:56, Kartik Rajput wrote:
>>> From: Akhil R <akhilrajeev@nvidia.com>
>>>
>>> Add support for HS (High Speed) mode transfers, which is supported by
>>> Tegra194 onwards.
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>>> ---
>>> v3 -> v5:
>>> 	* Set has_hs_mode_support to false for unsupported SoCs.
>>> v2 -> v3:
>>> 	* Document tlow_hs_mode and thigh_hs_mode.
>>> v1 -> v2:
>>> 	* Document has_hs_mode_support.
>>> 	* Add a check to set the frequency to fastmode+ if the device
>>> 	  does not support HS mode but the requested frequency is more
>>> 	  than fastmode+.
>>> ---
>>>    drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
>>>    1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index d908e5e3f0af..6f816de8b3af 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -91,6 +91,7 @@
>>>    #define I2C_HEADER_IE_ENABLE			BIT(17)
>>>    #define I2C_HEADER_REPEAT_START			BIT(16)
>>>    #define I2C_HEADER_CONTINUE_XFER		BIT(15)
>>> +#define I2C_HEADER_HS_MODE			BIT(22)
>>>    #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>>>    
>>>    #define I2C_BUS_CLEAR_CNFG			0x084
>>> @@ -198,6 +199,8 @@ enum msg_end_type {
>>>     * @thigh_std_mode: High period of the clock in standard mode.
>>>     * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
>>>     * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
>>> + * @tlow_hs_mode: Low period of the clock in HS mode.
>>> + * @thigh_hs_mode: High period of the clock in HS mode.
>>>     * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>>>     *		in standard mode.
>>>     * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
>>> @@ -206,6 +209,7 @@ enum msg_end_type {
>>>     *		in HS mode.
>>>     * @has_interface_timing_reg: Has interface timing register to program the tuned
>>>     *		timing settings.
>>> + * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>>>     */
>>>    struct tegra_i2c_hw_feature {
>>>    	bool has_continue_xfer_support;
>>> @@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
>>>    	u32 thigh_std_mode;
>>>    	u32 tlow_fast_fastplus_mode;
>>>    	u32 thigh_fast_fastplus_mode;
>>> +	u32 tlow_hs_mode;
>>> +	u32 thigh_hs_mode;
>>>    	u32 setup_hold_time_std_mode;
>>>    	u32 setup_hold_time_fast_fast_plus_mode;
>>>    	u32 setup_hold_time_hs_mode;
>>>    	bool has_interface_timing_reg;
>>> +	bool has_hs_mode_support;
>>>    };
>>>    
>>>    /**
>>> @@ -717,6 +724,20 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>>    	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>>>    		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
>>>    
>>> +	/* Write HS mode registers. These will get used only for HS mode*/
>>> +	if (i2c_dev->hw->has_hs_mode_support) {
>>> +		tlow = i2c_dev->hw->tlow_hs_mode;
>>> +		thigh = i2c_dev->hw->thigh_hs_mode;
>>> +		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
>>> +
>>> +		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
>>> +			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
>>> +		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
>>> +		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
>>> +	} else if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
>>> +		t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
>>
>> No mention in the changelog about this part. Looks like this is a fallback.
>>
>> Should all of this be handled in the case statement for t->bus_freq_hz?
>>
> 
> HS mode timing parameters are programmed in registers different from the other
> speed modes. These registers does not affect the timing in other speed modes.
> HS mode registers being used or not is determined by the packet header.
> 
> We may also want to program the regular timing registers, because it will be
> used for the master code byte to transition to HS mode.
> 
> So, I guess, even if we move this to the switch statement, we might end up
> doing something similar outside it.


The 'tlow', 'thigh' and 'tsu_thd' are configured under the case 
statement and so seems logical to also configure these for HS mode under 
this too. I see that there are different timing registers for HS mode, 
but right now looks like we are programming both the normal ones and HS 
ones. Do both need to be programmed for HS mode?

Jon

-- 
nvpublic


