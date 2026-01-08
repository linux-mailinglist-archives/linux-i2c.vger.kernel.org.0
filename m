Return-Path: <linux-i2c+bounces-14999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 499EDD01C6C
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 10:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 894253098473
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 09:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5952834C141;
	Thu,  8 Jan 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s7UYyu3/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31B34AB1C;
	Thu,  8 Jan 2026 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862435; cv=fail; b=qvPofaOxRLFSOyjRZqiueV36Z350PvE4XOc2gNfaNCtj6jZqiE9H7h0WLXBTMnZG2OLGZnQSShmkmiem8+E/o90W3aZg22l3vLarvJNs3XGOKqp9MczYtAlydJ899QVxrLutrpubXUC4cGVeZllxAferYzevAwzTbUEBJ53azHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862435; c=relaxed/simple;
	bh=yD3CllIXK2NOc/WjXB6xJjrhsyiNLspCOqJzKDQkkKU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MHPxgAySSBdB9OCjdQWos7pb1NjqPwoIja0+Nqo5Wy+f4tyUZlQfXm6qGyx5HHhwydlopc6ZcyGrt+kqfc8atPuxeLvYvhOkNEcg4BuQsMJAk9ydhUJGyw5h0ZlhjmsUNrIG2g08WiMFv3IVQpisq1VwFu/akAjGXR5V0ZnXfp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s7UYyu3/; arc=fail smtp.client-ip=52.101.48.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha/Mc+28IqlGkdvnud7zFDwDKV3/hH+9142ki11oHPR+XnsthmWhFBlaAZFDVi8loG+01HqxfNLWqStvDivRF0cljtxZ2xw4kMpqAUpE9jfJ5tRK0v7nYa60moloqI43m6YFefvGtV6aioicEemYlklRnm2eD4Ek0mz17+MFcC6lZ51c0bbVPoLGrR5sQLGdHPgFUD9cUEt9tOiDqZkk34ebgVYd6Tua4/KWs09obY52nKcdJ0QsXmfMfx5rIEOsSw6yJtIF4/IPql246wthLT6YpkrByloBBnJ+7LyQUH0OAmW/UVWgiY9PtRyeGqexqfXgvtQ84Isb0o5KZMFlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fLQKgdG5NSsEWLiSd+tyy9pQiL2EXSI33wxKvdpyvo=;
 b=jWpU/dPbQ2teARNd/vkuC0yX/X3NFquNkA1mE0yOjIGXq5KrDiUxhEHNYUC5RydFfHJ2hibif+VMhzpJ9h/wOz1dz229bPlzaw7K/14pCDJUfAE+TqZO8FcpLweI6oO+UspD7a0cJKEH2DVOi+UzOA1bn4In4eOavGh/OIfn+GkbMi85ESYTslBsS3esa9o2XhJ3U3NWje8TBnFjaVDBy0u9B43WQ9D7xVFv+LT9LBUmDjaEa7lQBhQCfr4zRyTwWm8posNkeTiAYzqk6bDPK8tfexqfNjWGZFZFJ3H7tFR5jgscwzMffuBzkNef1ybBQQMMK/1azP4/LYOSLcoXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fLQKgdG5NSsEWLiSd+tyy9pQiL2EXSI33wxKvdpyvo=;
 b=s7UYyu3/TmbIkJKYRuyMvT+UR19nXAsHGadVZGfX3TVs1UhxFviyAy1hB1jlrbujpo/4dTL9j4ndWmSBLqR7/6Rpm6cEF6S7FHEIpkprmBnquzcVH61Zsxw3kxM0ZqwKuDW1aeQBy36pptyT8OtAfR06YPb3mowbF+w7zdoNbVrp8ETjmR3Nq1GxtlK6d2lURXk8dEHD/ZZNDjjVfyvW4C36CVR83Ky0lhles2tUAUXTXIiHJmYH6mj3KZr8/YIi1cLJ6qq4jdfBeBlqt40B1rPL4/lQeWF7j3HZ7ff91zNRi11+nskTSD/xNBq/iu0/iuuCRjeQHI7U+KbITkTzgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB6993.namprd12.prod.outlook.com (2603:10b6:806:24c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 08:53:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 08:53:42 +0000
Message-ID: <27c283ca-a7d8-41eb-8fed-0ee9d08f26c5@nvidia.com>
Date: Thu, 8 Jan 2026 08:53:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107142649.14917-1-kkartik@nvidia.com>
 <20260107142649.14917-4-kkartik@nvidia.com>
 <85d5583c-a679-454e-959d-438e7726ffa4@nvidia.com>
 <69d4316a-f841-46a3-89de-6fa4412db25f@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <69d4316a-f841-46a3-89de-6fa4412db25f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3944f9-0f03-48ca-e138-08de4e936cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUUwSC8ybWxpS25VbzJ2TlRMb3pGaDBlUVhVZGFKZlNOVFNSZUNPczEra3lC?=
 =?utf-8?B?Y00zRUJhcmZSSVF6Ylc2ckJ2b01IWTNuL3NiTHhtUTFtVGhpRzdUZFkwcFBC?=
 =?utf-8?B?cGljcFJUa3dPMVFra0RmT3RSUGQzYjhhZ0FZcEFab3NrZ3V4VnhUMlhXeFBH?=
 =?utf-8?B?MGlSRkVTMWdYaWNTd1IwRURFNElzQlA2c2tUQ0FPOFNYMVdVSzhwbFZPVDRI?=
 =?utf-8?B?QUhUWDkvL2VmdWMzUjJvUWVkNW0ySDE4R1UrampOdWZzT0ZWY3Y1Q3lHdTBh?=
 =?utf-8?B?ZE95cTFVV0Q2VnU4UW1qeFNmVlZNZzljL2t2b05meUh6M21MVzJOSGVBd0xn?=
 =?utf-8?B?UkVJenBCQ01yMUMyQTN1cUZIN1JJSTZkaFF6N3ZGMXU5dXJCWnVvc2ZiS0hB?=
 =?utf-8?B?d25kLy9oVDlqTmlvQ3N0bUs5bFFob0hWbmFrc3U0M3dGd1Fnbmc0Qmt6a3FX?=
 =?utf-8?B?TkoyTUxnWVBEOGNUNXdwZkE0aTBoWGE3TzdGVlRicktZRFAxTUlzSHpYc3Qw?=
 =?utf-8?B?VHczSnN1NWt5RHhiTW84bEhBOVY0R1lTNzFrcnFJVHdMbHlvT1RMY0RBMXlt?=
 =?utf-8?B?dmpoc3BsS3pKVG9XNFhoTXBCcjNsMi9qUXVDc3pRbFZGK1ZJc2dRU3JmRU9j?=
 =?utf-8?B?RWV4RFVRRWRXUUY4a3MvOTFSWUxsSkxqK3JaT2ZwZ2xjakRwUWhvNnc4ZHkx?=
 =?utf-8?B?dFRqWXUrZTI0Yis5UWhNdFZrY3UzdUFjWStwOFZTOTMwMGJTb0lkZStQNnVy?=
 =?utf-8?B?dFlEdXBNMUZnS1kyQjE1VFh3RktPNkJLR25YMnRJdzlCK1VkT09FUENvNUhC?=
 =?utf-8?B?aGdXY2hJUUY5eTJSTk1aR3lwL1hldTJCMHY5UGp3U1Rwb1psRVYycFpOazV1?=
 =?utf-8?B?MTU5eER2WkVSdFRncWRUY0M3SHF6aUUrcE5XWFRZSmpHaHJhdWZnUjJBbHVm?=
 =?utf-8?B?Ti9TblJTKzNiTE4xeHp5RFZEcUVsMGhyNC9jaHFTUlQxUHBYMmRzei96d1c1?=
 =?utf-8?B?SmFjdFZtQmdXTy9VclBDSlpCUkZNcU1QMVRibytPc1pSZzhyVlZFRU5VT3l5?=
 =?utf-8?B?UW5yeFc0Q2xZVEdVOHc5ZCtES3hhYWtXS1E3d0UxR0JTZWM1dmluRStSaFRI?=
 =?utf-8?B?VTd3QXMyMDlRdUxLd0NFbUxHQnVVUCtaL3Y1cUZTSTR1ejhobDBUR2JmTUxE?=
 =?utf-8?B?WmxWdlV0N0hkLy9FYUpGSnpDV05ja2N4dnhrRkFVSnA4OENQV2k4UHlBUi9q?=
 =?utf-8?B?eFlCVDFyV0xaY1NoNmFNb3hmTXNtMTZUTkhzYXlFZko2aTFGK09rdXBmb2hR?=
 =?utf-8?B?a202alFSdGU5dktyU2RVYTNUT3RQRVpENnNhaEpqV3FhbU13bmRnWGRCd25R?=
 =?utf-8?B?SFdRV2dWelNoOW83S1NNM25DdmlHaXMzcHRScjVrTTM4Q0hQUTJ2VTRaTmZE?=
 =?utf-8?B?WGQ3UGVSZlR2QTR2Vi9kYXlMOHZBMGlWQ2FTOFcyc0l4U1puUzhjMmVMaXg2?=
 =?utf-8?B?clIwRkVDUDZnQUxTdm9GdU9DQ1UvVmsramxMcFBMdnpOM205UUhIc3BsU3dB?=
 =?utf-8?B?NjRhT1lSaUwwNXpyRExLc0w1cUxYYkpSNG5pbmJIcUtmQzlFTUpPU3Z5a0Fs?=
 =?utf-8?B?V0NyU01XZXY1Y3IzUFFmR0tjak1aN25WOEtKdHdaNk94TThQL3VEb0R5TWNp?=
 =?utf-8?B?MUlMY2ZyRzN2bmVaa1FxOVRZQi9oKzBOdFZZbTY2Vm5pSnBvYlJRUW9QVnZT?=
 =?utf-8?B?NVhMT0tidTFnM3pJeTdSL3JjOFNCMHhOcE5pdkdLRDNROUlwWEh6MFhhSGFy?=
 =?utf-8?B?QWp4K21OaVdHOEYrOWFCQVMvOHhMUnFSU1cyYjBHTzB5NG5mQ3hFNHF4SUlS?=
 =?utf-8?B?ZDFiVHViS1IxcmpydVVMUkk4QktpK2kzQnNUYXNGcFFMN3ZRWVhOQllwQzk3?=
 =?utf-8?B?YnJYeFprVGoxN3A4MzU3K0UrYXIzQk5oQ2lpbkp2T3pWc3hEVVQyYVRXNTBD?=
 =?utf-8?B?VGlmRGN3Y1EwUXFwWEtNNEozWHVXQ1JycEgvRTlTSVM5RXhDb0J0bWh3ZTgr?=
 =?utf-8?Q?OLBVJP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG5ZQ3FPNHMrY2wzSXd3ZCs3ODdWS1psQVVkTTVvaDZyTDFScVU3Y1hmdE5z?=
 =?utf-8?B?eEs3NnYwaDRHN3YvWDRkU3kyV1BNd2NPNFJwa21wU2FwUGlQZDRGNU1YKzVs?=
 =?utf-8?B?cnppUTJOaFBScU9NWE9aenh4OEdBbEMxUnAyUEVoNCt6YzN5WkYvL3lzKzVt?=
 =?utf-8?B?ZCt2YWlacURVYWZLV2RBendLemVQN3I5R0ZUOE56WmFEWDQzVkpjVGxSd2RQ?=
 =?utf-8?B?bHREYk5udjh4MnlCT2MxNENQRlpUL2RoOC9kSkxRalZxdmRIcGNsWTZJS3BZ?=
 =?utf-8?B?WlZpekJ3QXNzZG1peXFmK1FGdW1BRG1RR3Y1NWdFZ05BSG42Y1JVWnFON3N4?=
 =?utf-8?B?WDV6THJtL0VQYWIrVHRPeHI1d1NkNGp3MUt4RzRlQ0sxZ2Rwa0ttYjduRzd3?=
 =?utf-8?B?MkVvaUxhZjFKM3hPYUdHbTBKZVhVZ2xvaHMzQ1gzQVZhRDRQbGdSVElZbkJT?=
 =?utf-8?B?S05ybHIwdEdHcUNOUXgyT3Mxa0lOZUxDUFc4RC82ZnZNMVZlRjJWT0F4eUhV?=
 =?utf-8?B?TzRMRUp6cHpwV3YwR0I0RmVSamRpQmFRcXgva1BuN0s5UmNEalExd3M3d0RW?=
 =?utf-8?B?NE9Ec1V2bVQvS3FqS1BUM0RPNHFiZ0tvSDVpQ2dDNXFRV0JrTDRPbitSRXc5?=
 =?utf-8?B?V2ZoYWE3TmZsRHNEOXVZaC9aNldOK1cvUE1DZmpmc1MwN1VZeUNQeUh2RkRU?=
 =?utf-8?B?aDhLMEQzUTkyR0llWHp0R0IzaE1KUFFHMW5QNU1RNnBwbVBJVDlCa1lINStL?=
 =?utf-8?B?RlZ6SDZVVXJoT2dsTkhGKzA0Qm50dmJhZmJVTFpIUndMTWdvMXNrR1V5TEVV?=
 =?utf-8?B?cWhiZ0NVOHlSaWkvWFB4Q3V2OTRYS1JaOTdBcWMvUlM2YTlzYUovYys1Uk9W?=
 =?utf-8?B?QkxOdUNCbmI3WWhwUDIvWGhoMVFMc0RBczBTNGRIaGJaSThsUjM0ZDZZWThm?=
 =?utf-8?B?cU95dkNTQ2xLdlF0Q0pMeFMwb21lMmwzZERlZGd6a013enpOMXhTVlRta3NL?=
 =?utf-8?B?ZHlIWCt1d3U3aVJETVRxSy9lYkdBczcycjQ1VG1ZMUozT1VhMkthci9Vb05L?=
 =?utf-8?B?ZTVxVjd0c3R4aEpYd1ZaT0FsZWE2M01DMTFwSXN5QmE4dUlDRXVUdGt4OTBx?=
 =?utf-8?B?L1k2OWlXcmwxT0N6SDBLRVByNC9VQ1dCMGpaMUNsSVErU28zSmdJRm1DNFJU?=
 =?utf-8?B?WExLekFFNFMvS2loZzlybWhINlU4bnoySGhVaURlS0FyTlBNM2pLNUdnaDJW?=
 =?utf-8?B?a3dKcEoxcFhhalVkTFY0bEh4dzYwZXRmV0VGMUJpZmVMdHRnQW9BKzlLWHEv?=
 =?utf-8?B?aTBhM1AxTzlVQXNDbFZjZytFSTQrRG0zN0ZaUW9VUGpjRjVjY2s5cGJDNzJp?=
 =?utf-8?B?U0tpbms2R1VRSWJ0cTlsbjFwbHpLUW9PTEJzMTcxMmFZYURwYjk4TzM5eVRn?=
 =?utf-8?B?MXpKWFIzUTkzYjZHM2I4ZzQvcWs1Tm1mQUxXbEhtSmo3OVFmTHlQWDBiaWtD?=
 =?utf-8?B?MURybEYwcXVCcVpTenhrUElYcU9Yd21uUElyaVFEajBDOWk3TmdHMEVtcjZR?=
 =?utf-8?B?dFEwZnhaQkRXVjlWaHBNdlZiSndJZFYrb0FzZW82SFhwU3dvc2NtVG9TTkp0?=
 =?utf-8?B?b013bjZTb3VxTXBlWTJBcDJzZzVZUDVQWEhnb0lMNFhxSjJRS0pkLy9IU3c0?=
 =?utf-8?B?d2d3VXFsY2oybzh5T3JxMTZHcUtMVFFFUlo2UE1qL1RhaUNaa3hxc0FqdU1y?=
 =?utf-8?B?by8yeDN5RmhaVHJDY2ptcWo3TjlsV3l2cVVYN0V2dDJIZHhCN1RETkVYRUl2?=
 =?utf-8?B?bTBrQzFEcFRsM0RIUlZqcW1CRTZDQU5kSjJSTEh3TVZRY3dxeGRHdlMwaDFu?=
 =?utf-8?B?Rzl6dDZzcXF2bXFXK3hyaVB3LzM4S3Qrb2tUazZTMUdqWlBhUTM1eEl2b0pZ?=
 =?utf-8?B?bkZza2FRR2l0bVluVnFkQnR1MmJoSjlXdUVwVitDRnhRTC9JNXBJZmdOMC83?=
 =?utf-8?B?Sk5ZKzlLMmg0bjJLeS9nY3d0dXJud0hzWkxqWUNWN2JLaVNRTm96TWVtUTR3?=
 =?utf-8?B?d0tuVjRLNTNVcG00TkQyZXdpUmxqRU1QTnBrU0ZHNlQ1cWtIZVRjaHU4dDlH?=
 =?utf-8?B?Qi9nby9TbHEvR0l4c2xLSXV2eEZWSmNURkpuSFFlK3hOaloyd0FVMitwVUV5?=
 =?utf-8?B?QXpPenovdzFyM1lwQTl5VjlyU1YxTVRuY0VCWnVjenFVa1dYUHV2eFdXWUVW?=
 =?utf-8?B?R2JuT1l5V0lmMmVWK3UwSEl5b0tvVHZ1eWR2S1E4dEprWmFCQ3pLSW5saUxn?=
 =?utf-8?B?NXBGclltbDdwTnZCNGE4U1ZIL1RaejRwSDZack5lUDFocUttWDNHZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3944f9-0f03-48ca-e138-08de4e936cb4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:53:42.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AE/oyhNQuqIYkE1q6HUfb6fy72Bl1FSj3rxhdx3o25dIrQZTyZhDXGMsakOTq5Tm21qIZiyDozo+LUk6vdyOPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6993


On 08/01/2026 08:33, Kartik Rajput wrote:

...

>>> @@ -159,6 +137,149 @@
>>>    */
>>>   #define I2C_PIO_MODE_PREFERRED_LEN        32
>>> +struct tegra_i2c_regs {
>>> +    unsigned int cnfg;
>>> +    unsigned int status;
>>> +    unsigned int sl_cnfg;
>>> +    unsigned int sl_addr1;
>>> +    unsigned int sl_addr2;
>>> +    unsigned int tlow_sext;
>>> +    unsigned int tx_fifo;
>>> +    unsigned int rx_fifo;
>>> +    unsigned int packet_transfer_status;
>>> +    unsigned int fifo_control;
>>> +    unsigned int fifo_status;
>>> +    unsigned int int_mask;
>>> +    unsigned int int_status;
>>> +    unsigned int clk_divisor;
>>> +    unsigned int bus_clear_cnfg;
>>> +    unsigned int bus_clear_status;
>>> +    unsigned int config_load;
>>> +    unsigned int clken_override;
>>> +    unsigned int interface_timing_0;
>>> +    unsigned int interface_timing_1;
>>> +    unsigned int hs_interface_timing_0;
>>> +    unsigned int hs_interface_timing_1;
>>> +    unsigned int master_reset_cntrl;
>>> +    unsigned int mst_fifo_control;
>>> +    unsigned int mst_fifo_status;
>>> +    unsigned int sw_mutex;
>>> +    unsigned int dvc_ctrl_reg1;
>>> +    unsigned int dvc_ctrl_reg3;
>>> +    unsigned int dvc_status;
>>> +};
>>> +
>>> +static const struct tegra_i2c_regs tegra20_i2c_regs = {
>>> +    .cnfg = 0x000,
>>> +    .status = 0x01c,
>>> +    .sl_cnfg = 0x020,
>>> +    .sl_addr1 = 0x02c,
>>> +    .sl_addr2 = 0x030,
>>> +    .tx_fifo = 0x050,
>>> +    .rx_fifo = 0x054,
>>> +    .packet_transfer_status = 0x058,
>>> +    .fifo_control = 0x05c,
>>> +    .fifo_status = 0x060,
>>> +    .int_mask = 0x064,
>>> +    .int_status = 0x068,
>>> +    .clk_divisor = 0x06c,
>>> +    .bus_clear_cnfg = 0x084,
>>> +    .bus_clear_status = 0x088,
>>> +    .config_load = 0x08c,
>>> +    .clken_override = 0x090,
>>> +    .interface_timing_0 = 0x094,
>>> +    .interface_timing_1 = 0x098,
>>> +    .hs_interface_timing_0 = 0x09c,
>>> +    .hs_interface_timing_1 = 0x0a0,
>>> +    .master_reset_cntrl = 0x0a8,
>>> +    .mst_fifo_control = 0x0b4,
>>> +    .mst_fifo_status = 0x0b8,
>>> +};
>>> +
>>> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
>>> +static const struct tegra_i2c_regs tegra20_dvc_i2c_regs = {
>>> +    .dvc_ctrl_reg1 = 0x000,
>>> +    .dvc_ctrl_reg3 = 0x008,
>>> +    .dvc_status = 0x00c,
>>
>> Why do we need to add the DVC? These don't change.
>>
> 
> For consistency, as we are consolidating all the regs in `struct 
> tegra_i2c_regs` and moving away from static macro defines.

I am really not sure we need to do this. DVC is only applicable to the 
Tegra20 devices and no other devices use this. Hence, adding this for 
every device since then seems wasteful. I prefer we don't include this.

>>> +    .cnfg = 0x040,
>>> +    .status = 0x05c,
>>> +    .tx_fifo = 0x060,
>>> +    .rx_fifo = 0x064,
>>> +    .packet_transfer_status = 0x068,
>>> +    .fifo_control = 0x06c,
>>> +    .fifo_status = 0x070,
>>> +    .int_mask = 0x074,
>>> +    .int_status = 0x078,
>>> +    .clk_divisor = 0x07c,
>>> +    .bus_clear_cnfg = 0x0c4,
>>
>> Shouldn't this be 0x094? We are only adding 0x10 if greater or equal 
>> to TX_FIFO.
>>
> 
> You're right, I will fix this in the next patch set.


Thinking about this some more I had a tough time reviewing this and feel 
that this transition is error prone. I would prefer if we kept the 
current definitions and then just ...

static const struct tegra_i2c_regs tegra20_i2c_regs = {
     .cnfg = I2C_CNFG,
     ...
};

static const struct tegra_i2c_regs tegra20_dvc_i2c_regs = {
     .cnfg = DVC_OFFSET(I2C_CNFG),
     ...
};

static const struct tegra_i2c_regs tegra210_vi_i2c_regs = {
     .cnfg = VI_OFFSET(I2C_CNFG),
     ...
};

Where the macros DVC_OFFSET and VI_OFFSET handle the conversion. This 
way it will be simpler to review and less error prone.

Jon

-- 
nvpublic


