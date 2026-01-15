Return-Path: <linux-i2c+bounces-15183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AB5D240C7
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 12:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2048300E4E6
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 11:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1A027B32C;
	Thu, 15 Jan 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="C6XAKGju"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020118.outbound.protection.outlook.com [52.101.69.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9F361FCE;
	Thu, 15 Jan 2026 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768474993; cv=fail; b=cIhNIgHhaURXt1+pymxMaAQFkihjn5UFnYTTW42UWLXoZkASRmH2sPxwHc/RVSx0kfuNTm2T/W82uEsNedGUMyhDT0yFPoYA7yMmBoKdi3D4GhStPWN7nJHbKDACMQLL5AILpzFywzhqFc/A2ikwMIubMCDz1wvQSzd/YMu0AHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768474993; c=relaxed/simple;
	bh=jI8ct5BIDaLd4XC3v4YQSUV/JNX1BNK1fiMmfnLbZu8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mRiBI2Eg7POWw1q41S+gu/tysm1o9sEr4rJlYEzgSoKFdb1L0sEpk/6tdpfcxwk5rstYnXNbff8/6JbNTUKM26nzsWn5Vz06FEosk3tSQSMub9HdP7D9hkMZBb6dQpfVB8aCazFM0gxGJh/pDmJj1LAMAUGCa8By0pOqZW1bFwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=C6XAKGju; arc=fail smtp.client-ip=52.101.69.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HD32EAf3O03Asem2VGM8y+myK8rXbzhbeUWigi4N3SR0ToBDZYNeNPqG+w6ueqH9P4zsGTyR+HmOf0OOnXknkXa1J4ZEkbrnD/aYiGyKeRw5N2iZ6dqCpsPeT3q8pLvQhKyY+OJl2Asp+ottyBg62mQQTozlVP5kAlmDNd42J33X6ZhOKef8XpPnDbMI1bpW6/MLhKWvXKN+ITE08Gi+/CXPQK2fkYxJ3ebE/OvE0ctTdCmm72UqyKlv9QmLdxgZrVBe7n0wUvLXmQbJTbBP/tAY63w4wKH9sauKH+hDbc3ik/Y85WlIPG6yIV09fDaSZ/OWfmsvS8T79yFWamLVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ0Ko0zQKToLeJuj32urGxca9dxrZdps6EI6EI5+LWY=;
 b=HZ89NvR6db4FpjJmJTZXTyTt+tRltLDx0hymM+hB5kAxjGdrBdQZprvIw00bJbx6ncrHPKtkbwmmmCMix1BSr/SwJoYlwXUldMUr7BjY8bAw5rD8pN5VouVCTOHzyDUjP1geiG1GDymwkOfhoBcrwwI7IYO7iDTC52kXSnba1m8i+PF0F5KiFY5De39ONtd2mJRPq6ogfGKraBGSSdQzaV4u9IMfMeCnQk+kenpgryoWPcx5d0TIxYpYLlhjdLzvIW1777Uy+TVFvpzWojD2bq6LDbN2pQDuBv4lmTs+1+qwltdNE2F7WMD+jLb5RqrRSmCdeK6UIn+aEUjhIwHuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZ0Ko0zQKToLeJuj32urGxca9dxrZdps6EI6EI5+LWY=;
 b=C6XAKGjukzWxlZPImfLknIr9+J9E9n+OWcD6bjbrRV5nW0eMHTxc2AZ+ymUYTsy7YYP/kVUhorfhfowqw2YU/sPjdxKiQA++sY19+Dua0Gea5ffAybNosjDBI0mjtU/2+lFXcykpO9Ydk6qVh57bDyrEvC4E5YRCS38pn04SHEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::5)
 by AM7PR02MB6132.eurprd02.prod.outlook.com (2603:10a6:20b:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 15 Jan
 2026 11:03:05 +0000
Received: from AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714]) by AS8PR02MB9235.eurprd02.prod.outlook.com
 ([fe80::32a9:a9e6:ded:5714%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 11:03:05 +0000
Message-ID: <0e85c0d7-3fa1-62cd-f09a-1712ca7c03b3@axentia.se>
Date: Thu, 15 Jan 2026 12:03:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: mux: reg: use device property accessors
Content-Language: sv-SE
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260115003523.26660-1-abdurrahman@nexthop.ai>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20260115003523.26660-1-abdurrahman@nexthop.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00002E4E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::21) To AS8PR02MB9235.eurprd02.prod.outlook.com
 (2603:10a6:20b:5c1::5)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9235:EE_|AM7PR02MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: df4ae98b-5971-4500-d194-08de5425a8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkdhVmpUTU5wdzUyc28zZllWQXpUb3BEby9JZjlZd1NUaU5WdWtyU1VzL1Rz?=
 =?utf-8?B?eEM2Z2VDTFJSQStxTkczV2haL1k5NFRhcUdnVVRYdDU2YTY5S0xxVkpFRVk1?=
 =?utf-8?B?NC93bUZUYVBZTloxMTZSc0h3VzY4cHg2ZUsxQUhRZEtWMDMybVVzazh5U29R?=
 =?utf-8?B?d0dFNWkrN045UVdVVWtDLzgvdmhhVE1lZkxuOFE4WHp1UG1KdmpMOHRjQ1Bu?=
 =?utf-8?B?WHBGNGpQZ0FYdTdyQmd5NUtOUWt1enhRc0cydkU0dTlHZis5bjlCb3hWUzJj?=
 =?utf-8?B?N2xyUGQvSGJOT3JLMzhjSkU0UzNKWUN5WVAzcFFBQzdScmIwcENHb3lPSE5Z?=
 =?utf-8?B?UXhqSjg1YTQ1KzZQT3EvL0M5dHRUaWlpMUsveFNISGxmekptdzFrQkczTXZU?=
 =?utf-8?B?ZTRFVjBiUWV0UURDc2hQMXArL29XVkdnejhsb09Xem5NWnVXemc0eFNvNFVD?=
 =?utf-8?B?UGxyYWo2NXozTUQxc2poMjVWejJBQXh0N0RhSWpjeHNkZmxLQVpaam9EamF4?=
 =?utf-8?B?V0VRWG0xZXlJOFFjTzdRaW9HeDBXMEh5NU1idTJKUURPc3pRMTJlUDA2R2h2?=
 =?utf-8?B?aTBtQ3Q1SExhMEF3TS9Vc0ZaeitodFhiS1htZDJWbW92bWxibEVzNytDZk51?=
 =?utf-8?B?Y0Raa29GYU9NTUZ3aFdGc2ZNaXNxZlNDbVhuVmZBeDdOa05iTEEvSVl6TEc2?=
 =?utf-8?B?M3hZdVFNTHBSSDVWbjdNWGpsdExCbjcwL1c1U0Y3eG1IV3R0S0tYMGNIWDVJ?=
 =?utf-8?B?Mmp4b0tPeU5vRWxMWlhwN1NSeU42NHVod3BodVk2MkM2d1ExMUpBZmV6R29h?=
 =?utf-8?B?T204N3ZiZ1QzbDJTNTVxNXNXYW1xeGpTbDVaL3pjR29oR0YrMVAxT1YxNnl3?=
 =?utf-8?B?VjZmWHBIa2xRU2wwZkZQRTRYZ3pIVXQyWk9rSVFhbElTR1dmLzNDOGRCVmt5?=
 =?utf-8?B?Sm5XN2JLWTlGbS9HbVJhRTJ2V2JldDlPNXVJWUZjMVo0a0F3U29sUlNpemFK?=
 =?utf-8?B?MmlPbkFKalEzbTN6N1NNZHdacHBGZEdqS052YmpFd1I5Z0hKdTJ5R0w0OFkv?=
 =?utf-8?B?VHhhRGZpVUduU3VkMGFwb3NoN0wrcFYvQkh3U2lhSnAvdURnbS8yM3NHZGpr?=
 =?utf-8?B?S25hanQ4V3FBNENFRWZPQVJwbUZaOWhGVjRrSXp0NGhhK1AyUVhGSDdTMVZo?=
 =?utf-8?B?Z0tGMlduYmNnNTJwRkRyUzQ3eGQ5cmVDbDZDYlB3V291QnZwTURmWFJBV3pi?=
 =?utf-8?B?MTExRXNCL05pWG56WE1GdzBFeWJMZUUwSkpXbXg4ZWgxSDNiWElkUldDOG5j?=
 =?utf-8?B?NUlJUWNVdVhSd3VMUDVVc0QralZZNHhzaVQybTd2RjNLSDBXcVBEYThoT1FY?=
 =?utf-8?B?NUQzNkhKZER5dDhHTWQyNU5ETk93SXc1eDU4RkljVmRSdmRveitRM2xaWG5X?=
 =?utf-8?B?TnQ4eTJxOHJMcUhDUHRqM016aUI1MnJvd1RKZmdLUWxTZmR2TWRMNnVGNlZj?=
 =?utf-8?B?dnJYOTZBa01uRlR1TlJlUnRpd0dYQ3lNQXh2NU9jdWIrSFkzeTRCU0xGZHdo?=
 =?utf-8?B?VHJWNU1KV3dHcURWY0k4aUJqNHVXcVAwUUJ5NHJLVnNMYWJPNkJYM0dRTDNy?=
 =?utf-8?B?TFVvZ0pCUFlUN0JidkdFZ0JSdzIzcTlvSnUxb1VKamY5djBYY2w4YTRsQjZz?=
 =?utf-8?B?cGRqWnFhVXRnZnFtS05rSGhIOWtURGJmS1hjaDZjcTg4Rzc4SVV0dmdyWUts?=
 =?utf-8?B?cDNYY0RJRW5lN3R1L2l6ZjhoOGxjNUVaSld3MUVjeUtpMldaTUR1clZHSDIy?=
 =?utf-8?B?WG5lL2R2d1E5UDUxcWJTU0ttbG9JdGk1VnVzT3ZpYzgya3hyd0sxYThSallt?=
 =?utf-8?B?dGlWUFpsV0dQVU03MUlSdndLY055Z2dUa0k5WWZtdHBkeWpLZ2FaeE1zbXRu?=
 =?utf-8?B?cy94cHpEbGRESlZIWGwxKzk2eDBYOGFHanlNSG12eTlYRGs1c0ZZWExpRStD?=
 =?utf-8?B?VjJzSjREVFF6QXhGL3B6QlR2eTNQeVJrUkxlb3hZdmlnL3ppWDN0YVpiM0NS?=
 =?utf-8?B?SHhUMGM5L2lLSUhtQitJQVRSYm9ZOW81QWJjYkRhUFZwWnpKZmlVc0pHQTNM?=
 =?utf-8?Q?K3d0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9235.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGpwYU5ndGRuY0g0NmFyWkNoZXJJcHBac1pueWFNV3V0SjVodmNLekRTRUhm?=
 =?utf-8?B?c2pVeUcxc3pXV0J0eFZpa0k2RHJzT1lBYnVMVVNjTkQ4S3kzVjhYNWh1VXdQ?=
 =?utf-8?B?emtwY0J0MXFjMUxmUkcwTkkrakl3YU9tOEw2Vnh1NWl2VUh0RldNM21IaGYw?=
 =?utf-8?B?a0ttNUVjMVRQVlZlUTZ4RWJzZXpPWWs0Y0RsTXFsdU16L1RVR2hwOUI2S2Vm?=
 =?utf-8?B?c1BwMVd5VzBRdjdNejRFaXJBaWVoTWNBS3d6NkZXR1pUTE9pbkZDZkU1ait0?=
 =?utf-8?B?UXJvbzNwM3A2Q2JxblNEeFBxK1psQmo0OVl0UlgrVE5FNEg4WXNVZyt4N1U0?=
 =?utf-8?B?ZlR4R3NsVXJsNy9mNDJNZ0xrZ1V3dlpOZzN4UlNPUDNiUnJzVEpSQXdRU2Nw?=
 =?utf-8?B?dHVLMGJJMmcxMUN1YUZIQlpLT1ltd3hMTTE3ZXdpbHlQMXJ1eUtncTZXd0NN?=
 =?utf-8?B?SVNEZzVvNi9RRzFkL2R1QXdzc3ZyYVdTVVZtQ1VrdDUyTXI4ZWs5c096ZGVE?=
 =?utf-8?B?akdqRytnVUtZUnVRTmhMNVQ0VU9ycDgrWDhmTWRiZ1NSSkVXT2lhemFiNzFw?=
 =?utf-8?B?OG5Hejg3T1NsZ2hoc29wYjhzbkxVR2phZW9TRlFxa0RHb1dwVVZZdk8zWlZZ?=
 =?utf-8?B?NG5aODhlaU5NYmo0VGNIYlkyODFrUk0rMHdhV3hRMVpyNm11Z1FKYU1nR2Fy?=
 =?utf-8?B?US9vRFBCejc5eWMvMUhTSUdtaUp5ZENEOFNIbERQNGhFZnZmVm5kMnEvUDlq?=
 =?utf-8?B?S2xiT2xRVzU4cjFNV2VTQU9ib1B2bGh6M2ZDMVNuZUlRVG03TE1DajBZS2tn?=
 =?utf-8?B?Q2V1Ky9CZ2QzM1YxNCsyMlpFVXh1WHZkc1FaOFdOTUduaUNLdlh1VGt4dU9p?=
 =?utf-8?B?bUZBYlhxYXpnWDJ6N1NiZ0ZnRkdqNVM2OTJuR0FneDVpNEFuVGRoUExobU9V?=
 =?utf-8?B?eWdwaVFadnhiWW0vWjBPRlRYUjlLdXNMajd1ZysvREVhdk9EdzlHS25LYTht?=
 =?utf-8?B?YkFzTmFzS3dhZG15SGxFaHVhN0l0SWFRQTMyS0VyM1dheXE3ME5Ma2pPVk5E?=
 =?utf-8?B?MGdyMkFwaFN0MkZKdHZJTlR1MVNWN0dFN2FjKzdOUkhDZ0RUYnhlN0xGNllk?=
 =?utf-8?B?bmtDY0RpT1pkVWVRTXUxMTFaUTdMUnMrU25SVU1BQ1d0N290aEJzU1JpQytV?=
 =?utf-8?B?ck5TZk1COHk3dE5TQk5HTXVHazU4NXJVQ085OC9abzRnYXA5UTA5c3JGQWlE?=
 =?utf-8?B?bm5NcVdTUWFHNFNVNFhrMENYQ1h1RmpHMS9hOUZFTGhMQWp4WEhpdFNHRUZa?=
 =?utf-8?B?dnFZak9tNWR6OXlnbnE1NFUxZjA0MWhEM2JmZlgwWHRuTmtJME1xcG9iMXdi?=
 =?utf-8?B?aE5ScVJlWVFwb0ZXZS9FcVJaU3RrRTV4MHM2cnlkR3BuQzliQmtXUGRBZWhx?=
 =?utf-8?B?ekpBUDhJdStWbVVTTlZPMTAxWlRZRmpnZVJMQThhTVJkWVFjNEtSckFsUUJZ?=
 =?utf-8?B?OG1ldERtdWovRVRENU9KL2RId3hYVDlwM3JZUnNpOUpZZHVXbGxsZmxMbTd2?=
 =?utf-8?B?U29obWJ2K3lCc0VRVzN6bDFVSExnYlJHMWFkY0wwU2VmNGpFMUJPeTd3NDFJ?=
 =?utf-8?B?RlRaQ0xFUWVHcGN4ZFZhV2lUOTRZRm9FeWZpUkRDZGs3ZGxKQ3A3VTN4M01F?=
 =?utf-8?B?c1c5ZkdqRlJGZmFlNG8rbFlFWVgzamIxNTdFWHhpV21taTd1S1FyUDVNWE9x?=
 =?utf-8?B?TE1CWlM5WmtBME4zZGh5WFE3TWIwY2R2VDhjMmRrYkxRYmE1dHYrUWM2UU9T?=
 =?utf-8?B?V3lUOWpSNlQvZHBHaU1jUkJkSm0xaFA5OVJTZ0NzQ2k3b2dxNDdVNlcwVTd0?=
 =?utf-8?B?MTdMV0dSZjJMcVFmU1FkU2xZdVRKVnpYSVB4Q21oYllCakZrYk5SL055VHg0?=
 =?utf-8?B?eXVhUzgyMmRwVklOTEJVbUtHaG5SMERsd3RSaGlFM3VDRmF3VHd5RWc3SlZv?=
 =?utf-8?B?UnFYYVczQ1RobjRhbysxV0Z6dWJsNlRoU0xaUmlzK1pUcTh4YytYdkJ3ek04?=
 =?utf-8?B?SFhtR1lueTlkVXN0Y1NBR2M5ZFRHZUpNUjhNSm9GaFVHOENYYXpTTDFhankx?=
 =?utf-8?B?d1Z6a2RxV3pEdTdFanVRZnFiUGdmMjU3MkEyV29hTGsraXROWkQ1Z3AzcVBU?=
 =?utf-8?B?dmNtMElBN0U0dFBvU1UwU0hTLzY4dHdyU0FwbGdyQ1lFcFc0OCtyT2x5Lyts?=
 =?utf-8?B?NmF2Y2sxcTBrREJsVko3QXFOT3JaMjhpZWRnUEtXbm93M0pSVUNaYnhqVFFz?=
 =?utf-8?Q?d8WzTwgfyLO9ieyt02?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: df4ae98b-5971-4500-d194-08de5425a8b1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9235.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:03:05.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvGN6b73rZL4d/aqJcR6xE/+I6oBm4XAzDB4QzLro5XBR/xaHvh7iESj722mvyEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6132

Hi!

2026-01-15 at 01:35, Abdurrahman Hussain wrote:
> [You don't often get email from abdurrahman@nexthop.ai. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> This makes the driver work on non-OF platforms.

What measures have been taken to make sure that things continues
to work on OF platforms?

Cheers,
Peter

