Return-Path: <linux-i2c+bounces-13413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8873BC4343
	for <lists+linux-i2c@lfdr.de>; Wed, 08 Oct 2025 11:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B47A19E0E09
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Oct 2025 09:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3682F4A10;
	Wed,  8 Oct 2025 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FWxthc/Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713D25785F;
	Wed,  8 Oct 2025 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917150; cv=fail; b=u2XNUQVe7Zhcwk+KE/u2WiSL9efH64hcnOrzpDob9t5qcMCoVROul42O8uW4qCWBGyb+puRM84MbJtqXHQ0u5ZpJiJCeIyZ8megHpczme3I6GpjnYGJOcEr+bONcyQDD3Q6edRVhtwZbotx5pmiotfNS+jB0cDaER8stK3cdky4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917150; c=relaxed/simple;
	bh=3o9KJj9XoQN9PLWfYAIF9KQXgGpaujtKo25r7WkpprM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DzRYbA5kk1FQL5C5Yquag24ROZXGgKx48DukRjEZ9EGkNjzYToftgR4zM1XEvYaTK5d+bWQCf4tZ+vJDE3l4nVhxa9D9hAtfRwhQ6qBcHNS2xjeD1+aPZYv/l1mWCsePLn4Gcy0sNFQPXCcdc+m4u1EHozgAQiYMYYJZS32Qqrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FWxthc/Q; arc=fail smtp.client-ip=40.107.200.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3z8gQSByAEol5Mrsj2h27e+AF7T4qqPhZ3oB2JD1vtCgkTSA2lVOhbLPirRZ8aBjL9q508jlTseQfI4XadVaDbvzktdu9JU74NdOUqKZSPn0NrutqgEQmWwbQxj2GGheSTepq/ukgegU5kzeH8qvtJXto8NJ1ndEdyA8T32EOc2+0QDFCx9Qgz/S1/LUnwKfrtJ2kN6UggIMpjCxa7hMknSyGcdjj/cFlRbBPN8IXRzx4StnTayXRw7JT56WC8eBcZv2rPVQAoYh7x4OWF7ANJDESuR4Ezc5LiTYASgODGuYomjrW2Ny9puse//Q9qRJvHBOz0bVzOzvnBu1NkRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAGPp36m9uLAVp8N3lt9uHqicaEMTO2ntks3b8HsSNI=;
 b=Wip58ddqT55wQUy/DVTueJsVEIRTM1xpPe05Gn3SKPOsXe6ya4BMXbg0egoJQ9XZ6FRmvc3uCEP+qWDr+uAf3bM+crOuCfXzkXlpRzbtwjEJS3B2mXUVbuSc1JWzMzBBB81xNylD8GFaP2UNkKcbiWsqkAM0XTY43rFn2icNC3aM3XqGnt6advLKUreTiiF0nZ+0O0YI4XjJRuP+io+o8CRmdBsUnUr7ZJwVQlwO72IU1xH5+Icvjj4YGW/AYV/q4Vm6Hxo2MFeaOdl0FSqWP0e4qOD2yeDWy76D5GjE2XZdya0vkfshTGUcoUayV9fnrAH2RjHufRzeKvXM1VCPkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAGPp36m9uLAVp8N3lt9uHqicaEMTO2ntks3b8HsSNI=;
 b=FWxthc/QYqHH2beL6BlAPYz1YK/9iu0y1DP2j6DKhsHA+/yWYpfTjbzw+xrAwaIaKGB3ASqY2WY7uQus00nFhigOhRxfym3/Tf/f+/vRTKe/CCKbotopS+dh8VXJtyVGsVVqWBkeKUWEUl8pciSWBhay2Oc1g2T8bU3EOtgvb+I39yy0DRkg9veGY0LMkZ8CytUMVPot4cUiKYmDfGRgUKkoUFvK4PORuSuz9AEhik84vKpa3hryK3muWlzcuszznbxSrEYkYvQrScFXI/xkF5rt/m+5AgiEhDsxuq5ehGE/1vVDxcJEZgUkAYDmaEwkdNCvQkb9gv/GBp8rC8sDOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Wed, 8 Oct
 2025 09:52:21 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 09:52:20 +0000
Message-ID: <f954b162-f9bc-4693-92a5-8ac73b3a788e@nvidia.com>
Date: Wed, 8 Oct 2025 10:52:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] i2c: tegra: Add Tegra256 support
From: Jon Hunter <jonathanh@nvidia.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, krzk+dt@kernel.org, ldewangan@nvidia.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, robh@kernel.org, thierry.reding@gmail.com,
 treding@nvidia.com
References: <91da537e-01ea-4b51-8493-8cf88d64b435@nvidia.com>
 <20251008053530.27253-1-akhilrajeev@nvidia.com>
 <4a434229-31a1-4f16-94dd-9adcaa6f6932@nvidia.com>
Content-Language: en-US
In-Reply-To: <4a434229-31a1-4f16-94dd-9adcaa6f6932@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::32) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbc0141-eb36-408c-ea67-08de06505fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWRiQ21oQzJjb0ttOG5uUkhEdjRMY0NidEZCV2xSTHJUWjlMeWd3alQvQVpH?=
 =?utf-8?B?ZmFwQXpwTVRSVmhERG9UVjFmM1JZcmsyL21NaklLc0FkNGRRTWhSNmFJWjhZ?=
 =?utf-8?B?c3dJYk5kNk5UM0hBdjlXZ3FYY2w0RVpZMk1wbmIzTGhESDQyT0k3cFZaT25U?=
 =?utf-8?B?TW56Yzh1bnFZaEpKTXRLNWZ0M0lQVGNTREt0WW9pZGNnd0NkZ3BNbUNFVEV6?=
 =?utf-8?B?T2RnZDhNWExteFhka3RrckJlbFBNWlh6RWFvVmExdDZGcGNrMllNWVRhR3RD?=
 =?utf-8?B?aSsra2FmL2JQK2g5c2hxeGg4RGFscUdOZUlTYk9KOWFYcTRLdW1ScUZDaXEr?=
 =?utf-8?B?djh6blVud0RYY0t4Qk5ZY3puNzA2TUFCRGJvOEtieTVza3dPTlJMUDFOUHN6?=
 =?utf-8?B?OFgybmxiYnpHYjFKVVUvaUluZ01MUit6c0RkbDlHL1R1TjBWRVBNR2VRRDht?=
 =?utf-8?B?d1ZOMG9JOTdvTVFEejRJRHMxaWJ1UVZPTDJEUzRjcGZuUVVNcUdYa0t5YTh0?=
 =?utf-8?B?dFdtZ04zZytzR1k5Ri9XWDVtTDdTOVVuZm44bjdvYVhsMFpUNXNGbFFZTTVp?=
 =?utf-8?B?M2JJNHVtMkJ4V1BNbW9zKzRNMmFxTXNBM0UzUmxCMGhNMFk3UXhsNE1xUGFZ?=
 =?utf-8?B?czlsYkxKL3F4SW1acVRwUDBIUnlzV1BRelYrYTF4cDlhdmhkb1JraXdKbXlm?=
 =?utf-8?B?cFhtSlZiTjVkNTIrdjgrTytnREtMclMyQjl3dEdtVUVPakVNZldJT1h5TGQx?=
 =?utf-8?B?YVAwM0Q0cnZvWEN6cjZ3bm1VdjBuczQ4ckZvZ3c2VHhiNVpFUENvQWtGc2tQ?=
 =?utf-8?B?YmlNSzY2OWk5a2d5SEQrT2EzaFRzUDRJaW50NlhSRm9qWUZDeG5MSDU5R2dQ?=
 =?utf-8?B?WGtjTStEcVg3SXV1Zm52MlZEWmRqTDFRQ2lZK3gxczA0Q3Y0dmh5a1lTM2FE?=
 =?utf-8?B?aE5TNkpLdTBma01jQ2xyT2FUemxiTlpHODJqN1BCbEd2bVc4Vk9HQ1FNT2pW?=
 =?utf-8?B?RDRJNXFZRldlU2NGZXRVUHJKVWZWU0dXWUdjQUl2WnlWU2FqN3ZacGRxM0pj?=
 =?utf-8?B?ZWVPc2RIMy8waXpTT0srSWltaXg1dFNhZldyczBHS1M3OXFWR2t6dW1OZTVq?=
 =?utf-8?B?NEs4aUpFUlNEUmxmd0ViNDdMYXhBWEFoL01CZ2FTRVZVbEJqQzA4TVRaMHY5?=
 =?utf-8?B?cnpzMnlQaTlFRXFQTnNtd2tHc1FHd2k2L25aUWh0NHBFOG9VSWZjK0oyVHZ6?=
 =?utf-8?B?OTVOYVFtUE1FSTBwVkIwWmtwYU5ISll5YTR6dG1PVGJDYStpZDJTaGVPUll4?=
 =?utf-8?B?V3h5a1dRRkZvUGtQS1VqS2xRNjR1bWZOdWV4UW9ySzUzSmlpaEliM3Fqb3Bs?=
 =?utf-8?B?RktZNExWQnFkSmFrQUZvcVAwSWdFd0tUZjNISzVtdnFqdTNRTUZZL3BKRWNR?=
 =?utf-8?B?ZHJ3aDEwRlVoVmFVT2hNa0VqdHVvZnoxTGg3Mmt0VTloM29oYUdkc29kd0dj?=
 =?utf-8?B?c0ZoZXA3K2p3YkFhNFhnMTdGNC84c2JvTk9HaXZVYWY5WmRoOW5hSnZIQXpE?=
 =?utf-8?B?WmRHakJjN2hUSFFDTjdNV2RZeFpkVnhpZE1wU1FTYXNaV0Z0UTRDTkFHMDli?=
 =?utf-8?B?KzZ5TXkvQ2p1TXgvWTBITEMzLy9xQzJtUGMvRjlITWRha3cvN3ZHSFhKcWcx?=
 =?utf-8?B?eGZOSFVmQ0Z2dklNNjFGVXhxNnY1elhsRXhnWnJha3FIZ2Y2TW12M3E0RDJF?=
 =?utf-8?B?NVpNVmJGc1dJNWhkNFJaZ21VVWpyMW9ZcjNxNG1IdlkxVXNlaSsvOUJhendY?=
 =?utf-8?B?S2lKNTh2aVZRNlZsTWcrWjkydzRadllBZ3djNDlDWDdwZk92bEFNVUZDcGJj?=
 =?utf-8?B?dkVoc2d1NjZXcEpDL0N1OW1Xa0hGV09EUTJqOHdvQ05qdGVVcEh6ZjNDSUl6?=
 =?utf-8?Q?oyWRkFyq7ZuEubDhe5UKvyI8dh9nkrJh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2lBQU5CY3lONEJOTmk1NkNKZ1psZVZjS0pQVytwNmdySGtuNEcwUDdsMXV4?=
 =?utf-8?B?aGgwbFpKbWdqVjB3RDRmaXVhV2xINTZ1RXZVMzQrYXZKZ0tySkEwdFluSEMr?=
 =?utf-8?B?aDAvZ3M3MzhXYUN3OUtpWjBIVVVkWXJhRkFBdUNpWVBrRWhQcjUwNzNMZm50?=
 =?utf-8?B?MlZ1MDRlYTBNQWtHTm15a3dCM1pGNUZPeGZ2QTROSEYzMFIzZVgxRER2OXA3?=
 =?utf-8?B?cDArMUo1RHRBL2Z6YmFCcW9yVHpxcnRwRkg3UW1tUVNtUGZYcUVwcElYZW5t?=
 =?utf-8?B?bmptRUd3TXFTMXQwa3QxTkpqK2dIdTBJVWw4NEZNSXU4ZG1Ncy9ySzR2WnZW?=
 =?utf-8?B?eWdQRzhTTXMwOU1EYTlESmdtNHBMdWdHdzd4Z2VQWjBPWncxR01rbEZrbHB3?=
 =?utf-8?B?QWJtQU1tRnB4L0EwelNKYU9GbWExamU2ZHEveENaZG9NV243ZG90K1pBcW1P?=
 =?utf-8?B?MFlYMDFZTnNUeFhlRjNuMnBsQlVESUZ4Z28wNWJEUUp5K2Z2WWY2dzRNcGFV?=
 =?utf-8?B?dmQ2VExFWThOb0MwVld0cXN5U2I3SHJ6V1pIcUxUNDVhT1NneFFnVnNxdjFp?=
 =?utf-8?B?Tk9scHBZQXduZHdjdldzcmhtS0UzWTVzSnN5Vm5ndWtYLzZFcGcrc05WNWpt?=
 =?utf-8?B?MVpndFNNMDh5L05SdGM5U0t3cUs3K1BmNTdXZVRqdHVQbkdvclcvR2dFYlMv?=
 =?utf-8?B?T09mOHJmbVoxQnE3Rms4WkVFRlFIZjU4a1ErWVRHTHpYMm0yT1g0YzFodVNy?=
 =?utf-8?B?VG4yZDlQM0x1RzV4b3hOZXp4NFdiV0oxaHhTQ01MNEV4VnUvMFBnYWN0RWpy?=
 =?utf-8?B?UVJTY3Q1ZmFWZjNubTNYQm5LQmlBL21KZWR0RzdZVzZHaUYrNjNYTzN1WjNS?=
 =?utf-8?B?Qmw2L1E4dE9yT0ZYcTZzQzIrT2lqWE5VU0V6bW9GWXRlVm0wQ3MvVnVtQlQ4?=
 =?utf-8?B?dUY0Z2NsZ1dCTWRPZ0g3Zk1ZaWNVOHBvRitIOG5JZEU2ZmFtaXV2SXNVMTJU?=
 =?utf-8?B?dk56VDg4WEhpY2pwQi9UVXcvQndnTUdYbWNFSUZ2MlZwOFJOcUhScG5NOEY3?=
 =?utf-8?B?TUY1R1ZQVmE4SGlZWS9PeHZ6YkwzUDlZK294aHkxM0tlYlRBYVA1MEtHV3No?=
 =?utf-8?B?Wm9Xb1lDRjEwR0ZZeHhHaklUenl1TjVkSGZHOU5kVjBtWDBNT2gwMDZZRUd1?=
 =?utf-8?B?V2UwZFdHUmZPeWlUV0VveWpKMGYzZDVIeUV3QVJTaWR5TmdsYnlVWEZMcHFH?=
 =?utf-8?B?QnlJc1o0NlUrU3pGQ1doUmc4QTdmMENxcTN6d2s1TUtBTnRpak5IU3RqazJa?=
 =?utf-8?B?RWFxS0ZLR3Z3dVVmd3dwWm5QUGxMWEdrbTNvYTZ4Q0Q3TUtwemwyQjFTSys0?=
 =?utf-8?B?UVR6S1ZpL3VNbWNKN3hwcG01ZnQ2cmd3MkdtVHJ6cS9pbFhRUy9yTXdCNVRm?=
 =?utf-8?B?eG9sS1M2TkhtTE45bnlSS2JGS1pqZmZSamphSkxBU1c3WFBHcVBheEJMUVE0?=
 =?utf-8?B?OXBGOERGa3BIUE0zYjNpcVNXa3RySVlmSWdITE5LRFo1b0tySm5KU1REQnBB?=
 =?utf-8?B?V0hia1dVMUVoWi9MVmhoMmh6empjSU1GNVdxc1JZa0hyOUFKcFpuTSthSE1Q?=
 =?utf-8?B?Z25MMUZYOFFOV1JCOTI0VEZzei8yc0gwTldaeE5LbnlGUzlVMWx3MGVXRU9s?=
 =?utf-8?B?OEg0djZSU1ZDQStGT01ZOEtyY1J6UlU4aENoM1A3L1dzOTN5SUlJRW1GaXFO?=
 =?utf-8?B?TEFzMm9SR01zVXM5QUhWN3ZlOGlZdURjTkxiVFNlcHpxdUFncnhldklKMG9W?=
 =?utf-8?B?ZVhlMWxkSDFlRjNvUVU4eHduVVlhY0hSS1hkR0EvSTcrT3RoeGthK29DdEJt?=
 =?utf-8?B?Z2VhNHhmS1VOOWlXTUNuamcvZmF4M0lMNDF3ampQcVpVR09XcW0vd2tNYTRL?=
 =?utf-8?B?NlN3NWFrbnM1Vkgxa2ZjeU56L1RBTzlkRmFyRHRiaXlBbFBmNk1nc1RtUHZk?=
 =?utf-8?B?WHB5bVRSNlcwN0ZLTnZCbTBWdzhPZUduSllkY2FyMjNVZEpSckRubW1KdDJC?=
 =?utf-8?B?SlVETjJnM3BLVUxkZFdqYXRlbXI0NkJJMmJmRlloNVZjdk1seVVqU3N6VHpF?=
 =?utf-8?B?ZWxKK29uelZ4d3diK25WczJ2Rllib3FCdE15TzNiZWFEN0V6SGhRUXZZRVpp?=
 =?utf-8?Q?rSgkmDMLHhxV7Ld8i4nYTgtHaSos5jUsJT1svVhN6Qvt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbc0141-eb36-408c-ea67-08de06505fb4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 09:52:20.8484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRkEzvmr6Su7JvnCtTRqV2IHUdaIXwrlQOmN+NNjGabHrIKeICrKG0xUxoxzUc09sek/IOwUpoTEk/CK1v2LNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760


On 08/10/2025 10:33, Jon Hunter wrote:
> Hi Akhil,
> 
> On 08/10/2025 06:35, Akhil R wrote:
>> Hi Jon,
>>
>> On Tue, 7 Oct 2025 15:50:56 +0100, Jon Hunter wrote:
>>> On 18/08/2025 05:33, Akhil R wrote:
>>>> Add compatible and the hardware struct for Tegra256. Tegra256 
>>>> controllers
>>>> use a different parent clock. Hence the timing parameters are different
>>>> from the previous generations to meet the expected frequencies.
>>>>
>>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>
>>>> ---
>>>>    drivers/i2c/busses/i2c-tegra.c | 26 ++++++++++++++++++++++++++
>>>>    1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/ 
>>>> i2c-tegra.c
>>>> index 4eb31b913c1a..e533460bccc3 100644
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>> @@ -1649,7 +1649,33 @@ static const struct tegra_i2c_hw_feature 
>>>> tegra194_i2c_hw = {
>>>>         .has_interface_timing_reg = true,
>>>>    };
>>>> +static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>>>> +     .has_continue_xfer_support = true,
>>>> +     .has_per_pkt_xfer_complete_irq = true,
>>>> +     .clk_divisor_hs_mode = 7,
>>>> +     .clk_divisor_std_mode = 0x7a,
>>>> +     .clk_divisor_fast_mode = 0x40,
>>>> +     .clk_divisor_fast_plus_mode = 0x19,
>>>
>>>
>>> Can you check this divisor value? I see we have been using a value of
>>> 0x14 for this which does not align with what we have here. Can you
>>> confirm if this should be 0x19 or 0x14?
>>
>> If you happen to notice, we are using a different tlow, thigh and hold
>> time values as well internally. We are also using separate variables
>> (tlow, thigh) for fast and fastplus modes, whereas this driver currently
>> uses the same variable (and value) for both fast and fastplus mode. With
>> that limitation, these are the closest timing values we can use now to
>> get the required frequency.
> 
> Yes I did see that we have been re-working these variables and separated 
> some of the variables. However, this parameter itself has not changed 
> and now we have a different value in upstream. So regardless of the 
> changes being planned, I don't see why we are not using the same value 
> for this variable everywhere.

Or are you saying that this divisor value is correct per the other 
settings we have here? And when we push the other changes to separate 
the settings for fast mode and fast plus mode, we will then update this 
accordingly? If so, then that is fine.

Jon

-- 
nvpublic


