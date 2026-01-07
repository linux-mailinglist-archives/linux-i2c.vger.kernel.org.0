Return-Path: <linux-i2c+bounces-14940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF63CFBEAE
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 05:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6ABD330034BE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 04:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E10419C566;
	Wed,  7 Jan 2026 04:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sDOFw1zG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0797542A9D;
	Wed,  7 Jan 2026 04:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767759040; cv=fail; b=Un4ENGxHZ05DziZygzblALrA+yZth83ey6iFfC9HCiWP8Tu7cKPffYOeICFEXRmbn+r2HRgb1p9crXFoNIgOznHSVWw0lJxe9yYsUqYLBZ0GRaK2zFlBzkdxQMOQAxc8xZn8uEFmfO+0R32EoopoEGUkNdWQ2TfB9+vEurUvA44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767759040; c=relaxed/simple;
	bh=oLka733ksWygLKMGrf9hlZTaG1w5rw50fmdvc9uyW7g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WFASbjNPlwznFGXsT/NFV0mqwnKMl9wX5u/uNAa0+OWihogJZP50MH5qcfTJvP3hdXmqHEJW8Z7N+hM86m6hfEzYeBqNawOo3d/J2Fb+YBD/8kc3Ybr5YYyeXCfUuAZW7a7Rvh00MqytAPoHfncSN5rUFZNGklNSlCq4PUhzLtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sDOFw1zG; arc=fail smtp.client-ip=52.101.52.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7RQSZHJzxggXmkS3iUA8ZjbEmkdn3cMePZZ5nvwM0MLL8MpQqcgqVn+Z/quAGJPRMVcWKM1VrTa7m+NfptQ/uQKIGKoM9alt1d6w6RvvuCpjZ256PDjK8geHpBOsYpppalg1T8Gs+mHLrZee3JILe/TduxX2QzmSJ/PvAlqnmBSGNcP1JyyFZ41FYKLwAVUT4lv4hxAidv/IDY4a63RrRLp7SBkNsV377tQogSD/GMbrex+5ycCRYJbrLE2cjWfCMGuh2sd+20cF98L/rPZPojXrWZBPcDx6wcWnxigkWOEp/v7dnwaiQ7WnRMwtAtFRCCbm/mnQF+lk974zFljwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuklfLNcAZtqVtmatrpx4RiBm4YijVgIobC7WP0YlHM=;
 b=L79tG9Z12KgHBb+rcYoKI2sKw0Cua5X+qqqoBTtAGZMTi3RpIMbjB77qZxo8D1lwBQR0QFBo0hxwpebg5lN2i2Jqw6do7YWJN3NR4oYo4AsFqIA2MiN5f0ZIciwxXdy9XRHc1YRM/nKmNlff/zPWDeld9xTMApCdGHZIqFYRafITgdGSbrj6EuuOwrCbSOqP92jTRlUiT1bjAqtlJJ4S6lSuYdLjzGDWYARKOjYDuOKkfIWVYaTehSzRoNQXY+BbzeTOx4Pd1eGHkhTlu/ckOIZvx6qbQTam6SS/LpiWW4BYsmnC7klK5P7rCv7FAMgfbADmVucg4tyMfEkjJvBzJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuklfLNcAZtqVtmatrpx4RiBm4YijVgIobC7WP0YlHM=;
 b=sDOFw1zGJZnixmXfBIk+Gj8QsoJ/aZBAV29C7mCjVLflR/ib6IO6AFmTj4cte8QXbCIoJR90uFtRB39LmzErQDw1pJ977cqjajWnLWoZtDIPcvMqv5JiS3KRMzXOe+SjyKFZFfW7rN5IJSzA5XFDprh25OdthKsFg3TWAkk1lq3G2M+5UQzlCp8Aw3v2Sbo0MvzVGLBsKOTNS2HsUI0YTTUPtxfXxVrgueu9JxZpusGSH9cRKN4QUDoBkwfcNCbIE2OCZrlp1g49m6B6b46hMM+/FJpmeQuSIN4W0ArBDrEsmqwrDsn9/L+UXvqLOT/ScQqiQ14nDrZsVpwdqdzmaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by PH7PR12MB8427.namprd12.prod.outlook.com (2603:10b6:510:242::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 04:10:36 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 04:10:36 +0000
Message-ID: <e3a6d4f5-87cc-4d22-bf3a-f1067fe152e9@nvidia.com>
Date: Wed, 7 Jan 2026 09:40:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
To: Jon Hunter <jonathanh@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106111033.5556-1-kkartik@nvidia.com>
 <20260106111033.5556-3-kkartik@nvidia.com>
 <e4be900b-207e-49b1-a7d4-5cf88e0caf2e@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <e4be900b-207e-49b1-a7d4-5cf88e0caf2e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0124.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::10) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|PH7PR12MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfc1fa5-5ca1-4708-9575-08de4da2b57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3VWOVZyUXdLMXB4Q1pJMUFMeHhQcnZ2VlNoWmhNN2YzMFBtRzZJM1kyeEVa?=
 =?utf-8?B?OXFXR2w5Q1FrTkozWGIzdG1NMDhWWEFwMzZ0TVUvNUo3WE94ZU9OdnFZSWtY?=
 =?utf-8?B?ZHRkOTRUVG9mV2x0NTFmNXRIOWo2NTdKRlMzRjNjaHRZUVR2L25MVG5BZU9F?=
 =?utf-8?B?aXZSVG1yeFdIWjV3SGY0UzVVd1l4UnBsTW9LZUVJc0ZZWWZWNzVYK3NHbS9k?=
 =?utf-8?B?WG50SXBwVHgraXd0OEw4eUtnMENsR3M5OXMyRi9OZ3ArWjJBbUU1SWRrYURV?=
 =?utf-8?B?WnJoWXgxUlBJZHZiS2RjTUR0QSt0aHI2OEhjQkJzRmZqUmlJTFVWTWVuS2hm?=
 =?utf-8?B?SmlqWks2ZW1HVHhEVW96aTBLZ0F3UW96eTlVbUpGTGpvbURQNmQ2KytsRzAz?=
 =?utf-8?B?M0MyTjZrcXJxZ1l3dUlVMHYvVkM3UmFPRGNLaXYwdmhPKytpa05UdmE4RHFy?=
 =?utf-8?B?RFBJckdoNzdtbVZabHU5emQ5VFA3RXhMcXlMQmQwTVJSemwyQU9LcVVISUhO?=
 =?utf-8?B?T0JNN3h0RDFZaVB5eWMybklmSEJGUlZwb21iM3hUV05hekNUNjFERHdoR2FE?=
 =?utf-8?B?SHZyeG5xUm5lVnRIT0JOc25Ka0o3WG00R24xdXk1Z2ZlTERlakdQTkN3NG9Y?=
 =?utf-8?B?am5tVnV6M3BTdGJ1ZzFRVG5RbWUvOW5MZnhUeGplaWpWSlpkcFArVzdURHF1?=
 =?utf-8?B?UWJTcjlBNi9QMW5QTnQ3YkdvTUpqbnlRTkpqVjE2R1dyVXdnV05ucDZZN0xJ?=
 =?utf-8?B?V25PVzNocm1YUUhKRldlcytSL3prSXFBWGk5d0FZOThGRWhLREJ3Ly9neUZT?=
 =?utf-8?B?akVSZjBDVGJpOG5yN3ZhclNMNHppRUdJNFFnYk1kR2h0bjdFQ2hvc21FMGpy?=
 =?utf-8?B?VGpJcHdHaGYyQXRnZlczYTFzckQzN3o3WlRIQkFyRlpKZytXbmpvTDlYWEVC?=
 =?utf-8?B?UGhOMUUvV2Vzd3ozbzZ3cTQ4YytFc0kxRk1SZ2ljNVQybEZvWUg4ZG9mazNm?=
 =?utf-8?B?bU9ROGV3R1ZuN21ZZVdrKzNqdDlGazBOYytGaW5TWHFoMEhBUEphMFFDaVhK?=
 =?utf-8?B?UFkxT2FLRFhzU2wwSXJzWTIrcXRmUHdIZlhkcyt5YWVEUWFqUkw0N1N0aXBx?=
 =?utf-8?B?R3J3UXExazQ2c296R3YzNkRZZ093Q2R5Z3B5clo2L3BYVFZtdjQxK0hVTnN6?=
 =?utf-8?B?Yjc1RUFITzV4SUpwK3RYL1cwcXlaQ3IxbC8wRVcyOWFINjgrU1FJVExKUm8x?=
 =?utf-8?B?ejdVYUhhQnorRS9pSUpVLytCTUVCVjZBVTR1RFdKSmNMd2pSU1BDVCtxVlFl?=
 =?utf-8?B?alZoNy8vR3JyT1FreWFoeC9XZyt1QXBadXJ2Y0Q0cHhVdHlpdUwwK1JsTXl5?=
 =?utf-8?B?Rjh6OGQwN3pBa0IycVE1dEpGc0xYamFuVEVPUnZxQytUeTdzUEJnSGNydmZI?=
 =?utf-8?B?Slh6Wk5vQzQ5MENvN0g2dndCUWhKQjl4N2h3VEpYQWU2T1ZSa2hVTWJiVndK?=
 =?utf-8?B?TFpOTXBLVVVWTitGUTlxUm5tOHNTMW80VmhNbko1em9WNzl1ZVhZYzlRKzc1?=
 =?utf-8?B?YkdKVkxuVnNVZ3Y2U3l3NXJiS29sZHFkUjJDajNZRi84QnFGNzE5ZUtpdVMx?=
 =?utf-8?B?Rm9sd1lWLzRmZkRuSERBQWhsRWpWMUtYVDE4Yk5TK0pHNHBDWkd0Tk9HaG13?=
 =?utf-8?B?NVdzNnltSTl2VEFMQkN3ai9QV0V2VGptaDNFTXMwcTJmOStsV1lKOWEwcGpX?=
 =?utf-8?B?Ukx2U3NkTnZqT1JEV3BiNXR4VWE1MnV1cEpTSWxMdDZaOUw3ZStPR1NhbUJs?=
 =?utf-8?B?TGpEOE9kRzFadUZjd0s3b2dJRmVSSjFXb243d0hueS9DRGJ2Y0VRcGVNcThh?=
 =?utf-8?B?ZjUwWEI5bysvU1E3OGFLM3lQcUlmRmwyMGxDbmZFQlROUXRYRjlCOHVrRjE1?=
 =?utf-8?B?VEVYY0IxSWpkeEVTU0tjNkJvaDVRd05qZXVsZ0liTTlPNUFDd0YxZXR0TVlR?=
 =?utf-8?Q?DrA70XgpZF8hKCR0103f5UoFUXwFlI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWxRYVA2MXFUa05oVUdJSktEclBlZ1lobWUrZEppL0tLTXU4RFJsMGNCelps?=
 =?utf-8?B?eGJTbEg0c1hMNUtrd2RUNW1vL29WdVRESVo2U1p1ZTdscU03T2p3WWRJS3c2?=
 =?utf-8?B?N2ovN1FjVWx3RktoUzFGT1JhUWtETE1rWlVIYW5vdDRURlc1NGFvVUxHYWFI?=
 =?utf-8?B?KzhOdk1tWTVxTytFdUdXSk5aVlNiT2xyN00rS21oUVJxZTVGSm9Ua1ExcHhs?=
 =?utf-8?B?MFo4aURCeWZYRnRBbUJwWlE0bGlhNWh2UWFTdWtTbCs5YWNCOEplWWU1Rnlk?=
 =?utf-8?B?K2VydWZCc0QzQ2c1LyttclBNaWJ2eHRDSmRZNURWbmtrRmxBNmxsRVpWQWlY?=
 =?utf-8?B?WDJ4TFFyeHlSZTVDeUNNc2FLcGJSUTg2bkFqSUJhWkZ2bGxIN0Q3U0VwZmZT?=
 =?utf-8?B?T3JxZ0V0Q0tKUHRHWUJzQkZjY1UrN01CUXdXbVpyK3BxTGQrTE5vQXBmeDQv?=
 =?utf-8?B?VENYR0tVajZPcjEyMFBhenF4aFVCcFUySFJUdER5eGpGa0FVaTU5R2xxYk0w?=
 =?utf-8?B?NzcxdEVHU3lrU2dLRE94Q2tvb1lIUWJYMnVLUmNJWElxT21mZ1FOU3lqR3Y4?=
 =?utf-8?B?WlBkYzdhUWc0QTcvbjJ6dElPeGVJQUtDdzUrM1o4S0NDeVozV2pPMkFMMmpQ?=
 =?utf-8?B?eUxBb2Nic0NrZFdUM05OTHZJZVlWV0ttcHk0TFcwNDZWcmNXcTVidkV6QUM2?=
 =?utf-8?B?WXZBeHpiSlNTUkZpdzZHWlpYNytxaStBZ2FqYko0YkNkeEkyV3JlTjUyNGNW?=
 =?utf-8?B?SkVUcUszZUIzUlA0SmVGdXJWUDFFU1RSQnVsSU1lSkYvRnVvcEZCaGRyY3NR?=
 =?utf-8?B?VkZZN21NQ01hVHM1NGxEdUJmMzI4Q0daa01YaFkxU3FRRWt5d2pORXI2YVhl?=
 =?utf-8?B?a2RYNmFZMWxEcHRYMERJVHVCd3pHakZPek1Ia29BVjVEd05lSm9oRkhZaUV5?=
 =?utf-8?B?ZUpPODEwdWJ3eG5vYnNZQ2lhYloralhlR3BHMVk3enVHR1oxM2Y5YU8waGRM?=
 =?utf-8?B?S0UrKzBmenNKbGxsVjhMdGVUYlpwazNvZTNiVjl1ME9Tc2gwTXVUQ0RkNGhI?=
 =?utf-8?B?YmlpZFgvLzE2VUFZQm1qdDUzQ2FUSnZFTnJkd1NjbWZHcWdsSEd0RXU2V3Zy?=
 =?utf-8?B?VGhuT09iQzY3K0gzbWdzNit2cmJOT2ViUXFSRFg0YmxEaElrWVNhWkdLcHpo?=
 =?utf-8?B?eVNnUWRFc0xLWitEaHpKTG1HWDlLZDZBNDVXUEw4UmtURE5BWElNT1hMWTBr?=
 =?utf-8?B?KzRISzM4cGl6NFRwZHRCVVRVNnVLeERqOURDa09IbDlYR0UxSEFGV00wSitP?=
 =?utf-8?B?b3JKWkVpUXBGUzRJR2dJY1RKMjl2TUFkWDlhZXc1MEFraUlnUHRzSEdpbHJ1?=
 =?utf-8?B?c2FTN1pNdE5OZ2NaUG10NGs5THJJVnNtdXY5cjhrMkNDTWFyUTJaYjZ1dEFM?=
 =?utf-8?B?Z1VMZmYvUlFEMklRdC9RSjZMTXNaVW1nclBsWjBYb255VmJ6YTJmRkFZNFNY?=
 =?utf-8?B?WmwrVUpCL1RWcFhYdUVlQndYNnZYb0FveWdMMlVMdCtDSGdEMHhLNkx0NXBM?=
 =?utf-8?B?SXpLckZXaFRjU3VJdjBDU210RXBBSkhnYmdlb2pINzk1VzB1TkZlVHJVbjRr?=
 =?utf-8?B?VjhIVWdKQVVPQXpOSGQ2UDFkNWVqOU9XMURMSXRSN3VZMWNzd1hFcHJka3p3?=
 =?utf-8?B?djliWFAzMG8rS1FxUFBGWUU0NWdpeXdYZlRjY1A4cmNPdkRlZkFoMFI1ZEpE?=
 =?utf-8?B?YkF5VTdrT2s4NlpwUy84aGNtWnBGVU4vQzRpbFR2enloTzMxZDJMeGlaNHA0?=
 =?utf-8?B?S2F1MjEyOXBuLzBPOXp1VFdra0U2bWF4WFh6cHZiT1d6bUlXb3VKMldBTnFr?=
 =?utf-8?B?RkR0V2RXcnpEMk1TTW00V0NHb1VWbGtWSzJrWjBlU2JmYm1jZFdLZlZLSXdV?=
 =?utf-8?B?NWdLTzVTbUNCVVRMQ240WEJ5SnkyVnhZWFZIR0p4ZmZudzRNYlZTUktFd1ZI?=
 =?utf-8?B?OEUvUmVpRHpONlFmeWIwTVFINitZMEhCWGErR1NVUTVBRGgzNm1kRHdNY2tX?=
 =?utf-8?B?a2FUYVYySFQwNDhGaUFEOEdobmxDVHdiWEZvakgwT0QvaTl2Zmd5UGFQcEJr?=
 =?utf-8?B?Zml0N0ZDaHZxRWdmenBVbDdLSkNBTldVMFZJTlU4WUpVZmVvKyt6OERYTGdz?=
 =?utf-8?B?R0VWVTljT2w5MWZEVFcvcHlnUE8wVFV4TlNBNmdKai9CUVZkcGphcTdDalY4?=
 =?utf-8?B?aWJHRzl3czI2aGgybHFVblZzNnphZVNLN01nTE9zTjNKalFzV0llN3JSSVZT?=
 =?utf-8?B?YVlKTEc2a21Kem1UNHh6a0hRMXFLejZqK3B2YzRORitIcTY3WUVJUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfc1fa5-5ca1-4708-9575-08de4da2b57c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 04:10:36.2095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rM/WIw8VIz20H4AjCnDjm1RPiN1y9wT5GwtPUgfA0Vk1BCzzSHr5b5iTqYIAnP6C/9GqiNwLCN2hqYUUzxSx5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8427

On 06/01/26 17:04, Jon Hunter wrote:
> 
> On 06/01/2026 11:10, Kartik Rajput wrote:
>> Move the variant field into tegra_i2c_hw_feature and populate it for all
>> SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
>> "nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
>> from tegra_i2c_parse_dt to initialize the Tegra I2C variant. Also remove
>> the redundant config checks from IS_VI and IS_DVC macros.
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 100 ++++++++++++++++++++++++++-------
>>   1 file changed, 81 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 9a09079dcc9c..4ab991a22350 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -235,6 +235,7 @@ enum tegra_i2c_variant {
>>    *        timing settings.
>>    * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
>>    * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
>> + * @variant: This represents the I2C controller variant.
>>    */
>>   struct tegra_i2c_hw_feature {
>>       bool has_continue_xfer_support;
>> @@ -266,6 +267,7 @@ struct tegra_i2c_hw_feature {
>>       bool has_interface_timing_reg;
>>       bool enable_hs_mode_support;
>>       bool has_mutex;
>> +    enum tegra_i2c_variant variant;
>>   };
>>   /**
>> @@ -281,7 +283,6 @@ struct tegra_i2c_hw_feature {
>>    * @base_phys: physical base address of the I2C controller
>>    * @cont_id: I2C controller ID, used for packet header
>>    * @irq: IRQ number of transfer complete interrupt
>> - * @variant: This represents the I2C controller variant.
>>    * @msg_complete: transfer completion notifier
>>    * @msg_buf_remaining: size of unsent data in the message buffer
>>    * @msg_len: length of message in current transfer
>> @@ -334,13 +335,10 @@ struct tegra_i2c_dev {
>>       bool atomic_mode;
>>       bool dma_mode;
>>       bool msg_read;
>> -    enum tegra_i2c_variant variant;
>>   };
>> -#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
>> -             (dev)->variant == TEGRA_I2C_VARIANT_DVC)
>> -#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
>> -             (dev)->variant == TEGRA_I2C_VARIANT_VI)
>> +#define IS_DVC(dev) ((dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
>> +#define IS_VI(dev)  ((dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
> 
> I was thinking about this and actually, I am wondering if we should leave these checks present because if these are not enabled, then the compiler should be enable to drop all the associated code at compile time. So there could be some value to keeping this as is.
> 
> Jon
> 

Ack.

