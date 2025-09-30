Return-Path: <linux-i2c+bounces-13278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30459BAD72B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Sep 2025 17:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4C83256DF
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Sep 2025 15:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942B1307AD2;
	Tue, 30 Sep 2025 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CC65i0rT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7191EE02F;
	Tue, 30 Sep 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759244500; cv=fail; b=G0k5Ym2qvxRC2kVEmEzcw3U3tk0Bne3wrRXkmv++gH1jWSPRnO3Q0wklNvRk9GoHu6dthe6PETPqqEUObs0igQt+rt4ah+nxgqjZPJ2Yr3qFY//HTufjazd7IGnVhKYL3JW7LeAFP35T3wuHW2RuOJB0+2qikg2qON288BqKy60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759244500; c=relaxed/simple;
	bh=MiViAckainWHNg2HWZWWCX1KMABW2mXQmszlycRHLAg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ui4BIbbEK+xkXKU76WMqhnRKNMld/RFkNHGQa44DoJU0hsOpdcbh195MLzHNAZWLw8qLqNuvSZK5hI6dZNSYD0Fl2NeZzE3vGOox9O/wl+Pe6VMy8T+qCBnAM12oz3MQYvOE/NJopBouYG5MsXKrpUIL075d7hNifwuuGi8HQQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CC65i0rT; arc=fail smtp.client-ip=40.93.195.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsBv2qkFqXqHxL7n9vwRDlOCJUwme/g3M8CT9TgkVZ1mQqyKrqfQtdlIyIKukeQHyeb0IxahykA/yNQPDGl+zQFpQvMGOw1TjF1HMPzZ4K8DRWU5GM4sLbgsSuVsO+8j1mAplnB2GJJMZN2dcY16Lgdh+8BbH8TXLtZbC+QhOc7nNM1vGtzncQrm1vh5GnU5gzMxnA85ZkOpNggF0YriKDZoCwzqKZkA1su9dYZygL7hCpiDWjy28IvBWWzjfRRwkR7z+Avtw11HMJbUILQFF7QzbHaWAu7I3bceOBxob8NJm3jbzMHxFA8k2JFD7I82lkJCijB+C8wftkQsOk0pUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ark3ISzCYuxVEEVnGlQIBFZME+vAVvoh4E3orwNrD9A=;
 b=In+PfyQZoLENTd1im08dy3w3QR0b/jYaPCEqx8fBZwlqjdro1re2GNkBqPqX8xL3nL0aF6gtACqj4NOKeF/y8ov4Ajzq+qcc+S7JZBn10aCg4PJtPL5jUlUzMCxmgmSfxpHD78RWi4XZgeKwsZ5B5ppjRXXtXsAOA2ePQeoDaBNtMBDTqiJwcg/+o2AC7+78qGOz40JkMyHvMMIjJ3cvBjhZXMfw8HAI16KnbTbPfRt2nri5AcBPYBnmPa8SXruzMGDYEI87TCkXNn92cI3d+Y2I8gJAEhfGWVMZ/zQpFQNMUobdJMpw3aDLqZHtLB9dOYq3biNB26NAod23ym63Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ark3ISzCYuxVEEVnGlQIBFZME+vAVvoh4E3orwNrD9A=;
 b=CC65i0rTUdkLI4QwK50lhqKDuYsqGFQweUBIhQD1n9ZNt42yUxetPm7rpcpbinviQkneYv21Zx+7bb3gi5wII46KCnkugIx1rbaf0LRvPtWnhDaHdvneOHruPPcV3vmgh/F8r3ASFuTXH2/djIBS16Zh5X0o/fzVPDVMx61+dSJRJtHxw/LKRJ0EzpOghhGOuxtOzcAAPBGb/9H2MDR0BocPQpHiMVs9vr09qnuwmVcm+o1RGSJ4mp5fFjGVSZHyB7DZSxM3wz37Zor36YTaS5TgygvQn+Zu0v3MxLNCQtqrq8ZdHkzj3JJMv1jKcGG7dNA+7Gf2WvmT/7t2ZOZY3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by IA0PR12MB8279.namprd12.prod.outlook.com (2603:10b6:208:40c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 15:01:34 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 15:01:34 +0000
Message-ID: <d619df1f-813d-4be5-8d24-295455f956de@nvidia.com>
Date: Tue, 30 Sep 2025 16:01:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-binding: Add register-settings binding
To: Chintan Vankar <c-vankar@ti.com>, Rajesh Gumasta <rgumasta@nvidia.com>,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, ulf.hansson@linaro.org, thierry.reding@gmail.com,
 kyarlagadda@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, andersson@kernel.org,
 sjg@chromium.org, nm@ti.com
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <20250725052225.23510-2-rgumasta@nvidia.com>
 <0784441c-9859-4418-a4a7-85ffe3ecf860@ti.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <0784441c-9859-4418-a4a7-85ffe3ecf860@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::18) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|IA0PR12MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 49863dbf-580d-4bb7-4e68-08de00323f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFc2UXRDdk9TVkt3S3ZhVmhPblRjL2VLazNhRExJUk5iWWlZMjRuSHVLdnBG?=
 =?utf-8?B?V3VFbXlMUGFWZVB6a3EyMGxhdFd2ZERsaXVVeGdjdUpxRzh2c2ZjbkR3WTFo?=
 =?utf-8?B?QXUxZ0JTMHVHdUJRR2I3TUpRUFNHVDUrNkVyQ3d0NWVPWjRKSDBXSkJsQ2FH?=
 =?utf-8?B?UUJHYjNPaFg4L3pyMkZMRlRqZ2xGRU9LOW9BR0tDcEEwc1BnRlYzbEZlOHJO?=
 =?utf-8?B?VnJaWkcwOGRCUFJObFdFSEtIYUxWYUJORGpEVFhheGprdHZJbmhhNTNiU1h1?=
 =?utf-8?B?d0k2cUlaZ1JpUEFmTnEzK1E2ZEpUNndrMjJFeWtxY2JNd05pSGlRNng5cW9x?=
 =?utf-8?B?NHVlbzZyZW85K3FXSHBIYWdvSmlnT1o0RERnZHI3WGQ5Q2gxZVUzTkd6TnBj?=
 =?utf-8?B?eHBOYWtReWtKdklDdENkdEdMd2dEUjFaSGxOWGh6Zk9VdVJ0d2h2Y2VCWVdM?=
 =?utf-8?B?Nm1hVXhEbVNkUlQvNHR5TXVLaFJqK0tESUJqMmlSVmtGTFdadTZ4em9NZkp6?=
 =?utf-8?B?WlRhMFVycnFodmx6aEhMeXA3dVQ0Wi9MZWMyaUxRcUlCcVFMNTIwRnJCZktW?=
 =?utf-8?B?MVMrbTZVYzNwV0VweWlqRjdxUE9aTng4dzM0ODROYnNFQWVROG8xWnBqK3I0?=
 =?utf-8?B?K3Yxb1k5bnVZUDI1YjFUZi9YT2FvTk5Db0RKSDZNTExZajZIWDVERk56N25a?=
 =?utf-8?B?b0plUFVkSWVtQVdkbHpldjZKMU9QTGJBTW5URS9UcElWZFcxRUphZnA2U0lZ?=
 =?utf-8?B?KzFlRFZQVzRzV3Z4WEtLUFphdnErSWcwWkt5WloxcUtaL3dRUFhWNHdJcG02?=
 =?utf-8?B?cHkwVk53UGhRNE12YjZwZVBSc0p6RFVObjlsc1FyWkZ3OVlBN1N6VWxWWGI4?=
 =?utf-8?B?RTVIemFlaGRjMnBhK2xlRW12VEIzTTM5eEhLazZHeDBvVTNKR21ISFJxSUI3?=
 =?utf-8?B?a2IydkdHUnNoYTU2Zi83QUhHL0dMaXJVWGVGT1BVNklPQm5DMTI5Z3dDRmUy?=
 =?utf-8?B?REJkNHhoWElDYjIxb2o2SjJJQlJlS3pjQlN3SDFWY0Jlb2p5MEJoRXJwNHJK?=
 =?utf-8?B?MFM0S0xRT1p1N3hWRTZrM2w0MTVISEdNazJ1R0dVMzdlWW10TXFtRktteDI1?=
 =?utf-8?B?L0U0WUdybDNYSEZlNnBVRDJzZFllM09uMGJOWmVzUlJ3WUwxMnloemZwM2FR?=
 =?utf-8?B?alI4V2o3eHRVaVdjSU1aRzRIaUlseWlsQ203QjJSNUgycDRXeHp3QlRUaVo1?=
 =?utf-8?B?WUdXNVJRWU5sUVVxY0lENmlTdWdrbitmellSZitaQ3B0T2FKTGZ5UC9INkpn?=
 =?utf-8?B?YytKakdYUFdLMEJlWnF4VTRKa3ZEdUtJZ0dwbC9OTjRPckx3RGV2M3JhcWtW?=
 =?utf-8?B?RXkyZ1lMM2REYjZUUHNWM0JFS1ErSE5RLzl0MEdGYU5KRE5sS09Xb2hGckZ2?=
 =?utf-8?B?c29Sc3NaVmJLK2VQNWdlaU4yMFV6eDB3K0d1ZTh0MmxDMXBuaWVURTd3dTli?=
 =?utf-8?B?U2lzeEg5ZWVWOFNEM1g1ejdLdFJuaHhmMkRleFFMMlZKWTE1OTAyS0R6Z1lT?=
 =?utf-8?B?Q1htMTVhWmxyTGlzL1owb1lhWndrK1ZSMzJuSHZ2WG0xUmFtZ3poWUdvbHpV?=
 =?utf-8?B?WEFWQnVEcEF1RmJGODBOWU9wNUIvYXZDOWdJVkdpV0JpOGwwTER5WEdidCtN?=
 =?utf-8?B?K2hTemlHd1lZWkFCTWVIMnRCVmVRS0hyV0hnRHJrMzRKWmJNbjlyMHBmSXR3?=
 =?utf-8?B?YjZNNElvaTNGQmN1dTR1SXUrMHVwVjBUR2R1SmpLWFVNemdBZktLQXorbXYr?=
 =?utf-8?B?SGhoZVlDS1daTEYyNzQrcFhZSm1QSDhHQlpqeFZFUXJncXdNMXhJa2VQSWlR?=
 =?utf-8?B?ZWFMQm05aUE1YTNHekYzOTM0akUrazZkMFM5T2pMNG1PalozdFAveUg3elY3?=
 =?utf-8?B?US9oV29lbDV0Uk1mM3JjUTNGUmc5eTMzdWRRbXEvdjhQSUtZd01paHJHU3hS?=
 =?utf-8?B?VzIwUWQ0dVhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmJKdVZFd2JKdW5qRktGeGhza1JFWFNvMUhJeCtiWURpU2huL2tqOVoyN0Yr?=
 =?utf-8?B?bi80YWQ1YmV0cUdsblpxMmJ2RGR0L0lCYjhrQUsrMUZEV3JhUVhETzNjdWJm?=
 =?utf-8?B?VHh0eEZzeVdNay9NLzUwWnJjTjU5S0tEYUZ3eGpobnNMaXBIZUx2YVJSR0tE?=
 =?utf-8?B?RnE4UFQ5ZWthUGZaZWhncXV5WEVoeXYzbXVhcHRlUnRxTy9ERHdISnFwdm0w?=
 =?utf-8?B?VjlvdStEV1IvVVpWSUpiSEFwTGliRHI2c1NXWERjRG80T0N5VDZTTHhtSFp1?=
 =?utf-8?B?WjluU0IxMGR2OVZIUFlMMlpRK2Q0ZlIvTDJRY3dQOG5lYXBGZXd2Ym9CZG1z?=
 =?utf-8?B?ME9tZkNKNW5adUZvNGVqL3hPeUxvRi9EYy94b2ltSnhiaUxMb3hnZ1R6TUpa?=
 =?utf-8?B?aStDN0ZnK1lNZlNJc2dPUUdWN0NKT2VLTjQ0TklWbXMyNU10cFBuR0s0R1Ez?=
 =?utf-8?B?ck5pdHFheUhKRHJLazFhMjc2MFBUT0xCakd1MkhyWVM1TElheFBJKzdRK0Jx?=
 =?utf-8?B?ckR1YlYrOVBtZzVUd1dyRmNyOWIybDA4bU8zd1lZVTRJRG1LaG1nUGRKQVFx?=
 =?utf-8?B?NXlWaWUyZE1KR25uTkZKVDh2b3BZOUtpR3JlSDVOWGc4dXFlS01zU0dBSUps?=
 =?utf-8?B?OHdSSkNKWHNzbVB1UHNydUxDazFxMTRVRnFDQVdUdVFGMVowOHdRc2o0T2Nl?=
 =?utf-8?B?TEJEeVFsTjZVc1FJSDV5bGFycXpMSEFibzArc1d4Slp6TDVIeExBWWNxMHpW?=
 =?utf-8?B?VWFNb1RkUWtVYzNXQ3dYTkFaME1JR1ZyL1pDTk5vbDJ5WGVUbUhpNEtZZzJq?=
 =?utf-8?B?QlVGUTlrVXNPcFUxZ3NJb0hZUXg1SlF1cXo1b3hLcGlqem1GbHkzWmRnZ05o?=
 =?utf-8?B?RVd6Znk1RXVKWjBlQnR1akkyRkt2MzdWdnNNM1BvWDlBckpITURjc2cvUjkr?=
 =?utf-8?B?Z1lTTGE0UUR6VmM3dnpDdk5RQm0wV0Q3QU1WcHFRankwWkxLbVBocVhFVytx?=
 =?utf-8?B?VDlVV3ZWS1gwd0Q4NUFNc3NmbUlYNzJjTi9raGdIRTlMT2x1TW94cjNONFlS?=
 =?utf-8?B?T21KcFBaZU5jdmpERkdWQXV1M1R6dkFmTldEV1hOZHdnWnNMOFg0ZzlQQ1Zv?=
 =?utf-8?B?eE9tYW1WcFRObThibmp3ZVBtS2NIRnVjQ1lqUnBZOUNycnNxZUQ3VmNrdVdi?=
 =?utf-8?B?bzFEZmJzY3Z1ck84c2xHS1NFYlp1ekdoT3J5UThpYmhvRm9LSk5DUTV3UUZ2?=
 =?utf-8?B?STlxRU4yNld5YnN6SzhHclc1VjFxOHMzVEYvUlgwSmhtc3VlalN0OU5qWUI5?=
 =?utf-8?B?anVuNGp6ZHlvMjU2TGllVVRzbU8zb0VkVHFLbjVIbDBud05Wcnk3MFpmWXZs?=
 =?utf-8?B?bHEzZGg5SVN3czVKK0NtcnRIbnpZaE05b3d4bmdHTzEyL0d0MGNpYmwwa0xE?=
 =?utf-8?B?VFFhTERhN2p3b2xScU5zTDVqak1OTE5oUTVBam1XUDlDQXZoY2VCRS9XY21w?=
 =?utf-8?B?U0o5cERVMFg2WmxGRlhwTjBlSm9hSXZVdUdqcFVoOHhmb1pHZ0pqQWVjWWov?=
 =?utf-8?B?dXlkWUh3SFl0QVZHb1hNYW5NTWYwVkJDMjhFNUNtdzFEakZkUk5rR0ttS1hp?=
 =?utf-8?B?M0JIUXZPMEorMnM2aXZkUTlJdW1wd1AyOGxZc1A4RzNlaTlTamc0elFCTFNr?=
 =?utf-8?B?QWVxTGtMSDZ2TUtOUmNKa0Y2T3UrMUFzWkpqaHNGYVhjTUJrbFVFNWo2OSs4?=
 =?utf-8?B?VGdJZ0NZbXJPOFphc2w2S3JEYXZ2R1Y4VE13aWF2U09hZm1QVGhrdms4MldY?=
 =?utf-8?B?T3h6d1VCTksva09FUkJXMVNPVHIxZ2k2OVJ5YnRGb0NNTTl1SHR2OU5YUUti?=
 =?utf-8?B?WEtVRStrQmVQbzYyR3EwQWJFUmlsU1BsQ25meWZTK3RzcFlwa1IwazRyak45?=
 =?utf-8?B?UVRqdE9QUkxwV2tCaHVVeGhuOVp4dkNUZUJpbHZtcHpNR0plZ05VYmI2eVNm?=
 =?utf-8?B?R1hZSE5CM2h1R3BXZ2luaEkyREVxQVRzc0VRRk53UmlQY1BJR1U4Q1RoR3dI?=
 =?utf-8?B?TDZHSno1T0E3ZkU4eWZ4T3RrK0NyQnVyL0krS0praHlpRTZhMWtzMThkSVF0?=
 =?utf-8?Q?FIKPsJPtH65CbSFBgYqxSzg7m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49863dbf-580d-4bb7-4e68-08de00323f0d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:01:34.0913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Qn+QMZZ0FD7TCnz9sZnuKLJYP5u3YJaPfzD7GASiWT48GkSLuerkNTj2S4tnhEcoVZjrN0y62EtShCNYQJmEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8279

Hi Chintan,

On 29/09/2025 05:39, Chintan Vankar wrote:

...

> Following your series, I would like to bring to your attention that
> Texas Instruments SoCs also have a component which requires similar kind
> of configuration, named Timesync Router(TSR). It enables the
> multiplexing of M inputs to N outputs, where inputs can be selectively
> driven based on N output configuration. A detailed explanation of the
> TSR and our attempts we tried to implement TSR can be found in following
> RFC series:
> https://lore.kernel.org/all/20250605063422.3813260-1-c-vankar@ti.com/
> https://lore.kernel.org/all/20250205160119.136639-1-c-vankar@ti.com/
> 
> To implement TSR, the relevant registers must be configured via the
> device tree. We initially assumed that the device could be handled as a
> mux-controller and could be extended in the same subsystem, but it was
> ineffective. Having explored both the approaches, we now plan to
> implement TSR within misc subsystem, which aligns with the dt-bindings
> that you have proposed in this series.
> 
> The purpose to replying over this series is to inform you that we also
> have a component requiring configuration as outlined in this series. Let
> us know if you have any suggestions for this.

That's great! Thanks for the feedback.

Rob, Krzysztof, Conor, have you guys had chance to look at this series 
some more? We are open to re-working it as necessary to address any 
concerns/comments you have. However, this appears to be stalled at the 
moment and I am not sure what we should do next to push this forward.

Thanks!
Jon

-- 
nvpublic


