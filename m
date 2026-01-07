Return-Path: <linux-i2c+bounces-14956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6709CFCEA2
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 10:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23834305DE48
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 09:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15189314D0C;
	Wed,  7 Jan 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e5bfTGZC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F41314B8E;
	Wed,  7 Jan 2026 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767778815; cv=fail; b=QaaH0C++qNgGJVg4FGflv3PV1dirgimLlTa/CHAewkzWZ4MJvg+1PgAMm6o7AOJXAJwb6B/Y3+SZFFdTOC3VdLOZCqsrNWvCWBRRX4OUps/j1/Jm3tddKzM6Dd9tNKUjmmxopSCbdO/FnJ7HY1XaCB0aUPUlhHUIMQFJIMVqFLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767778815; c=relaxed/simple;
	bh=OABOAmTJQuX7aJxp86m50IbaioXMRSKNMRqgrTinDYM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n1jbY0Uxh+LDDLGHay0iER283WxzkKRsxBKz+P9fUtKR/SdYa/B6frliEGmTe0LgIsfbRquS7XQCn80DyzmRc06jio62LNcMDoexmhYXL9nIzpqUA28DO+lOgM0Lv9e14QQgfcnbtRYcw8raxXFK49emtYP8fL46pfpuHn6ofH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e5bfTGZC; arc=fail smtp.client-ip=52.101.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWUwvPb8W4g8sy6Lu5R506vlaExRG2saaCY1Ey2jLgDuUom5beT0qWd9IZZYeYBeV54CIrA+4N9HXy+6DZgdjfe7+3KQnSUv3myJJFbpQFFSYBEzbmegMs7pZb6zVQm/gFhIrwhQCYe1yAW3zNLNW9Rdz6Rn1CddEPsm3t9T3FJD9lU2GG2pd1t/ubECHjnK/W76sk/Opckj7n4wy7f+7q6wf0SSpyu782FOBhsOf7Iu8ZdHrMSkthOpo+NxtXCsWc2v/5AZajKGPRzlR5J/2/goOCNAA/tgpQEAMWDT/jYrlwBzt8QZPgddJQThNUXf52GiPkNcY27I1e8dPpxiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDdzwBZ5Ocje3kBrzUGIW0xd3snPpxM80rDPy6k8oiw=;
 b=bqvq0cLJoKdOlkLCBSt1HJ7QWI+fb4EXgX1gGcy+gZJuQkIg7ymfPynURQTDuVuhXfqs2xqS2+Msp3cSEyjvCHjGpQ7hpw3EGaVJn3Zp3+e5HdJ6ZtvxZ/9PPzAyXuhU/102dT74n5fWmTvlyUbgaI0SkOWWiHL8WYMU0ay1Ru3o/9O5WAFLYq/9ab0+nNQURhsHWMoRXeqag6T0rJCkdPhkF4BqLjgkOg7E6EOIB/Kb0NYH60xK7Mhl6O74N7+lzzyZ/xesQyxTYbCUTkFgYjsZS2BD4orL8HV8N49Dak1qKOTzfi8liQlnkHC5MryaZBTw6JzVsQZ6YR1/mWgj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDdzwBZ5Ocje3kBrzUGIW0xd3snPpxM80rDPy6k8oiw=;
 b=e5bfTGZC6FOLJ73/e6ih/K774ujXV3Qc29RVXgO/W0sp8HA4jAM+U93Jvg3aXtRInZzS0n1GLCSuRX6CXLxl6rrcub8h61zOLSLexizTwL6WQ5h6O+Ftd4e3lPSmCVfM1oWgyuhtdaCE+rz+EmtvoDO71l/lhpFPt4A7krSyv/6BdzpiQIAwMTw5VvlDXivTbi/cMQhonTGXnPZFcbJ06iZokwPtPepfENjJoTGts4E0jpRGHnnC+NPEGtyD7Snz1HSuFrgUjWq01BBJHWq2LEdKpcC2WTcSFAEZoh0Yr2Gs4a3FTkf6dKYzBYy+FpxGraP1dhDzKhSBw8U28+/4Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by CH1PPF93AB4E694.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:40:11 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:40:11 +0000
Message-ID: <3a38a0ec-977f-4b58-9f37-3331ce4b8282@nvidia.com>
Date: Wed, 7 Jan 2026 15:09:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
To: Jon Hunter <jonathanh@nvidia.com>, ldewangan@nvidia.com,
 digetx@gmail.com, andi.shyti@kernel.org, thierry.reding@gmail.com,
 akhilrajeev@nvidia.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107042434.10587-1-kkartik@nvidia.com>
 <20260107042434.10587-3-kkartik@nvidia.com>
 <ee422fec-d9a4-4c0d-9c42-433f06104ac0@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <ee422fec-d9a4-4c0d-9c42-433f06104ac0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::17) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|CH1PPF93AB4E694:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ccb639-f7fc-45d4-ee5e-08de4dd0c07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UC9uNW1MT2VWTVJHRG5nMktGVG9jL2NTMmlEWFlIM0ZVUVkyWW84OU1HMUMy?=
 =?utf-8?B?RmZXelU2MmhhekdwR21EMmp3Ykp3M2ViM2NzWlVtZ1ZEaE1GRTBwTHVMNWxp?=
 =?utf-8?B?YTBnMDZzM0JWNjdkb2UzTFZVS0F5dU1aTjFDMWI3elFPV0czcnBmbkszRlF1?=
 =?utf-8?B?cmhaL3M3SlJ0SVNzOUxFQWF5TWJIbFUxWjZnTk5hcm9heUQ4OGtnQUNuTjRF?=
 =?utf-8?B?VXJPTVg3NUlFSHdJcnVHSVhOeDFWZkhpMEVkQ1FnYlVuV3ZZQ2d3ZE1HVm1V?=
 =?utf-8?B?TkFEWFo2SDBVRDg3cGZ2QlplYTQ0OTJSOUc4cWJsNktFN0luSmJwK2VBUFJH?=
 =?utf-8?B?RW84WmZES3BRMEpUN2RhWGF0bzZEOU9jT1FNWEVya0h2WWFMMTlqV2ZqYllX?=
 =?utf-8?B?UjVueHZIZnJ6MnBvVXdOYUk1S0loS2NKVVl5aGM4a2dQZlN4T0NMc2tucFZ5?=
 =?utf-8?B?Yzd3czl2QXBBNWJqZEgrVmlwMExWQUpmdS9YMVlVZWp1c3VjeHVuZVR0WFYy?=
 =?utf-8?B?N2UyVWFXb2krTFlvZkd0aHg5TlFIR2p2aVlKNmpHWVlqRGk3T0hzcjJkdXZY?=
 =?utf-8?B?YkNRdGFvZHdtMkczaUk3VWVKWG9aVGZMemhyaklaQnoyaXA2VUhsRERlSVFX?=
 =?utf-8?B?bkxvK0pQSXJiaUF3K05hc1Z4Y3dQRXdScGZVdzVYTzY3N0RCajZidGpNUHE3?=
 =?utf-8?B?SFpKbWxzYS9Nc1VrVjhUTUg3TjU1TXc3b2NWUDZ5dGtCT2lnNGhJRTJFVHB0?=
 =?utf-8?B?Q251T2dyWEd2dUdRMTRzQnFXaTdwc2tFWkgvejJ0ZkVZQVU1UGlZTCsrenRh?=
 =?utf-8?B?Y1RMd3UrYm1DU2dMbHNHaERZd0dMS0djYmFtSjErc0puNnhNWWVMeVhRZVlM?=
 =?utf-8?B?R2tCb0ZiWGkyS2MwYjhaM0RZc29vbjNPYlBjTmV1Q3lPdEU2OHFmQldaejU3?=
 =?utf-8?B?ZStteXNKRlZYQWJoelNvaW1OREQxbG9DMHljRWlEaWJPL3ZQUFNoV3NlMUFF?=
 =?utf-8?B?WHZwTUlnM3VvYTY1emFvVnJRNFpPWGh4cEE2M2ZtNUI4NFY2MG4vUzNiTGdN?=
 =?utf-8?B?eXdDWDFnVHNxUCtDOXd6R20vOUliRExCeGN3OEppWXVaSkpXc0tCQXBYL1FV?=
 =?utf-8?B?TzY0TmRiNDZnN2YwMTljTGttQ2tITmRMbzNyUlVnTE9nRlIxMzR0YVY5azZw?=
 =?utf-8?B?QXdLUnZvM0xuNE5XZzdlSnJQTUYzaHQyMC9xODlwc0l4ZmkxQ0RFZytNa20y?=
 =?utf-8?B?Z29VZVVmUmFLbFJvS2dxcUtocU1la25iWmt0NkppbzljUlEzdWJvUFU4MytL?=
 =?utf-8?B?eHY1R3YrZXh0TE9vdEd6azR6Z0V6Wm5IN01RV3M4ZVRQY2tkZVQ1c0lvNEtS?=
 =?utf-8?B?Q0lqTHpEajZhdHQ1aXFaTWtZUm1yZFI4VmZHb0JNajZrM1FXUVY0VjR0dGFp?=
 =?utf-8?B?TXFmZmtRMzR3VERDbmRUZERXUzJkU256K2l4eS9xRVFYQllCS0Q5VFo0M01t?=
 =?utf-8?B?VUtNbnlEcnpHeGZ2SnhDcEVWcFBXUFgxU3BGS3dhZy85U20zVEpuNU4yWWlh?=
 =?utf-8?B?ZVRhZlBCZ0VvbWM1OFJiMVZzdFNRUlB4aUp2dlBJbDRKc3ZBOXlvc1h4aHlR?=
 =?utf-8?B?U1hnNWlRcm9GZFZOTDdUK3ZyRWVxT2Y1TjN1V0kxVmlUUkEzenVHRHpPY0Zm?=
 =?utf-8?B?QWx3UzRub1hCNWhkRFp4MDEzSStpNUI0b0VCTS8yNks0bWo5YlV5eWNlTkdH?=
 =?utf-8?B?cUd4clVXZTBOSHN6RnZzMFlDUk9YVS8wRnVGbUhLZHNIU3ArS0xXMjByWk9w?=
 =?utf-8?B?VXg5SzNjSVQrN1B0cUdqRTloMmR6RVVVT01kZUJkbkZlVGZYbHNEcWZJMVEv?=
 =?utf-8?B?V3RNU3hMeGJ0UGtMRWoxOEprU29UOGRCZFUxVmZvdTFabkZtdlErdjQ5ckIw?=
 =?utf-8?B?S2RiZUJ6T2hta05wTjE0Uk04dDBDZXh5b3R5ZzhqVGpwbXNSSk8xVmRsSElF?=
 =?utf-8?B?b1gyMjMyN3RTT0JwUlNDUSthVXR4anBubGlydkdnUW9SblI0czZURVpuWk11?=
 =?utf-8?Q?m3RWmZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW1FdVpIS3FwU01kREFaaEprZzgrdVFvQ3EvV21SMWNXdmluRnNlLzNTUzhs?=
 =?utf-8?B?NEVQWmV4dDg3bHJZUW1GbFV4MHA5UW1JS0RZTmt3aVFNdDN0anpJeTAyak1k?=
 =?utf-8?B?aGNQUXpqVUc5SXFqeld4OFlQeis5czN6Rkk3TnZuNkNocUpOa2NXZ1pWVFV2?=
 =?utf-8?B?RWw0b2k0RnJlcUxQQnNMd1cvRlVRTlBEVFk4R3ZwZEJPNzFyc3QxWUJkSzBv?=
 =?utf-8?B?MjFuOGFtTGFkak85Tk1LbEJDakRRKzU5Y1ZqMjc4RDZaQW1QeFJNNGxVRGlB?=
 =?utf-8?B?UldEVWNwVy9hV0FlMmo2YnY5NmhrTkRnK1o0bTlNUDlEN0IwRWxNa0UrQytB?=
 =?utf-8?B?S3h3OVplTmk3ODROYTFVTDNTYkd2U0FoYlNDR1phNSt1YVlpYVdNaWhidHc2?=
 =?utf-8?B?ZGxySnJFOFl1anBSb0pZVGtNNUNJMnF6Z1h0dXdUQldBNzNVMWE2a0RjYklC?=
 =?utf-8?B?Vk9xRHFMeEZ0UmthNlRsdlA3cVNJMHZ5SW9WeGF4Wkh4Si9sZnE5aTBZcWdN?=
 =?utf-8?B?VzNwbkNiK1hHbEl6Qm1CQVRXZS90TVY3ZG5MYWlkMzZqbGQ0UVMydlNsaTFZ?=
 =?utf-8?B?Tk1HdmVPOVMrMFV6L2o0MUhiN1VOVERkcXRDMzRqOGtycER1NTZhbXJ3M3ZQ?=
 =?utf-8?B?dTlEbE55TkFKd0tON0lia2tiMlM2a3R3ZjRhZytQOEM3RFZWeFIyQldhTTJt?=
 =?utf-8?B?M2tjVGhCd2t1Nk5JaFIzYXVOaW9DdDkxOW5jb1lGTnU2aVZSWjAwZ0kzYmhH?=
 =?utf-8?B?bmVkVkNYV0xORUhNSHZubk9Uem82eHdtcDQ5bEJFS3JPM3BvRXhnbkpJSlpQ?=
 =?utf-8?B?bEh2N0YwVVpBNy9QTUdna0dRWlU0YmhEZE4vajVvdGlaZEtGS3drdnRPSVQx?=
 =?utf-8?B?Y3IveXpqOXY0bTVXalpRVGtSUGMzR2RsSkpDMEptNVJPdUlaeXpWQVl0T0Zw?=
 =?utf-8?B?bTQwQjFJNDlEUlg3ekhXdk0vZmZDdDVxNjdIMWFsZnQ3Z0ZzYzluNEY3bDUx?=
 =?utf-8?B?b1JCL091ZkNCSHJNQmd4NC9Pd2xQN1BodGNGMWtiL0JYNERKTUdZMS8xeHdJ?=
 =?utf-8?B?bEl0WEdPMkJYemM5eU5PbzhsVkRaSlgycFMyNjhQV2MwVU00OVhmTHdiVEdE?=
 =?utf-8?B?QVdnSEMxcEpRRDdCKzR3Sm5TdFIyK1VXazBGbS9LWm5QNldvdEJ6MW1tbjcr?=
 =?utf-8?B?aVR6dkxDVjZ3MmdiczNOSlFzdy9zNkIzejBZc1loQThmV0Q4NUlrZlI4TUJX?=
 =?utf-8?B?Qzk0eVYwU3hLWWlUU2Nwci9BOW9heFA1SWVIWkRmNkdhZGo2bUtQZUJQTHdp?=
 =?utf-8?B?VXJtYnRhWndoSnkxYk9yejNiNzBLT3R1SDB4SmpVZmhtTzFYTzN4RXJpYmtY?=
 =?utf-8?B?Q2ZDM3RNalpVazdhYWVHbVdzVWtxbEVrMVczZWpsOXBjcW9BSjRXZjNWTm1x?=
 =?utf-8?B?aXYxM0lFdHdUSU1RQ3FPQi85eHZNYlpuL1JKS1BtOFUxbFRvSG9SaURBYjVr?=
 =?utf-8?B?Wmk0N2NDeEROemh1WUlCeGRhQnhBbm12SnFzMi8zZGtCc1RkNnVLV1lrVXVL?=
 =?utf-8?B?WnNMYnNFSWlyLzdCVlpvSHVQclJteWMzT01nenV1azlWa3RrQS9mSVpxSUND?=
 =?utf-8?B?YnIxSlVlb05YNFQ3dzBSVDFLUnF3R1JlYUtmb2tzNGxEcHVobUx5MFV3cUFI?=
 =?utf-8?B?dENqa0FOSWdCSTFZWThFaGxVb2Z0YlI4cEJKajJvZ3F0RDNUQUU3TGQvc0xN?=
 =?utf-8?B?djh6b1BLRi9tYTRpV2FwZjBySjh2OWI3MDJ3UC9lZUdZMTJUSTZPdGNmaS8w?=
 =?utf-8?B?d2pDYVNib0ZOamxycWswanN6a1FQNml4OUpWd1E1RFNROUdxNGxoZWtaNEZS?=
 =?utf-8?B?RTZTTDUxdkliSlR3YllSZWtFd0xkUEh4dmt0Nm5jQXlaZVJBb3Zwamdsb3pO?=
 =?utf-8?B?Ry9pRjNwU0dSUHFtQ055RUxnNE50djM0OTd5MzZTZUhoVzJkK2NIYU9ITkgx?=
 =?utf-8?B?aEtpZkx5cU41WkV6RTBHZ2F4ZkEwYUFaVGxtNU05MXVoR3hCbjFmbGR1eEc0?=
 =?utf-8?B?K0RYakRNTzBZdUlVSUZ5eFQ0VU5haVZZeHJQYnh1cnVvTkhsM2h6QTdPM0ZS?=
 =?utf-8?B?NDBNYXUvTlk0NVJFQjFob0JwYXdKOU16MjFqdm45VzNRU0JhcEJYT0J1NVhG?=
 =?utf-8?B?d2xVTXFqVmQ5SThoRnB2MTRjY3ZaQkZMdU5OYlNjSmpBNFFDREU0OUpyMmJm?=
 =?utf-8?B?K3NORnpsNVVRL1JmS3ZTYlAxR3JsdE5sckRhQ1RrSWlVcGZFOWJ4bGMyTUEx?=
 =?utf-8?B?UmE2T0diekswVnd5V2dGRHlna0NWZlNXcmJhaEEzM1luQXMwWWpDZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ccb639-f7fc-45d4-ee5e-08de4dd0c07b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:40:11.4076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXRd9N+t4u0qOE9szBoh8R/Ev8pdQsv7q6LF0XF3sPRH9vpzByFxGRjrAv+Z0dabwSJSc6mhDH2FC87xY9A/uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF93AB4E694

On 07/01/26 15:07, Jon Hunter wrote:
> 
> 
> On 07/01/2026 04:24, Kartik Rajput wrote:
>> Move the variant field into tegra_i2c_hw_feature and populate it for all
>> SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
>> "nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
>> from tegra_i2c_parse_dt to initialize the Tegra I2C variant. Also remove
>> the redundant config checks from IS_VI and IS_DVC macros.
> 
> Thanks for updating, but now you need to drop the last line in the commit message because this is no longer relevant.
> 
> Jon
> 

Yes, I missed this. Thanks for catching this Jon.
I'll fix this in the next patch set.

Thanks,
Kartik

