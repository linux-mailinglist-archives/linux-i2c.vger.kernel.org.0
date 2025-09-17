Return-Path: <linux-i2c+bounces-13024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F98B7FBA7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 16:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7B8D541469
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BD122A1E1;
	Wed, 17 Sep 2025 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TtqTsAnU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCCD3A1DB;
	Wed, 17 Sep 2025 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117605; cv=fail; b=uahTM9M34cyTVy/9UkMdAjkpDJ/ZkjXNNdf003PmbFXPibbPanEpJ9JOKxqGt8M7VOv4OeVSw2QHSgqZsDPuAF/LjKG0KBuc9uRlSp/ycbnnmnv+2re079uy9FARsoLNJ176uUUdfTt2dvlVkWwI/V0umaWkWuGhcWTnaqblLCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117605; c=relaxed/simple;
	bh=BN8bMjS7K5j0HkU1hoM9ECYSs/F323yJpCpb7rl4sj0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=byv+fpsb9h7ni0wIhuhuXS2CJ9GEruwDBcaRGknzxFAlDqZjUKlI/Qx91znh1Qn8/bUj7i41cZ5jQ1YN4rn+mZl9+wf/AJFYEBmn6ZqdJfUsxduIzoIMb1/2LoW4R9HUsm+R8E7b6vKPHps+qcXQgGjqaBsKuu+LAzsF6qg625k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TtqTsAnU; arc=fail smtp.client-ip=40.107.208.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsnTJYgAyHiUJlt+vscpObDIbVILIhC6bvEZT2r7cy8Gb29/pQXgVeSqSHjCuZj5DTNPL3iIeLyxenCSrjOVAZhIghq15rpknV8zTaajgnGOVi9fOlRqnLkpkOuk8hj7U+Phg3Ju6OsRBY1pWhk6zSyFYJncZ87ZzLeZkvrpp8bWBJSHMgPLCbTQ2PlBuQzeU8tO3rPv3b5eV341cdeehaXCiDpoSw1WTs0NCPQS8IdC56MjyxwVwwgECcmklr+O5AQEydHQc1juvcXMhlJEotaMjQV3dZmvsnwyfS8b22bZls/1GRdyBhXsQhXJC65MrEhh2MAeOaNM/fRNf/xA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwmlXE2eax1ilt3GgVBA2sCIPKLQgEzDymCZAamqiIM=;
 b=VFCYn6GZ/i64pekF//GMX8W3FUcPmzjonCy5iLBi6r1UhVT30yAZfvohQfkdbh2EFWmDgV8OmNEqeudjJdizXpyI6gSbf0S8y9mr7lqVBsKQhOqSyryJ9mKJfe2oBz6cDcGs1sRL+6SaHLyVjBTk1GRwk6I4xWIITKV2QVm+IF6qtrITYL9/E1wVsghKc/m0jq5PO5w7b4Ey4nHRR2yVW+xXcm/24QBJXb4BSQOnymtOG2aXbtLDyx1mzaPHvFoXW4ieanXjNyYCZVISEglFW7jH/v7y5v56shk8G11lhl1FsiaR4yDg8KDdyeAWM0cv8YL5MTi+06c1KLHK3ocoAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwmlXE2eax1ilt3GgVBA2sCIPKLQgEzDymCZAamqiIM=;
 b=TtqTsAnUNCM3o10yKwbv3EkFLTKpCiVCioknHh9R23E0N1WPkKZNtjNadjnmjHaWQ5usjMWLz3Q6M0x8zmZq/bS3YpqKa4Z86cHiRGEZK+N78cTjdbxsZ2KwanPI8ZMIj4vjLcdk3Ox9VALtfwlWSrCjq+UWn+HnbOR+m4S45H6FqxoqgTSL2BBKCy/REcuTuu1QbcaLWb749dGUiQ6+izc9uAZFAxnZJ0jLazgwfg/mNoqkaIGQ3mwLqD7pCoDHqCwmFCj4nQLg2KH1AD2mwIH8O4mggIs1hXs8P49tQxcuXdTBxnkNk0d1GnP6NBv/X72Ga8MnhCDFhELm17uyPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 14:00:00 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 14:00:00 +0000
Message-ID: <bceeb247-a8db-4ee7-9c7c-ea2f521ef376@nvidia.com>
Date: Wed, 17 Sep 2025 14:59:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] i2c: tegra: Add HS mode support
To: Kartik Rajput <kkartik@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250917085650.594279-1-kkartik@nvidia.com>
 <20250917085650.594279-3-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250917085650.594279-3-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PR12MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b449dc4-4a32-4da8-2c66-08ddf5f27dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eE9Xc3VDVGVWQ1JsckN0aW1zZnY3UmxqTjhldUpVcDhudVBETmpHRGc3SWg4?=
 =?utf-8?B?dmZ6VWxwREIyWnp3T3hIa2E5bmh3MXR3KzVPSVJSL2NiTXhucWlhRXd6Q1dX?=
 =?utf-8?B?VlROZ2RCcU4zQndadTF5MFhYdU9vN3pVRVBZMmtqci85VTNhcldsZUVLZHRI?=
 =?utf-8?B?anFqMmJQZkRZQURoa2dMZmdkN2pSZkFNZjRwT01XSUhKa2JaQ2xLcDFTMGZS?=
 =?utf-8?B?MDVWc1lVR2dMb0lDNnZKVjJHb0VoSDc0TTk5U0FZcWVQaXZ5UmVCTEt1cDA2?=
 =?utf-8?B?M0xRZGVpSnFuVGlaSCtXNy9hOXdoYm1JSUFmSGpkcWtmMTYzYkxqanovUjFm?=
 =?utf-8?B?UHpVd29PbDNRUjdzMkR2NXplMVBVSnE0T1pEdGhzS1g4UEFLSlBsdlBOeHBi?=
 =?utf-8?B?b3J3eEV4UlRwZ01EZWIwcUl5TUZ5ZHRFZ2tlZExkdklNRWVhcHBwa1pJTytW?=
 =?utf-8?B?YU5ZOHFNMWU2bjNvR1NncTNmaGFhbDV2YVpvdjVHQnlSNW1MdmtWTUh6a2d5?=
 =?utf-8?B?KzRLSUZtcnBXVEhhYmJPUnFDMWhyOVVuYUZyRjdiQllXN0pKdVhlSjg0UlhO?=
 =?utf-8?B?T2JoTFBzN1RNWWpUc21RWnMzVlExYWNHTU1EaUxlM01yck1yREpuZUZtcGNP?=
 =?utf-8?B?eE5kMmRnVWVNSUdBZlNQUkVZWmZpUE8yVzAwZFBsdHFGYW1RL3FZcFZoZDRU?=
 =?utf-8?B?UXBhcWpLTHpqTklVVTRCVW5yYmh6YXpXT2d6cmViUG0zS1d2aHovMFkzb01u?=
 =?utf-8?B?a3Q1TytWRWdLR3JZNURFM2wwV2pkemx0ckJ6dk9rS3hpZ25JUVZ5THZNME1F?=
 =?utf-8?B?dzMrZElSWVR3N0xZKzZwL2N4ZXhhNnVnWmpJdS9oYzVtRnIwNXJBQlRDTGZE?=
 =?utf-8?B?TnU4VDcwdXhnb0FUWnFGYndybUxGbEJsUzVRd045VG1xMkJMYW9xUjNyYktq?=
 =?utf-8?B?eDlaSEhjc1B1Mk9iM3N6RG40VTVqcmJyaUpWOVlMU3B6eURTQ090NHFkUXNL?=
 =?utf-8?B?L0F3ZVIzSUZ5RXozbzgwendwbkhLVlIvczA1bHg5Y1JMWnE5SEh2ZTR5WThu?=
 =?utf-8?B?cnpMbCt2dm10R3RWVmtpSXp1cGFnSzlvSzhLcEVQS3M2Q0YxWmdHTk1tcXJr?=
 =?utf-8?B?ZEdBWWxXK2tjZ3I4cEpicXA3dGRNak9OalJYZUtkMXcxdFdyaDVnSkZvbndM?=
 =?utf-8?B?M2doeTVwSTJDaUphODlqYm16TTZmTEdmVGs1cjFVVUtiMjF1cVBuRjFJem4v?=
 =?utf-8?B?Q3dZN3YxT0Nwak9wcmFjM0ZwbU9JbTRCNy9IdmIyakVncUkzdytDR2VyYkJH?=
 =?utf-8?B?REdsMS9mQUNuSHBESkZMU1hPU3hNWFZiUmVwQkJNd0x5aGJnalVJbHVwc2VL?=
 =?utf-8?B?R3oyZUt3MGxKWDE0VEdOcjEvYTJ0bjQzaHlVWXFFbjVnZzFwajZxaTFRaW9s?=
 =?utf-8?B?NitraWlIV05OcjR6Nm9ETmtkbnY2ZkRvN1IxUzhoY2pNOUdXZXNBckF5Y2Jl?=
 =?utf-8?B?dlN4US9aQW1tdEJRNkNCZW85Q2ZFeTcxdXBWM0lCQkE2aWt6UjFWQVlvQnJK?=
 =?utf-8?B?VzlFbGIwbWs0Yi9LTERXZFNEMVlZTW9DV1JQYXZzeUVzazFUaHZwMGUxMkVV?=
 =?utf-8?B?NWFCUFFUdDdWOS9hK0NiV0JPaWVUN2tTb29VcE9NOEJtZk9mNVMvQjdJSE9Z?=
 =?utf-8?B?eGlBZDJOYWdnWHVBTWU1cFZqNkhodENSdWJmMkJyTkYyeURmTXJQSmtpTmh2?=
 =?utf-8?B?L01pU2x3dU1KVWhwbDJ0TWdEL2ZjeUR1TDN4RG1MZWkzR3VmN1lmTG1QYjFx?=
 =?utf-8?B?VFh2c1pzSktoOWMyT1lWcFJOYTZsaDFJb0VqWGt6R3dacWFWeFpEWGtwNVpl?=
 =?utf-8?B?WDE5bkp4cXY2dUsrNGRyWmxuUGN3bmo2OTlSUWRBNDBzSVRZaXBsam10dFZN?=
 =?utf-8?B?MC8vdFNMVUNycW5qbGNwNVhYdXdEa2tqc1JyZDRVSjdMSWRnVGRsTUYvR3h6?=
 =?utf-8?B?SG53Zmo4aklnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SldDRWMxOWhLQU5WcnljdzQ3ZXc2V3VYM1BqWVRnTTV1bENsMHlEMDFMNWxL?=
 =?utf-8?B?cENFUjhPWjd5Y295N0Ewci9oTGdsVUl2ekg3RjJCQlZCL2JkOGxxRDJzQlNS?=
 =?utf-8?B?cGV1RlZlTEZnUlBZSVZxUEVsd1lueklIeDRiOGlsZWE0U0NCTUNJaVF4V29N?=
 =?utf-8?B?VkVKbnhqTkNJV3lEby9oeFhkM2F4alA4enFUVmRjTlpsY3RxeWR5SEh5UmNC?=
 =?utf-8?B?ZEFxNGFHc2c3Q3Q5em9MaTZoYVR0T1ExQWdvUEl4RHJVZFhreHZOamRUL0wv?=
 =?utf-8?B?alNMeU9YWnpaU1pjLzhwUjF6SmNYM2NMVG9JSUxBUEdoY3U1SUE5Snp5RHdu?=
 =?utf-8?B?dmFuSXBzaDhMNnJOL3NlY29qQXM2K093Ym5nVG1KZ0J1a25UMWhJYUFyaTZ5?=
 =?utf-8?B?U2NBUUhxOEZNdDE1K29qNXVzeDEwMHBnMkZDYzRzeEFENXhxMk9DUUcrYjZW?=
 =?utf-8?B?SWRsTTVrUHBDTWVlZnpScmdYUE5McXNJMTNZUkpwSVpub3lYSExmYTdHczRD?=
 =?utf-8?B?Ulp0UEdWdHVWYTRzSDZ4ZUdyYjRMdjloQVlMUmhqbDZvNmZja05xaEpCZUVB?=
 =?utf-8?B?aUtsZXhjR0xZT3BZcGMvazY4MjhPeFZ0aFliOTRCN2RleDBjVUJjUHFlQ05M?=
 =?utf-8?B?WjdxWEpWVElCbDd0enM5b2hFeC9qT25TdktidTdpeERnNnBqRFRPaTNDTzdZ?=
 =?utf-8?B?MXkvQWlqbHhYOFdUUG9rNjUvSE5QeDVYQ1lZSStEWVNIS1A1Qy94NGIrV3RG?=
 =?utf-8?B?RjM4K2ZkdDJjcGR0SVNLMlMrMEgvck9LbGw5TEpzblg0WldGN2xEUnl3Zkg4?=
 =?utf-8?B?ajc0STVjNlJpU01KTnNpVlFOL1dpUTlNMUx5R0RsRXc5aENIeUp6K1FPNFhj?=
 =?utf-8?B?MDJsTlZFWFFGV2J5b1dtTmRleFBoZlJjSHZBZnE5UEVLWE9FN3ljMS85OTBM?=
 =?utf-8?B?SlB5cmNqNXc4dndlRXl0blYvTUlpUDZTcEdwZ2lHWFY0dTh0N3NEQlQ0UHh0?=
 =?utf-8?B?WnVBbXRSb2FVVXBBTE92ZzVhay9aL1JDVmF5ZWw0UVhwT2xlQmtaVCtzeUZs?=
 =?utf-8?B?L242MGQ5OW9JV0s0YkRVOGJMUUlMMXl4RXZTa2pMc2pUcEFiLzI3RlY5MWpi?=
 =?utf-8?B?eG1JNG0rZU8ySktpUHljTnZ1czNDTXIrTFhHYllFNEp0d2xvNnFLMzRRT3Vp?=
 =?utf-8?B?eHRwUGJCRUZwQUx6alo2R3IrejNvQ3k4MjdaOFphSEdjOEZHKzN5ak0wS056?=
 =?utf-8?B?SjNROWRxVTQ2VERkOEVrbjFNa29iRUs3RkdKSDdEa3g4VE1jWHVBb3o0a2Zw?=
 =?utf-8?B?YnBUVFBWeDV1YW45S1dYTy9GWkdhc3dwb1AxS0hJV1Y2YThXUkd5Q2NLTkgz?=
 =?utf-8?B?Y3o2NSsyWHBIdjNRZ1N4RmdLQjQ0TU9lSVpMNjJYb21CUjRtajVDd1dCM0w0?=
 =?utf-8?B?b1F5V2R0L2VCSjJScFRSaWdlWW1uVWRDN0ozcVVpSXJabkFMQlJFSE5tUGZs?=
 =?utf-8?B?VG8vdTZxWHpZWFNnNWRGYlJ1ODNXcTZZY1BzeVJlWTBJT1RtblFrcFJ1TEZn?=
 =?utf-8?B?MW9Pb0NtYy9iQnk4VHRlMXhLZDhZTzlQbTJ1ZGg2T0xkL3RNbUw2YWNvYk5s?=
 =?utf-8?B?TUNHbnNwSjliMk05ZWhMRnFQMVpFeG13K0dnWTFDcG1qMjhEYzN6T0FadmZC?=
 =?utf-8?B?TE5NWGFFYWppNUI4Q1g4NHZQN0pXS09hOCtwN1FPUGp4SlBDOFU2NEg2NDRt?=
 =?utf-8?B?WkIwNjhWMTZzOHdxeXBoSXBBb2J3YzROdzc2SGczbDRYYUE1cFVNOVNLWHIy?=
 =?utf-8?B?UzdqbkkrbXVPcmVsM1l1cXpTaXRoTDNoNzduNEpkOXQzKzBWWjZZVThGSmJs?=
 =?utf-8?B?QU0vQTExVjFnTWhiRDhmSlI3MGFBV21EMzczQVJtNThTaTgyUHpxN0c2Um1P?=
 =?utf-8?B?aXNQTmY0aVc0MFNJMHFhazBzZHhiMEF1Nktmc1liQzdPNkNsUVRKUVc2MWYv?=
 =?utf-8?B?YjVXS1pRT3pEOXVLQjZQdzVtT3VYZC9YTEIxNjExdU4rczlpOFArTi9mNEpo?=
 =?utf-8?B?N3FoOU8wVzhwb3JOcCs3Ri9ZZjAva3hRVUVGVTdiUGxVeXNhTkgrSWI5cGtX?=
 =?utf-8?B?NmF1UmdpNndFbkZDOHk0aGMzNW8vNTl1R0NuM1QwMmovMXBWdFJGK1l2OVJ0?=
 =?utf-8?Q?n8vFnGyqoMWfZLMSAeg4oP/KE8Z/7txmzh6sW9wan7oq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b449dc4-4a32-4da8-2c66-08ddf5f27dde
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:00:00.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vex2u3p5vpYmugsh34Y4B3k6XSEtdR31Z3clJiDxpwlATB7tIXSkYZp6lAyiGQA1NaklZeV6gJhZYsoDTTeeCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302



On 17/09/2025 09:56, Kartik Rajput wrote:
> From: Akhil R <akhilrajeev@nvidia.com>
> 
> Add support for HS (High Speed) mode transfers, which is supported by
> Tegra194 onwards.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v3 -> v5:
> 	* Set has_hs_mode_support to false for unsupported SoCs.
> v2 -> v3:
> 	* Document tlow_hs_mode and thigh_hs_mode.
> v1 -> v2:
> 	* Document has_hs_mode_support.
> 	* Add a check to set the frequency to fastmode+ if the device
> 	  does not support HS mode but the requested frequency is more
> 	  than fastmode+.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index d908e5e3f0af..6f816de8b3af 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -91,6 +91,7 @@
>   #define I2C_HEADER_IE_ENABLE			BIT(17)
>   #define I2C_HEADER_REPEAT_START			BIT(16)
>   #define I2C_HEADER_CONTINUE_XFER		BIT(15)
> +#define I2C_HEADER_HS_MODE			BIT(22)
>   #define I2C_HEADER_SLAVE_ADDR_SHIFT		1
>   
>   #define I2C_BUS_CLEAR_CNFG			0x084
> @@ -198,6 +199,8 @@ enum msg_end_type {
>    * @thigh_std_mode: High period of the clock in standard mode.
>    * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
>    * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
> + * @tlow_hs_mode: Low period of the clock in HS mode.
> + * @thigh_hs_mode: High period of the clock in HS mode.
>    * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
>    *		in standard mode.
>    * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
> @@ -206,6 +209,7 @@ enum msg_end_type {
>    *		in HS mode.
>    * @has_interface_timing_reg: Has interface timing register to program the tuned
>    *		timing settings.
> + * @has_hs_mode_support: Has support for high speed (HS) mode transfers.
>    */
>   struct tegra_i2c_hw_feature {
>   	bool has_continue_xfer_support;
> @@ -226,10 +230,13 @@ struct tegra_i2c_hw_feature {
>   	u32 thigh_std_mode;
>   	u32 tlow_fast_fastplus_mode;
>   	u32 thigh_fast_fastplus_mode;
> +	u32 tlow_hs_mode;
> +	u32 thigh_hs_mode;
>   	u32 setup_hold_time_std_mode;
>   	u32 setup_hold_time_fast_fast_plus_mode;
>   	u32 setup_hold_time_hs_mode;
>   	bool has_interface_timing_reg;
> +	bool has_hs_mode_support;
>   };
>   
>   /**
> @@ -717,6 +724,20 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
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
> +	} else if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
> +		t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;

No mention in the changelog about this part. Looks like this is a fallback.

Should all of this be handled in the case statement for t->bus_freq_hz?

> +	}
> +
>   	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
>   
>   	err = clk_set_rate(i2c_dev->div_clk,
> @@ -1214,6 +1235,9 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
>   	if (msg->flags & I2C_M_RD)
>   		packet_header |= I2C_HEADER_READ;
>   
> +	if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		packet_header |= I2C_HEADER_HS_MODE;
> +
>   	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>   		*dma_buf++ = packet_header;
>   	else
> @@ -1502,6 +1526,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>   	.setup_hold_time_fast_fast_plus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
> @@ -1527,6 +1552,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
>   	.setup_hold_time_fast_fast_plus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
> @@ -1552,6 +1578,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
>   	.setup_hold_time_fast_fast_plus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = false,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
> @@ -1577,6 +1604,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
>   	.setup_hold_time_fast_fast_plus_mode = 0x0,
>   	.setup_hold_time_hs_mode = 0x0,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
> @@ -1602,6 +1630,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
>   	.setup_hold_time_fast_fast_plus_mode = 0,
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
> @@ -1627,6 +1656,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
>   	.setup_hold_time_fast_fast_plus_mode = 0,
>   	.setup_hold_time_hs_mode = 0,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = false,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
> @@ -1648,10 +1678,13 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>   	.thigh_std_mode = 0x7,
>   	.tlow_fast_fastplus_mode = 0x2,
>   	.thigh_fast_fastplus_mode = 0x2,
> +	.tlow_hs_mode = 0x8,
> +	.thigh_hs_mode = 0x3,
>   	.setup_hold_time_std_mode = 0x08080808,
>   	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
>   	.setup_hold_time_hs_mode = 0x090909,
>   	.has_interface_timing_reg = true,
> +	.has_hs_mode_support = true,
>   };
>   
>   static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {

-- 
nvpublic


