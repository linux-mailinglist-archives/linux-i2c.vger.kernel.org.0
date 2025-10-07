Return-Path: <linux-i2c+bounces-13406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD7DBC1CFD
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 16:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7C9E4F6B5A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 14:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373902E1F14;
	Tue,  7 Oct 2025 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="taBQD74v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013011.outbound.protection.outlook.com [40.107.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641842E0909;
	Tue,  7 Oct 2025 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759848674; cv=fail; b=rzBeFR+rOJmejhVruMHg9no4qa8sRnMdNa5zJ3DMa/adaIRb4AucniuejDYlKFiz6YdaYr69khmEhaoQgyV1PSMddLJC/p1504dSL/It3+MIZUP1/nf8sBL8mcVLzmYqirXl+3LsKoeg1iPfIfGhf4zHA/loLfuwrYEJp37P1Ns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759848674; c=relaxed/simple;
	bh=19jM1PfOLEjSpP/Ac1OnExo4LYFNDSny15zlVR5D99M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C0VheFv9bZ128zInC54vSoWYuITvXVFrANxMGWVRsoc0iRM7o9Az2XX64bnhs9IrZ9MBunKxc9vUrd12nxp9jXf7+FaSbRyXGLoXL9rX4bL4x0+hLI/iDXJQfddH44phWN0Xia12olNhlNsL8mQbH5Lkx0iEmkidbhOBQdRhM1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=taBQD74v; arc=fail smtp.client-ip=40.107.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieFP27XV5/9q4REBuK+3tt9ucZmxdaWzEUl37YMbnJQHnX92cxvK6GjY+/G5ud7Xz1VFLNLtKr/93vgAjWXD8yLIUG78qMpWH0IxWQ65A++ECdaN9WYLcvLgygsoj6/c2rPzbHl3sx6wwQPos26lgMXJV8hcTLj0uEZm3Pud+2pJIuzpoy6xjUDOY5f3SMUF2hF1WA9hB/qLNpmFiNBPV0xL5Yiwul3qVV40f0UeQFxgtpae+RvRTIAQSLotbP2fz7qFlYRZ/Vd1ggCmxQAhtLVtAR87/2WTv/fhtBgAD+1kh4KMGuTTyj2BP3/DMbSZJ5DOVSUBOXSe4vg9O43Qmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX42ydOvtfufl+H+o18ZbWtAIdTbbaIniaQK+3vVE0Y=;
 b=oMDaXgMIjB3A7pwn8d5z5IEUZm8SrTQ7lmRnJEJfLFQnHrk3B6CF39NoZScxkc2qRMlzlnHKBLnPWmYkOmOGTlY2W1bcRtQGclp83mQ7oDWtsAa8vsCYf4TD+RhPEetugbm9KOMdSFLFO0Af+r5qwffSR+iV1uG2+f8pYtO91UwZSJE0oE+hMXoh8/78BLYB7sbv+GFJ5mEpFFbDnN5Yg2PH02N5STJ1MqSHrMyFFcsqDrOQj0NulwdAv4JN7qN6yBfERazkfRAcjgZu0wweOuHoux6/F+xgMB+FKH0fnUiv/x54rv4+F+xNns9Bq6UAamAcm7qabOnZ7M2xjcAX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX42ydOvtfufl+H+o18ZbWtAIdTbbaIniaQK+3vVE0Y=;
 b=taBQD74vJ263EfidNH7RmwNxbSclNg55sl/OhbjXUF17qIRkuHMYdt4yDxXqvQrMYd5gLoE8lliUj1aTUw8k5gg77ANGK2VxYNsUx/qqvsRtgUNCKtizWjNf56Yu7xFAnfoSpQYjrb2SbG/4YSgDVZC9gb4tYcGul2FRYXxo4Z38Y3Ul+yk0dJY9nYIZ8PHpC+cjCQe8Uyz6XI4n1Dz+wC0lz1Ngun8WJmRjp6qLBrhrrFpiwnvNUu+SNtmDBDa79ksHLrmlslL6yO9hT6DMHm8qQ9THR4oUMzoK9ZrRuFAMC2rED5d/wAerAT+LzHTyfupq0twjL48dugpe1XuoQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 14:51:01 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 14:51:01 +0000
Message-ID: <91da537e-01ea-4b51-8493-8cf88d64b435@nvidia.com>
Date: Tue, 7 Oct 2025 15:50:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] i2c: tegra: Add Tegra256 support
To: Akhil R <akhilrajeev@nvidia.com>, andi.shyti@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, digetx@gmail.com,
 krzk+dt@kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: ldewangan@nvidia.com, robh@kernel.org, thierry.reding@gmail.com,
 Thierry Reding <treding@nvidia.com>
References: <20250818043345.65899-1-akhilrajeev@nvidia.com>
 <20250818043345.65899-3-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250818043345.65899-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0535.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::20) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 89683214-f98d-4124-557f-08de05b0eee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0cyK213REpVS01WOXZZY3dGVVdUT29rc1hMUHdoWDR6Nm9Qb09zcWQrQUVj?=
 =?utf-8?B?ZVlCNEo0bWhpMlpNVWE3OXBSOU81VXZnQzdpWlhZTUtuSXdIZkNPMmlaZHRj?=
 =?utf-8?B?d2xvQTZUd3lpSWI1NTUzM3lObWhETytiK2lIbHpJTm9tK2xwTnpLQVNKa2ZO?=
 =?utf-8?B?aG1mYjJpYnAxL2ZNYjNNR3pUUW56eC9zRElDeHRDbTZwSHAxUmxVTDRXWXBa?=
 =?utf-8?B?c3hHOHBjSDN2MzVkc3FuYWVHbVN4S3huclozOWpraTh5VWljdTR6b2pKYnhh?=
 =?utf-8?B?RlBHVkY0RDRwS2RvUXNiZEcyVUFvMzVmaFZlQWdPSnNXdzlqeDFWMUsyTmZi?=
 =?utf-8?B?OXRyd255dHBobW5wWkNobXdpdXlNajY3QWd0azE3VkN0bnF2QkZwN0lXRWhr?=
 =?utf-8?B?dllwYm0wdFNVQnAxSU9JT1hMZzhQUzdqRFVsMklIMWMwcnVZeHBvTWdBTHdB?=
 =?utf-8?B?OFdObUZKbzBnTzV1bzU2dll1NFZLWUkrN1lMZSs0c2lROG5WSWJaQXJsTCt6?=
 =?utf-8?B?WW5OeDRlTGlnNjlqMUM2TkJTZnUxYUlZVlQ1VGd1VnpvYWlucGxYZVUyNTBS?=
 =?utf-8?B?QlNBblhwdktsdUxSKzdFd2gxMVc5K1ZBeDRDQ1RjaUNvTTdKTnFDS0dDR2ky?=
 =?utf-8?B?V0pYVVp5U0RuYnVlYktzMTdFcU1ERlU5b2NZUEVXV1dYYW5XZC9wS1NNY2lj?=
 =?utf-8?B?YVE4YzZ5TVNqRUtyZE5peVE1eFlNZzJkZWgwb2lRQ01ieWF2cjZ6dEEweHd2?=
 =?utf-8?B?YXIzL1NlNFZzVFZtVklGeFh4Z1Fham8vRElYSVplQUtWVHQ2OU53SDJVYTdz?=
 =?utf-8?B?dEh2WkJ4WTV0TkwzdHBoWllVRWplZkJVdmNiTGFjWWVQemo3SHdVdi8wTUVN?=
 =?utf-8?B?cFREY1lIemI1WVJ4OXpYZkV3OU5vTlBNZC80YmRwNE1OdmNvV1JCSzRlNkM3?=
 =?utf-8?B?TFFyajI5czQvVzZNeXZlZXNBVE1SbERXMW5jVFRVRFEra1VaaFhCZFVpMmxq?=
 =?utf-8?B?Slk1VU0weDMzeTBaUHg3dkNGbVdqM3pUckViMUdlalNMcTd0VTYyeEN5b3hY?=
 =?utf-8?B?VVJmRjBIRVVUdlA1S3dRU2I0a0dKWVJhWmNoaE0yNjdaNDFZd2lZNURRZjJO?=
 =?utf-8?B?b3c5TmNaZG1Ra0xsTkw3WXpZNDhPWnYzbFV4ZVZqZXpVc0hUdDVFZVMxck9T?=
 =?utf-8?B?VzhPajNZRE5Zc0llRHY1Vjd2VU1CeDdNRXJZQktVR3RXRDZ0elBrZzZZUHoy?=
 =?utf-8?B?TDA1Z1pPcDF1bUlnYnlEakw5bGxWRjRYYy95QStSUmtpSXR4TzVhSUZ2SFBr?=
 =?utf-8?B?aHQvRkdORUdXZStpQnQvRWd4TTQ2bHFkVVZsK1JhU3hHVlZXTTc1NCtyV3lF?=
 =?utf-8?B?d3UzUTZvcFBQM3gwakppcEozSWVoZStZNVlxemRBWFpFUWFtbUxkSVF1N2lr?=
 =?utf-8?B?akFkVDVJV3JYYlM4TENiZWcvZHVyTjVYU3doT0lnWkd6dEIvM0drWWV3Mlpm?=
 =?utf-8?B?V2srbUh2VHN6cmNhVXhkRmgxdnNrVXlkazNTeCtJWHllN21adEtYTE5HUzdV?=
 =?utf-8?B?Ykt3bTZGbUxhNW5wb1h6VUJrUnZkelBsbWZORnBMcXl6NkQ4b0dWMk0rMDRx?=
 =?utf-8?B?QU9sMjBuV3JJL2hRTzRBQ3c1b3FWa0xia1JUbnNSbk84RnovTlVKM2NLQS9a?=
 =?utf-8?B?YTNuQ3dzT0N6dCt4RWJyOUROeENwRXpteUlvb3d2RUxkSWkvZWh1T3NENURk?=
 =?utf-8?B?S2dGR1E5Q3JSRUpyMDAxTUJScUhMVjQ1Yzl4a0JsNzBpRWRnQWJzZkt5UXk2?=
 =?utf-8?B?M214WlJEY3RZWlp2RjVlK24yVnFFUGhrbWMxakIzY0E5bjVXZUZlVmQvdGFn?=
 =?utf-8?B?SGJhbHFjalp1K1o0L2cvYTVidUtCZHNsMFYzVTltYzlFKzFidGlrQXNlV2JI?=
 =?utf-8?Q?MD5JKBbjtLsgoWX8bOys1vUoQkD+TZdI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmJhYm5ZUldOWDJtbGVSRXQrQ1ozeWhHcUt3M1phaDE5V3NxblMrVEN2SUxD?=
 =?utf-8?B?blp5WGhKUExabGxyejNPZ0RybTVjdksrcmpOdDk4TEw5bUswRWFYQ3VyNUJ1?=
 =?utf-8?B?V0xyKzVKWkVzZDltYWIyVDJueS9oVGhBNGpxUlAwejlFclFNakh2bGxCazY0?=
 =?utf-8?B?SldOTE02UnBTUysraHEwSDhOWEN3bDRRTFlpMWhyOFc4a1pKcUxLY0M1emhm?=
 =?utf-8?B?Q1h0QUxSTDJzbjlxRStOKzk3SUMwVWo1TjhwL1RwU0p2UEJ3YzFhMjdwOTU3?=
 =?utf-8?B?ZGFOU3Y4M2FGR0p5MFNrdTBDRExWQmxYR3gvMlRlRVpVbDFkUmVScXVsVDBn?=
 =?utf-8?B?Y0s3WGg3VlZRK21EeVB3T0tKZDlxbTQ2djNKQmVmajR3LzBWcU5hOFZuSlBU?=
 =?utf-8?B?S3hycjZmTCtLQ295Wk1OQ25MdkMxbTN6bENrc3dQN3c3dDhzMDAyRk04Qjhl?=
 =?utf-8?B?ZDZkNGd1dTcrRkRmVWZnVjBrUlpxK0RVL3dRbG9nd0NQd1cyeU1leEplQXhh?=
 =?utf-8?B?ci9KSG4yK3Fsd0xuS3FDQjNVSVdjTk1IUkMrdGk4ZjF2UTFBRUdKRXpTMUFy?=
 =?utf-8?B?WlNJbTlrOEUvVGRzTkU2VkRRRnFBT2tFRFFzZWlPUmhYQ1NHWTRTNVZpcHpN?=
 =?utf-8?B?Zm90dVhHN2RCWmY4WFloREhlaUluNXZRQ1Y0UFRkbzhkV2J0dVIvVTlVMS9V?=
 =?utf-8?B?QklaZDV2SEVNRFkwREZzbkdOYnNRU0lkek9HMEc5TndTblQ5Mm1tOG1ydlhv?=
 =?utf-8?B?TjdvdkY4WjhUK3Rjb0gxak9kaHdXSWhEQzk5UEwwRllscS9aWmN4RGlZQmov?=
 =?utf-8?B?Vm1nMmo1SVpBVDFyMzh4NzEyajFma3owS1VSU3NaRSsxNnlsa2JZUFdtWUpn?=
 =?utf-8?B?KzdxendWY1J1Z2pFckpTdUtZQlh3MG9icTRtRkF5SDRlay9jUjRNLzUxNVEy?=
 =?utf-8?B?MGVIVkNycXRRbnRmN2FRT0I1aE5udEZzc1Z1VGdoV0JEOVg1S1YyVjZoNEE2?=
 =?utf-8?B?Qy9MWlRTelc3Y3VyZDBrRGIyZjVNVXhUdGtoL1VnbEhRdVlCTk1LWDRWZHM0?=
 =?utf-8?B?RXhBeTBDVSs3NVBSYy9MbFpSZ3dJVHBBMFZldEp6RlJCckxaUlNYSzQvdFVT?=
 =?utf-8?B?bThxVWd2K2pDeWdEYzBUbW5XRi9uekxsTnZqQk83TTBUd2FIbndxY2JCM05M?=
 =?utf-8?B?bzQ5YWhVYzdCWmUyNkVneHRHTGtHMVFtOUJUN2FzWUFQd2lhRUkzbkEwSWg2?=
 =?utf-8?B?bnlqbUYwR2tYTFRPdlhuZHE3N3l2WjhZTGxDMmlIblI3UXNsQ3ZjTlJBYVpC?=
 =?utf-8?B?aWlyRlZQUGRObVFYNEtkYU9jc0tiN05DaWppLzFodHVQWnk3eEswSWhOWENR?=
 =?utf-8?B?ellieGYvV0RjakNYZFNPMXRIUmpzT3E5T3JzYWNaNHhUWFBBMHNDV0c3WDBO?=
 =?utf-8?B?R2VGbWhTYkprTk8zaVRzVU90ZEdJOXVPRDA2aHZ0bnF1NkJhS3FGeHh0Tm14?=
 =?utf-8?B?SkNzdWpVcHhvVXJralkwc1ZYVmhBcExEa05DR0lIZG14N1FLT3NJNWE3SWFP?=
 =?utf-8?B?Tnd2TUtheFNreVE3ZitpN3hrcUszSGtQZ2poNkVCYlJJYTZ4RUdDbGZKeDhY?=
 =?utf-8?B?NTZkY3MrODdscmEwdC90TVUyRHNSZGFvUmNlNzdkUUFyd3M1bk9EU0FmL3Q2?=
 =?utf-8?B?S0lJSUJaSFR3L3F2ZmdPY3IwV2I0OG14azRaeTJudG1EM3lmQmx1MER5T3JG?=
 =?utf-8?B?ZUtqMVJHOWhUZXZJRHIvZ0M0RDZSU3N2L000OEVpUHJiajMxTTQ0UVVWRTZj?=
 =?utf-8?B?eXltNE5DbDBvWmFXZzgvNm9tUEdnMmQ0djhCcVA1MXdSaTMyKy8zdUJnSTc0?=
 =?utf-8?B?Sis5a1hObHpIdWN0aWpMZ0tab0h1N1cwbngwQzFJSVhrOHNuenYyclEwN1NN?=
 =?utf-8?B?aFlqN2I3V1pQSTFDMndETCs4MlZBNUQrSWJOSDRIajEyMnFzRjFORGc1aWVv?=
 =?utf-8?B?dU52Q2M1U2c2c3d2Qk1kMDFvWTgySVJoU0lJaEdoT2wvalRsVUVCVlphMjRj?=
 =?utf-8?B?ZTJYQ0MzSWI1Uk0rVHM4TzBheFdVOXdsOVUvNlpUZ3NEVXdzS0RiRFh5VzM3?=
 =?utf-8?Q?nvCth1VBbIFnGPvXMFPxUUNGX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89683214-f98d-4124-557f-08de05b0eee1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 14:51:01.6637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwC1kKtDxIw/UXFHLBF7Nm1wTu2Lg4sCQhfs/WS4rfZS61ZBQfm110XHgrP/N6wDj/rhh52upEajyP8IUZw9gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056

Hi Akhil,

On 18/08/2025 05:33, Akhil R wrote:
> Add compatible and the hardware struct for Tegra256. Tegra256 controllers
> use a different parent clock. Hence the timing parameters are different
> from the previous generations to meet the expected frequencies.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> ---
>   drivers/i2c/busses/i2c-tegra.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4eb31b913c1a..e533460bccc3 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1649,7 +1649,33 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>   	.has_interface_timing_reg = true,
>   };
>   
> +static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
> +	.has_continue_xfer_support = true,
> +	.has_per_pkt_xfer_complete_irq = true,
> +	.clk_divisor_hs_mode = 7,
> +	.clk_divisor_std_mode = 0x7a,
> +	.clk_divisor_fast_mode = 0x40,
> +	.clk_divisor_fast_plus_mode = 0x19,


Can you check this divisor value? I see we have been using a value of 
0x14 for this which does not align with what we have here. Can you 
confirm if this should be 0x19 or 0x14?

Thanks
Jon

-- 
nvpublic


