Return-Path: <linux-i2c+bounces-13795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E87EC06EF4
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 17:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A48851C234E0
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 15:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9B3322C60;
	Fri, 24 Oct 2025 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qcPF/ink"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A02E62D8;
	Fri, 24 Oct 2025 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761319219; cv=fail; b=bz89JobH4GG5dEr5yqZVQJIp9WSsstoHIJr5m/myLHQl4lE8ppxew2kEhstC9fuHqxr8sHoAVg9ZT15Q9uXv8FkLD87zHge+eKtw38ihRVzwcbwxigC87MonAmjEL061gCV4NwF7QwRu68ZfhqaHKmCBMEu/eN+bIHSQkXygPSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761319219; c=relaxed/simple;
	bh=ualEd3mLojuYpWCrTW21MBSPmI7Ywac9Jqh2XlorEr0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=amnN1k0n1I0roQu7ZkNIj+CFGW8yA5KhZECvS9lvHEGn+ebU2R4rRkneuYBFKmhOWNVgoQ0e/MkLSbQouwho56zPZCR5kDxNi3YP7lVH7x6JUrRwHP0Q7pI6V7XLaaNKYjYY8nOa96MCMvovEkVJXWz7H48UuAsvCqeqVli+Pwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qcPF/ink; arc=fail smtp.client-ip=52.101.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkLYwgKzvt5kMu0y3Ldcv7iEQCIcRpYohIAtE3OoyZ4jpY8qExLEAGifP+yuQx1/DFsUN6izbpIQyo+oatH2vwm3iwBVcPpepAz8yVI9SZyHFHywIBg2QYxgRfDapRPTVD39yTu4yo/BiuPkaMlOxiraCXTA5RZxrJYbh3YD6jLgEw0lGcQZ4FvsvKxG4/H5cjFEw8BsocTE6Kq5146O0+rKBTSeHDq7NuSbq5gHObOVDL+EphUVLrJiarxYL1CpNVKRKqIgPQ11+fN95A1FJMKoh3ZUgi18s/D6WnPIJdelRAXnAOVd/U/QkqNvXi37MZrEcZURYMJGI+bVBMiIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1unadcq4t7OLW8MOy2tRL7IOwfk5jo67qYHYlV/x+s=;
 b=GzObM17qlXsOUxE1YwjmHDAEinDWR5X1YRM6Z9qnJ6J0BgctcOe8HcwIgaQml8RqjTHWsdz9zNFkGQc7Xlmb1yXwBU++usIyKLDdRlH29IwSxjqVM9AScnjTtkbIM4wO8RkyVLbogA0/YXjMChScd78/X3lBlZR8aLJtgTkgaAe2CfhNcuMLX3g0/TPvGHCeAzpmcrBD2iKPxmLBcwMIAsmMsqzmV5bNsp8S90Amibs3Ad/0kyov1fbSwcABwBUOMu5hDLkd5lSHuVnZikHoYuvGRcU+LeXHz1EeH+hADPQGyf8NCIvanN9y4qs3CbBYWzQDjk7cIv5sT4uHLWEgdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1unadcq4t7OLW8MOy2tRL7IOwfk5jo67qYHYlV/x+s=;
 b=qcPF/inkqLbh3v/Xg9hgM9ap5PP0iX/7dRs7DrNPzGhaGtJQgjHgghqdlkbwUPuCtvr8FF4zKJpbkpN2GIjSiN8Rnq4qI6ifdWTfsaqhT+b52oR89KetuKixWGIoEKuoK/aCpAEWsuwYt7HkrmxGpikFoou2Bl54ximr0J9WvXJkEIzg/SKnoRwa3scqNRHVg2u2pRbmtdjv86WnbKScn7+Y+0X+3fFZqxk+Uxj/L3kuQfEZBxE3a4xybkgRffi7W++bM0GJnLofwZBCDrr1ZAxVtt2kYsmdBlfXIcJ/+L8RdSRWM9pZxaW/H2B5s3mcBEmxgIL22b1Uajn8QfQXVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 15:20:14 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:20:14 +0000
Message-ID: <fa389b08-7ca9-4c0e-b9fb-68d9a58ce79b@nvidia.com>
Date: Fri, 24 Oct 2025 16:20:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] i2c: tegra: Do not configure DMA if not supported
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001064759.664630-1-kkartik@nvidia.com>
 <20251001064759.664630-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001064759.664630-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5596b8-f049-4150-9f08-08de1310d4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVY3RE5mdUc2SEo4YU1aaFduUW1sTHVGSG1UWGozZFZIbGRXdW15YWYxb09a?=
 =?utf-8?B?Rk16TkM2Q0RtVS8zbVNwdEVacGI0cjBxclAxNlBkYkJLaFlKL3FpSzZvcG5o?=
 =?utf-8?B?SHVkVmlQUXhZNnUyNkNjNFpJdGNFS2kxTWV2Z1VRTXFrQ0FId1RwTDdTV2hK?=
 =?utf-8?B?MDViV3ZhTGdTblR6MFEvWkF6K0JSMzJvK0g5VjF1aUNWZkluWkd4ellNTm9v?=
 =?utf-8?B?Nks2Yjhrb2ZFVnVvSnRQMkUzSFJKaXk1UXAxOHhyQmZVMlFZUXJZRzlVbm4x?=
 =?utf-8?B?Wm9UTWNReE5YTmdyUGJmdzZYd0ZKMEZaZFRuR1JzNm9vK3pCaG1rV3VKZjQv?=
 =?utf-8?B?SFVIZXhVK2pTdEFLMnBDRms4MUNHQlU5ZkZUWDZDa3NaSVB0enBoem92ZG9P?=
 =?utf-8?B?YTV0VEs2eTlJSkhiNHlBenY2YWdQblQ4QjZrdmVTQ0VySWJXVHJ2VFJFM2NV?=
 =?utf-8?B?R0padTQyQjNrRmxIdDNmdlc3Qk9Md0dvdmRRbk1ucHcwbE5VamhteDZEL2th?=
 =?utf-8?B?L0hFTmpwRUNoREdaNHVFWm9uWTZlYW5mVnBKb3U1VE54czkxUGIzQzcydktS?=
 =?utf-8?B?WXpyYVFjZHNOdWxHWW9CTk93WnRMelU5MkxoYWNOS1loWWJBbEYzVk5NcXZm?=
 =?utf-8?B?Y0xtZk5sc1RWSDFHQUxJcUhzNzdvRlk5bEtMM1JGaEJqQ3Y4K3BwbXJFOGdP?=
 =?utf-8?B?WHpDNzJiaGZPZUJ5MnpIbGxUNEZZdzAxVHZyeG4rL2xUTGJaWVh4UktQTkVs?=
 =?utf-8?B?MHZTbUJXQ29nSEFTOHZNYTZuMXBQcjFDWVJSYnlpczJyUW9FNmdYd1M1RFh4?=
 =?utf-8?B?TGE5Ni9QMlEwaUZqT0NnMjUzYnBYcTNDYUJLL3lEaEhKNGo5VDdNREg2TUlV?=
 =?utf-8?B?dGdWMG9pNTZRNFRLQUlwNHlhU3NXcDAyOXhIeWdVUG90L2d5RmhMVkdxQkxJ?=
 =?utf-8?B?VEV2TWwyUFZScnBJaXRTMDVMSW44b2ViK0ZySWNHR093ZzkzU2ltY0c2bHY1?=
 =?utf-8?B?d3YyUDNxVlYwdDhwS2plNTNyZHZaSk41THlOUkFFbHdWL3pidUpscHVyYnRM?=
 =?utf-8?B?T0EraWxIMm8ycmw0V3VFb2ZaNnEzMVhxNzZ3S3VjMEYyb0pjaEltSmNzMHda?=
 =?utf-8?B?MUlMc25DQjRvVHhQYlErZlhKbkJLQUpzRDJESFJJSkFrZ2djeUowRFVMZU1u?=
 =?utf-8?B?QytBc0thVEpReGZtTEgwWVJGc3FBTW9wVWU2N09nS3c5bDR5Y1Jra25DdnJ6?=
 =?utf-8?B?WlBRSUlNRFlwWmx1SnluOUhoQWh0a3JyYWk4bGcvMVlRMVRCVVg4ai9RZEtv?=
 =?utf-8?B?WGZvQUxrU3kvc3N4Yk1CdGsrajgyd2NQZzI2Mjg2M29vQXVkbkY1MnRHM0dC?=
 =?utf-8?B?MlY1WlVMcW5GZ3E2S0doN044NUQxdDNsRkFhUUJiY1lkQ2cvT0NFK0Rzend3?=
 =?utf-8?B?Q0xSVVlNY2YyVm0yZkkxVXV4VUIyNjZMS0xaaUpWWEtLMFhDTjNScWpyd0hQ?=
 =?utf-8?B?eXZYU3oxb09zb256WkVPT1ZOa3Yxd1E0c2duVWFWUE9VSStmTys4akFUMzlh?=
 =?utf-8?B?TUdJRGt1WnE1WnYyVmNHUWd1MjVXMWRRZnVDVXdyYmpZaGJKVXQzRHMyY1E2?=
 =?utf-8?B?aWZ3UnpRZGV0djdvUlM0QUNyUWV3Y05xUGQxWVBkVGsxYlE5OTlOb3NjM2FJ?=
 =?utf-8?B?dVQ4enluN09yUWE0cVB1VnJYaHI5dG45dUpPN09JL2VxZ2hzWjlkdDVidmhI?=
 =?utf-8?B?M1MzVGJ0bkcxRldtOE1Wd051Y2MyeHIvem5vWWpEb01GMWxyL3d4dFJjSExh?=
 =?utf-8?B?TkZrbTlLMW1KQjVvMzdrVGtrT2huek1HcUJ0ZzZiUFRPUUoyS1dXZWhYbFpP?=
 =?utf-8?B?WW5aSTlySGRIRTBEUDJkbEtIZ2pnYmtHNUkyOUJRMi9xek9JU0k4S2laZEZx?=
 =?utf-8?B?L3ZqODFXVkUzN1ZoTC9YMThoNkw2ZW02S1k0VGgvSkJsbDRHNkRCNnZLVVB4?=
 =?utf-8?Q?KTkWHp1pxNxLSfPFykwhFt7r0vbD1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDdSd2NkUGsxanBsZXFSRW5VR1dXQTdnRkhGKzBFT2czYjFveHRtQXlqbUZV?=
 =?utf-8?B?anBsRzh3NUM0Qnp1czY4UmRyOTB3S2ZtR01HcVRvMnlxdExLMWM1SEdJSHM5?=
 =?utf-8?B?NUJGMXFoWE9NNEd6QWxhN1ZtQzJaVXR0MDBzWll4MklrRHp2UVg0K0NPVGZj?=
 =?utf-8?B?dGgvY3c2NENLNy81cGg5bEp3dXVwbkZNRzh4WlJSelJBSk1jQXhBMjlFRlE5?=
 =?utf-8?B?NTlxS3dOMGVFem9pOGZNd1lkOStNOTU3Sk5uYnJYblo0WUl3YTFZODkrYUFF?=
 =?utf-8?B?NGVvTjlUL0xmNGlNVjBzSHRFMGNaYkY0Skx0ZHBrT2grUXMyejduSElGaTdX?=
 =?utf-8?B?N3NDbWRxeEVPU0V1cURPS1JxUW1nTzVROUVSWTZLZGVNSStSVXEvZ0V4Qlcv?=
 =?utf-8?B?Mk5BNENOZzlXbWptcDY5OHBwMXh1b0ZmNTRNaERodWpjb29wSDVQZ1E4cXJW?=
 =?utf-8?B?Q1RCRGtja3p0MDA0WWc0ckdnakFDTkZvVjZOZ1MrU3NuT1BWN1dCd2RQcXEx?=
 =?utf-8?B?Q0JpNWhUYlBVcEFtSzBkYnlLQm5IRkIxdkZnOEZsd0l3dWxqaGpQRGZmaTRu?=
 =?utf-8?B?bXp0bGIwYm14SWdjaHBLY1dEYVlMcmFyRFJ4RDIwTFg4MUJrRWdoQ295TG56?=
 =?utf-8?B?SnZpenBxYzlKOE95SUZqRGxmZDJxeklBbVI3VzJMNXdMUkpvdTI0ZS9RZVpR?=
 =?utf-8?B?VUowcmVUZUpDeWpqREI1WFREVFE1bVlVc29TR0phZllOSWhXSzJ0OFNKWk9L?=
 =?utf-8?B?WDVRRDF2N2cwakNPeE5yZ1FEb3p0dXlLUXBLVkpRQXB0enlUVFB3M3JHZHJN?=
 =?utf-8?B?L2UxL2VZcExhMDB3TUxOYVdWUTVwM2lZZnlpWk9XUFdGNFRCaUJxWFN1U3J0?=
 =?utf-8?B?NzlQZmtDM1RNZ1Iya1czUG0relFrclBSMHlvc1Q1SGo1TkxNVEhIdldWbjQ5?=
 =?utf-8?B?U0cxeHc1MFVOblo5cWk4eTRiQ1pQOGozRmwybDd4SStRNE1wNDlYSnpWaDlr?=
 =?utf-8?B?MWg4eUNiU0J5bkdvSER3b0gzbG9LdzFuU0UxOVYvV0tjQ0ZJNDFsQjJxd1cz?=
 =?utf-8?B?M1RlS1o0VVlIb0FKK0VEbDQ1UTdKNTBDSlY5dHFRMzlOTXZoSHdBMWlrT2po?=
 =?utf-8?B?NlRDdUsvelpVSWsxTE4vU1dYK1VuemU5Q1ppNmMxREV5OVpERWVNQXNBZ2lT?=
 =?utf-8?B?elpqNjR2dUhYY1BmeUxTcWxEa3lGVXN4ZFFYU3hnMTlaeWVtdjVDYjRUMFIw?=
 =?utf-8?B?dVR6NnlLb0VoNG1rQzVCbU5EdEtDS2kvUkxGZVp4NHMrYnRTSW5lME1GNURV?=
 =?utf-8?B?V2FTTElReW56cEsrMUdQREM0RlNVeXJyRmZlRDRqUmlwVzIxSlRLcUlFaSsr?=
 =?utf-8?B?UWJrYTlmSkZIb05WN25CdG1xMjIxRVIxNDVrc1JLVGhXME9EelBQTWlDTC93?=
 =?utf-8?B?R042aE1PWSs4ak9pZWd5bk1EWXEvYU9nRVorSGJaNm82c1ZYQ3pTNnZzQnU1?=
 =?utf-8?B?SVB6UnNSZ2pkbXZCeE5GYlgwZWx6ZWRQTUZ5UkxqdC9zTDdSRldRMHVMRG5R?=
 =?utf-8?B?S08xcEQzd29XbE1sVElxdElUQUg0eDY2M09zOHdqODFtVHJuM1lzM05SQzds?=
 =?utf-8?B?Ty9yMi9ZcTU5Z1czVERGelJBTndXSzJoOEw2cUgrRXJBcC8ydVNoSVdaWWow?=
 =?utf-8?B?eEdGYVlPeWFFdWlzOERuYW5JbVgzVEV2YXhxYTd4K1V4OU9xWkllbmlsazd2?=
 =?utf-8?B?RmJ3cnNtUm40OUxTeUVlUktsdmFRbWhyUFJDaXFpcWVyaHVvYm5maGxvQTFX?=
 =?utf-8?B?KzI5bVI5Q0pnM05XL0VtSXp6VXExZExLb2hqVkRzak40MlNrZXd1TDNJNVZy?=
 =?utf-8?B?SUVCYjR4ZEJMMkg1azJMM2RoUnY5cmVSWXlKcVZwYTh3VytVZWlJUUZvMmFS?=
 =?utf-8?B?UndUcnVaWFZMOHUxVlJmS3F3OU42RXo0eElhdWpJMDNHd1p2TkdSc2ZFRFV4?=
 =?utf-8?B?ejYwYyswaSszMTNneTFBTWNMSzFQcG5VVE0xaEwwSTZWVHFXdWtUbTdPdUZP?=
 =?utf-8?B?bUdqaTVCMG96TVZzRTNNMFRhRC9BWmpJaWNDb2pITTRCejBzdytvbjBYT2NR?=
 =?utf-8?B?aXZUQTNxSHV1aGM3aU5IWWVCZnhjanBvMmZKMXppY0FwSFpOZHJHbW42YmhY?=
 =?utf-8?B?RHJOUUZoWDA5RmYxYVBLL2F6STdQb1hpM0liOWRpT3lwMG9VbVRncXVmNGN2?=
 =?utf-8?B?cnlEaGdyU0pFSWgwMjV2amFjcGZRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5596b8-f049-4150-9f08-08de1310d4d6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:20:14.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpDkTpzk6JDBbEGYo+Zb1SOktv6zz+MHysFGAesSBLcC6LuliFwpE3yL3QZmh81iP01FNu28Hp/B5L2Ts0d74Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841


On 01/10/2025 07:47, Kartik Rajput wrote:
> On Tegra264, not all I2C controllers have the necessary interface to
> GPC DMA, this causes failures when function tegra_i2c_init_dma()
> is called.
> 
> Ensure that "dmas" device-tree property is present before initializing
> DMA in function tegra_i2c_init_dma().
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v4 -> v9: Moved the condition down to have all dma checks together.
> v2 -> v4:
>          * Add debug print if DMA is not supported by the I2C controller.
> v1 -> v2:
>          * Update commit message to clarify that some I2C controllers may
>            not have the necessary interface to GPC DMA.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index e533460bccc3..aa7c0d8c0941 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>   	if (IS_VI(i2c_dev))
>   		return 0;
>   
> +	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
> +		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
> +		return 0;
> +	}
> +
>   	if (i2c_dev->hw->has_apb_dma) {
>   		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
>   			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");

What about ACPI based devices?

Jon

-- 
nvpublic


