Return-Path: <linux-i2c+bounces-14137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0CC69531
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 13:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 958342AB17
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 12:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEF3324703;
	Tue, 18 Nov 2025 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZCQGmNp7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68D28751D;
	Tue, 18 Nov 2025 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468228; cv=fail; b=tbOgAJl00Tuy8lo93AL8xnUgGoIeBrAf5PiB3leFSkzznKswR2XZG9afJBDzMpNpb1W+V5LInFJM25H4BcYL3vTVWObLRGAzMHy47oZSgy+qd0UtH5YxwQn0QkuQEfZaQ9zXxPQW/XTrF0Cr2LLsee4VJcWpqfrXZlBzeMiltzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468228; c=relaxed/simple;
	bh=agI+x/mtn7YhcSe14RPxKD/ClSYGZJK5Df+s4p+A6JU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OLvpS/YvjwPj7bw+bcyAYi9zyTOdBKK2pcuFSCFaWXXpW/ofcx5XGtnn0U8hQa9aESVHyI2kWY9WZPCvnYDil8EatWQhvpaxWLo5q2q34sgKVUMStUNaU81Btzmf00awzl1rSFCgvZxVc93QPdZeMedn4nePDfWHsI4Rm6YByog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZCQGmNp7; arc=fail smtp.client-ip=52.101.62.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpwZJawt+U6I6KAGZer6FL2zsqHkIDAOFiGNJs5C8xpJvd+PpTz+WKbHpPsTCoydneTQwGleP557b+vg/Qt/i++LN0Tuc5TXKi3TE8kAEwvBU7mhSTyRWYN0xg7WNJ81ocwwv/QpdKAawdSNBaNB2JHpSvRJ4XALDaAO6fZxCZyom1xl8LQulCIulvEXCB8yt9W9oA6KnshApLuH34gbo+ST/XOi5Mn7u+1CllEZRJn3WLduc4pHQDlnbbov7JO0ODjJ9V9gP0klI80GFrzhgDLVBhsTcf8T6kFiZXtP4ZxaOXG9ZQYpx3M6KZb6UqGWb41xOtVNwDC2JtllMk3RwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLMWXffidPZs83j4S0XYxftI8YDiK7tsTLkLvV8CvW4=;
 b=TwSY6V26JNJW/0Bh62B4SKYTAk5tHOKcKAnTvG427cqGR+M0rnn2QLPEllP6PV2FUf1oJTYwealQE6bFqck5RS5fhZJSgj1C3nhf3X4bSGe9iiXlBl3bSfAZxIo1ZYOb1QeutFVy76w+7iK4n/vnwPBIAIpb82KiOhNIsojlilQMCJ+Bv48EOL4CYInOvSbQt1EH8ECMDRy1Eykxp32gvUJ2WIVVvOG+uVsV+mgasMQN8UTuNSqdr2fGR9GwyZJrueuaV7zVZNkbyYx6uxiuTAL63oEPU0poEGlDxIV5JfNJbnVErcI1NO8DUsnC3UGskfE8ceXV5cEEIKHSK/AUfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLMWXffidPZs83j4S0XYxftI8YDiK7tsTLkLvV8CvW4=;
 b=ZCQGmNp7wGu4Mlr1S/DbR1zMG/wWutRKxuuainZYyDDWmA/QKawY5Wbcvv/gfh6QwIU30mSksPCiGenYwYCa9d4D67ogwQTTbDRRS5nF0PZKprIivLkpXJUDzpURQZcfisdosJIMjj+7a7SCaaFZCg9bxQDHjbFgF5wD/50POq+mp8CWV5b0PEnyeajrM3vFAU1Cyoi9GjQFEo0/8O5CWBC6O+/aUIP400KfjTS/eQfR8hwdgeAWXPDf5MF1L5UQXp4h8WXBIzmSP858lG4N3xit8WI0s4NmlBeFVH1geESWHatQEIT7yvxTQoEw+H4+PxART0RzvaX1JKN3vF8XTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 12:17:03 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 12:17:03 +0000
Message-ID: <f173a987-dafd-4bc7-9905-745f855e12bf@nvidia.com>
Date: Tue, 18 Nov 2025 12:16:57 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] i2c: tegra: Add HS mode support
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, kkartik@nvidia.com,
 ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 smangipudi@nvidia.com, thierry.reding@gmail.com,
 wsa+renesas@sang-engineering.com, wsa@kernel.org
References: <828b6131-24bf-4a92-9c86-4c9f0461e6d0@nvidia.com>
 <20251118110903.61560-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251118110903.61560-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d152ea-bff0-400c-e7c8-08de269c61c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGJYNzYvSGo4b3F0RmJtb0VuVkNRVmJGN1BEbDRPdStyU3l4SFIzRjB5RUpt?=
 =?utf-8?B?dGpUa1htUVBlbUtxWVNsWWhERUpUb3oycGgvaEZsY251cEdROTZpTlgwMnJq?=
 =?utf-8?B?QkRZRnlIdlFrdEU0K1NuY29HK2ZmaUF0bGpXbXNwTDZPd2RRWUF5MkxpTFpq?=
 =?utf-8?B?T3RKb2hlcHpGaW5mWWJBRzU5MXdZeHpXM2pldkJFdDM2eTBJV2dtNGhCcnhC?=
 =?utf-8?B?RFBZOGNqTmJibnprbzluRFI1RCs3eGg0Um1QVWVORlZiQk1LaDRIUnpqNGdC?=
 =?utf-8?B?ams1V2VWOC8ySHIyTTRWZmRZWTNpa1F6bzZnS3NqRERuZG5OdU1jNzRVUmN5?=
 =?utf-8?B?MEN5V0x1NGJ5clBYU2wvdkg2cDRod0xObUlDUXVuTGxPMm96cUN4M0VhcmRK?=
 =?utf-8?B?MGFuajN5SVZFcFBrcnREa29WSmJpc0RGYk1VV1Z4Uk80QjJ2czJPcmN6Vi9n?=
 =?utf-8?B?TWxYT2dHV3dDV0dnRlg3dWY3NkVLaExPMVpYZC9WMko2SUE0cm91M1J0Skx2?=
 =?utf-8?B?VHZqUnBaWlJGNnNDWnFLTlVCRVdlVGtDdGZKbUJDRWh4aGUzaXY2blhHeFE4?=
 =?utf-8?B?QjhTa2RFc2ZxdnFLTUNHUW5xRmlXaEpWMWV0TjNMYzduWHhqcHRRWXVMWVdQ?=
 =?utf-8?B?Sjc0UWRDMk9mOUExa0RVa1ZrTkJOckJTMHVRT2ZuTDJQUTlSMkI0UnR5cTBr?=
 =?utf-8?B?TGZxdC93MXRhSEJ1Ti9hRmgzT2FXTy94QmE1WHlzaHZ3V3N0aHVtVzJyTEEv?=
 =?utf-8?B?b3JNRThhUUNQcXQwUklJV0tPcXJpTm10VS9ubG1MYVpJd0ZhRjBONUppTDRY?=
 =?utf-8?B?MHozdDg3ZWM5cktnRUJ0em1VZkpXUW5mdGNGeU1aanhNWitiNEw1bmg5ME5G?=
 =?utf-8?B?eTd5NEdIUW5kRlViT0ZWMWNTbEhMQm9PRk80UWhNbC9IcE9UZ09tK1BFZVJv?=
 =?utf-8?B?M21iZUVFUnFVRGhIWitoTkx3NE5VOHZIM0JOVXV2WCtLZ21QcGNoNFFNRVNO?=
 =?utf-8?B?VmdtR0dGWkVacjF3aXFyNGhtMnlnRXczNzNsZkdKWHdneUxhcTllUldIZTJj?=
 =?utf-8?B?OVBUQVIxTUpaVnNoKzBhdEVBVDhGUFpTWUhHeGZQSkhaVkNHTDZmOTA1N0Zm?=
 =?utf-8?B?YXN5OVJUY3hKVk5XYmZQODFxZkRRKzNQaHpYTGV5dGlpUWR6alhpenlXQ2VJ?=
 =?utf-8?B?WlZWYStRZ04xZ3RlUS8wM0lhbFFTbmgrWGdaMEhUdFFxRktRenh0R2ZJeWZB?=
 =?utf-8?B?V1g3WHhOUlcrYmVQckVrL1MvQ2l2QmpDWDVHL3puTkFUUlJkeTZ0NncwM0xi?=
 =?utf-8?B?TXduemJJdE1WWG1kemNZM1hoZk1zUGpWT2p4aUo4Y2k1U3ptSmF5LzRsd0ZC?=
 =?utf-8?B?M3QvZ0Nxa29IcnlxZ04xYmNCNVhlREhBZXRobkxiV3lENG1PZUpTZ3lBNkNs?=
 =?utf-8?B?QXRHbEM4V05HZUE5SmhBTmR3eU4rSm96UGdsL1hDS2JGeFJYdkIyQTk4UnRR?=
 =?utf-8?B?OVMxbjhYcGI2czA4eUgwVHRiS3R4dEttbmVSUlNLTmpJV1J1ejNmZ0hGVDhj?=
 =?utf-8?B?bGxQOHlQc21ta1JVRm95U2k0SUR3blFIRWtLcGtuVTl6alZpeWJLbHU2ZmYv?=
 =?utf-8?B?QU1OdGZyTlRwcHpXcnJzcG9yeERDeFhZbUhaalQyeDlUcThyUmNmVUdjdTht?=
 =?utf-8?B?UFZLU3lKc09YU1JiMFNjN01ucmI2emhrQlQ5UzdkQnJMb2FzcTY4QXlrSnFI?=
 =?utf-8?B?QXJqMVMzcXdpanVFQlh6K283b0hocVFkMk9pai9HMnI2R2Zra0tINFhPR3JL?=
 =?utf-8?B?Q20rMlVkTlE1bDdlckk2Q1ZYY2xhY21QNmhLQjRZSmxOTU8yQldzK1U3cnh6?=
 =?utf-8?B?Zmk2WjlVU3Zlb1dLR3lOODhIRnpoNjVVckNkY3VBd01WcFIxNVRzaG9MaVFw?=
 =?utf-8?B?OXR5L25ydU5pWE04TkxWRXUwc3ZNTWNrZFNnOCtxaUNabm1zbnVkMlM4REJE?=
 =?utf-8?B?L3BSWUlBZjhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVpYRGRISzkxcGpUcjMraG9oNllURVU5YVQ3cXg2aDZIL2NMd3NFYWxKVVZy?=
 =?utf-8?B?SmdienJlWTE2dm1BbUtieWNBK0JpSldqWkJydHBCejdRL3hHSzk5Y0NwT0xL?=
 =?utf-8?B?RnZHNWRhU0VMMVFCNEU5OU9EdW9FVlNWY29hYXNBN3NTdlQ4T2NMUm1TSXVG?=
 =?utf-8?B?NjlwSGRJaDRnb3pvQVdJWSsxK2dCT3RnUzV2Y0k3Ui92OTJCMHNuMHduVWhU?=
 =?utf-8?B?VGJzZzJjNjJoV1RLbXViTWJtZnRGVTluY3BYbWorVWdnNHc4cDlLekhLR28r?=
 =?utf-8?B?OVNlbVd0LytXSERjR2JBb2F3Z256NE81cXc4dkhlNlpiQWVzanJwWFR3cGc0?=
 =?utf-8?B?SVkyME1uWFlTZ3grNkZZVzJqUmZGOXg2akE2WnJJbFlWK3J0OGlZRTR4TjI4?=
 =?utf-8?B?K1d1UFNRQWduVXB4UzFySWljVVgzMGtMcnlKclRkb09QbUFyT2s1L1ZwZ3A2?=
 =?utf-8?B?QjNXWW1pVmhzNGpHOVJ6a1l3RHpoN0t3WWR4bzVxTWlnbXphakZsSjZSUmFq?=
 =?utf-8?B?SVV2dlVTQTd2dDZ3LzVWbVdNN1RRNXQyejQwZ0YydXRpcHJ3WW9aYmcyVzIz?=
 =?utf-8?B?TjlkM0hwRFhQOFQ1dmpENTZUVUdiaGdFdStTL2FXOWtLZlJESjR3dHI1TlZK?=
 =?utf-8?B?WHM5RldaRnZsUDQ2OVZXZ0Z5WEh4UkVrRFBkTEVyVHVaU2g2LzJIY1RGT0Jy?=
 =?utf-8?B?Ykh4Mjg1bjlNaTBxRzZtNzVmSUxkUnVxamZFK2dpMnJaTll5Q0QveThLbnA4?=
 =?utf-8?B?M2tMTTJoNVRpbzljU1IyMVJsN2Vkc0s0dmdCcjB3U1M3REVwVkZLYmprRmZQ?=
 =?utf-8?B?Zm1SeTk0QnlENnpnZGxxazkzY3IxenB5OGdDSkNDRC91ZjFBcG14TnhWRWJ1?=
 =?utf-8?B?QmRLZFhNT0pmMVczVzY3bmtGU3E2MWt5WUJ4ZkZHOXgrb0tkTmFtOURRRnc4?=
 =?utf-8?B?Y0l1RWFUVjdjMHdTTStBbG9uUHIxL051d09YTElhRXZPNGV3MnhBUFBUY2Rp?=
 =?utf-8?B?T29FRmJtZFc2YXZKODlGV2VTeTZQWTE3NExqd0NLZWRvOFNGS3NVYXNCR0NV?=
 =?utf-8?B?b1J2Y0Z3dzNBOWNkNmJGcGJ3ZXQ0bW5zRzFvS3NVbjZkN1RkemxRUExmMUtu?=
 =?utf-8?B?Q2d3RE4rblFwc3dhVTNZUEUyVjR3cXEwWUFsSnlPUmhRUjRMZnlIaENPdEZO?=
 =?utf-8?B?QmlmcVplY0U3NGs1UGRQeDI2blBxZGZsTDcyL2hwbDduRThBNEJrTFpMWld2?=
 =?utf-8?B?c0JhS1lDS0JtSkJUbEN5eGhySWRXWEJ0UFRKeSsrQi9MVWl6ZkREdXNvTnVE?=
 =?utf-8?B?bEFUWkRpQlFreXlEVTJ3VXl5a1FRTTVGdERtVHI5YndCYVViRVYrSTV4eXdx?=
 =?utf-8?B?QWxrcXdlMzBUeE0xV01VY1FRbnpjSE0zWVpNK2dlYmpmbDFveTdPYTkyKzNU?=
 =?utf-8?B?Mm5xZWF6dndPczN5MHpDQTRhZURGcnJMMFdKRnYzQmNjSGErT09tc213Y1R1?=
 =?utf-8?B?Y0ZwVVZ5d1RzL0xXc2ZWOHhuL1ZkaTlqZVNuK2N2L29PSHlNYytRUjAwWC9F?=
 =?utf-8?B?blY5OWNGS1BkUFYyajluMjR1TEY2U0JTUWxydVM5eDNvcE1xUDdaWnVwTm85?=
 =?utf-8?B?MTZLUllqa0wva0dUS1RvNG5DRENRemFiVGt3bTB3SnNqYm1CbW5GbUZvLzBz?=
 =?utf-8?B?clJwQ0tYNVVFblFwNjVuRVBKd0JtS2FvWTdjNFdpTXZuR2NDRHZXWDEzWkZq?=
 =?utf-8?B?RFdKMWxjSUZWWk5vU05qdTM4dWQ5WkN6UHhMNXFTeTFUbk5yR01HYnBKdndG?=
 =?utf-8?B?Q1Y1Qm1CL09Ea1drS0hKOGxXalBJOFBMZnE5b01STUZ4dUFqTWtMQ1pCVmRk?=
 =?utf-8?B?eW1adHpFSnhlZ3l3TUdUSUEwYXBvbkN3WmZsdXd4QW1vQkNYc3Jpek1PbjlU?=
 =?utf-8?B?SGtXSkhpS1dQU1ExV2picUtuT2xBQWhDQU05SUJxWTY0ZUZJakV5ZVExWis4?=
 =?utf-8?B?VEh4SVdEd3A4UlJ1cXg3MjJOQjA2dEV1UjJlcGM0K2N5MFJRcXFwbjFiU1NO?=
 =?utf-8?B?cEFTNC93SkhNMHd4LzEyOHRxTkl6VXVqZmpvVktUZHhKOTdwV052Y1NVUVpa?=
 =?utf-8?Q?mCYj40sFYFwyquwBKRNEY9buO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d152ea-bff0-400c-e7c8-08de269c61c9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 12:17:03.3290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGoyrXQ1tROvuw0FOvLZmsML69xY2qTh6MgKn2ZcOZQOlncXj76laOle8KO089Wj0OTk0FUvN3ACURIuhD53Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664


On 18/11/2025 11:09, Akhil R wrote:
> On Mon, 17 Nov 2025 11:07:07 +0000, Jon Hunter wrote:
>> On 15/11/2025 04:26, Akhil R wrote:
>>> Add support for HS (High Speed) mode transfers, which is supported by
>>> Tegra194 onwards. Also adjust the bus frequency such that it uses the
>>> fast plus mode when HS mode is not supported.
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>>> ---
>>> v10 -> v12:
>>> 	* Update bus_freq_hz to max supported freq and updates to
>>> 	  accomodate the changes from Patch 2/6.
>>> v10 -> v11:
>>> 	* Update the if condition as per the comments received on:
>>> 	  https://lore.kernel.org/linux-tegra/20251110080502.865953-1-kkartik@nvidia.com/T/#t
>>> v9 -> v10:
>>>           * Change switch block to an if-else block.
>>> v5 -> v9:
>>>           * In the switch block, handle the case when hs mode is not
>>>             supported. Also update it to use Fast mode for master code
>>>             byte as per the I2C spec for HS mode.
>>> v3 -> v5:
>>>           * Set has_hs_mode_support to false for unsupported SoCs.
>>> v2 -> v3:
>>>           * Document tlow_hs_mode and thigh_hs_mode.
>>> v1 -> v2:
>>>           * Document has_hs_mode_support.
>>>           * Add a check to set the frequency to fastmode+ if the device
>>>             does not support HS mode but the requested frequency is more
>>>             than fastmode+.
>>> ---
>>>    drivers/i2c/busses/i2c-tegra.c | 59 ++++++++++++++++++++++++++++++++--
>>>    1 file changed, 57 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index 8a696c88882e..9ebeb6a2eaf5 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -91,6 +91,7 @@
>>>    #define I2C_HEADER_IE_ENABLE			BIT(17)
>>>    #define I2C_HEADER_REPEAT_START			BIT(16)
>>>    #define I2C_HEADER_CONTINUE_XFER		BIT(15)
>>> +#define I2C_HEADER_HS_MODE			BIT(22)
>>
>> This should be ordered according to the value. So place this above
>> I2C_HEADER_CONT_ON_NAK.
> 
> Agree.
> 
> Do we need a new version with this change or would it be possible to
> update while applying?

Given we need another minor fix to 3/6 you might as well send a new version.

Jon
-- 
nvpublic


