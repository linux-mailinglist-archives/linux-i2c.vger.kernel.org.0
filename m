Return-Path: <linux-i2c+bounces-6833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B897B401
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 20:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF2981C237EF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 18:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AA218786C;
	Tue, 17 Sep 2024 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nLDCiLAK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9F166F23
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726596858; cv=fail; b=J8NTdcu/at5zjcVqncJxPZCtkYQEfvv9Mr9szEuhqrEvG9SwTdiusFG09eePWaeNursN+o98tytGeJF1XqanVPIpdVVePyUBXHtgRYjPqd2+xuepmlS70W+NJv29Fnl4oZo0WLlBK5mpMQVJA30MxLhy5+MnaKHsh+mXQ4Au+2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726596858; c=relaxed/simple;
	bh=Lp5VbyWnliR1r2Qc4uPCHwhI688UL1+37/xoZ1Df2Vo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A/GxeTmwYWWYQ3tws8I0ovt9AlQMtzFJm4Dcbrixcnu01nxuLK/1scBEir+MI174eSciwFMrHMGT3/HqKDZ2Zk24n1TQ4eow4XFVo3D4S1/2UfBcwSXG635csiU8B9tr5lj8s4RqqsJZEfOiS1F8xuhHtxTffQGKNtuiBId6ULI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nLDCiLAK; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaHUHfUeHw810nGEVQcR+veeR5hOoviVwC0WLa+0gzUrZu8r5YUu04XT3T7zkH+u8d1DCi2/2bzjltzi7tYQjIlKa99vMccngLwT9/M9kBtUT8fQbHIBl5F2XnZCtexPQj4uVuiqc0Mwibt31gOMPYaEt43AVrKYwxAvO4v1/zFNx7ciYyi83Lqz3HHCqUiVjyMxV7oYdUE1RWpfvuR6F+YCzZ6rlkAMsSYIgHVdDJzeKbF7Jw5Wz86sK0cA5WoTnyGqLu9o0NZmvN/mICIBLS08wLfFspW/ZX/4gi9SOKxw9wv4rWLZ4K0I4AfKt/KqaFppdACW1gMK9QDVF6czjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90tXx5TPYuSYG4l3WTpdIXkhpW/JyWCleGiyXmPBYYA=;
 b=GcBNl/6rR9nbKx4UkJhFgd55qRTqfPOMPfG2JhszStfnUn3MDf36BxSRiMkgShiVxT72roNwydSco6oMiHkWQ7Gqf2yJO0x/k04qaKSp7S/NFvpfHN9EkZ3lFqfWLe238brN3sJIYPo+V2Yjo/f9qn14PuacT+lqrFWrwVFgmxmaRHFtKgEhftbk1JobCcQN2wpmZJB9HyoX9/wYcP43SlrfFTm/EdqRj2k2T3PQ0KRe4kgrSHW/iZvTY8cyJDZDYoKD2Eb+poTpJvyjESUTjY5AEfgGoryS7+6B5SHCcXlLzWR8b4e82Y9v78b8gg8iWC/4CxyIOc33OsvQipd7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90tXx5TPYuSYG4l3WTpdIXkhpW/JyWCleGiyXmPBYYA=;
 b=nLDCiLAKMDWIA2b1wU0S1ucWTs9y8QNtWwkze9hjXZ7YL+K7QQDA9/4bi7N0uIj54tzDzdd81s76hR6QdB3nJK/jmPm+jshUVgYhyYPjT0NsPSq3uo6PJk263Ccrxi/2opFwqaDv98yAAUqfA6rqY1k4Cqnl0zsO2M6lH7a2SOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5875.namprd12.prod.outlook.com (2603:10b6:208:397::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Tue, 17 Sep
 2024 18:14:14 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 18:14:13 +0000
Message-ID: <5361ddf5-e1c8-4512-8982-9404f12fe4c1@amd.com>
Date: Tue, 17 Sep 2024 23:44:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-4-Shyam-sundar.S-k@amd.com>
 <ZuSKUCC1XqBURdib@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZuSKUCC1XqBURdib@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::35) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BL1PR12MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: e383e474-1ae0-499d-8cdb-08dcd7448828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUI1bEg4WUFvaDNkSU1KNTVTbm9kaTFVbkZvU040cUQ3OVIzY2tac3J6bFdS?=
 =?utf-8?B?UUY5eHVxYU1aV2V5bGsyVzJpdnZUNU44cWpNdUlxUWRRdmlndHk2a3hjcCtV?=
 =?utf-8?B?RUthMy92Q2FwRVpwdHZBOUg3b3lsL1A4dnYvRHpuSnJBSkMrUThISzF1Mlg2?=
 =?utf-8?B?NlBJQXhXcWE1cndvaEhvaVpITldCbjNzMnNLN21Xb080TTlmTkxCTlovalh2?=
 =?utf-8?B?MDAxMlczU25wTjVtVCs0L2VuV3RWZGg1V2Fyc2kvTjY5cUw3K21sM1BIaU5L?=
 =?utf-8?B?OUdnbzNHNkJWUktVZFgwK3RScElBaStiajI2VWtPWDBLdUJ5TXgrazg3WVJQ?=
 =?utf-8?B?aU1VbWJMTEwyMHpxMFNyVWJ0c2xScHVsS1JxK3d2UnR5a01NeU9BUllxODND?=
 =?utf-8?B?YVF3WmNQY0xQZUlqMHcybmpFb0xmMDBORE9wQkpjMGUzNi8xWFpHWldwWUlp?=
 =?utf-8?B?VXF3cCtJRTUyUzg2VE90KytoeEZRWjV3b3I2SXhuRGJ6Ym45c2VCUWMwdjNp?=
 =?utf-8?B?OFlRYkREQWpoWVhsTEh4MXJCRmprV0ZhYm5Rc0dQUXNxcFVhTERIYWkxaVRS?=
 =?utf-8?B?Ly9zNktMcFVaOUQraHpNZkQzQUs3OUs0b3pSSzV2WVFVZ1plQTIxaGs1am9F?=
 =?utf-8?B?MGZXTW5PRnNyU3hVbWl6UXZEWFRINzd4cnhrNmRGZ0ltNHlQMGpYblY4SElF?=
 =?utf-8?B?eUtCQ1JWREJtYWwrYllVTWp5WE9tNmpnVTV1NnVBYmFhSjQ1NVZNQTF0eU05?=
 =?utf-8?B?NXFiM3JSVnVJNDdRMEI2OE5QRkNXZGhsdEs4Mm9Rd1BoNzl5ejZlMitkc1V6?=
 =?utf-8?B?MVlpRGtxNTk4djRuZTRhVk84MU56VHFrZlN1blEvTklyNEdZSjhaNXc3YlV6?=
 =?utf-8?B?UW15MXJvZzVTQnJGcDFUL3VwYVRxQUtXNnQvdU9ZUFRvYjc4N3ZpZHZOaThh?=
 =?utf-8?B?M3hQOTBsalFLVUFaWVBmelJER0RzZXVYSUFlQmJ4NkZyZW1hSTI3cWlSRUMw?=
 =?utf-8?B?S2VwME9HQWhQM0V1b29lQ1NGbml5ZmNwajIzNDNOcTJPN3c3ZEF4SnIzQ3Bw?=
 =?utf-8?B?bGlYcmxNa1hmYWE5QXlXK2dJQ2tobTJFaWJ2dVdYNzhrd3lsZGJFbUhVdmIy?=
 =?utf-8?B?NzVvMlpVMEtjMXBSdWlwOEdYNjlRM2tZVzJOcFdHbTYrc20vUlVrUE5aeEMz?=
 =?utf-8?B?YUsxSS9jd3hGU0p3NWROclNzOGx4VFFBYUJOa3M3dG9wNTNTeXVZRTNNelVE?=
 =?utf-8?B?Y1BFZURmdVAwbjZDOGltcExOYmxzN09ldmdZaFQwK1N1cnZsdXc4RmlFNExW?=
 =?utf-8?B?NEVSNDRFZi9BaEFkdkR6QUtSTnRadERFOFJnZTQvVG1IdU9pOUVSYmk5L0Yw?=
 =?utf-8?B?OHdVYXhkN0RwY0xKRDcrUEdXTU01SUZWZlBTQzBVTGlJTUZTSU9vblVmZjVS?=
 =?utf-8?B?eXMyc1FabXlMZTZmRGluWGxSTlUxeUdaMlJ0Y1J6ZGFySXZzUjltVGNPWXRI?=
 =?utf-8?B?RE51TXB4QWxhUWpLenZSUnVTNlhXUGgyNk0zVWw1ZGlzYTBybjlWV0pIUStj?=
 =?utf-8?B?MnI5NVNuR0JjZW1YcU1SZG1ZZytxM0FYVUwvTXc3NUZFNUs1Ri9UR0xzSy9o?=
 =?utf-8?B?amZua3N5QmFkTjZybElpcmRVVEJoZ1lzTmg1amthOVhvSG04RzEyRTBSU3F5?=
 =?utf-8?B?MExyK3YrOFBheG1sQU5Xbks1WWovaGQ0ZTVnaFFVMHU5NFR1V2pqT0M2S3dw?=
 =?utf-8?B?b1MrSm1ZUnExSWdBdEo2MGlwTm9qWGhJK0tHRlJ4MEhMN0RaT2dhQ0g0TnE5?=
 =?utf-8?B?NHQ3WGtud1lSR3FVUmpTUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE5EVVFmZU1LMm9qY1VKTnRCelVmbGsxWERoQkxMekJzclRpdTdoZUg2bzJ0?=
 =?utf-8?B?VTFhWFB5WWVnNVpEeVRLUVVNYVA3MlZHM0FvL1REWWZ1eFVEaGVMSFNXT1Aw?=
 =?utf-8?B?Yk5GOFNTK3g3a3JpV3BkVEJQQTQzWFpicDduVml5MjhkTlkxQ0RNK2ZJZUtO?=
 =?utf-8?B?UElRMDM4SlFLTGZ0N1hNY1hPdjhmMVR3VkVoVkRMSERMZmZDdG1FeUV6QlpZ?=
 =?utf-8?B?Q2tJWVJwa1RZZGgwcFdhVEhjMWM4YWhUQ3poUmNOTlB0YXVhbjlKcHlLQWpL?=
 =?utf-8?B?ZEhDL1pXQkpGQ2d2Zzg0Nk1ocEpIOFdGT3hHRnViYXk1UjZGaXNiK2xtVkFp?=
 =?utf-8?B?RktQU05neHFmcXJQdXFCVlIrdWl0Q3QyOGxxMm9KNG1PcHBmTzYvV0tINi9N?=
 =?utf-8?B?b1NCN2YvclJqelMzSGtZMGlSc1FUWDlXZlYvRUcxN2ZyWURmN2ljN1l4Yi9C?=
 =?utf-8?B?VHZzVWpGOFUyVDlFTjZWMEoyMGZ5NVIrTlFlOVBzdXpYYlYyRW0raWhpTkkr?=
 =?utf-8?B?bTE3WmREQys1Mi9ITVpuditJY0g0MGxDZGhKSFhYQlJaeEtuQU1JclpJRFhq?=
 =?utf-8?B?bXFLNkNQL2pFT0YzK2M5M2NpRGZHQ0dUMzJNMGlsRHFFR2hDb1BleVltNjlJ?=
 =?utf-8?B?eUFlSWw5b3JaVlVGK2FaME1EcWw5SlRZcmIyeGxYZ0VXMmgzUTVHUkZCaTlv?=
 =?utf-8?B?VENCV0dHRTZxSjM1Njc5TlE2d2pDaWtENUdiRTh5djFpNG5laDgwRnBldFBi?=
 =?utf-8?B?YWFBS2RoUjIrcWxKWS9yNFlNZUprbmtNTmZhN3UycGdxcmRGYXNNd2xLemNt?=
 =?utf-8?B?N0MwSVc3eWNKUVJ5alY0RzE1WWVLU2F0NWVqNEZwNHhWNGZVRjBOdmZuMVp6?=
 =?utf-8?B?REJIYnY4TnhMaXBZeHBrRFNVdllZVTRzaklqSzdoREFhR1hCSVNieTFiazJk?=
 =?utf-8?B?cEJXdjlwUWRQZEs5T2VUeGRJR1h4dW1MUnFuSmFCTHRzb01LNXNBRy9qVE5q?=
 =?utf-8?B?ekQxcThISWVnUUpwMWplcGIxMzhzT01UMDBGaS8zUlQzLzUycEZVRjhiZS9l?=
 =?utf-8?B?Q1dPeEFMOTE5dkxJdVFsQmZ0b3B0TjhsaXlOSFVwQVFyNGRYT05UN29NZGtI?=
 =?utf-8?B?Z2RiSlEwZ3hVVWJXQUZZT3c1Z21oV2daeU1CTWx6SlBJalJFQUlZaVBQem8y?=
 =?utf-8?B?Y0xsc1UvMW04TDh6OU1uMm50cDBKd2hDZEtkV1BzRHphQ0duY0Rjbm5Kc2hZ?=
 =?utf-8?B?UHZUaS9xNnVyekFMNVRUbDZaa3YrRzJ3QzBoR3ErUDNhYTAwSklhWm9KSWxE?=
 =?utf-8?B?dmcrWUthNDhPV0pBZFU0ZWVMUUtoRSt1MDBjQ2liWVdnck5RcDFYc1gyUHkx?=
 =?utf-8?B?M3NzblBMLzZXSmlaNWlNcEJYRXRvUnlPa1FSVkd1b1ptUU1BekhvTWF6M21o?=
 =?utf-8?B?L29lenAvL1Q1Mms4QU04dXo0K2w4N1pRb3h4UUNETFQrOWUrVGhWUVFhdloy?=
 =?utf-8?B?a2p3ZGUraHZLUi8zRXRhdkMxVXpGVHFuRWNaMWNwbkNuSCtaVzZsbGMrcXJ2?=
 =?utf-8?B?ek1sMFZsZ3RlMjUwSnVZZE1DWCsxZXdOVnh1Tk1rVG9ia0ZHYnBGMVgvR2xo?=
 =?utf-8?B?R2JjVjRrRVRyQVhyRnlYcU11dWgzajZGUVQwNnRzekRQREsyN2pTRm9tY2xX?=
 =?utf-8?B?NS9CdWxFbHFSd3hJRkRkTXlKYVJ6SHB0dnZ4RmVUemxtZlo5MDdpYjNmN29K?=
 =?utf-8?B?YzQvQU5ldWQzVUZ0dE9uYlBHek5zS3pJR2N1L01QVGR0Q0haNFR5N05BNW9K?=
 =?utf-8?B?RkJWSDhzaTZ0bXRNUk1zemd6S1k5bmllK0pFZ2JjVmtBdjVVeDhZQnhUdTFZ?=
 =?utf-8?B?eE5pYWhma2QvK0xZc0Z6Z1dDWWpjTkRPOGpWV3pKdjdleWdLb1dDVnIyVndS?=
 =?utf-8?B?cmc3QWY0dXpGRXlyVmh3cEx2Wlo5KzdSdG5INDZDRGp6U1VoTlNNbzd1bW9h?=
 =?utf-8?B?SWNicXcyYkV2OS9qcjM4cnFPejlzU1ZQd201b05tTzhEQ3JFT1d2NFJEZEhS?=
 =?utf-8?B?M3ltcVBVZlNLc1BBN0gvelVmUnExK0tVRlNRT3QvZ1ZxYmZRS3Viakc5dCtY?=
 =?utf-8?Q?oChEq5wKM4NrwBPl9Hq/yB4ZA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e383e474-1ae0-499d-8cdb-08dcd7448828
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 18:14:13.9084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCdwv9sd2GF9ByNRueUoeluAmE2fgoAYjg/+yKB3Hxa/AkrLFenXLsUizEj9EYlTsIlt8iuQTTmjoUsnQ34jqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5875



On 9/14/2024 00:24, Andy Shevchenko wrote:
> On Fri, Sep 13, 2024 at 05:41:05PM +0530, Shyam Sundar S K wrote:
>> Export the following i2c_piix4 driver functions as a library so that the
>> AMD ASF driver can utilize these core functionalities from the i2c_piix4
>> driver:
>>
>> - piix4_sb800_region_request(): Request access to a specific SMBus region
>> on the SB800 chipset.
>>
>> - piix4_sb800_region_release(): Release the previously requested SMBus
>> region on the SB800 chipset.
>>
>> - piix4_transaction(): Handle SMBus transactions between the SMBus
>> controller and connected devices.
>>
>> - piix4_sb800_port_sel(): Select the appropriate SMBus port on the SB800
>> chipset.
>>
>> By making these functions available as a library, enable the AMD ASF
>> driver to leverage the established mechanisms in the i2c_piix4 driver,
>> promoting code reuse and consistency across different drivers.
> 
>> Note that the git diff view is presented in two separate lines in order to
>> suppress the checkpatch.pl "CHECKS".
> 
> This paragraph should be in comment block rather than commit message body...
> 

I can move it to comment block but in the last version Andi mentioned
that I have to leave a note about the function within one line.

>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
> 
> ...somewhere here.
> 
> ...
> 
>> +int piix4_sb800_region_request(struct device *dev,
>> +			       struct sb800_mmio_cfg *mmio_cfg)
> 
> One line?
> 

I am OK to do it, but Andi has a preference to stay within 80
character wide length.

Andi, what are you thoughts?

Thanks,
Shyam

> ...
> 
>> +EXPORT_SYMBOL_GPL(piix4_sb800_region_request);
> 
> Use namespaced exports (with _NS) from day 1.
> 
> ...
> 
>> +void piix4_sb800_region_release(struct device *dev,
>> +				struct sb800_mmio_cfg *mmio_cfg)
> 
>> +EXPORT_SYMBOL_GPL(piix4_sb800_region_release);
> 
> Same comments as per above.
> 
> ...
> 
>> +EXPORT_SYMBOL_GPL(piix4_transaction);
>> +EXPORT_SYMBOL_GPL(piix4_sb800_port_sel);
> 
> _NS
> 

