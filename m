Return-Path: <linux-i2c+bounces-14119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AADBC63BF0
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 12:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0BB63AE667
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F64032E699;
	Mon, 17 Nov 2025 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VLHggnVt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E732AAC0;
	Mon, 17 Nov 2025 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763377640; cv=fail; b=Ez9YNfEY+eoUhSj472MLzU3aNBXYHke+n9SVJVW7WObX/0Q/bdIjxerBAvXBTxMCaA2wTFhzlz9vKLLZ+HrAfyY2D9ShkxrdjZNG4sJMvAObF0W5GOOSGTo0R/cRdI8/ycBKeTxQgiUW5WdQZ/Tcyt1XorL6p6PUFQNhYr0JbEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763377640; c=relaxed/simple;
	bh=g2bkupYMxpA2ElKZ4/1cVB0qMLeiSU3JWc2J8VEbmUA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BOtFJaQJ0N/anJBvJmXp4qOFxy+dwzCO+AwcdwXBofhsgG+ecPo+xfl+bAUZX7ea6Zrx1LRlVb2kZFX1ThnL2VYree5dBc75o/BvxrCuP69YgPstXZAkm81M428v2vqxa6sqekcRyy4zewoxAqVqOGFKnxRpVgVJdJLNPg74dH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VLHggnVt; arc=fail smtp.client-ip=52.101.193.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ie5B7+wwUPt3Cbnj/EhGP3VNDMgpK085dDzjmp2fqICUq4bAlCJisBcBYufFUkyK2eNdzuoGVFFkDIYpCJHG5phzkYaxCxpBe5uz+cfXPxzjx6u0dm1TK46VJaW8K8AZABRjQdCbMBXXRDzZ7yc5PgJRz++zpXE+1z3XfzqNHaqleOzOU1+U4TwtkhtdMYmB3kNzvQxfJM/VwU/phmMxI1kYmbx9iTUnb/J8j/9oqv7skK85xIUO7kjwZ3U0kzDzQTXgtq8nsFU+VgItRU9E1fF0RsFkrCmtF75IBGpNyYDbL6x8VVtve0idJPGgL2AadGmLdQd9Nspat7aKIkfzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opY+Es2FWxBaQxpUhGE0EEYsYuRPO16APcfVsZ4NPSY=;
 b=gfk1M6+BBN6PuLAdX/Fd3XZXf8NOVLmeJ3Cjym7/pf2iCb8gGqtDnSicwukoA3+8DvvdycpKeLNd9x88xgOMFx46lr50GqgkW4ccmRg4wKiTDUhdWB9PWVyAz6y0Axrci24FRKGFd0uiNOq4wLLp94Z93nhwSuEokDlglZMKeokaZPJElF2DDWz+nGX607V1adC4tmlh5FfBDkBJ3gCpwTzjR6ZuTbZRDib0zbgJkAfPOnS/yvUNb++J2Yn79hK1o748MEj/YvJzCEg2j14b6ubCEpr1BG9eYLGy8rTlz9Ycm2EGaqKngjf4sz4IPAJgJRJzq++7NncTSCwdGXxj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opY+Es2FWxBaQxpUhGE0EEYsYuRPO16APcfVsZ4NPSY=;
 b=VLHggnVt0PES930S/GAc8DAjcsg6xfBpPpU+8VDefl/3rxpccyM8Tx0YmhyURlNhzMJxR/dYyj0xxY2yArMGHSeLw9575Ko0CbSr2XJIe3D2fyNwiPXuwdlpxopkNyaP3kSDDJDwU5fKoE87ivYZVhrufp9yTaRssNpNGAaj3UjW24ALPoOlWgJEFI8nmfIdhanYoxzrnctkxCBZ7PjbyGeHprIAS8hrX5XI4epYnkwptBUdfV8U3gkJCatpTECCA+JyhE6dVHXFTKUuAu1Sk0f8rDjDlYG6+pfuWeC0qrHyhQkSNCfX716GWaMM10fOhW9PnSLXC/a/0pyWHzk86A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 11:07:13 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 11:07:13 +0000
Message-ID: <828b6131-24bf-4a92-9c86-4c9f0461e6d0@nvidia.com>
Date: Mon, 17 Nov 2025 11:07:07 +0000
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
X-ClientProxiedBy: LO4P123CA0208.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: c6154995-11e7-4887-a845-08de25c975c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHUzSEpTVkJ6dFJOK2hPL2JyWEU0RVVKNlNiM3NyNmRsbjRteUI0RFNqQmoy?=
 =?utf-8?B?MUR2VXJXcGpwRGF1VmJ1VmErVHdON2lGZU56cmFtYld4T2E5YmNnYjhuQW90?=
 =?utf-8?B?TGRyMzVYclJTS0ZTWDZ2a2Y2bGdobEltK1BBRVQxT3R5UHhQV3FySzk1UmN5?=
 =?utf-8?B?enY2YkhJS01neTFLTTNWTHdoaWpGc1orYWhRQ3NNWnRQQWkrYVZ1N2hQUU1i?=
 =?utf-8?B?RTZzMUcvUTdQTWw0M3haRmpFNHpVeld6M0wrWk9qM2pWTy9lYy8zTmlvS1N5?=
 =?utf-8?B?UDR3T05HaXN6ZGFuT3pxYVg1R2VvdzJiakVyWEtvdGZGMlNyL3dnVlJTbUFo?=
 =?utf-8?B?ek1DQmhGWnlCSW1HcVZxenBsdEg1QVlwWlFDcW9zb3R4VGxwUDhJYjluTFZW?=
 =?utf-8?B?YkhyTGkvN2hKeFdkamNaOEpjWjFxWFBaRXkrbnRtR1Z2L1Z2MG5ZVXl4dnhy?=
 =?utf-8?B?eWZ1SGNlZzUxcEZvaFBMVlNjL0RKeHJJb1psY1MvMVl6dmdROU5EalhaMStY?=
 =?utf-8?B?Sm5rd3pPWnhUOW1FZFFNVVM3UWsvZjdMNTk3Ky9XaWxwNG5oR2lEVVBQRkJx?=
 =?utf-8?B?ZFVRRWh1LzJpYmwwNk9RWmxpRURGc0tINkJyYnI5NGVYdGN5RGhEemVmWXVl?=
 =?utf-8?B?OVYyaHI1Z3MrRUo0MkJTTXJLTWdlbUlpZmFGN1I0Qi8xNHloME4zM3p5Nnla?=
 =?utf-8?B?cCtQQnN3Nm1zZFhNYWpwVUJRbThHNnU4NzFwQ09Td1F5MmJQaWNLemozUjFL?=
 =?utf-8?B?eW16T1B1NVNqTjJhMld6M3FWSmN5NTdwcWlsWFdoYVJLZi96YmNTdnVDOTRp?=
 =?utf-8?B?ejhrOUQvRk9RcFhIdUFUZmJhVGUrMTlzY1NaQVg4cS9Lei9XUzRPbzQrK2F3?=
 =?utf-8?B?VUxXK0Nsbmk1eUQ0S09aYUJaZU5zYkg0a3hpd0xPWTl2WEhhMGNGQ2ovOGNs?=
 =?utf-8?B?eGJraFNPblYvWm41NFBKQThRSGZkOTFGWWMwa3RTcHRtdkdYeFNrM0ZZYjhV?=
 =?utf-8?B?Z0dGNzh6clhqWFo1WGFkNVJsNmxaMDhFK2VYdU5Ua2paYytvTklRdWZ4NzRC?=
 =?utf-8?B?QnFpbGxIOEVBL2xVVDc5MlFxa3phVTF5OGVqcFRWc1ozWHBWYnU1b21Tb3Er?=
 =?utf-8?B?VTFnWkpRTlBTSjZacW1MdlB6Zk1Oc1FjTkg2d1JFUkVXaUhTbU1wSGRsOW0v?=
 =?utf-8?B?Z04wbzh0cFg0Ny9JZk5vajlRU3ZEOVJuS2dVV2R5THM5ZVBWaTJsaEpvU1c2?=
 =?utf-8?B?UVlrcGxLQ25jTHRSZjNqejhDalk5cmZUa3F1RXRPZS9rdzZ6aXBwVFNFN1Nw?=
 =?utf-8?B?aGc2Q0l2eE1IcEwxNWxZcnZadWNPV083Y2dwbXhnTlZjaHIrZXVxckpNdjA3?=
 =?utf-8?B?NXhkUUxKZDZkRXU0bjlETnFkajBWK1RZSkErTlFUMDRMSTU5K2tJb3lVY1ho?=
 =?utf-8?B?NFJxWG14dTVzb2s2R2FtNGpqRFM2NElPUUZxa1FRK0tIRk04K1BvMEJDazU1?=
 =?utf-8?B?MnlieW1sNEZwSjZrTlBkTHF2ejFXSXBGck5JangrZjMwUjZRYXR0bmlJNkla?=
 =?utf-8?B?b25YOCtDSXlGZ3ZtZWw3cEcwaTZMZnNPaWFzOGtxaEthMCtENTdJTkJwV1RX?=
 =?utf-8?B?TnlJcklwaDFlQjN4R21LZ2VDU2UwazUxemt5eE5OdU9TaHhoVGNtNm9GY3ZH?=
 =?utf-8?B?dXI1TDFWTnkyUG1iRVprcFcrRWtkMXhWdEM4ZXBPdy9xTXVDSlNqbjNPaGZD?=
 =?utf-8?B?UkRMVW1kbWVDTW5UV2Fpd2pVeW50UmdpWEhWSlg1WUFrb05sL0tjTG1kNDZa?=
 =?utf-8?B?eXBIdG8yMWZueFVET2F6VkNxdEVFeWpOYUduTmxMZlpnYjdnczVHOXVoMmV3?=
 =?utf-8?B?TE1YbDlhSWJzb2dMcVdJNUV2QjljZWIrVUpaRW02MHc1MEJNeWFteEx3L1Zz?=
 =?utf-8?B?Q1Z5VjRJTHJVOVFWL3JXNEpFS2ZjYUw0Nm5QSU5IcEVmRkNCYXRGMVlUbEdC?=
 =?utf-8?B?bTZIYUVuWE5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWZqZTVWTUJJWGZlTVhLWkxJVmlzZDVCTGZVVEtBZ08wMmx4cE0zYTBucHYw?=
 =?utf-8?B?TTFKbnVhblN6VlVJV3JXMXJPUmxlanUyU0tCUDJVVitOdG9yL05IV0h3blhI?=
 =?utf-8?B?YmJxZWJFNjJHRU1IUFNEOHFTZ2w5c0JoaHdMeUl0M3ZvSWd3aklnT0I3T1Ni?=
 =?utf-8?B?UUhQVVFnUFJhcEw0dlk2d2hvTjUwTjJxSk5QR3l4b1JpUDlHcHJPSy9TOURQ?=
 =?utf-8?B?M2RnSW12eWJ2bzhLYWNFOFBBbGNoRDNYV2prbXlzMkNUNTlMd3NZR1VhTTJE?=
 =?utf-8?B?QlY5VGpBakl2bEFHaDlFTGFWTk9KdW1GU0hwdGZwOVJtelR5T1pmaXN1OVZH?=
 =?utf-8?B?b3ZwNHRMNzEySXdydVRZNzduUi9TS1dqajJVWm9kd3hUQVlHSHJRQWNzVi80?=
 =?utf-8?B?ZGpUbkZVeXNXcU5pUXNtYTNQZHRBVmtUSDFnZVU4ZFRrV2FHZUYxQkN3M3Uv?=
 =?utf-8?B?SnpYeTV5RGNGWjNlWTBMVTdCTEF3RGFva0dLdTFrbFJvZk8yU1dKRkxWU2pu?=
 =?utf-8?B?Z1RiM0pvblRKMXJjekNyaE1mRjdWaU84M2g1Mlh4MTJ1cjRtVS9YQzRiZk1M?=
 =?utf-8?B?bWk0ZWJoZFRITkNZWHdRWFBIc2Y5ejBKbnBrajQwdVhVQnkyWURXRjd5U0ZU?=
 =?utf-8?B?UWVqdGdtSFZTWDVPUE5lVUNNekZvSkROb2JqeFhyYjZBMWc3VWVrcVB0UmlZ?=
 =?utf-8?B?cHhJTTJzeDBBK000dUtLUjFORm5TQ0hDdHdNM0M5dlJ1QnRiQTVMNzNncDht?=
 =?utf-8?B?NnlJY0NvelF0VVdob1RweTJ4NVl0SnFHdHJOb2ZqWkZTdG1JRXUzVHZhcWE2?=
 =?utf-8?B?UXhJL1JMc04rK3d3YnVNUjkwd05HY3FLVHFYVkU3aU0xTnQzSkxTTk00bEIx?=
 =?utf-8?B?NUxGQ0Z1a2l5MzZnMENGZ21HblhaN0daSWZOSGZyNFNZT0FWVWhQa0lHaFdM?=
 =?utf-8?B?ZmxPQ3YrRTFERDg2NDBUOVo1dkVhcy9NMWdOODV5djhhTCt1Q1BqcjJ0WWRB?=
 =?utf-8?B?clJxUDBkZDVoVlpuRkVKWmhpTE1Lb1d6SDVmamRCYWQzMUtrVW1ITXVOclZi?=
 =?utf-8?B?c2dTNURNbVdKRXd0MW9qU3JDdm81UVM2L3NJcFdVS2pTUUNMMWpMNlZ2NVMx?=
 =?utf-8?B?ZGFTdFJmMzhydm1GbUhUYWF5ZnU4ZzB5K0JLaFBkOEs4QlF6dFBYV3lHVmZw?=
 =?utf-8?B?OGZmWkJpK1orWnM0YkxiL0FxdEU2OTJTd2Y5RWE3eHljeTFOT2krdUU0WlAz?=
 =?utf-8?B?dWxZc0NERDIzM3hLSnpXeUZ2NnRuMjlTamFMRklMMk1DN2xnQVUxdEZ1cUN4?=
 =?utf-8?B?WUQ0a3huTzFWSlN1eVo4OU0vMllONDFHeXM4ZWc1QmVBMmVzS09DdTl6Ly9F?=
 =?utf-8?B?d1BxQno5eFVXRDZVZGMxbFV2dy9BTXRvR3pSS21Hc0dWZVZsSk5kamU0ZjRQ?=
 =?utf-8?B?OEtMRThPejNMRE5FZE5sandyS2FhSlIwTU9mamQveVJocHRFOG9OWC9oWjc4?=
 =?utf-8?B?WUpSNmc0OVZSY2hFNUVqaGpqdDdLZDI0c1hRYWVvOFl1bk5FSGRqR2tFa0pQ?=
 =?utf-8?B?d2djbkZ1UHdiV2hJUEpDRUF3UDFlWkRvQ2o0RDhtN2NuWFhVRldlNnlseDd1?=
 =?utf-8?B?ZXQ3elN1U1pTMlBKSU5WUXJmT2tCRVVGZXRjWkp5U0hGUVc5M0puYWZ3UHU3?=
 =?utf-8?B?Qk5Pdjk4aDBRd1IxT2VHTVdpV3BEc3JROVduVmZBRVBNZXJZSGw1N0tXQVV1?=
 =?utf-8?B?UXJMT1g0YVh0c1FHdGxCdWJGcjJWcFhHZi9Qb1gxb09MQ0FOVmpoQmsySGZR?=
 =?utf-8?B?Rml5YXQxRWlOMlllUS9aQTNXaSthaXNtTUlnVmJRU01TM1NTeGl6Qm5iWHBn?=
 =?utf-8?B?RlVjc3luS3k2M3RQcG4wNmxxVHY0L291UmQwUmJnOUlQNTFTRlZlTGd1OXNJ?=
 =?utf-8?B?dWcyaDB3ajVzZWp5Qld1eElzaC9DTVltOTFHVmR3YlJLOUwwK205d0NVb2pn?=
 =?utf-8?B?NkZDYlU5elpDUDBBcXRuQXhlR20xY2VCWHMrZVN2UHVsa2dMMVNkTHNpUTFG?=
 =?utf-8?B?S2N0UDJ5alZBbHQwZ2k5RHEyS0orSGR3L1BWeGxYMHlpVFJDQTRDSFExcDUv?=
 =?utf-8?B?Y3Q2aGsxOGxDWUNIajRoMmtrM1F2SUtHbFBLK0hHeXhjbzFBaGE1SjJnVG5s?=
 =?utf-8?Q?K0jPMSQMufTExIUchq1lNzL2VhUkHyOCXTJKAPSMq3fI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6154995-11e7-4887-a845-08de25c975c0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:07:13.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qa2InGaQrw6y+47KoQIDkkzroTFtJ7shK97rMK4lhYbbDHwcm6O4onhknuy0f6Nlod79NqXyI50v47l5ZFw47Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607



On 15/11/2025 04:26, Akhil R wrote:
> Add support for HS (High Speed) mode transfers, which is supported by
> Tegra194 onwards. Also adjust the bus frequency such that it uses the
> fast plus mode when HS mode is not supported.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v10 -> v12:
> 	* Update bus_freq_hz to max supported freq and updates to
> 	  accomodate the changes from Patch 2/6.
> v10 -> v11:
> 	* Update the if condition as per the comments received on:
> 	  https://lore.kernel.org/linux-tegra/20251110080502.865953-1-kkartik@nvidia.com/T/#t
> v9 -> v10:
>          * Change switch block to an if-else block.
> v5 -> v9:
>          * In the switch block, handle the case when hs mode is not
>            supported. Also update it to use Fast mode for master code
>            byte as per the I2C spec for HS mode.
> v3 -> v5:
>          * Set has_hs_mode_support to false for unsupported SoCs.
> v2 -> v3:
>          * Document tlow_hs_mode and thigh_hs_mode.
> v1 -> v2:
>          * Document has_hs_mode_support.
>          * Add a check to set the frequency to fastmode+ if the device
>            does not support HS mode but the requested frequency is more
>            than fastmode+.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 59 ++++++++++++++++++++++++++++++++--
>   1 file changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 8a696c88882e..9ebeb6a2eaf5 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -91,6 +91,7 @@
>   #define I2C_HEADER_IE_ENABLE			BIT(17)
>   #define I2C_HEADER_REPEAT_START			BIT(16)
>   #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> +#define I2C_HEADER_HS_MODE			BIT(22)

This should be ordered according to the value. So place this above 
I2C_HEADER_CONT_ON_NAK.

>   #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>   
>   #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -200,6 +201,8 @@ enum msg_end_type {
>    * @thigh_fast_mode: High period of the clock in fast mode.
>    * @tlow_fastplus_mode: Low period of the clock in fast-plus mode.
>    * @thigh_fastplus_mode: High period of the clock in fast-plus mode.
> + * @tlow_hs_mode: Low period of the clock in HS mode.
> + * @thigh_hs_mode: High period of the clock in HS mode.
>    * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>    *		in standard mode.
>    * @setup_hold_time_fast_mode: Setup and hold time for start and stop
> @@ -210,6 +213,7 @@ enum msg_end_type {
>    *		in HS mode.
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>    *		timing settings.
> + * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -232,11 +236,14 @@ struct tegra_i2c_hw_feature {
>   	u32 thigh_fast_mode;
>   	u32 tlow_fastplus_mode;
>   	u32 thigh_fastplus_mode;
> +	u32 tlow_hs_mode;
> +	u32 thigh_hs_mode;
>   	u32 setup_hold_time_std_mode;
>   	u32 setup_hold_time_fast_mode;
>   	u32 setup_hold_time_fastplus_mode;
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
> +	bool has_hs_mode_support;
>   };
>   
>   /**
> @@ -646,6 +653,7 @@ static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
>   static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   {
>   	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
> +	u32 max_bus_freq_hz;
>   	struct i2c_timings *t = &i2c_dev->timings;
>   	int err;
>   
> @@ -684,6 +692,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   	if (IS_VI(i2c_dev))
>   		tegra_i2c_vi_init(i2c_dev);
>   
> +	if (i2c_dev->hw->has_hs_mode_support)
> +		max_bus_freq_hz = I2C_MAX_HIGH_SPEED_MODE_FREQ;
> +	else
> +		max_bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
> +
> +	if (WARN_ON(t->bus_freq_hz > max_bus_freq_hz))
> +		t->bus_freq_hz = max_bus_freq_hz;
> +
>   	if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
>   		tlow = i2c_dev->hw->tlow_std_mode;
>   		thigh = i2c_dev->hw->thigh_std_mode;
> @@ -694,11 +710,22 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   		thigh = i2c_dev->hw->thigh_fast_mode;
>   		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
>   		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> -	} else {
> +	} else if (t->bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
>   		tlow = i2c_dev->hw->tlow_fastplus_mode;
>   		thigh = i2c_dev->hw->thigh_fastplus_mode;
>   		tsu_thd = i2c_dev->hw->setup_hold_time_fastplus_mode;
>   		non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
> +	} else {
> +		/*
> +		 * When using HS mode, i.e. when the bus frequency is greater than fast plus mode,
> +		 * the non-hs timing registers will be used for sending the master code byte for
> +		 * transition to HS mode. Configure the non-hs timing registers for Fast Mode to
> +		 * send the master code byte at 400kHz.
> +		 */
> +		tlow = i2c_dev->hw->tlow_fast_mode;
> +		thigh = i2c_dev->hw->thigh_fast_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_fast_mode;
> +		non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
>   	}
>   
>   	/* make sure clock divisor programmed correctly */
> @@ -720,6 +747,18 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>   	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>   		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
>   
> +	/* Write HS mode registers. These will get used only for HS mode*/
> +	if (i2c_dev->hw->has_hs_mode_support) {
> +		tlow = i2c_dev->hw->tlow_hs_mode;
> +		thigh = i2c_dev->hw->thigh_hs_mode;
> +		tsu_thd = i2c_dev->hw->setup_hold_time_hs_mode;
> +
> +		val = FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, thigh) |
> +			FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, tlow);
> +		i2c_writel(i2c_dev, val, I2C_HS_INTERFACE_TIMING_0);
> +		i2c_writel(i2c_dev, tsu_thd, I2C_HS_INTERFACE_TIMING_1);
> +	}
> +
>   	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
>   
>   	err = clk_set_rate(i2c_dev->div_clk,
> @@ -1217,6 +1256,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
>   	if (msg->flags & I2C_M_RD)
>   		packet_header |= I2C_HEADER_READ;
>   
> +	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		packet_header |= I2C_HEADER_HS_MODE;
> +
>   	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>   		*dma_buf++ = packet_header;
>   	else
> @@ -1508,6 +1550,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
> @@ -1536,6 +1579,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
> @@ -1564,6 +1608,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
> @@ -1592,6 +1637,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
> @@ -1620,6 +1666,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0,
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
> @@ -1648,6 +1695,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
>   	.setup_hold_time_fastplus_mode = 0,
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
> @@ -1671,16 +1719,19 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>   	.thigh_fast_mode = 0x2,
>   	.tlow_fastplus_mode = 0x2,
>   	.thigh_fastplus_mode = 0x2,
> +	.tlow_hs_mode = 0x8,
> +	.thigh_hs_mode = 0x3,
>   	.setup_hold_time_std_mode = 0x08080808,
>   	.setup_hold_time_fast_mode = 0x02020202,
>   	.setup_hold_time_fastplus_mode = 0x02020202,
>   	.setup_hold_time_hs_mode = 0x090909,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = true,
>   };
>   static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.has_continue_xfer_support = true,
>   	.has_per_pkt_xfer_complete_irq = true,
> -	.clk_divisor_hs_mode = 7,
> +	.clk_divisor_hs_mode = 9,
>   	.clk_divisor_std_mode = 0x7a,
>   	.clk_divisor_fast_mode = 0x40,
>   	.clk_divisor_fast_plus_mode = 0x14,
> @@ -1698,10 +1749,14 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.thigh_fast_mode = 0x2,
>   	.tlow_fastplus_mode = 0x4,
>   	.thigh_fastplus_mode = 0x4,
> +	.tlow_hs_mode = 0x3,
> +	.thigh_hs_mode = 0x2,
>   	.setup_hold_time_std_mode = 0x08080808,
>   	.setup_hold_time_fast_mode = 0x04010101,
>   	.setup_hold_time_fastplus_mode = 0x04020202,
> +	.setup_hold_time_hs_mode = 0x030303,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = true,
>   };
>   
>   static const struct of_device_id tegra_i2c_of_match[] = {

-- 
nvpublic


