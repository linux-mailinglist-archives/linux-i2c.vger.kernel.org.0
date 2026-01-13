Return-Path: <linux-i2c+bounces-15096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E84D18C13
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 13:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 807063011772
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 12:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B96310777;
	Tue, 13 Jan 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nhh3qjmC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829A214813;
	Tue, 13 Jan 2026 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307686; cv=fail; b=pR4nczwdwA/MHIs81oZMFxfd1aCDOFoFC+d7ZCh9y5go/9Qlk9HCpsrTctbNRdeLb+ZMRrx8XIhSOXbN8lfDhJDJqDbsHBLNhVjcUX7Rdt7gwscNyBChLmKS2EGJWiBW6xOo6k4b5+/fM1UJcaibE0NiOqo6R7MghLHxxD2F23k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307686; c=relaxed/simple;
	bh=x57vK7e3iwNg9UfKTPun7QWHTdR1AwjgDeHHzaWiWLs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I4PduwPrYXWKp8jM6hD8GhttLBcBICePcuSUWcYRkq006+CwQfVCqgF9kw4qLcVrZcJXKP7CE6OPiv2ddtqjlbTTak/bpbPIuKjAMzsBZXQbNDKBGEdH6rX5NYTlmLXa+cXhQqLGX6QqWBgVSrBKM0lfFQ6E0vsnS1pph6Eemc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nhh3qjmC; arc=fail smtp.client-ip=40.93.198.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mowf5wF1RopYpHPN+EjSudMy5wf/zViafFRcnYmB4rk4x/doGagUGV9wc6XyaqanuqDR4PFXeZr6eyQA15+VhLCNJdgyRux14Br2ExmBztWUMwFzHsd1f/kthPDXQCyv2J+QiRQZWOIW/aJiOSNi4MHNyYOhXy++isX1d/X6NvF1HDnHc7o2xyHMp0LWSAOTcgHxmfHxVIaMJ7vOcTfG/Bhx8Lw5oke4iEnkktNHRW+g0cOnwKU6uqMCAF+mALp4I+7N05ZszecktV3XnFIwNnPCJgacu4QiPGLtMkEedo4O9OI9NETTBnBD3hSR49L9wuGfzjublz3Cs082SBm/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V+jTOzPceaeoul6gzXWr8GT7dbTUtD8O4FK4pVDqaM=;
 b=edSsMu9JHlFBFIMADEcF+M0tIDvAYR+mDCq3cvPfK6x6Bl0Zi7CU0+JxqyXuyzNkUD9823ihYJcCottSC2LV//o0NK+bZm7JKZ3uYzNbBczZDB8DdM3DgbsPmrI8zucvF5iL/aivaq1w2YTvZvIZyodkFz1xmZisW3IsjyVaUngPxRdwu6SAFbd/+EeX72pPeXGUGhloWKUIlC30a2+FdjIaeHuj8NrnIXQYd2ua9yaAy9kMV+OoYvwVI27y21npR9UY98hW+hOjCHfACDQWJuyZjPQ6ejBXwXu/fTrkt6yGsXRPrPLSpZK5nUn/5IASVqp8QVulQmnW7imhAP68TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V+jTOzPceaeoul6gzXWr8GT7dbTUtD8O4FK4pVDqaM=;
 b=Nhh3qjmCyM7gqQXHqxQ5FFsZU9ik83kYKm+7wWIlWbYntGQeaWzX8T1IV0bTbj2pOo/UOp5/LL2qzkPt4AxrF+fHgTGSPW9r/F/dYsXEEDbPvzLJ+g4b96Ecs8A3SCHe13PvNxIcBDSES3BD8ceJg71gb3OXEd5l3nD4i1lCd39r3AL0Er4fgZOGfD8+brccCAX39nOtLDPJMnSK9uu7jo96cRFnWCUE7jEih5wlYgLwy2JUqpS+U+nLMhK9uwfkJ4rIZ+940yRCFRTbShB+YTzXRm/6TksfZjdrZaIJPKnYC5SWXaNoDEYrBbgxGqXDPAsjmAKxBn8SnqaWILSLgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:34:43 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 12:34:43 +0000
Message-ID: <2084e4ee-f984-4c39-95dc-1e2291a815e5@nvidia.com>
Date: Tue, 13 Jan 2026 12:34:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] i2c: tegra: Add logic to support different
 register offsets
To: Kartik Rajput <kkartik@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113090457.41689-1-kkartik@nvidia.com>
 <20260113090457.41689-4-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260113090457.41689-4-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::26) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CH2PR12MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: e59cd182-fab0-43b5-0623-08de52a020d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1RhVlp4ejRaMDIvOXhCUm1QK1hzRmZTeTdHOEFSOE9pZjd0YXNrbmhBbkxG?=
 =?utf-8?B?OGF0YTB4TzAvT3lET05Md3cyVm9qN0NIWFR6Sk5RSU80amtURnVDZjFhcHUy?=
 =?utf-8?B?VUNnZVJwOC83Mk5BL1VuYVZ0MEMydEpEdlNIZDVQWll1cDRxamw4bTREa015?=
 =?utf-8?B?aG5zZjRGWk4zUDh3MG1uSUpqR3dPUmNXcVk1VVNhNkRZNk5mN0FZYjVsQ2tT?=
 =?utf-8?B?ck9Gcko3NHdqelpJYXMweWhxZ3BENzZzL1FlUHBzN25aNlpjbEdCRU0rd2E4?=
 =?utf-8?B?WGRUd2F1Z0xJY3diTWlwV2lCayt1NUVYa3MrSjBnc3E1SVBuOVZQdUM2d0lZ?=
 =?utf-8?B?eWVhNTR2dWI5VWR2Rk5HRjBUU2tGMGJTRHVXUURpMjFFU1RZODBRRnhKRUpE?=
 =?utf-8?B?NlVFTUYrQ1RPVTVESU1rYW0vMHFBMG5tM3NIUzJ5ZHR4dFlJV0JDUDdhQktj?=
 =?utf-8?B?TXBFdlRJYzl5MU5RWGVoYjlheTNMNnF5dmR2Q0thM0Q4NnZHT2oxV3M2QzFY?=
 =?utf-8?B?K0k5SEZJTmt3endxYlpXTHMrVmlYemxiYVJmblMzMDZFL2F5UXpxMit6aXJG?=
 =?utf-8?B?bEcra3NBRW9IS09JOW84bjFJT3pYd3RnQ0xQaHhUM21nV0Fsby82TlN6VGVn?=
 =?utf-8?B?dEtRTEtPUU5IblhFUnFMc2t2SFBmWUp5d2YrWjdObkNwR2pDd3dDQm9xVkpM?=
 =?utf-8?B?NEEreWxhTjRaTjdsU0c3Q0IyV21Mb1R3VmNndFZYZVNlUnZMb0g0ZGlTVWVa?=
 =?utf-8?B?SktGeGJSS1FkZXB6Q1E4RzV1UHNBd2tiRmRFOFJrR2FBUjhzMjh5MGZZdXhq?=
 =?utf-8?B?d3IySlh1VXZSUTNZZy9jVkVoeE1vekJZZ3pkNzFKV0dQMkIvcW5NMVVhVm5N?=
 =?utf-8?B?WjNhMmNWcVVJS3hmNFlxdSs3aTVBYzdoVm9YY1doNnRLb1lJYUE1RmpWMWRY?=
 =?utf-8?B?bVRPUFB4Q2swZ2JXRWs4VGFxbFRwaERkajRjc1RRMmlQSFl5aWlaR1EvdURr?=
 =?utf-8?B?OTBjYkJHZzJzVzQ4RW9yWUJmTFRySjUxdG8xNmdFaFF0OFRsd2R4bG5MUGlM?=
 =?utf-8?B?bTFwWTVXd3FJVDBKQ1dZWm1WNWtxR2p4Rnc4LzR2ZWpqM2ViMGVZMGFPS1I3?=
 =?utf-8?B?MFBpYk45anVjdjdYVW1GYzkyWi91QlYyNmMzQ3k1TFZVNkp3S1k5R1d5Z0dM?=
 =?utf-8?B?dW9MODV2M0RNRXg2R2UvUGYxbjJhbE00amlPQ2RoM3kwUWNaZzV1SVlYRVl2?=
 =?utf-8?B?UU5PSEQ1ZWYzVTJVMFE3Sld0YWVJR3Z2WFBoZXIzVWF6M0NST2tDb3JNSXJE?=
 =?utf-8?B?dkovQmVLRHZPNVFkUTFmMFpya2sxNE9wNTRpcUd0U3hZWWUycFhQM2ZGcWts?=
 =?utf-8?B?czhaeDVqRTd3eVJUZXRBUTVkZEdGV3dwditseVNsWE10N0xRQlJJcngvdnd6?=
 =?utf-8?B?MXJRSTRoSWlxNzJQdlZ1dHBMU0h6b3RuZmtLOUVSYXB1RjVVOTlKaGkzbFdD?=
 =?utf-8?B?WjIzdFhtdml6YnhKNTVidm1ORXBwc2NzWm9FcmVIYUhkTGJNVzNXVURYd0lS?=
 =?utf-8?B?Z2VUOXlRUk1FcjB5RnVHQ2F0TFR4d005NC9VQWJnK1NESzZ1aXJWS2JkTjU2?=
 =?utf-8?B?SmU1NWtXZU4rYmhqREZkOFprVnB5NXhEajBoRHRjZkFSL3c0Q1Q5Q05DR3Qr?=
 =?utf-8?B?eTdsKzBHc2J2eWNGOXg1VThJTHF5dWM1dnllOWIyU3dHLzl2dVc2MjQwdWVH?=
 =?utf-8?B?Y2NwS3hFVVJRZEFQc2RkYXlhazZMcWd6Q29xSTlvaGlDWFlKUlI2dnNYSmow?=
 =?utf-8?B?L2VlYTY1N3l0VFczSzVaZ0x3N2VyYlYwSjVSdEdKTE1xbnUwRERpSG1CNVA5?=
 =?utf-8?B?cFNEUkJlQU8wU3ZxS3RhV1V3bStaNnFCa3JOSlNZZ1hHbWlhbXFZRmd4Mncy?=
 =?utf-8?B?WmVrK2xXbFVtMXJaVS9Gb095MXRzSGo3R2ZxT2JHZkVERXNUeWRwS2VOREph?=
 =?utf-8?B?bWJoaWYyTy8zVEQ5d0J2UEJKSmRHMjhWQmhUYnJGZjZtU2ZueDZCSjRMTisr?=
 =?utf-8?Q?97ebdu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djRXR29BaDBCYURwQlJ2Rm1DMTZvOUwwUnR4WDgxTHB6NE0zY0d1Q2RJQlJn?=
 =?utf-8?B?T3JYaUFGWjRLZC9BTGlvdmZmMUtrVjNqNDl5V2VQVUE5ejVJTmlIVVBkSDBZ?=
 =?utf-8?B?b3E5NXpoRVJYcVo4TVRFWWVzZTAySzZHaXcvSGVydzFuYk1CaitKcjRBUUdU?=
 =?utf-8?B?WENqd2t4WHorTkVOSGhJQ3Q5ZGVkWHVLUHRpM1lXS3N3VVJCWk9McjE2TEhR?=
 =?utf-8?B?cEd1R2hnT2tob3VQVWJ0ZURmbk8rblNObzFDSU1BbjhMV3FaWlZXZUxhQjlD?=
 =?utf-8?B?NVk2RnFiUEhhUnlvQUpXRW16dVlPWDU3U20vOExiOGNEZ3Z0QmNqWEtiWjBY?=
 =?utf-8?B?RXlTRm02UFgvTjROS1Jjd1Exd0pJUGRLd1N1ZHpkbCtXdW1Mb0tGRU9qTS9W?=
 =?utf-8?B?aGUrajZtTzIvZHdtODhDTFNNVjhKODVoZHJkeld2anN6dFErOE9kVWdmTVpM?=
 =?utf-8?B?dXF4Z2k5REVMVDcvMFVuTk1zWEdnOGNYcWJxNWRJUGxVK0JWUXQ0OW0zYUs4?=
 =?utf-8?B?a2JFMUVYQUZoeUVUdXJUbUladzRiMnVSaDlleU9ISXdJVmVQL2ZHTDVUakZJ?=
 =?utf-8?B?Zy9XckdTb0xIR1VYckw3WGYyU3lRQXBwTDE3TDlOT0x0MTRVMWFUeUVCTC9k?=
 =?utf-8?B?cUFTbm82K0dBWm05SUJja0J0RWlKVnFybjdmQ0UwK0o0d0ZtU3d5dGRtWFp2?=
 =?utf-8?B?dzdRVmNtSlVYQXh5VDFGZ2x5Q21UVzJxMGxhRXNXcWZJdFowY1ZCYlpObzFP?=
 =?utf-8?B?azJJWGMvcTBmVjZSU1Q5Qk5VU29sOTBnNFl1TitKK1creEZDdFhObG1TR3Zh?=
 =?utf-8?B?cEw1VngxQ2huWFZDVnc0SnpXVXM2V0V2UkQyWjA0QjRLOVV1Ty96aGFDOVo2?=
 =?utf-8?B?RzkrK2x3R3FENkdnblNLT3ZBRzd2eVc5Zm9OOGxJL2xPUkVpbHYzdUkvMHll?=
 =?utf-8?B?Sis1U0ExZmpTWjNTOHZrSWNiVGdXOU5XUWNxYVZteEwwUGNNK2FzZDFsNzRW?=
 =?utf-8?B?UEVNc3RqQU05L1FSVGRPaXJGelNRVDhPZ1QrSDI1ZklxQXp6dTRrTDc4NEtB?=
 =?utf-8?B?c2VpZmFUOEpnWXAyQUZLTGUrMDRqRDE2czhOUlpIZ0dVUzFlOFdyMXFqTmFF?=
 =?utf-8?B?Qkk5NW5XTUxnSTBuM1gzWC9lMXBya3Jqc0RXMm9LSjczNUJISTB5QjdBakFU?=
 =?utf-8?B?MDU0QUIzY09kUFBvdm5Mc1ZUNTZ3cWExZkVETGpnTEp4cVZZTTRORWttRmRv?=
 =?utf-8?B?SHdaelV5NTBMZVUrS3FlZVcyc3hMODVYVUh4Mmcrbm91T3lWcjZRaE1XaVkw?=
 =?utf-8?B?am03d1NnTFRZSUdqdFhHaVdZZ05LNlVtSE05MzlZUllYbmIrSTdhNXJiVGF0?=
 =?utf-8?B?bmVQOVBvYzlreEd4bUVVQm5jb05mZ0RpaVRkNXJKTU81ZFV2bHJiY0JFM1RJ?=
 =?utf-8?B?YzRqY29Xbkg0b0Y3NmRxQUJNeGFPUy9uMmFoM3doOTZyV1AwS2F1a01HK1Za?=
 =?utf-8?B?U2h2dnlhdTd1TVdTa2V3bWRUSEdRUHZ5VEcxZDE4eCtGRmIxSGlJOW5Da3kw?=
 =?utf-8?B?bWllWWYybVYwYU13OUZ5WUJseit5c0pGcllQdEtldG5zRjUrSEhBL1pnd1p6?=
 =?utf-8?B?NGladVVLMkU0YUJzZ1FYVVJJZS81UUJIOEh0MVQ3alNnbTJvdjJmRElHTEtp?=
 =?utf-8?B?Y1hPZ0t3a08zMVhtZHdYUWp6SGFoZmtWY0ZwaUVOZ3A1TkhncEdMZ2M5Zmk3?=
 =?utf-8?B?djlGeXZkWklUeE0vczR2OTcvTHJGaGdNNkdmY2ExWHl1cGNLUDJPNXZQWncw?=
 =?utf-8?B?emplMXdodzJRMUprcjF3T3NuRWFueGtUMU5OYkNGVXZuNndyU3pMNVVzR1Nn?=
 =?utf-8?B?bTROa28ycXNRYnY2L3c3T0VhVzZEbkJFb1l0L3lkVHlDMGJkaXVVUWlIWlZ1?=
 =?utf-8?B?TTBWaFZYNjFxczRzVmo2YXI1OHB3QkplT0x5RllPL1E0MllnUVdXUVpOZ01K?=
 =?utf-8?B?RExVWGdEZzVXYjJ6ZmNtSUtiM0lhcStDMXpCWmlzYUdGckxXOFpmbkVDREJK?=
 =?utf-8?B?KzlVS0xadzg2N1lUdWJUeDgzejlHTnU2T1VLa3ZGZGZIczZlMlYzVnVRQ25V?=
 =?utf-8?B?MmhrLzExc1V0NVErU2NxcVFIN0haOHJKcXo1NEpTd1RRTWtCQS90RGdsdG4r?=
 =?utf-8?B?ZmF2V2xRdXJ3VUdyQ3ZwaEwrR09UY0FCcmNsZEQwaFZ4WXA3V216QnBXbEQy?=
 =?utf-8?B?MUdnSzVxUEdHN0lVb2NCMTJ3cEZCNnVSU3dlVm81SFJsajlwYTNoSllHQVM1?=
 =?utf-8?B?WE5vc05QalEwSXJWTUFVcmNMOENueXlOQUZMWkRjQXRDRVMrbWtjdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59cd182-fab0-43b5-0623-08de52a020d4
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:34:43.3540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZB5qa636JZzXJREzz4UTkQGkMurTwQ3ssDZEWWhQIj/k7IArZO/AWJn+iOiMqM6vc82yRtxh6qsvrzC7racAig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4133


On 13/01/2026 09:04, Kartik Rajput wrote:
> Tegra410 use different offsets for existing I2C registers, update
> the logic to use appropriate offsets per SoC.
> 
> As the registers offsets are now also defined for dvc and vi, following
> function are not required and they are removed:
>   - tegra_i2c_reg_addr(): No translation required.
>   - dvc_readl(): Replaced with i2c_readl().
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> Changes in v6:
> 	* Do not remove dvc_writel().
> 	* Keep DVC registers defined as a macro.
> 	* Correct Tegra20 DVC register offsets.
> 	* Remove sl_cnfg, sl_addr1 and sl_addr2 registers for DVC and VI
> 	  as they are not used.
> Changes in v2:
> 	* Replace individual is_dvc and is_vi flags with an I2C variant.
> 	* Add tegra20_dvc_i2c_hw and tegra210_vi_i2c_hw in a separate
> 	  patch.
> 	* Use calculated offsets for tegra20_dvc_i2c_regs and
> 	  tegra210_vi_i2c_regs.
> 	* Initialize registers only if they are used on the given SoC.
> ---
>   drivers/i2c/busses/i2c-tegra.c | 368 +++++++++++++++++++++------------
>   1 file changed, 239 insertions(+), 129 deletions(-)

...

>   static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
> @@ -1937,6 +2045,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
>   	.enable_hs_mode_support = true,
>   	.has_mutex = true,
>   	.variant = TEGRA_I2C_VARIANT_DEFAULT,
> +	.regs = &tegra20_i2c_regs,
>   };


Is this correct? Tegra256 sets 'has_mutex' to true but is using the 
tegra20_i2c_regs which does not define the 'sw_mutex' register.

Jon

-- 
nvpublic


