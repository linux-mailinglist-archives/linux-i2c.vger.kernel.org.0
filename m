Return-Path: <linux-i2c+bounces-3620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 370268CBF49
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 12:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3C861F234EB
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 10:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE3A81AD0;
	Wed, 22 May 2024 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sEZKolfY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB02580026
	for <linux-i2c@vger.kernel.org>; Wed, 22 May 2024 10:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716373930; cv=fail; b=ryNojz1kri8OYw8U35UiP4RA5Xcc8enYL7LYfZhxSTLqQMZhlx4Y18ruNi7tGfC8MQo2ofVMoKMcJ+BOKZovF1OX+WrtfzRUiApmY2hVAqilD6ez+sWakI8LoXbV9JQGMXJ2Gbme2XSaaku929FWdTTZgU4kHqEBw0822h4uCGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716373930; c=relaxed/simple;
	bh=CKEElJIt8KjxJBVItNVD+BZupiyBWa3DZb2KKyDK7dw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GhkF9UF6kDQC4m46DQqmH5z4XUXNsmMB3En0qAhJ8I0AbkkQlkpqkUDhXJRDJ6FMDDaRQB7i+4Xa+VKVPY1TO0vvUVj0lm8+i9Ily8azAhHSETkNyGNfo53/dv4dRO9Ron0JzeA3wEkkpYKVaE6E5jZq2SzWXWVVRWUlAW5Rd98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sEZKolfY; arc=fail smtp.client-ip=40.107.237.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gn2DV7vQw5SMyA9G+p76YbuWev8E6KZxpPC5/g0cAs/fmnX6U4/2rMgFoA4C8HYYGa/ZsreCjM1+4lhtvb0Si0xBa4CI7Kbd0mUZOybDXeEjgcBeqPoyNxcgp6qxrGR/6QK1JGEC4grz01+0/fa2qSvisx7gOMWGqsZots4npKWuq+fLFy5U7NOMvO5ucAphLJuyGldkAW/ll68mahVHzWAluic7ertRch1QzAYmnM8Ct9J4z4mHEgEaOeI5RavMwyZuIxkn0iMQM0Ma5hvXRXTq1qR7j+1FgKeur/cTUhwwNjqegoSpUyczdpAlls4VR/BFYp8K9HEe1CAF5Kb5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8SclkHKDCOfq70BCdKnAtT9nN9wQKveTx74JAYmLuc=;
 b=alMQdCwsRxxfjhdffvJ+bNp6DQ148WAvdK8PtebxwpwerghVH7yHIVwNEKmZfAQrfq3sA4BefvNxSgjEkGRmaR0y5YrKoi0VcAmdXEodOq6V3qt//4A7e7F7ibYIDvRqMY+ln5ExzqwtobhJxbtUu1G5kD60B1ZQxpcrVITFuhqUJV7KpsgTY2lmKKd6vqMc9q4chZUQOkUTiCbEwOFMRqYfmqfwVsdj8CqwcU1J9RMwiAj8HmqJtnQ3irUfSYB9jn2SSzV98C/xgfVFEFBH//9OxiJJsjRGL4FSPdkTdE9ataRkgfw3+xlKSxxACT4ohwuhFO4Kann94tJY2ezusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8SclkHKDCOfq70BCdKnAtT9nN9wQKveTx74JAYmLuc=;
 b=sEZKolfYd2Huo4jpcPD2DoH7KNPdgqnjHkyc+NUhM3DRfdzwfxN5htRreHhhhG+8R9srkJCQ1wltorP7hPKnM0cxMbZim9ZNlEflWioBf0OfSzfb/E9pxs+F3RsteVawC9Gxcwb9gcHb9+EdX95Pa8sJbowMXbwab/ITXKHrMNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SA3PR12MB7952.namprd12.prod.outlook.com (2603:10b6:806:316::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 10:32:05 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 10:32:05 +0000
Message-ID: <38c74353-17f5-4b13-8e5c-3eeda57f50d5@amd.com>
Date: Wed, 22 May 2024 12:31:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Xilinx I2C driver fixes
To: Robert Hancock <robert.hancock@calian.com>,
 "ben-linux@fluff.org" <ben-linux@fluff.org>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20231121180855.1278717-1-robert.hancock@calian.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::48) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SA3PR12MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: e78a0b1b-4be7-4040-197f-08dc7a4a6d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGdEWVdsd3FzK3kxS2FlV2Y2TG0rQmVZT0VhUHpTNlV3am9wT3RMQ3IvZGor?=
 =?utf-8?B?MEgzRnBRdndISmFUMytibVNpQmV2OWlMT3R4NkNsQzJOL0tDN1hDR0MwbzRR?=
 =?utf-8?B?RGpEU3AwenZzZWNSTTJZSW85YXh4b20zZU5ZOGNGUEI1akwwaGZNeGdyZG4x?=
 =?utf-8?B?SXF0MDNtSVFqVXQrdldvbDM4QW5BVFdFN25WM1JsY0xnTUp4TC8vN0ZjMHdK?=
 =?utf-8?B?cmxxbkVHSVp3czYrTmJsRkpEZXl1UFYveWRwajhJWllEaU1MM213c2ZaUThT?=
 =?utf-8?B?MnlXY3JNVFdIOFZRRHZwWW1kemNZYXcwaDkvQTVYMXFiUitvem5TRSs1c1di?=
 =?utf-8?B?eGpMajRmSDVIbDQyYkdsNlRZRkRFR3QvT1AzL2pkTlhJZ1ZpT0FZN2ovRzF6?=
 =?utf-8?B?OVBJWHRVcVgzNTE4dFRFeWV5UEF1TmlMOFI0VS9LL01UNG1XVmZlU1RQdlRj?=
 =?utf-8?B?NzlmWDF3cXpCc2s3WGQrdGRJWHNmeldGeFZvak0xMTVCQTdpVGV2VnI0SUFF?=
 =?utf-8?B?bXJNS2JwYkx0T09vK2hqS1ZhZEpEWkJLRGwwSkV5ZzVxaGNZb21qMnFuOEpE?=
 =?utf-8?B?SEc2UlN0b1FGMWhxbTdrMzNhbEI3OHlMcUhURTFGeHFYaTM0M0ZWcHpQKzhW?=
 =?utf-8?B?eXNHS2F1eUpxa2M1ajVzQ3hZaytscUlrRWErTjVmRHpGN3RQbDY3THkvQWlH?=
 =?utf-8?B?TTBValBWRERXOW4xWElIcW93SGxiQjRCaFp0YWdsUzVWbUtiYnNVNmxKS3F5?=
 =?utf-8?B?UnVNTzhtL2hzMUc3Q2U2NE1DMTAzd01wQ2tiOTg4bWs4R1RJWnJ4aXZJQyta?=
 =?utf-8?B?L2c1L1JpcXZhbXRkZEQ2TTZ0Z3RSdm8zMHBxdlJra0k0RVduM215MGk2UVpv?=
 =?utf-8?B?cEg3SWduazJyY05KQVdZbFc3WFR3bzJlM1p2SzFWUWJicktDUlNxcVgwU0ln?=
 =?utf-8?B?dDZ5UzBRbWpjM0RQS2NLTGQ2RFd6dVgvVnBWTDNqaDNUR3JERmczejlONmtw?=
 =?utf-8?B?WSsyc0xaeWpiRmRCUUx3TFNhS1FZWU5VZWUwZ3JadWkxL1JDa2N5UUt4aCtV?=
 =?utf-8?B?Z3laaEtWYllyUC92VmlZZHF1MmY5ZG1IeXd4clFQUC85aXhhNytGWEo4QS9B?=
 =?utf-8?B?RnppNnMyYjUxczY4V3pIbWtJQjUvMGkzTHZVTm1nRzMrZHRKVks1STY4OWxB?=
 =?utf-8?B?TytLb0NValhTdU4xdlFBd2lMVkFzN3QwSWg1aHdXc3o1NEQvdTA3ZFFVcE13?=
 =?utf-8?B?TFE1dFlnV3dQRFp5cFoxM3hIWjVoRk4xRnd0OGJHZ1VOQzJ5UGRhYTdYZUEw?=
 =?utf-8?B?dlRFcERvRERRM0dLN0RQVU41M25TRDllY1psRVR4SnBkSEhka1ZsMTJmekVF?=
 =?utf-8?B?eE03YnpzYWZrdVdhODRNMlRIS25LSFNqV3NvTENNdjU4VGlDRERMakdxTmpP?=
 =?utf-8?B?aVhzdkEvL1o2ZHA2MXBFR2JaVXVQV094a2d6SDllMmdWZWdIclBzWDNKdzJO?=
 =?utf-8?B?MmxOSi9jYk51NDYzYWszTkQ5WTRHazFhQ0ttd0tzbSttaUg5VmJnWUZUVkpX?=
 =?utf-8?B?RWlJM2RSdVVCWU5CQWRlR2NmNWNScndZR0F6U2pIQWFkV0RZMWVSRDdBWXVx?=
 =?utf-8?B?bkZuZzlGNjV0VzVJcEEvOTM0cFMvdzRhZ3R2NXVseTk3aHVMeVRJZkNJVnVY?=
 =?utf-8?B?amJYallkSGxESWhsYk5EQ05sZkNHUmtvVnlTZmdLS3ZxMFRVTWZjMTNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkczRzlTaEJYeVVVYmlIbWtsaXZnUzBhMmNoSElHT3JIN3ZwdzVzRjAyWkta?=
 =?utf-8?B?Yi9lYjNONmFJbEp1cFg0eEhIR3N1NC8vdGc5NUFkNVM2QmtJVHc4SitXR25k?=
 =?utf-8?B?MFpzM25HSFhsdnlkbCsyblRsWkd6aUFHQkRqVmdpaVR2bkF3d29KTjhrN1BZ?=
 =?utf-8?B?NEJFeHA1N1pvakllL2NRaWZvWmh2aWFrdWYyU3d5dVU3UkZxeTRoREk0N1Zz?=
 =?utf-8?B?NE9WQUlUVUtPR2UwbHVTc0w5aGE3MXMzYzBFY2J0dG9lcGRYZTRvZTJyRmVR?=
 =?utf-8?B?ek9YbFYyK09QczFIKzkyazkrcmtJU3h5dkwrVmd2Vk9zYyt0dTMrcG5vTyta?=
 =?utf-8?B?YzBGdGV6Y01OUzlGRlozWGI3NHhKMGtrS0I5V21lbjQzbE0rUWVFT2RzTlRo?=
 =?utf-8?B?QWRibWJhd2hhVE54NVpMd0VPdXk2Z1VrNlUyTUgweWV4UlVhRk92TS85YnV6?=
 =?utf-8?B?WmtLeGxjd3pobG1YNkQzRzJHNVpnZ0xoZjJwVzQwRVpGZnNINkRsdGpDZWlu?=
 =?utf-8?B?enBwWERGZnVrZ0FnVUhFQ3Q2cGlkb3BwTVlQSVpaVWxLeHNEWFZFL0gwZi8v?=
 =?utf-8?B?akdxdHNiczBkZUM1YWpack12RURGT1cxRGlJb25uTCtpWDVvekVrUDZIZnpr?=
 =?utf-8?B?MDBscXV5MDRjbWJQRXEyL0JuL1NFb21LMXR0ak1sQnI5TVFsMDk2bzJDZUt0?=
 =?utf-8?B?Z1NLMmhIbW5YNVFvcmlKdjhDejJ3VGdIbWpDMGRTWDRKRCtCSDZxWUwvMVdH?=
 =?utf-8?B?Nkd3ZkZ6N3ZTKzl0WHdmaGt0cDFhWlNHeFlkS3V1blNYVkJOdXI3US9WdHVw?=
 =?utf-8?B?cUFadTlWMTZYQ01SempaemZTRmxWMVRqeTlsNWxKWXJIUkF5N3BGcWttYUhF?=
 =?utf-8?B?emQ0TDdwSEJFTUFJL3kwMlJkcHZzK211VnVHSmRnTm1iejllcTl5UVRCMnBm?=
 =?utf-8?B?Lzk1dVVyeENQSzhRUk9teCs4TmVFU0NrR25yb1AxY2V5dlVJZ21icGZXMk5r?=
 =?utf-8?B?T05SY09XdUhCQW1NeG10QmFhQ1VROUpabnRERk8rZmRMZ3lVUFFBd1FqNm5J?=
 =?utf-8?B?bEYvWWc4bU0zeUsrQ1JXamxHdis1aE9EdHpYdHE1UWorMGg5eFhya0FxbWhH?=
 =?utf-8?B?b1RpTGJtbDZlTUlON3dYOW9LV3M5N3BxU0NoYUFjaUlmUEhvc3FWNEQ2Wkg4?=
 =?utf-8?B?YWJOSlBKSDUzYStlZVF2dlM1TjJDcStpb0tyODJ4WDg3aHg4cDZ5ZnJQVis1?=
 =?utf-8?B?MlpKeHRvV2VHNkFtQzBvWm9oREdrZGNiSm9nYkhuSGNkUE01NUNrd2pVSE85?=
 =?utf-8?B?aXdLeHdsVEQwOVZSUkpsVnZEeUxmQVNGcnV6TDhtUEFDV2F6aVJRb2VIZW9J?=
 =?utf-8?B?dFJGVTd2MUhDcjRKOXVyR3gyeDVBbTF5YlJjUFl6SmtxQjlJNFAyZHJzbDVU?=
 =?utf-8?B?c2ZzL2cxcXZDd2RNSVE3MGVVRDJYYlRNQ3ZsaWZMMVU3dHV6MVZXcDJQMkpS?=
 =?utf-8?B?bEsweUIzcGxEUHYwdUw0T2JnbEhMNHJ2cFJEWDJzdURoR3dIb1NqakNrU3hT?=
 =?utf-8?B?T2d1NXA3dklFRGp6MkV6QkxrNFo4NGtOVll0Zll5RTZodWJjcGFCdGRiVHdJ?=
 =?utf-8?B?SzIybHBUNFZNMHVobWgyN1BQK3VFeW0waDE5ejdOQUtmcE9NRmFSZFRNZ2My?=
 =?utf-8?B?UGZwSmlHby8zVStJRnZTSG9iWmpGNjhPTWRYVUlNUjhVaTA1ajUwSThJWSsz?=
 =?utf-8?B?d1FYOFVwZlZGaklPdTlXeUxzWHR6bklVWEUwNmg1VHhwdFk4R00reXNLTVla?=
 =?utf-8?B?bGpYT3JFaHRGVnFRVEJ4Y2ZuazZzRVNNaW1WV05XWld3OTM0Z1h0aHlnaWpH?=
 =?utf-8?B?YnVqbjg5ZW5jbzFqVjZiUElUY1UvbzRmYlVKVUJ1UWg4aWRnbmI4VytQRlFi?=
 =?utf-8?B?NkN3ME95TzltcmZZMTlIamt1alNrWVBHSlcwWWw3bXNpV2JLNXlYNWlFT3Iw?=
 =?utf-8?B?NzJQOVFzNkdJNW5QNExxRTNDQ3gxeUhEbGpNbkVRQWZzL0w4TTRVeENXcGd2?=
 =?utf-8?B?N3VJSm5jTkZSQmFaMlh0TEpiY3pVOG5yQWRwNU15VUhlS1RBRWZBWEJlaTZz?=
 =?utf-8?Q?WSE56o/DJVXME2Mdl7ijrLVfZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e78a0b1b-4be7-4040-197f-08dc7a4a6d01
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 10:32:05.7606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7lU/r2adCX/2J/oP5yZzX5ZvQTZW5WUkx4EGlulnARmohNyZGj01JrCEJzziAot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7952

Hi Andi,

On 11/21/23 19:10, Robert Hancock wrote:
> A couple of fixes for the Xilinx I2C driver.
> 
> Changed since v1:
> -Fixed an issue in first patch where an additional message could still have
> been written to the TX FIFO without waiting for it to empty.
> 
> Robert Hancock (2):
>    i2c: xiic: Wait for TX empty to avoid missed TX NAKs
>    i2c: xiic: Try re-initialization on bus busy timeout
> 
>   drivers/i2c/busses/i2c-xiic.c | 61 +++++++++++++++++++++--------------
>   1 file changed, 36 insertions(+), 25 deletions(-)
> 

Can you please take a look at these two patches?
It looks like they have been missed.

Thanks,
Michal

