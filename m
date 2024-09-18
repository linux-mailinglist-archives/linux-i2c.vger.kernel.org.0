Return-Path: <linux-i2c+bounces-6852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A997BACB
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 12:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBF5AB22943
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 10:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1C11741C3;
	Wed, 18 Sep 2024 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Elp282DG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791EA1B5AA
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655304; cv=fail; b=RbxFwu2Mjy6fFeWnsa585FwjDTwimieR9HWKtao6cBSgANHkaD53R7R1AAlt2ETLBjS7RelgqNJa6aoImlTGgUCpAwDBgsP6Bf9uT2OhaikWSn+9HNoa8uNeex1wucIg6G+J2DdiY2/KhOG4sfEMWKtDdlIoL2cYK7a4ufR2JxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655304; c=relaxed/simple;
	bh=V8jUXOipX2RuDvCn07lq64JBH58DekU4XeZ1JVQy75I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=elOH+YcnhUO/K65UgmZJVvFVF8Z9BaWb8up9Yq2L8wk8ekmf8AWiyFwcUbX9Hhn88Ma9i2G2KpaoXcuJ7jqk7n+zisXcRTBYZT6LyraNc9I3QhJIMIIcpZ3tmoGlIXQ7cSpbDJ3jAiPCbWK0ZTVsg/q/MWC55aAdHFjFO2jAwEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Elp282DG; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKg55rURZ42/Fn/86qyMxT/pzeZVeK9ts2TBs99mPmtKhqaNcNfAbNiPcM6PtUjMigoXw/IEh67aKzibiPaiCAX81049K10fveBdZIaIGXHluEfUCWurXBegBdZ4grGcV6jNr+BycntiQ3ef4lHl7fyzwtAxCP+peBvoEITG08UL1ALlce34vJtJXQPholuyLZ7uEEEXEjae2HQ77s5ZZ1sp7njPzUzf6Z/IyqRs98fNVEGYeyB1mgtw1UX6OKGVYP+yyPmrDedzSlaPBPVBHrEaIXXM5Yl3HsQ6HcNSiC5kIX+CivNQ4loB66xfqyy30zqC3eKjWJ7j5G5cZex/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHOXQI2lLCyl/+8Ivqu9A0oSn5hI55cMDP92bmTspew=;
 b=qGoO3O20gUxaKgu5E7U2nNj2udI0ngJ/DcJRVqynUYNWRNRi9iXxs/cWmOSQhy3EHbvXc7fn1NaTTSYTtiyXeAlCay8J2H+FhoY0SZfLYrJd7aOp8WZteDIz5y+UZbzZPdxp3Ki/Fa1Os14vSuQfvkVIX3JbHoULvPGjLaxQ4zfqgWbck8Gh/XIPZf0UcP4IpDxRADR+i/BNp7G8iWAVYmtSNuY/8GQImulqPVY4Zp6HU0sS+WUAlnPY2t1zzWjml0Oz+5gP2RfiU4ZwutDk/SHfoiSPGQVX4SrXn+2OEJkA80zB2giAsw3YKPCf/u6mBh8xdgqzvaoOk7KVB1HY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHOXQI2lLCyl/+8Ivqu9A0oSn5hI55cMDP92bmTspew=;
 b=Elp282DGsaHcouDrNfEwOG7LI8OLoUuFDBHIzWgo8X21A3Uzy2KXxObLRYMPkRN4kWI3/sG3IdeEK8mHzqNApC5alaZHQSKmHXbaYA3TS0v7iZVl+PRQVTb8D0OkVuOahuKXzNBC5kDGeUNY/WNROCDHxRoW3K9Lv2bOv4TcECI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 10:28:19 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 10:28:19 +0000
Message-ID: <027f723f-a276-4e63-8578-167d74e14d12@amd.com>
Date: Wed, 18 Sep 2024 15:58:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] i2c: amd-asf: Clear remote IRR bit to get
 successive interrupt
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-8-Shyam-sundar.S-k@amd.com>
 <ZuSQVpIqM3yOSuf4@smile.fi.intel.com>
 <8e12b68c-0a90-413b-bf02-f8637629f2be@amd.com>
 <Zuqla7IMBr7wYs1Z@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Zuqla7IMBr7wYs1Z@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 608f5585-f10c-424d-18b9-08dcd7cc9d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTR4dFh0c1VWOG5vUTg1cjZKcGxRS1dTaE5EYzZKV0F2dnhSYUFlZkk1WUcr?=
 =?utf-8?B?MW1wa0lIU1lBRHc5VjZGTmt6cDAxUjhsaUU4VGpMbTd4cDEvQU0xdkR4R0pi?=
 =?utf-8?B?Ry9XV0xuckxvdm5zSTVPNVNaRDJLd2hBa00xUWM3aFJOdVpPMWluamU4Q2JJ?=
 =?utf-8?B?ZkJZMFBrRURWSjRoZkJ2TGxZRHBGY2d1aVVZalN2d1IrZHZRMzc3cEpwQUZj?=
 =?utf-8?B?eTdudUVJWmpibkdUb0dmdk01OHdqNkNnNUE2cGFxbkZZY2pVU2hIaXJhM2JP?=
 =?utf-8?B?QmNCNW03YkhscFd4YnNvSzV1dG9zaVBpRmJlMzNxOHVueko5a0RvMVQ1Nk5o?=
 =?utf-8?B?WWpRa1pucXhYWVRuNjliYlo0ZUNUT3prTHRqcW9mSUFMMXZlcHZEMXNLekgr?=
 =?utf-8?B?d0t0ZFlhZGdZS2VsUWpLcGlBZ3gxUTFvYkY0SDR1S255ck9ZVXA3VjFRVFgr?=
 =?utf-8?B?Umhzc1ZWQnB2YzU2VDhqU0JKOHdWYjVXc0VjNmc5bVRaWjU4U1VDNzJhdGcv?=
 =?utf-8?B?N2pmNlFDOU9XVGhMSGpIbEQ3NW4xa2EwYXJYQi84RisxSTB2THpkYXc3R3d2?=
 =?utf-8?B?RXVURzZkRlVsNFQ0NzhaK2FPTWxoV0g1dkhhWGg0aDNpZkJuWlJ3Q212c2VY?=
 =?utf-8?B?aklVMVdtcE5TcldjMjhFdzlMSHNSTVg1RHF1cnlydkNNRU9KVDlQK013K2I3?=
 =?utf-8?B?UzFGTlQwanV1dkhHdFdkZmgzaitydmwvTWxJMVh2MG9Dd3pLMFcyZVJicTRJ?=
 =?utf-8?B?NzA4aW0zTkc2b1YxY0RUcXFCZE9wOUdCRllTVmJCTGZBeDd1ZFRaVElGMW85?=
 =?utf-8?B?dFBmeFBrQ1NZeG9SQ0xSSkNzcWhzbFhXc01XeVRZd2QwTXNGeEJnZEg1Um1E?=
 =?utf-8?B?N0ZNbHhMNmV1a1JqRFRsTXFyajcrQzU3VUJhOUZzYnIxbUJIMTFTRy95SGdE?=
 =?utf-8?B?Ryt4Ry81aC9lKzJmU2FHNkxXMjNqV3lWVlB1SFJ1SmhJTnBidC9FTmNoYUUv?=
 =?utf-8?B?WU9ScWgyOWlFdDBPU1p3MFlnY2ZpNjhtUUFGMzMrMjBKWFdRNDM0aXlCVTR3?=
 =?utf-8?B?S2YydGlSOGJjeHpXOG9yTWEvd2dEWFRKemhqK21hdzNlMEFDUDhPYWNrSmxP?=
 =?utf-8?B?aHllaVVrNTVvY25wZ0lmMk5lTWI0MGdSUHFDSWU2b3pkVnM1V2dESmtxamFv?=
 =?utf-8?B?NlAraVJJYVNaYnM1b20rZjJMNi95SnFDV3Q5N2hGNE1aQTVObVZKRnU3L2tY?=
 =?utf-8?B?b2dCbnVOYlRocXFjSUF4QWRjRDJlNnpCb2tVTjJaTE1NaGhkZEJhVkcyMXB0?=
 =?utf-8?B?aWpYSFdqUG9IaFhTSE9Ta1VmeDNkQmt0SklzSk0vTlFXNlFUbjhQWTJxODJa?=
 =?utf-8?B?TEJSRUFUWk1JNml0M3hQVVJsOThTTXM5Qm0wQ3Q4anh0RU13cWNDSEQ4U3dE?=
 =?utf-8?B?QUJ0T2F4Q2k3TFE0MVZaSDBiRG9mMG1rTDMyUmQ4OGNFVm9pYWRuTjA4RFJv?=
 =?utf-8?B?dDBZdmdJWHYwcmhHNHpJY3R2WXNFbDZ2bGMvSXhhNlJ3U0ZXRmZTQkNZN3Z2?=
 =?utf-8?B?S3YwQXBKR2lrMnBYeDRCVURiWVhUaVc4elkzdWRxTk5GTGt6c3ZoUlpIU2JJ?=
 =?utf-8?B?ak8xcnlnNVB5anZIaFpSMk1FUDJxWnhPUWcvOW05T1lkcTg5bWJHOWg1NmlJ?=
 =?utf-8?B?elQxMWt0NTNGMUtRc3dvWFo4amFQeXZVWm8ySkVKbkFSUHcrc2RuOVpubnJI?=
 =?utf-8?B?aG9mN3g1T0ZzQ1JqSEpKMGc3MUpiQVpNdEZuK1llai9reUEvaWRuZjIySmsx?=
 =?utf-8?B?aVpmTTYrS2VQMnFNZE11dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxQblhocVVsaVhvREljWXdRcURDQ2NRa3Z2L3BVb09mR0FnQ1Zya0tMeFNq?=
 =?utf-8?B?THgwU3N3OW83WUJvL2hHbnExejZZTGl2VWdZRXlCM1R2aDB1UERsY3MrdkVS?=
 =?utf-8?B?Ui9WSXYydStKTDljL3VlQTVkekRCUVJjdXBvL3VHeG03bGl1RzJjVTVVa1ZD?=
 =?utf-8?B?YTl3M0gvalYrYks1QnFpNStQVXNDb2hXTEpncmY2RGxYN3FSTWR6eVVZWU85?=
 =?utf-8?B?eEVUb0xtN0tGNGJvTFByNkY5dko5Yk1FRFBwaTZrWlUrUFNFZEZoVVlUL1E5?=
 =?utf-8?B?ZVVUZE12R1RhTG96WGZjOFVqRk1qWVJRS0cwZXlKTHJHQ1VKU0lDUUV3Q2Y1?=
 =?utf-8?B?UmpZZzZIelpsVUU2MjFYREJ2RXNWcjlmM3BWMUJhT21ReUdPM3N1UCsranZ1?=
 =?utf-8?B?YkZhWjJxRXZLUUtxRW04aEhHOGU1Z3VSQXZoL0NIV0o1K2tNdGlsZ21idWxD?=
 =?utf-8?B?V2dDM1F1cExHdUJ3WlNWK0ZOUS8yK1hIVWxBMjhsN0grTDE4SnhpTGF2UGVW?=
 =?utf-8?B?UWZGSGtTNWZuaUdPWXJhMWE1N1RjR3NibG9oRnpwUFZDYW82ZVhkWEpnY2JC?=
 =?utf-8?B?ZDlKNG0vQUszYlBMQ2FvSHNPOVJiN29tNTRTVWpveXR0eVlaSnlZNmJCZTUw?=
 =?utf-8?B?dG5WOVYybzc5WUNEN1lqOGhTTDdYQ3BYWG53QTZZMUxlL1R3bWpod003NER2?=
 =?utf-8?B?VkY3SEIyaTJkWWZhQmMzUFplWE16RlM5YzFYbnRDdGF1UGRsTlBYSUs4NkRs?=
 =?utf-8?B?MzBXdW9LQmtJRTBPOFZ6cDBsNXRHdFdpL0VUQ0JMME45YUo2V2MybS90YXpQ?=
 =?utf-8?B?YVZvbWNpMHByeUVqZXhYZFFPekRsY0pkVE40bzlUbWlOMXhtL3F1emNPZldJ?=
 =?utf-8?B?VjZDQVZ2U1dKM3pCUTUyeGZZcHVBZERBeGJUajhuVG1hSDZIalRoZXE2Z2xG?=
 =?utf-8?B?Nmwwa3Q3VE9TN3pmYzNqdXNZL1Q2SjF0VTVwRit2cWxWdkVob3ZJQVhWak5S?=
 =?utf-8?B?UmFudnFjRVBoUDJwMnA5OUlqZ25nYkdBWkg1ckVhbTE0L05kQ2hJYVZhU0Jx?=
 =?utf-8?B?N1VIYitsZ1AycHRYbFdKMFBleUFyeWd6RG5ERE93QVA5S2NjMW4xOWFkci80?=
 =?utf-8?B?YlY5NE40aVNYbEk2dTEzZ1BzaVQ2VWhmbzZFZnNsLzBrSExmbHFzcTBhV0hL?=
 =?utf-8?B?VHRYYXVLb0hOQjNVS3VyRWJjcHp5SUlESytab1E0M3BKcGRGc2R5bHlheTQ1?=
 =?utf-8?B?SEdiK2sraEZpTXVlZUNTL2NRREJpR1QyNFdWc0NQaFZUcGxOeHd5TWtlOWx0?=
 =?utf-8?B?MHNBS2pSTUNONXR3OUdzZnFLNDdWUGZlZDgyNmRDT0Vlamk2VStPcit3Q0x3?=
 =?utf-8?B?OGZuVnM2c0dpeTl6TGNEeU9tUVhqRFVkMm9MbU1DVkkzSmpqZ3RXYXZlTVRZ?=
 =?utf-8?B?citudXRZM3dCVytwRlJ2RmhFTFBIMzFFcnVRSGtRWitqZllEMDUzVDRydTg0?=
 =?utf-8?B?YmZNN2RzbDAzQmFKWElIdHZNWDZac1JMVUJuWUdJbEZ5bFFWZkxsY1poNUFK?=
 =?utf-8?B?Z0lVVTE2Rlk5NUE4bWU5WWVWQVZ0amNQRit3T2EwRkNZb3ZBT2hTOHhKMWZj?=
 =?utf-8?B?Yy9ZcklNdUJtQ1kwOEZRSmVwVnR6cytKWnZWVTNabElUV2MyR1ZiUldyWS9L?=
 =?utf-8?B?Q2VRQjBMWXBRcndtZmNiWTZpZHRkTStiN3NQQ05SVytDM284dTJobnpBUlk2?=
 =?utf-8?B?TjhRUGVXQTJHc2JzSUR3ZThVV0g3ZVZ2alVQOVhXaFkrMENKcVplMzQ4ZUhB?=
 =?utf-8?B?cnZqdVcrYUpEYk1qZi9NbkV6bzQyYXVCYnlYQkdVQVVmUmJaVTdCeDN4dFRi?=
 =?utf-8?B?WW1rQlg1ZlZSQSsxdk9wZjVTVHZJS2hkMVlsdGZpV3dPem4yK2NBcTUzL1ln?=
 =?utf-8?B?blJjRzZUTFh6Wnl4OWRRY0tYNnRkV05UQjgxSTFUUjN2M0I2b1lPbnMvek1S?=
 =?utf-8?B?NUYyaFZ1Um95TFlaUGFrT0xDb0FNNENBOGlqUkFoSEN4ZCtpeTBkUjhVeEFl?=
 =?utf-8?B?OWNrUGNiYnBDOExKNVpWdEJUMEtlVW5taklBYkt1aVBzMXhORitMY1c1aXNQ?=
 =?utf-8?Q?dKMRYp5zeEVjsAJR1/VZpZx7L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608f5585-f10c-424d-18b9-08dcd7cc9d7a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:28:19.5960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9xL+Yh+KQHECzD9P4K0THB2N3y8DyxuXAXTghsWQCNZC7ImVRQ8GaY1GkFygcFVvali0ZzlXWzY40zQxxYpkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857



On 9/18/2024 15:33, Andy Shevchenko wrote:
> On Wed, Sep 18, 2024 at 12:01:19AM +0530, Shyam Sundar S K wrote:
>> On 9/14/2024 00:49, Andy Shevchenko wrote:
>>> On Fri, Sep 13, 2024 at 05:41:09PM +0530, Shyam Sundar S K wrote:
> 
> ...
> 
>>>> +	eoi_addr = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> +	if (!eoi_addr)
>>>> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing MEM resources\n");
>>>> +
>>>> +	asf_dev->eoi_base = devm_ioremap(&pdev->dev, eoi_addr->start, resource_size(eoi_addr));
>>>> +	if (!asf_dev->eoi_base)
>>>> +		return dev_err_probe(&pdev->dev, -EBUSY, "failed mapping IO region\n");
>>>
>>> Home grown copy of devm_platform_ioremap_resource().
>>
>> devm_platform_ioremap_resource() internally calls
>> devm_platform_get_and_ioremap_resource(), performing two main actions:
>>
>> It uses platform_get_resource().
>> It then calls devm_ioremap_resource().
>>
>> However, there's an issue.
>>
>> devm_ioremap_resource() invokes devm_request_mem_region() followed by
>> __devm_ioremap(). In this driver, the resource obtained via ASL might
>> not actually belong to the ASF device address space. Instead, it could
>> be within other IP blocks of the ASIC, which are crucial for
>> generating subsequent interrupts (the main focus of this patch). As a
>> result, devm_request_mem_region() fails, preventing __devm_ioremap()
>> from being executed.
>>
>> TL;DR, it’s more appropriate to call platform_get_resource() and
>> devm_ioremap() separately in this scenario.
> 
> Okay, at bare minimum this must be commented in the code (like the above
> summary). 

Okay, I will leave a comment.

> Ideally it should be done differently as the resource regions
> should not be shared (it's an exceptional case and usually shows bad design
> of the driver). If you can't really split, regmap APIs help with that
> (and they also may provide an adequate serialisation to IO).
> 

Unfortunately, this is the only way to get subsequent interrupts from
the ASF IP block (based on the AMD ASF databook).

Thanks,
Shyam

