Return-Path: <linux-i2c+bounces-15276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CE37DD3BECA
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 06:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 55DB935B949
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 05:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E4735E556;
	Tue, 20 Jan 2026 05:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UNm2HLSU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E963C6BFCE;
	Tue, 20 Jan 2026 05:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768886775; cv=fail; b=bOdQU/KBzhgBI3vFrDANo/8BUobfU9Br61xiozwc2HPDmNllMTKRI4LAsJPWxlSiIfUPA/z6vVI4NAvln00ptMoqN/in/enUBUCdzKv7dSRr1y4G/doCO1sPYksuNslIa3aDrBHBAx64ADTMCJndaEJYWbCXj92fp4qu+qhUj1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768886775; c=relaxed/simple;
	bh=hulahTCj06d+2rLTwRep2lGm/nlu8Xc3qzyuM65LW/Q=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VADUhEYXmXJ8fwCNJkGOx63KOttlLNgPHe09MwTcWEtfj6nkuDt0Knyigz83muvupOXDRCWXJqK6M0GwVZWUM2wlYsqG4+XQYUGwyGQfF+fWF34YZLKmaXhxGmOrp/beNiZu38JmiJEkJLP9P2H0jg+u51gqazAcD4IfIXzbZCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UNm2HLSU; arc=fail smtp.client-ip=52.101.193.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxsp+vLUxYWPDCN/HAFDx2cn9rAzBi/qLh2wWaD4BvUUYcm4v+OmE70daNX2Uiaa2SfXQEzBLxpUUN0nhqgwmfGsSVh6pfasJwILFVOZ90KP9rRlap4Z1RYNEDaMRIz1WlSMI1f124Af2wFiJTEu3QAheBxWSjVDA/ZIMyb0j33lyPvc/OChDm1mU3voSvsowYBHbByLmwlkoFW0tT+eogE/j7DBKueGER7X15bnGUB6K8w8x0OrqxNrKBmtkdBfKJllRrq1Tm4IMIPVqmicX2Hn32c4CfsIXNPqwy04K5hRDpdjkhDrzAOk1d5KibP5X/VXalekrM5PfFHRvYDH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWlJlW6K2KAiHQZdRDHFKkkQwG3N1+3qlyNHv78wWgY=;
 b=WFYQXffplRWDfi+7qZ3sQNiiPdDmrjgYZ67v6aE4PsvtH4GEZd6+pjpNP1ifDrUo7RChFtBKoKNRtlhH2Rmjl5hGs1MAdyFjO334RG6tkFQ8qsv9wkgZrIS9iguQ605Rwb+q+bZnaTyV2+a/onOa1+5Xs5EfKqahn8SBnfhYe9+/2Ffatpx//7G1Ppr/peDt8XCV+gJSMdgmgqiCAMfpE7Y9+A+kKZdcHqmbwen/0EIG91HBBXz6FmZoU92a0iYu0VF4wC3IeJ5srXSW5NJuYeP6aeEQAHUDm5lLTj5jSxyQZoAQM3HeZCk04wzYp4s4rayhg+5bRPgzwKULILXZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWlJlW6K2KAiHQZdRDHFKkkQwG3N1+3qlyNHv78wWgY=;
 b=UNm2HLSUMaNFeNuarPxI09BWdUkyuRdAHCXTUvQBrikzEKGTEFaPiKlmU0636q2g2NGCYkXdwxPmvMN7Yc9/QcYsLkoqLsJANKGs1W/wnrGAInNe2tJE2h7iqb+OeOLkgrJ2lKnu2U/hwwgi9AJiDDXQ2ECDf5aACnBkd6sLq6WKwyswZxX/4kKxQiV1+/ESVsAsNFRIBoy/mHtlRYQTp0SQ14uCiu4eD61eRknKNwvAIVcO4rkkXfFS/349vYWnx6t3gfdi5qh1J/2adKxWcR8xWiGEUNB0qaxr0co7OUFbRCg6B8ed1DfrOcsGu30htL09L56lIC6idotW3iUAuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 20 Jan
 2026 05:26:08 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 05:26:08 +0000
Message-ID: <71e7a882-148e-4d83-bc27-4e3cc35b04b6@nvidia.com>
Date: Tue, 20 Jan 2026 10:55:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Jon Hunter <jonathanh@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113165929.43888-1-kkartik@nvidia.com>
 <20260113165929.43888-4-kkartik@nvidia.com>
 <089e771d-a4fb-45b0-8c34-5393a4082def@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <089e771d-a4fb-45b0-8c34-5393a4082def@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::7) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdf257a-dc8c-42f5-2db3-08de57e46a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STFwRVVXRzdTS1k1RnRyTFR6L21HZ1laU0JWRlRzZXBnQk8xSCtHaHFDUlR3?=
 =?utf-8?B?TERwUUQzcHBnN05ZN3ZmTnBUcUpUK3ZUNFA5VVBmNFlVaXIyUjZQeUloUWNT?=
 =?utf-8?B?Vm8wUWJhQTMzM3RRQ05mWGdkTm0vL3pGSk0yWW1JL1ZneXcxS28veExzVGdY?=
 =?utf-8?B?RGozVHJyb2JrMlE3NTNJUkhXY0dQc3hoQXFyTTNtTTdMNjYrTU90TnNucWNo?=
 =?utf-8?B?T1VOSzdqWmtaYlFCd2VobTFwNVpyTWZKUmQ0VFVDZU9DMEYyWjB2UHRIejNP?=
 =?utf-8?B?b2Zmd0hiSnZuT2Nldnd5aFNaMCs0SXdtd2FsRUNkOENabDdpeHJBTFBBUGZT?=
 =?utf-8?B?cTQrdzdaaHNiTDlWQ2VjRlV2NkRreEw3Y05oU3RHeDlkUE9JYUJRaGgrbjgr?=
 =?utf-8?B?UHh3N2gxbkl4TEo5QXNGZzlwYk1IcWVaYnc3aGVUc01XZ1RGQWF4K0c0eTlj?=
 =?utf-8?B?YkNjTDVNS01hM291UkkvakVkMTdJSjRSWnZlblVEL0p3dUR5NTRXVnI0SCtJ?=
 =?utf-8?B?Z205R3pHZ2hwUFRGMktKRm4ySFVKeE5mRm5sZzY1Tk9BdURQcTQrN0JIdkJm?=
 =?utf-8?B?V2dhRkJXZG9hQno5cUN4QW5IdmNPMGlKN042UC9MTWVFY0tyaVNvOWZmdXg1?=
 =?utf-8?B?RU1rejYrb0lXWjAzL01qcmlaQmh2TnhDUEgySXA3WEpOZGpqNTNJLzkxMlV2?=
 =?utf-8?B?dGpUY0JSTGFtT3NtWFYwZFhqMy95cXBKbnBzUzJBdWNIeG5KOUdOVUVlQzBP?=
 =?utf-8?B?OVpFbjYvUVMvaXpXclVQYk51ZUFwdTFGQjhzb1hlNGRkUjVZVjZXV3ZRUkVy?=
 =?utf-8?B?bUc2akxPLzBpMCtyTytJeDZ4amVTaElDVUVGQ25zcVpoM2hOdnBUYmQrdXlF?=
 =?utf-8?B?L3VJWG5zRXRLK3c2OFJaUW95RlVIUGRCN0hoZjROVWM2eXZHbCtDVDJicTBL?=
 =?utf-8?B?bDA4QU1vMzdxNWQ5WmhqckRWWjArcEtsMWNRTzRwV2t2ZDlvWG1rMFFkK05a?=
 =?utf-8?B?N0tKTjdnVDc3RkcvWVRxWTlER0lXMWljU1FsNTMzZEVSR2lDOC91N1dSR0ZD?=
 =?utf-8?B?bDdYYTZPMllWdG8xNmpLbWw0ZEVsbzlzb0IxOXJiUDQ5dHNxZHJra2lFbVA2?=
 =?utf-8?B?dTFkZDdFaUlpWUkwNWg4Sm93RzN1cFpLQSsyKytOL2lSZlFBL2dka0hObjJk?=
 =?utf-8?B?VTNBTnN6T2JGYXphdks4djFiN0xUbklmMEd4Rm9aQ1VIdHFuNU8vU1EzZ2o4?=
 =?utf-8?B?WE9PL3lya0RaNE1QSGFxV2FBaTVTNFFxQjBuYW85UWZGdGR6dkxzZlZZaXNx?=
 =?utf-8?B?Q2tUY1Q0cE5mbVV0WHF3NEZzSjg4N1pReCsza0pqeWdDam9JZ3ozQ2tDSytF?=
 =?utf-8?B?VzVBY3RIeTJQNm5FRWdCY2VuTUVnMjA2QUZiRFJZTFNKblVESEZGOHFOdXJy?=
 =?utf-8?B?QmRuQit2SXNrRzdsZ0RtWGc4UWdISUo5QWo4RXlwTGJsNWVzNDk3QXJyQXpl?=
 =?utf-8?B?d3lBYVZqNEZYVm9JTHZCUEhQcHFoNnJiNUgrN0paUU1tUlJFcXpKUFRWNzAz?=
 =?utf-8?B?UDRkZ3Z2R3VId1BUZVVrTXFGbVdWM0VGUVI5QnpyejlrY0V0a2preWw1bkR6?=
 =?utf-8?B?d08zaGNGdGtQdnVNVEFIUldxMHVwLy9uM1Npb3F5V09VbmZGVVUwQXk5TEZN?=
 =?utf-8?B?cFRqck9wLzhRNDkwWXJyZjhsK25NYXYxQk41bEJJU1ZrRG00b0FSSk5kVE9M?=
 =?utf-8?B?SkNCRmljMnNiSzVCZGNydmdyVGRHbU9qK2VqcWhWc0cwa2QxYzQ3a0RSbzNN?=
 =?utf-8?B?TnZFYldGUzUwMU1tc29leWVHcHNVaXc3WDRpb3VualMzdlRVWi9WNWl6bXpo?=
 =?utf-8?B?WmlGZjhtRXlqRWF5cXZRcno3bW4rRzEzTExqWlNzZ3pPMG45dHFweVBaUGRx?=
 =?utf-8?B?RUFCcUJnOEpheGM3cFJlVnZiL2JlNVJ4bnlkMjdYYlVoWjJBTGY5aEZqVWlH?=
 =?utf-8?B?d09MNThMcm00akM1ejB2SGVhYlJzeE5tRU9WdkxhMktJVG56bWRzcTZKN1Zz?=
 =?utf-8?B?MTloVjFYNEw4clRQdStoMjFWL3BSSmRiOHJITXA3NkVpajY3eHVZQy9nOGJp?=
 =?utf-8?B?Smh6bUFLYXUyaTdVQmhYOUZobm5vWHdRN2pQbXg2UHVzUHNXUnNnUmg5SlZK?=
 =?utf-8?B?dmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mmd1S2QvdGxKcE1Cbko0U0RFc282M0srQ0hYZittK0tVK2o0UlZyYnI0K0Rm?=
 =?utf-8?B?eklseHo1L1kvSlg1UzBLNGxwT1FMZWhscW5rSUo2M3E2V0d2aHpLT3AxeVIx?=
 =?utf-8?B?OU1nWUh1dDZkNFJNTEVKeURnSVJ6Tk9INFp5TUV6YnhYc0xDbzJkd0hZZHgr?=
 =?utf-8?B?TFhnS0pYaytzdTdpc1JPa2h4V0NOYkx2R2owUmg1TDZUM3VYdVBJYTdGSFVK?=
 =?utf-8?B?WmR0dFJINU03MkVJUUw5bVhBdU9xYUNzbkRNUU4yR21YMEswV0ZuQXhEVGdp?=
 =?utf-8?B?aWpTblBPdFNmLzlQYkJ3L2hBaE8rZVd1NG5GU1hXODJidGpBN1BFanFGWmNv?=
 =?utf-8?B?WXREZ3pqM3orbkt6bXNiV29ab3BQWkJkL2JVdmxMM1AwcmRPdTBYNDdIaXVR?=
 =?utf-8?B?NnhJUXlUcktPbGNnR3ZxS2h2QlFIMkx2WS90clZVZzlEWStFQUtzYis4UVpI?=
 =?utf-8?B?SU1ETG14WWVUN1R3cndESEZmUkNEM2krcWVUM1cwRlJlaThqTENnMnZteEtR?=
 =?utf-8?B?N0poZE0rc2pRK25LVzZHRlVSS1MvVTRqZU53SHFPanJ0Z2FJd2hHWjg4b055?=
 =?utf-8?B?Q2FjTzRYWHFrWkdYN1NlUUVCK0NQS3FKSzYrVCtFNFliWk1HVlJyVDQrUlFj?=
 =?utf-8?B?UWU3Skk0K2NleHNianNaQzIrR3JhQ1FLTmVLOXlmMGFDNTlvZ1IxazdKTklP?=
 =?utf-8?B?STdpYTJWcDh0SVhHelZPUGphV1MyWkdsUlpGbjZweEw0Uys4WllZQUxISjFG?=
 =?utf-8?B?RHVjM1FzK1B2aFJ6UTYrR2VqN0Jza001djBpaXVWSFBDOXZzQnUwMVpQODdK?=
 =?utf-8?B?VGlmNjMxR2U3c0dVZStWSy96bTBjdWp2cTA5aHl1aE9YYWx4RGthamRUdU1B?=
 =?utf-8?B?QVVHeVp3WGd6Uko1bmQ1VXdYV29nK1pEVkNqYkN4V2hnbWVpRCswR2tHQjI1?=
 =?utf-8?B?ejBlaWcrZXJwWVM5NmVJN1QyRFZrVGYvMUp6VzNkR0xHTzNuUTc0c2RsY2JI?=
 =?utf-8?B?VkFZenR5c3FsN1QxVnBRUXNqT1V4cmx5akZhNTUxalNZZzZVQUpCRGlHSFNK?=
 =?utf-8?B?UEdrY0dpeU93dStnNEh5Y1k1MHlCbE95Z0hQNTdmcnF2b2wrV2c0dEc1U1B4?=
 =?utf-8?B?cVdQbHNUV0cyUklCS05nMmJCdUh1VElRMXV5Qll3VTBlOVM0T1djUURoTUNk?=
 =?utf-8?B?cTdiK25SWHRRc3JvUFBLQ3lLeHRrNEIwRmVyeHN1ZkxBenFJOWhscHV5Yjcv?=
 =?utf-8?B?cVdLV0dKUnlPL3ZJdGYzVDk2bVExVWNiRzVKbzZvWEt5bkd0SEtzZC9iV202?=
 =?utf-8?B?VklzNkhlbGJDajVtRFZ0MXFmbldKM2hQQlh5NjJZMDBqTndSQ3NuTzIrTHhZ?=
 =?utf-8?B?MWlxaWFIaUpQd1JINVkwSGFybjdEM1ZpTmx6VzdHKzhVSE4wQzdOTDFJUGY3?=
 =?utf-8?B?VVBkL3A5Vy9kNHVqVUw2d0NDMXVkZDRDeWh1Qkl6VWZBKzAweWZsZWFDMEhk?=
 =?utf-8?B?QnJtK1hkNkNxZ3U5TE1EZnN4NHo3ckpEOE5MaVhmNjhmcVEvZ2REUW1va0tP?=
 =?utf-8?B?L0ZpYVhxUXZ4dzR3c0JZRzVrNXFaWUhFZDNYRHZrelNNNmhVc21hUE9vMkVK?=
 =?utf-8?B?VDd1RWE4NDRvTXNsSTQ1UmovVnJOYVpoU0hpem1aTzV2bzNHd0NBRUlzb0kv?=
 =?utf-8?B?bXNWa0xGbGxnMDluNlVaTDdTSHg1aFN5MHZWemVmWW8rcS9DQ0kvc0RsUGNP?=
 =?utf-8?B?SmM2L1JqQlJuVzc1R2NKMzNsODVDREF1c2QyVnhEQnlhMVVjUzNjYXgzYnFC?=
 =?utf-8?B?bzh0SEdhN24xUVNHdmpOZTNhbGhJbXpFa0xGZlVnVzREWEdGL3FMRFYyUmo1?=
 =?utf-8?B?RFB0OXlmNlZSMzFEV1hja0o3S1NCSHpGbXlISk5RbVRkZWk2S3YyUFV2UTBu?=
 =?utf-8?B?eDNpUkU3RWNKWTZRZnZienZrUWNadDZIVWZqd2R2Wks2a0RleWZyUWNEZlpq?=
 =?utf-8?B?Rm5sbDl2LzJnN1BKYUNKMzh1b2hDZ2srczhlSFoxeFhiZXU1WVVLS2IrMWIw?=
 =?utf-8?B?Wm90TlVlaGpackRhbnFkbk5nNUZweUJ2ck9ta3VMWVZJUktEbkpUQ2F4YXFL?=
 =?utf-8?B?SWR3YkpkbEhjVkhOMFZYK3UxcmNkcjNLWnJnZjFnVVNnb3c1bUc1WmV4djdY?=
 =?utf-8?B?cjA3bVpkNUpaY0dxbGVhdWp2a3JSWHgyOU5Vc1NJUnZUL3BQQmxxZEpCZDRI?=
 =?utf-8?B?YlN4WGtTUHdiY3JSczZybVVLSzJSdG45MElpM3Q2OXplTG1mdk5zZGhTWHhz?=
 =?utf-8?B?VHhNa2lETENoZ2VOOFFsVHNVaDF3V09lVWFETHNhUkdXRGtMMWtWZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdf257a-dc8c-42f5-2db3-08de57e46a5f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 05:26:08.5256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4v4mVH0kFPSttkr10UDKXFOR6SxAklSCa9Aitwk/UgaaUZYtXmIS/8EU5be93xnlkhv+KZthIXGTfesH2xfyYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578

Hi Jon,

Thanks for reviewing the patch!

On 20/01/26 02:31, Jon Hunter wrote:
> 
> 
> On 13/01/2026 16:59, Kartik Rajput wrote:
>> Tegra410 use different offsets for existing I2C registers, update
>> the logic to use appropriate offsets per SoC.
>>
>> As the registers offsets are now also defined for dvc and vi, following
>> function are not required and they are removed:
>>   - tegra_i2c_reg_addr(): No translation required.
>>   - dvc_writel(): Replaced with i2c_writel() with DVC check.
> 
> This says dvc_writel is replace, but ...
> 

Yes, the commit message needs to be updated.

>>   - dvc_readl(): Replaced with i2c_readl().
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>> Changes in v7:
>>     * Fix Tegra256 reg offsets, change it to tegra264_i2c_regs as it
>>       supports SW mutex.
>> Changes in v6:
>>     * Do not remove dvc_writel().
> 
> This says it isn't and ...
> 
>>   /**
>> @@ -348,45 +466,26 @@ static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>>       writel_relaxed(val, i2c_dev->base + reg);
>>   }
>> -static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned int reg)
>> -{
>> -    return readl_relaxed(i2c_dev->base + reg);
>> -}
> 
> If we are removing dvc_readl() I am not sure why we have not removed dvc_writel().
> 
>>   static void tegra_i2c_dma_complete(void *args)
>> @@ -621,12 +720,12 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
>>   {
>>       u32 val;
>> -    val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
>> +    val = i2c_readl(i2c_dev, DVC_CTRL_REG3);
>>       val |= DVC_CTRL_REG3_SW_PROG;
>>       val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
>>       dvc_writel(i2c_dev, val, DVC_CTRL_REG3);
>> -    val = dvc_readl(i2c_dev, DVC_CTRL_REG1);
>> +    val = i2c_readl(i2c_dev, DVC_CTRL_REG1);
>>       val |= DVC_CTRL_REG1_INTR_EN;
>>       dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
>>   }
> 
> We could just call writel_relaxed() directly if we can't use i2c_writel().
> 
> Jon
> 

This makes sense, we are not doing anything special in the dvc_writel(), it can be
replaced with writel_relaxed() directly.

Thanks,
Kartik


