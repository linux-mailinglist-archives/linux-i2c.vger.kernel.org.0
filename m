Return-Path: <linux-i2c+bounces-10526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB893A971CE
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 17:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09F774401F6
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 15:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16D82900AB;
	Tue, 22 Apr 2025 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xoo/vIl1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837BB28FFF3;
	Tue, 22 Apr 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337570; cv=fail; b=tmdCmYBVGPya23lfO1NVsyEKTXyPakeg1jXCmQ/3TegEGsNs0HPhXttFK4sztd7s8Tw17rkH9h66CX5Bbu9Ez0TOd14Dv/mpBeKAxoXRwtgM3euCRZJ5Hn8Jk+eM46VbsMIJo+T6kHdyyfG6UOXchUYQKGts/nhl7aip+bToKNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337570; c=relaxed/simple;
	bh=EChd0SMxf4A5bffGoMUuYbBDv7o6sFxsYf/2+hcQzEU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gayBK7lKCwDAf8dTMJIJok6osqcSQdx3xS7ZaK1KcovSSIIsMdzcnNN9RXeqPvZzIQsI3044by2GiN0u1TSsPyAPrkSUuNLCj2TzNlIt7WIxnZbY3jmE6Lm/1qAdreMWdN6in/FQSHR+HtxQoCuCfrzOjrYdVHJHBitAf42hqfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xoo/vIl1; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dlyzu9S9dVAD6lL/yU694DYW6JrQehpP2Xki8WLVOoeitKCAusEBO8UF3jDaY0lh5Nk/55qMKSQqDLoMd/HwnaI1Qzpl73j0hEP2x4m1JEjvhZYdhvMfh/CqPpa83SiY1npUFLSJ0scWjRSBzblq/6/Wlwdftg9YwIF6JM2ovF0SSV1/2+cenvfYKGT2AB5nfPVAKypA0fbiLsfFwnt9JO5Fk+iF72h5v/vbeMD1O0pf0uHfdBpNDE1zHqelSelPg/Doa9Vjr6JikTb7HouJQzqeX3sMBAP3yKkbfWPbB+uw/A+r94WrFMyh0EhfWhscAxOv6EZm/CjHMVWZbQypcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StxhP9pBF6tF6WkqOzNp27FHKheJ8hmaxmOV69jO0NY=;
 b=jGGxDWtIMoSaf2z5phOabHsy3pkFWL+Yb/IFAXBM0+6UitJUBwjh9ESVPn72SDmnx35Mm4UkPIfyeQCn48ygzjbkeAZWQQAeJCseSWuWSyxP6GXZ6qYv70KoT1HvXK49kwHrKqKBdhZOp30ZurGxQXyeFFUgREy5lUB8Kq2HZ1aZMhEhuWV8fcDU53lT/scSy3GfImYE8I3wiOwlwAadpJUyMic+FCkVhEEe78Zxbj4sncx1HAIh29TX5XoGtx4EHVztDgu+Z5Sx5TATQtGTsOzN+rQqX55EO7l/NKxJIq0OEa9cOtvByhdI0aYbwvlA0wT3l4SE/DNt8ioBCFkhww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StxhP9pBF6tF6WkqOzNp27FHKheJ8hmaxmOV69jO0NY=;
 b=xoo/vIl1ogPGdPRS/9oWVdKoKSu+P/wrZRmhnB+vS4RePP2Mxn98bm+U/vWOxktDYWoDyo3netrZ9pMdKEcfpvCz3x32oQ8+sugX9STmnZMle1+AKGaNDPjMb5dGnsZF/efVJpn5rOJULBjwnArnShQwhBHRw2iyPoa5CCbASoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by DS7PR12MB6358.namprd12.prod.outlook.com (2603:10b6:8:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Tue, 22 Apr
 2025 15:59:25 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 15:59:24 +0000
Message-ID: <63a2737b-384b-44e4-8eb3-f255d3011644@amd.com>
Date: Tue, 22 Apr 2025 11:59:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
To: Mario Limonciello <mario.limonciello@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dominic.antony@amd.com
References: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
 <af881cfe-926a-451f-8f40-c7cb64c99693@amd.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <af881cfe-926a-451f-8f40-c7cb64c99693@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0347.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::8) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|DS7PR12MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5cf0b9-9f29-4ed0-ace2-08dd81b6a713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3VsRmlzdldVc1JEbWFFMU5qamQxYURNbzN3OC8yZW85eXdkL1ovaG12ZW9p?=
 =?utf-8?B?MjFoa21UU09tQTVOSEhEK083dUdDVks3YitFWHFhaTZ0ZlZ0UTFhWjJRdXZL?=
 =?utf-8?B?dC9ZYnI1THhjYnRxQnZSVDgvZnFGNzd1TmY4QWN3ZXNHSGtHWEMwckdBZnFV?=
 =?utf-8?B?SkxQT2ZINFZJMDRTcEMwbzYvSndhdXJLMWEwNlFvdk9EeE9XeEdVenlWb01T?=
 =?utf-8?B?a2hmcGc3alVYOUhJRnFhanRuYjZrREhSMDkrMTNJSlYyRXVmc3VibGEyOUg3?=
 =?utf-8?B?RXA3cFdmemtqM1NNZE1RcE9RdHpoeG1zRlZENUsyMml1RUt4TVNMMGJkRXRE?=
 =?utf-8?B?RjNOQk9CQVJjYmVjSzFSb2luMFBYMnR6WnN6eGJBbDlHcHI3NVo3WHhXZ1R1?=
 =?utf-8?B?QlhnTUhWbkZDODNkQlczZld2YXJ0ZWp5YzQyQ0k2QVFsWUpPYUdsdGRpeTNu?=
 =?utf-8?B?YUd6KzdjMGZPYlFMTWttQjkwWUdDaVMxNjFIeldZNmZBbi9FMWlUMjg1RjlT?=
 =?utf-8?B?a2JSVnErSUxyc0RHRTllRWF5MThhWnVrb0VNOEJDSXFqSGpicjBDTW1tY1VL?=
 =?utf-8?B?ZVM3b085dEhUOTF0M3V5a25OUlpkakxTWThMUWtsTzJsOVJPVGNVa1czQUli?=
 =?utf-8?B?cDdsaDlVWUlWZmR3UUV0ajZCQ0JqVmszMHRPcVA0dnMzQmtZZEI2R2gyZkRs?=
 =?utf-8?B?RndzTjZyaTN1STdsajBiSXA3NUxlSURESC8rRHRqbnpTUjdDajZ1dUdpb3Vj?=
 =?utf-8?B?V2ROVW1OUlpLL1RRWkxFdmZuQlVtYlBaWjg3Q2I1UlBxSzZhRUl0TFBveWNX?=
 =?utf-8?B?Yk5IczR4VDN4WGM2Q01CNm03WTJkR0wzZWU2SE44MnozeW9qM2lSeHcyWURs?=
 =?utf-8?B?OGk0b2FhcnFSQ2htTGRXVjVTRy9UUVJZVkg5R1NxZmVpeStWckVVTTRxbFVh?=
 =?utf-8?B?Q3dVT252ZnFSQmN0a0MxaGp5R1FvV1ZMKzhRZTVJN1RDaUtxQm12dndYOGJ5?=
 =?utf-8?B?clM1d3p4eDJGS21qR3NKeEwyRE9ScGFiL2wzdW9VZ0ZYeEZlNXFjMENQQ2l1?=
 =?utf-8?B?aENKVjhyY0tIUG9ETHBxTGdtajcwUXhreklOYUxXZXFsRWg0eEw0bHBXVGxR?=
 =?utf-8?B?emRSVnVnWGhRV21vQ3RWL3dFNnM2VTQzSVpncGsxek5iMXQ1RHk4MjVBaTVP?=
 =?utf-8?B?MVZOaExubWg4Q1hJb0ZzbVJuMDEwVG0vZkQxVVJRNDhKUWNlN2t0WDBIMDlx?=
 =?utf-8?B?Z1ltQlVjMzNGT3BOaVJGZURwb0lwY1VDeW1GUlF3WEFNY1lTb3plWDhrUUgx?=
 =?utf-8?B?cE8zbG9KWlV2OTRvTG1lRXYyTmFEZjNORVRMY09jMmFsdmFxbXpWNER4Z1Q5?=
 =?utf-8?B?SE9TV0VyV05uMnp3SXRHbmdxaGJ4aE5TN2ozbzdrdFd0OHU3SU5STWI3LzQr?=
 =?utf-8?B?aHhnV3JDTHlpb0c2WFZpbFBTM3pHdU9zeG02UE90bldEUFExcEE4TkgrU1RL?=
 =?utf-8?B?aW1YNEk3Wm4zaXMxWEZGN2JVL0l5d3dTWVhDS0JGVEJUZndLS2J6cW85RmxV?=
 =?utf-8?B?UitCOC9SWHdjOUVvUlFZY01xUUNFRkFvcld1SkMwd1pGVTZzTmlDenk4bTFB?=
 =?utf-8?B?aG8vU0k5SjdaSlJNclNtSXp6VWpuL2JhdGZPV1BydnR1eDRhSUdVbjJtYWFk?=
 =?utf-8?B?bFFrS3pWckQyaDdWS3BFOWVoUnlXYXJnd0lrLzRnZFFNd2FNNFJ3MEhUa0ds?=
 =?utf-8?B?TXpOTlV2eUZkT1JQYXlLUUxTS2tWVGIvVXVobWNiS3FwK3dHR2l3WTJtMEdW?=
 =?utf-8?B?blZIWmlmWUZwc2M3QzhFdDAzaUo2ZDVscHRDclJ5V0hRc0dUa2gzN0NReHVP?=
 =?utf-8?B?VkhheUlZWUJtYVVpTWpvaFdtM09IajBlYXUvdUtQY1FnMFZIaXFCVndDVmlO?=
 =?utf-8?Q?JUNp1MSADBY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmJWNjRlM2ZFckF2ZmFSdGFXdzdleWtBSWxzUXhHUFdkckVRcVdRVzd2NUZ3?=
 =?utf-8?B?TVNKb0VXRDFGTlVMQys4aExmbVFmNWFqQnRXMXl0NzhoZGh0RjgzOXRWS3hS?=
 =?utf-8?B?WnFXeEkydWdCTEpOaHlzOFVJM2ErS0F6YjByK29uckhFUis0dVhxcktRZTFh?=
 =?utf-8?B?cEN0RzU0NFhneExXQ2J3VlFIZHdqU0oxb0doZ2xJSXZJL09aSlMySm5tc1pO?=
 =?utf-8?B?KzlweEdScHFQNGhZbXhIcERPN1hZd2pLdjBGVjAxbnd1WHc2NEplNzJGZjdz?=
 =?utf-8?B?ZTNOS1RqODZ0ZVN4T0JjSzZIaTRLZzZrQVQ2UjhSamlEcDM5bDA5ZTV5RUZj?=
 =?utf-8?B?Uk1zeVFUMmdBYkZZNUFFODRLeDJKcWlMRVUyc3hKeDFwR044TkRsU0RIZG1t?=
 =?utf-8?B?N2ZZd09YMjNHaEo4QmNjTzRHYzFtRGxENHgvZXZkU2p1WC9MSXRoMHJ3VmhO?=
 =?utf-8?B?NklpcWMyQzlmaUxHRnhLaUhQMjB5Ymg0cWR2VCs3K1RsZnBCMVNyL2xJYUZ0?=
 =?utf-8?B?YjlIbWNhOHZybCtKNmJIeDQ0YVUzQmh3Tkp3RE56ZTdWa1h0UUVjSXVGNFky?=
 =?utf-8?B?Q1dySUhQY2gwTUdqaHBtcWRnZXA0a3ZZclFQVFVCRUJNSzF1SzYrVXpydE5I?=
 =?utf-8?B?bVZGakNtbGxkVDFPdWhnSUJ1MEJCakozcHJVbE5CUysxcXhtd1ArdVRSQjk2?=
 =?utf-8?B?Uzk1UE5WVm54L25uTk9QaU9QaUdLTURVRTR3bEhjLzZ2M1hab1pjVzJzRmFS?=
 =?utf-8?B?R2ZCKzZweSs2MWl0dzdMSTMyak1rQXF1eVFIWmF2anQrNlFLNzBKQTBIQ2hU?=
 =?utf-8?B?czdvUnk1T2RuMmFTMk1INVJWUEhUQkRHcEtQOWhjTkt5QU9OUkUzRHlOcUVI?=
 =?utf-8?B?MGo1R0V1djMycURQYUdmdWowSE91N3E5d285VkpQNWhUcklUNTcwYjJjVTgx?=
 =?utf-8?B?ZkMrUjhPRDhnbHlKS2VJYWMvZnBlV0xRUkY3VUpZU3MyOVQvMDV2a1BvRFY0?=
 =?utf-8?B?TFJYeTNvcEZFSDAybG1CTm1ubmhYV3JVYmM0UitZblRYQ1c2M0pHTklQM3gv?=
 =?utf-8?B?eFBna2p6c1ZyL0t2c3pRTGdFcXV0OHNCTUZ6eGJSSUpXNGNZYWtpSU05cUxl?=
 =?utf-8?B?T3hxdGRzTGtZb0RWeHZRVzdXRE9ka090NzRLWE1Qdkwyb0Nnc1ZiMzBmZzZV?=
 =?utf-8?B?MWJwT01TanhOVWQvNUdhS0cxN3dPRG5yeTlNYUdVU1BYWnc1enFmMmpiYUJE?=
 =?utf-8?B?Nk51OEpEd25HOUxVUFVRTThvckUvcVRmRDUvMjNVTWdLajNrejNUUHBJc0lQ?=
 =?utf-8?B?YUdsWFJ3SVNpTXk3YXFObytUd3ZqL1E5elJ4WkpYOFdIQTExa2RVVjFRZ1lo?=
 =?utf-8?B?VW9va0pMWHJNMWw1bXl2RWI1YjhvUno0K0hFaSsyNkhZVUpNL3p3M1FiN3Nv?=
 =?utf-8?B?Y2s5VkJ5RlJZL0ZVMWlaQlZjNmV3ZTZ3c2Y2cVRKQW5DU2NHNGl2Z0dEdGZI?=
 =?utf-8?B?RzQ0T0pTVFBXUG1CUHBSaERBd1pLRXdNRXRiSTlEOWxrK2ZkMDhrZ1BQejdO?=
 =?utf-8?B?YW94S1g5NXVSS0R1SFVQWEhLZkRhZndXdzVjU3FYamEzMThWaUhyeFRoNGlS?=
 =?utf-8?B?Wi81cGV3MGVvcDg5N1EzREZZQkljQXc2ZDhjK0lKQm0wWDJMQjF2a0J2NHZF?=
 =?utf-8?B?NUtKZjZkUkFHTUNqQW1WcGdnUmJtc2lPODF5ZmYrMVdhM3ROMFd4ZGhVc25w?=
 =?utf-8?B?QnpSWGZjVDkxS1BqV25hQUR1K2lWT1orRFZwbk5ReGRrblNnV09VZ1drZXhW?=
 =?utf-8?B?cXQ3NE9ZY1huQWhJTHR1bCs2WmFxbUtCREhmbFJZREJxWlBUdWlKVTEwb083?=
 =?utf-8?B?bjVhRERvSVYxSnFqTDRBT2VDQkQ0S0NEenJDa3g3TE05WEZnSVk3cmxmSzVo?=
 =?utf-8?B?TFY4R1A4c1VMUWhIM2tsMmw4L3Izc0Q0U1ZPZXlBK1ViYWNMY0NIM1diMzdF?=
 =?utf-8?B?MGF6clF4Vk5LNWFtSXNMSVA5NmY1QUkybW5acitIUE5lMERFQWI3cGFJSjV6?=
 =?utf-8?B?TzVnZ0xEK3ZYbitNTFZrM2owQ1gxUlZYSSsxYjJ1Sk5rcGlVSzdyN0tla3pY?=
 =?utf-8?Q?5EC5L6rN6oNo0yqhvzKot8loN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5cf0b9-9f29-4ed0-ace2-08dd81b6a713
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:59:24.7186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdxkmrmN4lhuAQkKR3ZG7IAKssAzkrDG49wLEJhwC78CGGsp1t2NS3VZn7sDPje8nwGmhJW57SEoE6kX8uwx5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6358

Hi Mario,

Please accept my apologies for the delayed response to your review 
comments.

Thanks,
Pratap

On 2/28/2025 10:33 PM, Mario Limonciello wrote:
> On 2/28/2025 10:45, Pratap Nirujogi wrote:
>> The camera sensor is connected via ISP I2C bus in AMD SOC
>> architectures. Add new I2C designware driver to support
>> new camera sensors on AMD HW.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>>   drivers/i2c/busses/Kconfig                 |  10 +
>>   drivers/i2c/busses/Makefile                |   1 +
>>   drivers/i2c/busses/i2c-designware-amdisp.c | 266 +++++++++++++++++++++
>>   drivers/i2c/busses/i2c-designware-amdisp.h |  24 ++
>>   4 files changed, 301 insertions(+)
>>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c
>>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.h
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index fc438f445771..79448211baae 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -592,6 +592,16 @@ config I2C_DESIGNWARE_PLATFORM
>>         This driver can also be built as a module.  If so, the module
>>         will be called i2c-designware-platform.
>> +config I2C_DESIGNWARE_AMDISP
>> +    tristate "Synopsys DesignWare Platform for AMDISP"
>> +    depends on I2C_DESIGNWARE_CORE
>> +    help
>> +      If you say yes to this option, support will be included for the
>> +      AMDISP Synopsys DesignWare I2C adapter.
>> +
>> +      This driver can also be built as a module.  If so, the module
>> +      will be called amd_isp_i2c_designware.
>> +
>>   config I2C_DESIGNWARE_AMDPSP
>>       bool "AMD PSP I2C semaphore support"
>>       depends on ACPI
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index 1c2a4510abe4..cfe53038df69 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -58,6 +58,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)            += 
>> i2c-designware-platform.o
>>   i2c-designware-platform-y                 := i2c-designware-platdrv.o
>>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)    += i2c- 
>> designware-amdpsp.o
>>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c- 
>> designware-baytrail.o
>> +obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
>>   obj-$(CONFIG_I2C_DESIGNWARE_PCI)            += i2c-designware-pci.o
>>   i2c-designware-pci-y                    := i2c-designware-pcidrv.o
>>   obj-$(CONFIG_I2C_DIGICOLOR)    += i2c-digicolor.o
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/ 
>> busses/i2c-designware-amdisp.c
>> new file mode 100644
>> index 000000000000..dc90510a440b
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>> @@ -0,0 +1,266 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
>> SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>> DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/dmi.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/property.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/suspend.h>
>> +#include <linux/units.h>
> 
> Can you please audit this list for accuracy?  It seems like a very large 
> number of headers.
> 
> Just off the bat for example I didn't see any DMI use, so dmi.h probably 
> isn't needed.  I suspect there are others.
> 
Thanks. Will clean-up headers files in V2.

>> +
>> +#include "i2c-designware-core.h"
>> +#include "i2c-designware-amdisp.h"
>> +
>> +#define AMD_ISP_I2C_INPUT_CLK            100 //100 Mhz
>> +
>> +#define to_amd_isp_i2c_dev(dev) \
>> +    ((struct amd_isp_i2c_dev *)container_of(dev, struct 
>> amd_isp_i2c_dev, dw_dev))
>> +
>> +struct amd_isp_i2c_dev {
>> +    struct dw_i2c_dev    dw_dev;
>> +};
>> +
>> +static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
>> +{
>> +    pm_runtime_disable(dev->dev);
>> +
>> +    if (dev->shared_with_punit)
>> +        pm_runtime_put_noidle(dev->dev);
>> +}
>> +
>> +static u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev *dev)
>> +{
>> +    return AMD_ISP_I2C_INPUT_CLK * 1000;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>> +{
>> +    struct i2c_adapter *adap;
>> +    struct amd_isp_i2c_dev *isp_i2c_dev;
>> +    struct dw_i2c_dev *dev;
>> +    int ret;
>> +
>> +    isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(struct 
>> amd_isp_i2c_dev),
>> +                   GFP_KERNEL);
>> +    if (!isp_i2c_dev)
>> +        return -ENOMEM;
>> +
>> +    dev = &isp_i2c_dev->dw_dev;
>> +    dev->dev = &pdev->dev;
>> +
>> +    /**
>> +     * Use the polling mode to send/receive the data, because
>> +     * no IRQ connection from ISP I2C
>> +     */
>> +    dev->flags |= ACCESS_POLLING;
>> +    platform_set_drvdata(pdev, dev);
>> +
>> +    dev->base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(dev->base))
>> +        return PTR_ERR(dev->base);
>> +
>> +    ret = isp_power_set(true);
>> +    if (ret) {
>> +        dev_err(dev->dev, "unable to turn on the amdisp i2c power: 
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
>> +    ret = i2c_dw_fw_parse_and_configure(dev);
>> +    if (ret)
>> +        goto exit;
>> +
>> +    i2c_dw_configure(dev);
>> +
>> +    adap = &dev->adapter;
>> +    adap->owner = THIS_MODULE;
>> +    ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>> +    adap->dev.of_node = pdev->dev.of_node;
>> +    /* arbitrary large number to avoid any conflicts */
>> +    adap->nr = 99;
> 
> Would it be better to allocate an IDA here?
> 
Thanks. Will remove this hardcoding and use the dynamically assigned bus 
id in V2.

>> +
>> +    if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>> +        dev_pm_set_driver_flags(&pdev->dev,
>> +                    DPM_FLAG_SMART_PREPARE);
>> +    } else {
>> +        dev_pm_set_driver_flags(&pdev->dev,
>> +                    DPM_FLAG_SMART_PREPARE |
>> +                    DPM_FLAG_SMART_SUSPEND);
>> +    }
>> +
>> +    device_enable_async_suspend(&pdev->dev);
>> +
>> +    /* The code below assumes runtime PM to be disabled. */
>> +    WARN_ON(pm_runtime_enabled(&pdev->dev));
>> +
>> +    pm_runtime_dont_use_autosuspend(&pdev->dev);
>> +    pm_runtime_set_active(&pdev->dev);
>> +
>> +    if (dev->shared_with_punit)
>> +        pm_runtime_get_noresume(&pdev->dev);
>> +
>> +    pm_runtime_enable(&pdev->dev);
>> +
>> +    ret = i2c_dw_probe(dev);
>> +    if (ret) {
>> +        dev_err(dev->dev, "i2c_dw_probe failed %d\n", ret);
>> +        goto exit_probe;
>> +    }
>> +
>> +    isp_power_set(false);
>> +    return ret;
>> +
>> +exit_probe:
>> +    amd_isp_dw_i2c_plat_pm_cleanup(dev);
>> +    isp_power_set(false);
>> +exit:
>> +    isp_power_set(false);
> 
> I see 3 cases that isp_power_set(false) is called above:
> * success
> * failure exit probe
> * failure exit
> 
I should have removed isp_power_set() references before submitting the 
patch. Sorry its overlooked.

isp_power_set() is the exported symbol from ISP driver. Will take care 
of removing the dependency on isp_power_set() in V2.

> exit_probe falls through to exit, which means it's called twice.  That 
> seems to be a mistake to me.
> 
Thanks of identifying the bug with "exit_probe" and "exit", will fix it 
in V2.

> But since it's also called in the success flow this makes me wonder if 
> it's better to use a macro like _free() which will automatically call 
> isp_power_set(false) when the function exits.
> 
> Furthermore; are you missing a call to isp_power_set(true) in runtime 
> resume and isp_power_set(false) in runtime suspend?  It would seem 
> logical to me that when runtime suspended the tile is off and when on 
> runtime resumed it's back on.
> 
Instead of direct call to ISP driver function, will add the ISP device 
to generic power domain (gpd) to control power remotely using pm runtime 
calls.

>> +    return ret;
>> +}
>> +
>> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
>> +{
>> +    struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
>> +
>> +    pm_runtime_get_sync(&pdev->dev);
>> +
>> +    i2c_del_adapter(&dev->adapter);
>> +
>> +    i2c_dw_disable(dev);
>> +
>> +    pm_runtime_dont_use_autosuspend(&pdev->dev);
>> +    pm_runtime_put_sync(&pdev->dev);
>> +    amd_isp_dw_i2c_plat_pm_cleanup(dev);
>> +
>> +    reset_control_assert(dev->rst);
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_prepare(struct device *dev)
>> +{
>> +    /*
>> +     * If the ACPI companion device object is present for this 
>> device, it
>> +     * may be accessed during suspend and resume of other devices via 
>> I2C
>> +     * operation regions, so tell the PM core and middle layers to avoid
>> +     * skipping system suspend/resume callbacks for it in that case.
>> +     */
>> +    return !has_acpi_companion(dev);
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_runtime_suspend(struct device *dev)
>> +{
>> +    struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +    if (i_dev->shared_with_punit)
>> +        return 0;
>> +
>> +    i2c_dw_disable(i_dev);
>> +    i2c_dw_prepare_clk(i_dev, false);
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_suspend(struct device *dev)
>> +{
>> +    struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +    i2c_mark_adapter_suspended(&i_dev->adapter);
>> +
>> +    return amd_isp_dw_i2c_plat_runtime_suspend(dev);
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
>> +{
>> +    struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +    if (!i_dev->shared_with_punit)
>> +        i2c_dw_prepare_clk(i_dev, true);
>> +
>> +    i_dev->init(i_dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static int amd_isp_dw_i2c_plat_resume(struct device *dev)
>> +{
>> +    struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>> +
>> +    amd_isp_dw_i2c_plat_runtime_resume(dev);
>> +    i2c_mark_adapter_resumed(&i_dev->adapter);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dev_pm_ops amd_isp_dw_i2c_dev_pm_ops = {
>> +    .prepare = pm_sleep_ptr(amd_isp_dw_i2c_plat_prepare),
>> +    LATE_SYSTEM_SLEEP_PM_OPS(amd_isp_dw_i2c_plat_suspend, 
>> amd_isp_dw_i2c_plat_resume)
>> +    RUNTIME_PM_OPS(amd_isp_dw_i2c_plat_runtime_suspend, 
>> amd_isp_dw_i2c_plat_runtime_resume, NULL)
>> +};
>> +
>> +/* Work with hotplug and coldplug */
>> +MODULE_ALIAS("platform:amd_isp_i2c_designware");
>> +
>> +static struct platform_driver amd_isp_dw_i2c_driver = {
>> +    .probe = amd_isp_dw_i2c_plat_probe,
>> +    .remove = amd_isp_dw_i2c_plat_remove,
>> +    .driver        = {
>> +        .name    = "amd_isp_i2c_designware",
>> +        .pm    = pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
>> +    },
>> +};
>> +
>> +static int __init amd_isp_dw_i2c_init_driver(void)
>> +{
>> +    return platform_driver_register(&amd_isp_dw_i2c_driver);
>> +}
>> +subsys_initcall(amd_isp_dw_i2c_init_driver);
>> +
>> +static void __exit amd_isp_dw_i2c_exit_driver(void)
>> +{
>> +    platform_driver_unregister(&amd_isp_dw_i2c_driver);
>> +}
>> +module_exit(amd_isp_dw_i2c_exit_driver);
>> +
>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("I2C_DW");
>> +MODULE_IMPORT_NS("I2C_DW_COMMON");
>> +MODULE_LICENSE("GPL and additional rights");
>> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.h b/drivers/i2c/ 
>> busses/i2c-designware-amdisp.h
>> new file mode 100644
>> index 000000000000..f98661fdaedf
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be 
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
>> SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
>> DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +int isp_power_set(int on);
> 
> Where does this symbol actually come from?  I didn't see it in this series.
Sorry for the confusion caused. This symbol is coming from ISP driver 
which is not part of this series. We are planning to submit ISP driver 
patches after the completion of platform and sensor driver patches review.


