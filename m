Return-Path: <linux-i2c+bounces-12036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00F8B11AA2
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 11:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1851C16C748
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 09:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7B627466A;
	Fri, 25 Jul 2025 09:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OWNI7MXN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27702274650;
	Fri, 25 Jul 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434817; cv=fail; b=I4Ifuz1BQ0OuBd6zqwnOQepd7Qx2ayFnmTztg18guvqwMMVSKjX121ese2S38+J1w/tMLoYHpOXmMyrMdSvB6ZC1alCTY0Uq9IZ8Cr+vjTECD0gHeZFJlOxqIguHA6lM+pohv1pHqpqdQ0A7A+OgiRLnb+Bb5jyx26VLj10p/nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434817; c=relaxed/simple;
	bh=OmdA2Srt9/0W/svqL2qddJLiaD/3ySMgYlEMTbzOTI0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nkv8iIp0mqo9bgKVc82Qw/aey18e5SwCPUqrWS9QcTg1n/l8a+ub/36dzliVkFTfULK0pvanBMwfDWQ1KT2Q57DOQc5Y3ZRH7kvjzJHDudmmh3W93yfzNnxpvcUAKCkYOQlGe4Z4FwEoI36zd3cXnAFdA8t2n8j6juDJRvnI3GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OWNI7MXN; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8CqtaXTOO8McdiR7SqNgQXC5Gka6pVZWvZpmtY0YTY/8dConPqjD+YFwEK+tt51T+Wt/iWwmg3+lNpE2H80WS6lNjq/5TcdBGhY3yiLCqrR8egAnt7rssGmlyO3t5u8zDi8rj9S1W4JkBwG9MEctsbpl45dQ51ZHQzCx0cp5kWFfNtijcn/yjh/6fgY7F+W3eM0hNdtbvWL8Bsv7w8YXYjPO1AGpcHU5SMlHYMZWBlpT5XQ6EnTKoRaDgmE+lpDSvEnDDVy2yQAjtTKndbrl6ibp9XUjt9YeVN11nn3vxCM+qcZIXeIxmSwncgoZpCraRQxtBmQxefkl2WszvmxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvcKMG9O+8cACnQsJNRbT1HMCPezwxdZ6ry9ia4Bj7E=;
 b=J88xjrMSqBfZxzaWv8Yugd2q0UKSorKkd5yPcGpf0K9Wp9sSiIRxGOKCohBbEWPvwo2+eUAJVu9iarmIXqL/YfWeh1I4zh+yhGzECB6pTYwXSbFfGS/YB01hZDepOHRSzlj8Bv8nEzlCnq3kSil45dlC/sX8GK076X9+/pjw/Mhd1gzSd+LGHpjcmGeI9kXqyTs7ce2lX492xY8ufLMtGz3LbR/cAISKbHuS4RShr61bPX6lV+vsZmhqVHsbmsHigr9jlCb2+QCXyQPt3THFCW1exK/l2VEv3KxRrMfknEKeMq1g3qouiOZc4hJ73PQ6fPeyn4r0Xt/hDsBgywMY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvcKMG9O+8cACnQsJNRbT1HMCPezwxdZ6ry9ia4Bj7E=;
 b=OWNI7MXNNBPz7lsMymwEogfE9zlRC9XagUN1xo8/WI52kdIMJ2xJoXK22khY0nnKN9kIZ9l95AGnEJ1m/oc1k914gFL8bG9g1HelPIqy7JkT842i9E9cKBRRrlPxDZg4tT0OqDHx00Fe6n8e4JpU2fPuIP11sqOOgvbdWNfg/jN8tl/zOk0TcIoHgN6hsVH02ZKmeh8JHmKQYjSgQ0T9/Cx6aAKsZJFGK0n8QgE+oOrobC4nA2pwgZRJJrzHlvPsDwxSwEdyFmWJEXTisnma+FOVFS9TGiwGuPoH9oaZzysmAeqSKzGzxdC77oqyWKzySA7AZYXCvLQbwcZ4+nt05Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 09:13:32 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 09:13:32 +0000
Message-ID: <63722d08-6e99-4170-8284-0a0af93e5765@nvidia.com>
Date: Fri, 25 Jul 2025 10:13:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/3] Introduce a generic register settings dt-binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Rajesh Gumasta <rgumasta@nvidia.com>, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, andi.shyti@kernel.org, ulf.hansson@linaro.org,
 thierry.reding@gmail.com, kyarlagadda@nvidia.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, andersson@kernel.org,
 sjg@chromium.org, nm@ti.com
References: <20250725052225.23510-1-rgumasta@nvidia.com>
 <696774c5-db1c-4fcc-a5f6-139dc22ead87@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <696774c5-db1c-4fcc-a5f6-139dc22ead87@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0388.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 697952e6-4590-44b8-7cac-08ddcb5b86d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGFIR3Z2MW5UdlVpNGlUandianJmUWRFRTRmYVFuSndRTDAxRWVuZFBDRU83?=
 =?utf-8?B?bCtCWGpDWkZmZC9oV0cyMzZmZjVzcmN3bFZleDVRNVlnMXI2ekJMcWtOK1NV?=
 =?utf-8?B?U01FTkVJS1ZrUzVQSTR0bWlVNUtOM1laeUVYaTg0djJzb0NvQmhXRU5IYWZz?=
 =?utf-8?B?OG9YbDBaUElURG0zaitiUW9oMFZTUUpuRkJnRitITnd3ZUN3Wm1LNmZ4bUda?=
 =?utf-8?B?Z2hkTFBrL0dFWGQxZG53L1UrOTgxWHVrUStPekl2WURoUUE1VWhFdjQ5d3pL?=
 =?utf-8?B?c0pqMkJkN3VVb3d3RHZmRXJJdUdOUW9jSWlXQm1JaVo2Skp3Z2dzZEliRk5H?=
 =?utf-8?B?cWorV1JZMUNPTlBEbkFsMWNIS1VOQ3RXY0ZwMDR1cjhMeUFJV2FIQnV5WXA3?=
 =?utf-8?B?SWlhZHdWR0tCR2ZsRHlSVzhWdTJTdWxiVVZMdmRoUTE1Mk9BS1NvdU93b29H?=
 =?utf-8?B?VWlPcWhWOS9WQUxOUFU2MWNMejdvWXU1QzMxWHozMDhBdXJVNVZrRnh6MHNs?=
 =?utf-8?B?U3QydnUvc0xzbDhOL3VhNWFiNDZROVliT2ZXbWtPRi85TFZDVEhWNlY4alU1?=
 =?utf-8?B?SU9CMG9Rc1Z5dmcwbzBxUjJqTDdkU1VuRzY1aGJRS0pUdU5uTEhDY3JLNEpT?=
 =?utf-8?B?eE5vZlM4cC9TUm5tdDVWU0NRSmpHNFJhY0VxS1hmRXhvUmxQV3VCeTlLQS9t?=
 =?utf-8?B?WG5VeVFUbUtObHhvVC9kTzJaeEFnQ0lRY3hQSmtWdXVGOFE4V1pnNE9PeTN5?=
 =?utf-8?B?SVpnWUxZbGhJaDhiUit1a1owYm5GUWJTN3BuN1lNY1hRL29QY0lwSFF5Sk1v?=
 =?utf-8?B?REZQWkl5MjY0bFFiWlhaS09iTEp6bDQ3ZSt2dWEvM0xveE9mQ3dWNjhLdmpy?=
 =?utf-8?B?bzdrZkNrSi9WN2IyVXN6WmJZOGJ0emgrRWVIaENTa1dhVmhINEhmUXFPTTlq?=
 =?utf-8?B?ZVR4NTIyUnNRYWQzWWNwc0s2c2tTVFFUeHVJbUxsYWhPOWZkdnhvczNYcjB3?=
 =?utf-8?B?VFprcFZCK0lTZEFVUWhYNjRYbktacUpRam5qVmZzenh6ajdXUkJrYys0MFo0?=
 =?utf-8?B?bHgySXpVbm9SVkVJYlFWTU1vOHIxd3ZJVzVVcGQra29KaE1FNnhvQVJvRXNo?=
 =?utf-8?B?a2tZNk4xclR0QjhaaENLL3VKaDZFK1JPWnI2YU9HYXpGYmh1UVpScUpHUjYz?=
 =?utf-8?B?NjR5QjVFNEZQRkR2cGhPcUNXNG1MOExZVDAxSllCUHNrSDlSaXJTR3F2OUpV?=
 =?utf-8?B?MmZnUGh3V0RXTVpxL1U3TmR2akVFRkJmU0o3VERTZjBZUFZBb2dqd3dYWjFY?=
 =?utf-8?B?YmRpTTNZbEh6WXZhZER1dDRpeHJPQ2hyeSsvbS9rZDFDSkxFcFJxRHFoVEFt?=
 =?utf-8?B?OElXT0QrUmFEQXRwN1A3SmMyZnZiTTlPdWVrTUMyUjJpb0o1anZvZUdQT3pk?=
 =?utf-8?B?VW5ad2pvbCtRSnVkSHczWUVjZVNPNytLQmsycGt6Sjk1QXhGYUU3eHllNFBU?=
 =?utf-8?B?bnRRVzVBeitNcWtDMmhpeU9pRGNoTXVrcWk3ejc2RkRCOFJ0TlJPSHdJRlY2?=
 =?utf-8?B?ZnJrVnYrWjNDMVphZWpjaFFxQU5LTEovSWVtd21EWjhoQkdkU25uRkFra1JO?=
 =?utf-8?B?NG16WVlFemxUMW9sajZQMVlhdW4wZklFMzJLemMxYWNveFBkT1NhUUkxZG9E?=
 =?utf-8?B?cFQzMHYyMzQ1dlNCUTBJNExZcTMxS2VuYS9zeDhjQVpLVndZRGR3QlRkWGFN?=
 =?utf-8?B?SjhzT2Q3MDdDYU0xVFNjc244djdwYVFvbmhIaDArOVJpVmE2Q1pGZ2g5U2hr?=
 =?utf-8?B?YWc1U0l4K2xIVDBZK0xBYyt1MUtMM3hmanhTNFdGTXdweWR6UHhYWUs1YXpa?=
 =?utf-8?B?TW1COCs3NFlCcXpZTDdxNnh4TEZvdjBLSVdKUmZiRkJNbXozWTlsOFVncG41?=
 =?utf-8?Q?tUCfgLSpHR4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFVVQnRWdUk5RjMvVGNDUlRTVGlRU0JnOTA2TzJXcmZjU1MvRFRXVDdhNXhB?=
 =?utf-8?B?dXdNUVN0U1hkLzdKMFdIRkUyU25jUS9qSzh0dUdNamdNS1pDclBZQmFZS1c1?=
 =?utf-8?B?SUN4SmREeVpKaFZpM2FnUWxTSGJ0enloci9jcFE0S0plMmF1WHJTSVZBY3Vo?=
 =?utf-8?B?Vjc0eTVMOG0wRnV4T25DN3dsMjdwTzkwL29JNnZqbFBiQy9uNWxPNkQwOEZ5?=
 =?utf-8?B?WTFSSXBPeGNqc204MXF3UmdzeGdZWTVEYUx5RVhQVVpCQnFXR2tOSVlhZEtR?=
 =?utf-8?B?dGxNMDd0T1pNOVVmb1hPK1lzay93VWNJMGFkQ3BjMGhUQVFydVgzdlZvOXJm?=
 =?utf-8?B?N1E4VHZCR2ttZGNPRFJkNm5oc2J2YUREeU1aQWpBYk1OSFpsNkRVNUlJL1Bn?=
 =?utf-8?B?MnVmbm5ZekplQlVkdzRtTFFCK3k1czZIY1BEazdiS3oxMGZhbmRsZ0pIUnJo?=
 =?utf-8?B?UEZsTVFCajhoRWM0ald5Q3RoQldDN25vaG1rR1hvZWtXbnRSb3hoNlpIYTFz?=
 =?utf-8?B?ZTZjdDBNWGRDZjAyOWhjcGFJTUlYclJkYUxPTzJDRllZaXNKNVpwVXBNZzR4?=
 =?utf-8?B?Zks5MlJxUEhEdTBlWXVsRGtEM0FHU0t3djhXdG5EV1NpQUl2VXhOc1VoU3Fk?=
 =?utf-8?B?dXJxWGxVMlRLdC9nMytBNXhnZDdoU3pOZXRyYVpQWTRRTUtzTFdoSGhuVG5i?=
 =?utf-8?B?SDBnUS9kVjEwQ01QQ1kzL3pNVURWUHgrVVVtWTAyR3dCVHlYMktBSnlYU010?=
 =?utf-8?B?N0llTk02RTBaNW93SDl0WFk0bFdLRmx4NEtZVVRwMHpzMGZrVXhJNk5VZU5k?=
 =?utf-8?B?VEZqQ2JFSTc4ZE11TkFaWXcrQmNhMzB3TUFRanRtQ05UYmpXQ3kzQzNSYXg0?=
 =?utf-8?B?YVYwTkttdlpGR3BGNWxSTC81d0ZmbzQrM2M5ekFnYTR6ekZHOUVYWHM4S1lS?=
 =?utf-8?B?c21henQxQUVucThuZFBDQ1hreDMxOHI1cUNMaDBoa1ZvMUZ6Z3lXQ1FzNGJV?=
 =?utf-8?B?UExKZHdFZmJPRElPUGtlRzk0dEtKcldWeUVjanhEeXVzS014YmprMWx6eWVC?=
 =?utf-8?B?bElWWmdWVk5jREFzRGJZTHBMYTdSd3VCMy9jSGx4Nm1mNlFCTzdrUXJ0TFRq?=
 =?utf-8?B?TlRROHl1QkpHMDFIZ1hFdlhHNUQzRW1NOGtZeTdadDBpbk9qMDVxRXc5R3NH?=
 =?utf-8?B?amdla1NMVXFIc2cyZ01Ka2dreDhKQjhrRWhKL09rWWtkU3ljb0RGK1NITXJ0?=
 =?utf-8?B?dVdPNUVJSitMWG85TXdQdzU3bWd2LzBFVTBZa1JCVllOL2xJU0ZxQXdzbjlF?=
 =?utf-8?B?QnJzS1dIenBIZFBBMjJiR3p1ZUZ2V0dnSWpjMjJxYURzOGhINWFWMzN2NnJ6?=
 =?utf-8?B?cnR6VHFQY1FQZ1hNRVlrUG03NFRHZ2R0OFhhVjliZEY3blBOVlpGZjdleXFG?=
 =?utf-8?B?cmFVYnNTc2tEdm1iMXFNRWJ6TzdXb1J1RHY4YjJUbnBJNytiS1pnRGs2bXBI?=
 =?utf-8?B?N05YQ0xhYkVKVjdvR21Fd29nSm1FVjRHTUZFTUNNV3ROMGlaZURHY2ZZcUJW?=
 =?utf-8?B?WVBFazY4ZlltSUZ1cW16dHB1OGdtd0VSTGc4bmFBWEtqRDAvMXpnUXd6ZFhp?=
 =?utf-8?B?Nloyb2RjSzZGRC9NN2cyTEx1VXdGVHNWRFNtc1p0Ky90bjZGZlVpZmg0VTdG?=
 =?utf-8?B?RXltZE9SOGd0bFE5dFpjTGNGN2xZcDZ2bVkwL3Q4eXJrZURiQURpQndPNlMx?=
 =?utf-8?B?eFgvQ0loMXVmN0tOQ1BCUFJyWlhyaVpEQzFqa2tLTXFiWW5RNkVaM3VFcXg2?=
 =?utf-8?B?U24zZmxOV0Q0RTdKZURnNFg0NVV4QUpCTURWLzlmSGVNUjdrWTEzRzNZUXIy?=
 =?utf-8?B?dlhyNG1Rc1VlREpKN0pjaDJ0Y1RvS0JOdzA3UDROZ1h2bGtxWFdTeFcwWE5K?=
 =?utf-8?B?ZzhDQUowREJORDNuUDNOQ1BZd3daTHZ6TngvZ29BaUNpMUZkM3dTd2tZZ3Vj?=
 =?utf-8?B?dVN3bXE5TmsrZVFmMnFPWlo5TmVkZnVSajhodW9CZ2ZTUkQySGpod0lnOVhX?=
 =?utf-8?B?ZjJIQWFWejVIVHkvaXgvMG9LMUR2REpQSGQ3MTNCelpoNFdaU1dQQi9DVTla?=
 =?utf-8?B?OWRYakFENFBCd0ZFekk1c3luMVR1ZDFVUHFNajhoaDlTOUpMUmpDaEU4TUl0?=
 =?utf-8?Q?i+X1u86eqN4T6hSSKa/tUwKMXcvzLYuOYUPTrmhNWT+A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 697952e6-4590-44b8-7cac-08ddcb5b86d6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:13:32.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOHerSwHdbxLj8u8cwp+EGUG7B3f7h9bf26yjC8tzFJQbrln/ZPwhDUFxwN6ZPSygxMdQmTQUDk7vX4zkAwgog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457



On 25/07/2025 07:48, Krzysztof Kozlowski wrote:
> On 25/07/2025 07:22, Rajesh Gumasta wrote:
>> 4. The I2C bindings are known to fail the binding checks if the fix for
>>     the I2C schema is not applied [1].
>> 5. The file i2c-controller-common.yaml is added as a place-holder for
>>     defining the 'reg-settings' nodes for I2C controllers. However, this
>>     is very much a place-holder for demostration purposes. Ideally, these
>>     nodes would be part of the main I2C schema.
>>
>> Changes in V3:
>> - Renamed as 'generic register settings' as opposed to 'Tegra register
>>    config settings'.
>> - Dropped all the associated code to focus on the DT bindings for now.
>> - Added a 'register-settings.yaml' as a top level binding.
>> - Made I2C register-setting timing properties generic I2C properties.
> 
> 
> Where are lore links to previous discussions? There is no v2 nor v1 in
> inbox.

I see the lore link for the V2 at the bottom on the cover-letter. Pasting it again here ...

https://lore.kernel.org/linux-tegra/20240701151231.29425-1-kyarlagadda@nvidia.com/

And V1 is here:

https://lore.kernel.org/linux-tegra/20240506225139.57647-1-kyarlagadda@nvidia.com/

Jon

-- 
nvpublic


