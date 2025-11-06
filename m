Return-Path: <linux-i2c+bounces-13984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543F7C397B0
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 09:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF64D3B898C
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 08:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34E62FB616;
	Thu,  6 Nov 2025 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TsAv5npF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013019.outbound.protection.outlook.com [40.107.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281982F9DB2;
	Thu,  6 Nov 2025 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762415997; cv=fail; b=lokcicLskzWKVbxHiDJMPhiZXWalsFMBHhUOwloOlC7EjFNY7+oXFBcOsmhRiPqWGRMzdgDS5P+WXLG7p9jyQyy8T+oJ9ABAS4pHyD9FG/A4NQVV44rL8jsDdrIrTkdxMHzFcmDNNICVC/p8kmLtdOHjkYp5M5PmBclD1hw582c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762415997; c=relaxed/simple;
	bh=Khft72q/IhZ9Gw0Dy4iwaTARNe/BVQCXCciZcQ5v1GE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MakONeVWFEaEzAKy6Fmwn5hPCpjZ1rbzeiuELmh1XcBz4STH/HBv/LS8lMaYNq3WA9vEtQECT/VStad5AsYp4qJJEHuqmsQc0P7n5rbwKR21zeqkX4y7eG2tQfI2EjEttC6VLG03jWJn93y+qd3AxIodXNX9Su+OoF1a5XlC+8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TsAv5npF; arc=fail smtp.client-ip=40.107.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeTLnCmJgY1qfpdExA4RP7QvUdMHk2IqCGrWBfD1vrtyZE9aRkaUKqDZ30oFQ3fiSldjkkXiX86QYJQfZUGw0EWYxu0ORsOAqVk9tB63mBroSH9s6Fwzsy4la1IKkTNKI7PKG4++WnHih5l2yL+qvytSRRRAblCLfNHc67j7jC36Ed1FfU9HOdB1v3Mjj9ls2QTxmqjAfXf14hfWbCTQ9PH5Z/uI3VBiF3aKJuEYa20Vmwmv2yl2fV+bvwHWnCmxhuEpfy663Tc2NzYi3I8Db1/dv3P2qraDxLhOwYSmfXfv+tY6PliZa5zrYVRVpA3fohSkrH1zjKVfkeI91w0lXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDWlR3B3fAoIIxhkbUg13XKQFFumar+nI/I0JYkn5h0=;
 b=QNuz1KxZ0xsUr+LENZbtMAX+4q9XTrIWKIIEjF8eU4IuFy1cLyL+FC+opRYU06qBqjmnq2raar2MSGfeGxtW+pl5Hs3dmLZfQ1u21Hiu46H08lbPAXPCk22JNn20fe0u1hHBqsFVWomodidnbAdiMDpX9uMV5zGDuW1HGUrnjyh7l5STfkft9jvG3OkL6j0j8QeJtuYBCSXSqn9x3nXFlEZ2zwXj05dDx5hXfC7bMpEVxefTyfUN6kWzCAyJtrCqDtttFwFH4mGGXkGvJRDFLtc1jFagTJ3l+UoWbGvkfibdnoG50tnfcW5G35egYYaxjzwPlOiF9ozuR6llLqeJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDWlR3B3fAoIIxhkbUg13XKQFFumar+nI/I0JYkn5h0=;
 b=TsAv5npF1UcJDsMT9F9qg+z7B3mHEUPLQNqxpyMei8s6mr4ut7BCIS8iYjfPhdHRJ5Mqz11KvSR0YjW6NzE+DFKyxdrKulb0ts4J0KQ9fkla7IvEMEaDjiopdfKZ5ZfmS+0JDKcJSDvigeX7EjroBEfNmcn2Zjje+NavEcg+k/6neQVGGeq8gUyxvPhaQs6X3iLuaMnKtwPgUdGHnK9631um/XZcLvyGnYn7dNxtEx6WpZDU9L63pFduLo2WGUHP/YU0Pram8s/8MhABUY6t6SoJcNd9DoDLrxlq5sPAS1yqe667M/R9uS65Vp6+sUmN8vZ/gFjGdoeBckOknKLnmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 07:59:52 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 07:59:52 +0000
Message-ID: <4b121269-1efe-4741-b67f-42346b6c5c88@nvidia.com>
Date: Thu, 6 Nov 2025 07:59:46 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: tegra: Add logic to support different register
 offsets
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251001153648.667036-1-kkartik@nvidia.com>
 <20251001153648.667036-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251001153648.667036-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0450.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::23) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA0PR12MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: bf59f185-1c5f-466a-ba95-08de1d0a770b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkgxV1V2ODBaYldRVEpUTFo5bTFKZHZZRVZIUk4xUER0V2NHZTNaQWFzdTUx?=
 =?utf-8?B?TmFBczBUT2kzS2ZLRkdiQitPMU5CWHd1czZnN24zVUIvQXk3ME5zUGQ1ZmxM?=
 =?utf-8?B?L1FDcjBUTUd5RkNxdE9VOEREVkI3RnFjRURaSG9EcldqQlp6RVlOUEphVk0x?=
 =?utf-8?B?dFlPclFFNlRBdWtHZGhjYjZwbzdQOVFFVVNPVEtyY3phdHFNcDJDL0tJM0dF?=
 =?utf-8?B?RmtwWjhSYmVkeVlEdDFXUlNkUVpHVlBHSjhmOHB2UDROS3p6c2ZiKzNLMmVI?=
 =?utf-8?B?OGxBQm9iSUsxRGw4MUQwbHRRNnhxUkplZUFZVFVGVjVsTVgvOGp0eE9pNE5C?=
 =?utf-8?B?RDh0L0U2NEJ6akdUUmNHVkhKT2ZRdlg4bVJzTmhKTS9BSVEzQjV2WmZkR3Bh?=
 =?utf-8?B?b3lsNXBuTTZGV3dDVFhyelpTUGVDaC83R0M2UkNhMDZIem44dVNGekxwV3Fq?=
 =?utf-8?B?ZGVqQTU5ZGIwK29xSzJ0OXpISlpFUWpPUEd6OTBnUlZJMkVHak1UWW1yNmhD?=
 =?utf-8?B?YlJDKzd0V29aWCs3dUdFRllaUkEwU3UzNFk0QWxwZzNYVnd2NTlqYVdYdEFQ?=
 =?utf-8?B?M0JYemMrWStTdW1LeDM5NlF0YlFZa0ZtY2RMSGpWUXlBYWVDeXU4RVUyKzda?=
 =?utf-8?B?andJWUk0K2NaQys1L1cvblBLaXQyVWY3OGRvNFl4OVFFNHBNUE9YREhhK3JX?=
 =?utf-8?B?bk5DSE5KU1hiVXhBdWlCS3ZHMWlPSURLWlpOMDdNUlkydjBxLyt3bUkxK1VS?=
 =?utf-8?B?RnhvNXFuL2VkYytvcG1sSVh2aEMyL2s0QlA4cGlJcXVOcWtOL0tTQ0UyR3py?=
 =?utf-8?B?TUVvNjFnbG5KQXNkK0lUWE1seGJOZ1NaWENMYytUMVVmNzZLVlpwYlpPcCtr?=
 =?utf-8?B?a09lWGZMaERaWDMxcjhYdytBSUFxNzdCREFPeVQ4eUFUU1JIZE00ZlBQN01G?=
 =?utf-8?B?MFZMUDQrWi81NkhIQ1lSb3JOUkZqVEVHZGxudGNpa0doUFBnN0hVQ1QwSzV3?=
 =?utf-8?B?SjE5bFBPZWhjajJaWCt6OTF6WDFjNmlJdzlNbmE1RFdTbzVreHBPWWhXWG9z?=
 =?utf-8?B?OU5RK0grL3pFY2VObEF3TUlPT1l5YTl1cktoU2t2TWZSdWIyemw3MkdWaFJY?=
 =?utf-8?B?azRzZTUxT085TEx1cUJEbE5JT2tSTWlEcWlKaEhPdTNVMHB6aklBUTdSa3ZP?=
 =?utf-8?B?YWprUzVtRTNhTzZxbGJLNXRxeHArTnp1L3Jzd3ZrVUM1MHJidFZQOUIzakpB?=
 =?utf-8?B?Y2lSWWsyVTFENUkwYm1ZYTgwZUsvaFRWamx6eEVtVXdiS2dmdHZXVW1sN21n?=
 =?utf-8?B?ZUM0L2Ezd3dDamJUWlBpcHczTnYyUmNZbFZiRHo3VUwzbDhrSjRFTE82cVRN?=
 =?utf-8?B?VDhMcUt3TzYwZERtM3FqQjZPSEZDSHhSOHcrelhRZlg0eURrV2lscTdZZDdV?=
 =?utf-8?B?ejROWnh3b1BDU3ZsMTQ1dmdVcE9KenlmRDJIS1prZGM3SXc4aXdwaU01aTBw?=
 =?utf-8?B?S0FWWjBQQXVIYTVpYjBZeWdzbVJISThvQS95dXg2ODdEZk1iVmdodGc0cmtz?=
 =?utf-8?B?OURnblhzbUh0ckdadnNzZG53VDFlQlJCZ1Z4d0xiN1BjVnBMWTRxWEZBSmhN?=
 =?utf-8?B?TnhtZVZrd0cyUHdVZW5MSjhJVUVFcUZwelEvZHhoY0lqVmV1TVVwRy83eTlN?=
 =?utf-8?B?QkFQbFBZZEIybnE4S2FmeWM1VlRlT3RpUUF3dXAzN2M1My9vTDNJa1ZYUit1?=
 =?utf-8?B?UUNRNzZ5NVcxWDdUWmdVQXNDS3gvTUlkTmkrdFprbmMyUFVJcVNvdm1LQlBC?=
 =?utf-8?B?TDZ5Sm5hZmw1TnNMeXlKcGlEZVBVY0RHZ3Q3K0M1Z0R3OGhZY2tBYmhYcWRP?=
 =?utf-8?B?cVc0a0psVGZxejVSQ2ppSjBVcng1VHRiNGs4U3QxMWZLT1JMTHQ5TFNpTEpP?=
 =?utf-8?B?Y084Nk96eW5yNE1yZE9qcEs3RzRFcEIyay9wUzl1NGtlemdzcGRYSDFnZkc2?=
 =?utf-8?Q?Ol4LbOTtQFTC04kbd2iqfbSqhJ1hdc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHVPb3JLem1BZ3hxS3BZdDJLU2R3UW43Q0Q2UlcvSy9qL25GUG0yRWVQNFNj?=
 =?utf-8?B?NDZHZGw2bjZYdWNONEdJZ0RNampaK09aY0RnTzdjZUI1UXNaVityRzdVc2VU?=
 =?utf-8?B?S2EzMW9oWnY2WlY1amlwOHpadTgyZGQvOFJUYzNQbmVQcGhmbjJWNFpteitz?=
 =?utf-8?B?VGNud1o0WndUTEdab1B0R0dMZGNjYzZiV2JMZ0VQQjhOa2IvOXdEaFBHdlJq?=
 =?utf-8?B?eTErNFVVRE13VSt1OERmeFhCUHJHK0lZNEdidGhVQUNadDdrM28xYUZGU2J1?=
 =?utf-8?B?WDRYUjRVRkFPRTQ0WHptVTNmak1XenVwbEZEWE9PV1FYSkNEVmRDZ1J6N3Z5?=
 =?utf-8?B?eW5Jb1pmbkJSeGhNdzJCdlp0TU54dm5XLzg0UnQwSStKUjFmam9JMFJ5TnhR?=
 =?utf-8?B?VU9UcUR0akNoekVmY1BzMm5KajVGTkMvenZaVXR0L3g5NlFjeFhQWVBZdVp0?=
 =?utf-8?B?VXZiejIrRWpzdUphNFhOQ25WdmRrR3IzelJ5cU00RzZ5Y1RnMnFlZWp3QW1F?=
 =?utf-8?B?TVk0WmZrenZjSW1CdW82R0llMlNjc3NST3RGSGowYmdXTW41UEFXR0ZZQUh2?=
 =?utf-8?B?V1dNLzdXVEl4ZElKU2hHeVB5VnVLNEpqUjUyUGZhMUtTVS9WVHI3N0txcjRn?=
 =?utf-8?B?UEhNMkNEV05wdjBsQmdJdVRrTlJnM0JCKzVTdDM0OW9iNERuR1E1RjYrRi9O?=
 =?utf-8?B?VzZuL1lVeHNXU05qZUhYSTZlQU5ncEZQUnN5dVo5K0R5QXJ5aCtGQmZGRWNC?=
 =?utf-8?B?dzl5UEZxYzc4M1pPQ0RhQ3h5RXFFSnJIeGVTdzNyT3dOUkxHWHJBSi9DdFZ0?=
 =?utf-8?B?Y2hnbGJwVFoycGtoUW1WbWJ3L1NGMUFIZlkrOGhqUVdrWlB4dERPdllCRHc1?=
 =?utf-8?B?RW5ZSkpJSTNDc2V3bXpXSmExSWlXVDAwY1BzT25BbEJhOFk0LzN2dzR1MUIw?=
 =?utf-8?B?RzFFc1EyWlFDNjlaQWJzcEswdFlzRE85RmdmMDFkNGVaU1hxbjUxZ1BxOWRu?=
 =?utf-8?B?eTBZRnU5QlNubmQ5a05EZloyTkpPZ05DUXRnMjh3RXdPVDhsTVBKR0NwWW94?=
 =?utf-8?B?WmVabHNhRE1GalVqNXVJbXh6MGZDUlEvcnh6b2NXOWhRUWw5RW9DMjg5Vjh5?=
 =?utf-8?B?OHRvVXZkcVRKa2dIbFI5TVdmV0JFbjhxbnJoRVNGWGcvT01kZ1htdHBDUlZT?=
 =?utf-8?B?Q1VrN2wyalpBbnJnYUYvS2thM05PM3VWSHhBV25KRktIdmZvVitqcE1ZTmdz?=
 =?utf-8?B?TnNzME5EdXFnRVR4eDF6Q09TUnpZbVNvSGc1bi9wMXhvaXl3M01ZUjJoT3lq?=
 =?utf-8?B?Vzk0ekhuQ0JEdFlQNUZCdjJPTmRRdGlzQ1BqWVJ5eHBWeHVVQlFoTWtiVndo?=
 =?utf-8?B?YnlhZXFXeWhpT3p5b21WbDhjSll5ZWtZSlU3MzNyWmZiS0NqbmpmM1NLY08v?=
 =?utf-8?B?NkY1MVVRN1FGWmQwQ3Q0VUVkSDlTcVBLdUlQS3BGVmd6blVYMU05aW9qVytp?=
 =?utf-8?B?RU15c0hpeWVoZTZ4aURsbG9YRUFzNG5UZmFiSWtxNUlWa2VKWFN4Qzk0aGow?=
 =?utf-8?B?Z1dJVUxnME1VcFpKT2dpUFZKYmZlbVFKUjdlaER3QmJjNEVJOTk0cVZHQkNm?=
 =?utf-8?B?bkVzUlVicGQ2SjVzK0RzaWxvTkZNcWtRR3RHME0vbUN0djA3akFCT0QycUky?=
 =?utf-8?B?cDJIVFNPZ2NPeEwwSXZCdEhqWW13bHBPZGVwbDJoOEo1WDNCakttU0JUb2tK?=
 =?utf-8?B?WlVSVDFXdmVxc3JFazdaTnN3MG5iUVhDV2N0M3RwQnRkWXlxS3NoVWxsZzho?=
 =?utf-8?B?NVZ4elYyZjh3Tms5TmN5YVJCN1Nvd1NNeGZVVFNWVTEzdlNjYWhvMGZ1N2Jz?=
 =?utf-8?B?bTMxR2thSXk1eHBXT1ZTTTJsK3RnRWJlNUg4SnFqY01DQm5BbzU4NHJycXFH?=
 =?utf-8?B?cE5aQndieFdUai9XcVlydVcveWkyT1pzOWF2N0JiZHNPMWhpZVM2M0g1a0tq?=
 =?utf-8?B?N0J6Q2ltMWZXVWhnRVVZOGlWeGhPLzlkRlgrbTRJcExFTnJ0RW8zYU5GOVN3?=
 =?utf-8?B?MVpsRjI4V1pwSktmcUtqeTJ2bkhNcjdCMUVDbSt0ajJQaGJsc0hBbkpoeDVz?=
 =?utf-8?B?dGQvc1pzWCt5SXJHSWdraXpROTl6YnhDYUtxZWxmTVltQmhiRkhOaWVjZE1o?=
 =?utf-8?Q?mzOCHCaADiweQKT3AOiwJr3RCztqNko/dBxRPq8VTZ8b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf59f185-1c5f-466a-ba95-08de1d0a770b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 07:59:52.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJRGDL0CEsg7+oGwIZRz2UEQdd8tK5gqtk2ToQgGuGmcmgFsELE/JA3LUKiRRmtxRQWa5YVaPTYOYSWuZuQkMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493


On 01/10/2025 16:36, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 499 ++++++++++++++++++++++-----------
>   1 file changed, 334 insertions(+), 165 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 038809264526..1e26d67cbd30 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c

...

>   /*
>    * msg_end_type: The bus control which needs to be sent at end of transfer.
>    * @MSG_END_STOP: Send stop pulse.
> @@ -219,6 +322,9 @@ enum msg_end_type {
>    *		timing settings.
>    * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>    * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
> + * @is_dvc: This instance represents the DVC I2C controller variant.
> + * @is_vi: This instance represents the VI I2C controller variant.
> + * @regs: Register offsets for the specific SoC variant.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -247,6 +353,9 @@ struct tegra_i2c_hw_feature {
>   	bool has_interface_timing_reg;
>   	bool has_hs_mode_support;
>   	bool has_mutex;
> +	bool is_dvc;
> +	bool is_vi;
> +	const struct tegra_i2c_regs *regs;
>   };


I think it could be better to have a 'variant' flag for these is_dvc and 
is_vi variables because they are mutually exclusive.

Jon

-- 
nvpublic


