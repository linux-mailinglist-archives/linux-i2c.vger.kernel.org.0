Return-Path: <linux-i2c+bounces-9662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A95A4A851
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 04:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7BE31779E7
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Mar 2025 03:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273591B6CE0;
	Sat,  1 Mar 2025 03:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4qyoVpwA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD341BC4E;
	Sat,  1 Mar 2025 03:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740800033; cv=fail; b=MZ/jUMGfWXlzwSXqp9+pSIQiT6jzKv7gGyiQgX/qmliEGvvMEpQYohfGDPm02KGszxmBR8BTTyvtnb6yxR0MskhzGKuqTENMxifOVaQjR2aRw0rA92UZ3SNY0gpGl1J0oNkL9rHKNGT1G6SKQGs2uMf9hUVrqezluPQokkZs3PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740800033; c=relaxed/simple;
	bh=SDyz9YADQKBKGnLt6uZV6xj9ZHakCotzB+49nrSmM2g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QP9qedYlOkePSzTKfh1D/7P83IgGPRKh0eccWMgyYl9BAC66FGAm6DjxDZEYKjt+n5yl0awP9Y+m1K4D+51TH6ylGKaSQUOSYH9G8aUciKwlrH88F537nv4Y8A8Nv+osUPfc/ilAvet2i7jKkMG9RO6aOd7frJn3m5E/HOgWBu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4qyoVpwA; arc=fail smtp.client-ip=40.107.93.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RboK9TniWod5PH1jhuAINaPqovNuwwCr8r1rU8KUTWElPRu40SR7W1Kvlwhv0ZVSUEdWUZNEv45P3mAQpF8fik4xlNdKOF0Brq6vL5+jThtiUui7sLjLkPE7wA6YNiV8gvnaWWjDBtmoxP0Hi/LNUy+NFk/IGzbpXZHk84WZ4UgaLShW9CQ74uQongMfQGhP5b8YkF+Mz7q9owzBkQtCedioZZT+FJoIE2Ka4Yz8ybkRu9usXpXo+EKPfAHGQAkoVPqn44zf/kn4EK3R+Vf5PCaYtUQRAwLOaXGrc98dPUp/kIs5N/snAdm8QHXXEtQQ17qRFSoqgTUXCHysSWJyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBcn9D+BkEQQ/CcThb5cKUwOKrBq64UZzdIeHzPfK/Q=;
 b=Ddt98SjDF2UHurS501OdLIDrI7H1gmVdB8GPq/ny5iGBSZWQY6SOGFOcZ5O1F91OYhLCCMBWfg1c82BYrLuDsLqEply75Sz4yLKuDlvFZxxvo3XU4S4daGzvbmlSKouex5WuDcl2twOToavtdKiGkgzW8sHiG7Z4wrAKpYFOwTsKGfXG+8pl+twYFYrtcOL9tdLSb/iyKwbCghXIxSWqEn0QZBwhSJdNZSL7Pc3KBJOs/LcQrOzVF4QznaTt52xP/kGBg0ooIduSyJK40uTh192RV2JtcM+D0zFMJyps9jjLSRpVUUbE81o4DUBQ+QBCu1BwbUrKUkD9H4BT0UI26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBcn9D+BkEQQ/CcThb5cKUwOKrBq64UZzdIeHzPfK/Q=;
 b=4qyoVpwAR5BHjC/++ZxpXQxWaJnC1jAnEQHFAnQKT7Fxfg9qFw1VsZ5GySn5JWueeAcPZvYcSyFG/FEjv0boWjukjYDxG9CoabciBOBAxHtl9NVy4w/dksxTgNrrT02xbt9J6WrL4JNKsZ+ElIAMFYlFIjknlNX+CrOS0ECqsvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6430.namprd12.prod.outlook.com (2603:10b6:930:3a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.24; Sat, 1 Mar
 2025 03:33:48 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8489.025; Sat, 1 Mar 2025
 03:33:48 +0000
Message-ID: <af881cfe-926a-451f-8f40-c7cb64c99693@amd.com>
Date: Fri, 28 Feb 2025 21:33:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: amd-isp: Add ISP i2c-designware driver
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com
References: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250228164519.3453927-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:806:130::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c60bb88-c388-41db-4e56-08dd5871e06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFZLVyttVUVJWlRjUCtwS3NZNFN1QzNkZVMwSm1PeWpEdWtYQ3pHZExlUmJi?=
 =?utf-8?B?Y25NUHZFRHhmZGVra1hmbkk5cFNvSm90UVQzdENsRGZYQjN3azh1M1p1Z0Er?=
 =?utf-8?B?ajZ3ZkhIU0ZiZTljTERkZlNWVUhuNTdYa2dtOU5neEgxWWJKVFhyZDZrL2wx?=
 =?utf-8?B?OERMUXMxUCtGQnozRHd0eUNUdFEvRGtzckdyMFVxM2VLWmo4ZTVtSHMwd2tX?=
 =?utf-8?B?L2VJNkI1VmY3WmcydTN1OHZkc0Y1OHd6SXZlZWF1d0MxODJFRXA2b1hCY1hH?=
 =?utf-8?B?QWVPbnBBOHptZGZ0YkNtdGdPTldINmQvY0xlSmhMa0hDZ3czZTZPRWwzNU5M?=
 =?utf-8?B?YkRtN0RnSFIzcVFmOFlub1Z3YUZ6WGVveWZ2QkhreTRxNTFDUy8vT0RCZUR4?=
 =?utf-8?B?MXUxSk5nbW1iVnV4WlNXa1dsVkxDNVg0eHhrZnBVcEJZekhkVkMyRFdtV1Zq?=
 =?utf-8?B?Uk9yNUpHQnNEd0VYYjdGcVNONXBCek9VWTRESy80Z3NiZ09ESGFPVnRhMzNE?=
 =?utf-8?B?Wlp6N3c0TFB5N1cvZHBTanVTUWJERFc3a3MwbWtUdEwyZ2hybDQxQTNuWVhB?=
 =?utf-8?B?cnkvdHRaeXY3c2REbEQ1L25RRkJJa05pdG1JOUtZazRLTlpuVyttR0FVbktH?=
 =?utf-8?B?K0dZUkloN2FYSVhhdVpPTzdMQmZrSDVHT0J2T3p5ekJRWG1pTHR6QjZ6OEQy?=
 =?utf-8?B?VHpMSzV6cVc1Z3dnSlpJb1FLY1lkSmdCV09qQ1ltVTBTZCtJRG91S0h5TCty?=
 =?utf-8?B?UUNUY1lUTFJUUlNBajlaUWYxaUYzWkk0bk13QmczQWo2azFPTzZzRDJLSWo0?=
 =?utf-8?B?NG1pRGxuVVhabkFoNXV6cmtFUTMyUVp1Wi81SEZVYVlzaHpFWkF2MENHU3U3?=
 =?utf-8?B?VlpKRWJEbDBCSFNTK05YMW5EM3Jxai9HUjZUbFRiL0grRkRSWU1EQlIrSk5u?=
 =?utf-8?B?Q0lndEw4MUJ5VE1NVkVpdzdlRWJydVkydmxacVhlR1FLbU9rV3BFL200azRV?=
 =?utf-8?B?TkRjQ0g2MkMxVVFJblUxdUhoQmcwcmQ5Q2F5cHE2MTVTa2JqZ0dGM3hsb0U2?=
 =?utf-8?B?emJIQ2haZkVBZjJRYm9tWjRsa1hBOEs3b1RRZVprcDFzRDNJazVjMVhmeDBT?=
 =?utf-8?B?NzZ6K2JrRXBGYTJWSmdybjhrWFdSbnpQOThRNlVEYUhRSEpPRDhGWVZoUXNq?=
 =?utf-8?B?TEpVL0YwbDBQbU10c010TGhxRGRxUk4xRmIrQVUwVTFDcVJBTHVVT1R1SWd3?=
 =?utf-8?B?MkpkbE11VFVxOFVDaEhJQitROGRJQXBuK1I3Zmh2VDA1NVpudE1haGRxbC9F?=
 =?utf-8?B?ZStNbFlwYnZ4aWZiNjlyVGZxY1U5dDg0RW50ckgvMkVIak9HTGlydERaY1hr?=
 =?utf-8?B?THJvclllQjlnY2xYc1V3WVhiL29MUDdCNXA4dTh6cWxqc0dZNXBITWFjTmdM?=
 =?utf-8?B?NlNMUVBaczM2ZEtGcWgwUzZWbThiQ1hnY1FLYzVMSHV5dEppbGZ5NHlGSWtp?=
 =?utf-8?B?Wkx6c2ZuNE5TRXlZVkxYOXBiSCtnVWRud2pXS01CL05FemRqSHZ6SXFxSmN5?=
 =?utf-8?B?RmZFakNUcHZRS0wrMkRhQ2Q4NXFTMWJOWHpQS1pzM0dKL1FsMmVnWEJpdU9k?=
 =?utf-8?B?SUE3Tjk1ZEhoV2tqSDZzekM4bTVjTm4ybU9qcXdvOUxNdWl1RWNhZm1HenBJ?=
 =?utf-8?B?NUNCSlJjNE9UbWtNRDN5SEZmeTNpVjNPVXdNQ01xenlKazlBcjBiakJJdHFu?=
 =?utf-8?B?MkNkNE5iaWU4WVk1dWx4Y1lPdU0zclJjbEJuRXF5OUF4QU1FSk0wVmdrOGkw?=
 =?utf-8?B?ZEVHeDkzekVMeGhaLzRZeHdHdjY1NlJGdkVMSCtEbXprUnE5Z2xxQnpCSk51?=
 =?utf-8?Q?4I+L+Jr1/M/S9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkJjNEIxaHgrUWZwTVBKMUpPVUo4RWhpdjdGL0FXcGIvaGJSUVV5Vit6ZnFw?=
 =?utf-8?B?U0pkM1pxdEVFZzlnajVXY21qMDhsQUxCaW9pY0FLUG9jd2xKVC9naCtLWjd6?=
 =?utf-8?B?bXdnRFBQaHFxcFVtRDdGZXFzbXdpa21ndXBwNUJvSy92c1R6U2lOY3FhMStY?=
 =?utf-8?B?OHFCM2lrbFdpb0pWOUQ5cFBFSndHVW54T3liRzVFMEVFRUo4NDZxaFRoTE1L?=
 =?utf-8?B?UEpyVjJXeXNvU0paczhqTXRtM2RpaU1sQ2VlSFJ1QmxlcmY4SFp2QUhzbVhS?=
 =?utf-8?B?eVN2V216NHIwd3pRMDg2L2hBVGY4c3V6TnVkbW9ETzlxc2UrMmROMW55NmxI?=
 =?utf-8?B?NU50dEN5emFmUURnSisybGJZWXp3aUgyMzNQUDZyWG1sRmxaVVMxYTVHRGtM?=
 =?utf-8?B?V082aXN4V1NqTVN3bDZHR3VJWlVLS2kwQWVSRWVEUDg0dFFFcFhjVVVTOHNy?=
 =?utf-8?B?b3JDSU4vaTRlUHVyWkwyRS9mdjIxbWwzSTFHTngvU2w3dS9VQVF4RzY0enJv?=
 =?utf-8?B?OWhYaWRrMVcya0NIMmgyaWVpU29RTTNnTDVhTGhFWUtVblVNbEFYUnVLUkYr?=
 =?utf-8?B?eTZQL0FOK0JaMG1hVmVPM0ZXNno3Z1lwQnVSNVByak9yMVdjMDd2WHhOY1dN?=
 =?utf-8?B?ME9LRVoyMExXaEhqS0w1UVRlbCtHc2FSWkVLNC8ydXR2dnZxWTg0SXlYZnRv?=
 =?utf-8?B?Yk9SQ2lhOTZnYmZzU2FMUE5qbnExSy9ZcFhRYVRRVHdYTU1OekdZT0VGRHAw?=
 =?utf-8?B?KzRzdUVHTEpoUUJicVZEWjg1eE1JN0I4R3JPYXhFUXdHZnhJNVRuQTM1Tld2?=
 =?utf-8?B?SGpseml6VUZYRHc4Y1dXaU1wTXc3MnBxYVN0MENTeVhydWRVaUgwUEFuZzBa?=
 =?utf-8?B?YmhmWk53WmFESDJUeDN1QjJVdEJkWm5HeHhpdVI4bzkybzdKTVhvZTRscVhS?=
 =?utf-8?B?cFRVUFBNVFovcm1xUytQbzhmL0RjalI5dU44a1o5MENBMG9tUUJDSGdEZDBE?=
 =?utf-8?B?NWRLQklWaGVGdk05czFzYlVRb0pGc0NEelpNdFMycU9DWEVGL3hnNmhreFEz?=
 =?utf-8?B?c0pESk9TWVRmc2ZaSVVtTEpKR3o2RjVjeitlZHp5Tms2NXdQR01nb2VOOSts?=
 =?utf-8?B?TitGaFExRWowVkdJNzl1MG02aThxbW9nNE8zdHhFTGV6STczRDB0dmF3Q1lp?=
 =?utf-8?B?OVd6QWRVMXppNnlzSlhENzNyc21QOHpyaEdTUGo5V0NTVTNtYmlRQTJtaHVE?=
 =?utf-8?B?cFpWNUhibVBKRWZFUTN2bVRYVVMycDV5OStnaUJmVldmMk04eXZEODdLTnlG?=
 =?utf-8?B?K3lwWlgxU2ZOVzhvQ1FHdGFnYi9zbzQ3bnI2Y2QvQmdBanZsQTJLVVh6amRR?=
 =?utf-8?B?Zm5iQjBFdEFHWXdhcUIrREhxRHRQWEVOWklDdEpINFVpWjUvZjY4a085aU5r?=
 =?utf-8?B?bTZOZTdwY2tFOWNUTDNFOXJQR29kMjY4eUZCTzFwekZGK2ZUZldRV2hwc2hC?=
 =?utf-8?B?SUJYL2xFM0t0NEZRRkgzdUdpOEtqblI5QkUrRVRaY2VDYXp5Q1VITWlzQitD?=
 =?utf-8?B?R3BVTFpzVzFkRXEyd2s2Y2hEUVdoUWlSRE5VbnVXTHpPTWZ6cE8wMlRQazM3?=
 =?utf-8?B?TmU5cjFjM2xjcW5MR1ZqNjlGQjZYZ213S0VUbFl4L1pnZE5pOTdMYitmMXUr?=
 =?utf-8?B?Tnh3Z2FqNElYS3RySnVRb2JRSWRNVEM3K2Z5U3pGRFRBbkVKU0tJVlBqbVlF?=
 =?utf-8?B?VVZncXNTZzNvY0hBMDRIekY4RTlET3FRMHMyOWFMaWkreDNaRUdqV1hDS2lk?=
 =?utf-8?B?dkVIa2xiUTNqdHRVTFBqSklEbHVDNGg4b2JUWjVOd2FZaCtxZXJ4b3ZNUkFZ?=
 =?utf-8?B?OEJ5aHpFNzRqc3YxUlFzWkpwTDA3NTBJQ2pqQkVlNm1NS1J4cmowNHlpa1Z3?=
 =?utf-8?B?M2s0Y2tMVDNQZDdpK1BnaTRtSGJlWDZwNWJ3aGtHQXdaTnpMdVEra2JTbFFF?=
 =?utf-8?B?VjlhZWxKODBTaUpuUk9UeDZGU2dDdzcvem9OQXVUcXIyY0JJeWRzMjdQcyti?=
 =?utf-8?B?U3E5UEdTTHppR0FDak83dXlOSkNsNEVLSExEVytOYWw2cis5aDNLRGtMbzla?=
 =?utf-8?Q?prZWzac1aFYiuEtfvcdnkJzwx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c60bb88-c388-41db-4e56-08dd5871e06f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 03:33:48.0259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76h82yeWZqVmWhw+FgxB7E1un7Dqqibu6hFDhsVC3eSYUtWVhDqj9voQzWzXOWBSPSZVUIrd+LKNsHmGamEXSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6430

On 2/28/2025 10:45, Pratap Nirujogi wrote:
> The camera sensor is connected via ISP I2C bus in AMD SOC
> architectures. Add new I2C designware driver to support
> new camera sensors on AMD HW.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>   drivers/i2c/busses/Kconfig                 |  10 +
>   drivers/i2c/busses/Makefile                |   1 +
>   drivers/i2c/busses/i2c-designware-amdisp.c | 266 +++++++++++++++++++++
>   drivers/i2c/busses/i2c-designware-amdisp.h |  24 ++
>   4 files changed, 301 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.c
>   create mode 100644 drivers/i2c/busses/i2c-designware-amdisp.h
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index fc438f445771..79448211baae 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -592,6 +592,16 @@ config I2C_DESIGNWARE_PLATFORM
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-designware-platform.
>   
> +config I2C_DESIGNWARE_AMDISP
> +	tristate "Synopsys DesignWare Platform for AMDISP"
> +	depends on I2C_DESIGNWARE_CORE
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  AMDISP Synopsys DesignWare I2C adapter.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called amd_isp_i2c_designware.
> +
>   config I2C_DESIGNWARE_AMDPSP
>   	bool "AMD PSP I2C semaphore support"
>   	depends on ACPI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1c2a4510abe4..cfe53038df69 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
>   i2c-designware-platform-y 				:= i2c-designware-platdrv.o
>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
>   i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
> +obj-$(CONFIG_I2C_DESIGNWARE_AMDISP) += i2c-designware-amdisp.o
>   obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
>   i2c-designware-pci-y					:= i2c-designware-pcidrv.o
>   obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
> new file mode 100644
> index 000000000000..dc90510a440b
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
> @@ -0,0 +1,266 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/suspend.h>
> +#include <linux/units.h>

Can you please audit this list for accuracy?  It seems like a very large 
number of headers.

Just off the bat for example I didn't see any DMI use, so dmi.h probably 
isn't needed.  I suspect there are others.

> +
> +#include "i2c-designware-core.h"
> +#include "i2c-designware-amdisp.h"
> +
> +#define AMD_ISP_I2C_INPUT_CLK			100 //100 Mhz
> +
> +#define to_amd_isp_i2c_dev(dev) \
> +	((struct amd_isp_i2c_dev *)container_of(dev, struct amd_isp_i2c_dev, dw_dev))
> +
> +struct amd_isp_i2c_dev {
> +	struct dw_i2c_dev	dw_dev;
> +};
> +
> +static void amd_isp_dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
> +{
> +	pm_runtime_disable(dev->dev);
> +
> +	if (dev->shared_with_punit)
> +		pm_runtime_put_noidle(dev->dev);
> +}
> +
> +static u32 amd_isp_dw_i2c_get_clk_rate(struct dw_i2c_dev *dev)
> +{
> +	return AMD_ISP_I2C_INPUT_CLK * 1000;
> +}
> +
> +static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
> +{
> +	struct i2c_adapter *adap;
> +	struct amd_isp_i2c_dev *isp_i2c_dev;
> +	struct dw_i2c_dev *dev;
> +	int ret;
> +
> +	isp_i2c_dev = devm_kzalloc(&pdev->dev, sizeof(struct amd_isp_i2c_dev),
> +				   GFP_KERNEL);
> +	if (!isp_i2c_dev)
> +		return -ENOMEM;
> +
> +	dev = &isp_i2c_dev->dw_dev;
> +	dev->dev = &pdev->dev;
> +
> +	/**
> +	 * Use the polling mode to send/receive the data, because
> +	 * no IRQ connection from ISP I2C
> +	 */
> +	dev->flags |= ACCESS_POLLING;
> +	platform_set_drvdata(pdev, dev);
> +
> +	dev->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dev->base))
> +		return PTR_ERR(dev->base);
> +
> +	ret = isp_power_set(true);
> +	if (ret) {
> +		dev_err(dev->dev, "unable to turn on the amdisp i2c power:%d\n", ret);
> +		return ret;
> +	}
> +
> +	dev->get_clk_rate_khz = amd_isp_dw_i2c_get_clk_rate;
> +	ret = i2c_dw_fw_parse_and_configure(dev);
> +	if (ret)
> +		goto exit;
> +
> +	i2c_dw_configure(dev);
> +
> +	adap = &dev->adapter;
> +	adap->owner = THIS_MODULE;
> +	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> +	adap->dev.of_node = pdev->dev.of_node;
> +	/* arbitrary large number to avoid any conflicts */
> +	adap->nr = 99;

Would it be better to allocate an IDA here?

> +
> +	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
> +		dev_pm_set_driver_flags(&pdev->dev,
> +					DPM_FLAG_SMART_PREPARE);
> +	} else {
> +		dev_pm_set_driver_flags(&pdev->dev,
> +					DPM_FLAG_SMART_PREPARE |
> +					DPM_FLAG_SMART_SUSPEND);
> +	}
> +
> +	device_enable_async_suspend(&pdev->dev);
> +
> +	/* The code below assumes runtime PM to be disabled. */
> +	WARN_ON(pm_runtime_enabled(&pdev->dev));
> +
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +
> +	if (dev->shared_with_punit)
> +		pm_runtime_get_noresume(&pdev->dev);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = i2c_dw_probe(dev);
> +	if (ret) {
> +		dev_err(dev->dev, "i2c_dw_probe failed %d\n", ret);
> +		goto exit_probe;
> +	}
> +
> +	isp_power_set(false);
> +	return ret;
> +
> +exit_probe:
> +	amd_isp_dw_i2c_plat_pm_cleanup(dev);
> +	isp_power_set(false);
> +exit:
> +	isp_power_set(false);

I see 3 cases that isp_power_set(false) is called above:
* success
* failure exit probe
* failure exit

exit_probe falls through to exit, which means it's called twice.  That 
seems to be a mistake to me.

But since it's also called in the success flow this makes me wonder if 
it's better to use a macro like _free() which will automatically call 
isp_power_set(false) when the function exits.

Furthermore; are you missing a call to isp_power_set(true) in runtime 
resume and isp_power_set(false) in runtime suspend?  It would seem 
logical to me that when runtime suspended the tile is off and when on 
runtime resumed it's back on.

> +	return ret;
> +}
> +
> +static void amd_isp_dw_i2c_plat_remove(struct platform_device *pdev)
> +{
> +	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
> +
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	i2c_del_adapter(&dev->adapter);
> +
> +	i2c_dw_disable(dev);
> +
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_put_sync(&pdev->dev);
> +	amd_isp_dw_i2c_plat_pm_cleanup(dev);
> +
> +	reset_control_assert(dev->rst);
> +}
> +
> +static int amd_isp_dw_i2c_plat_prepare(struct device *dev)
> +{
> +	/*
> +	 * If the ACPI companion device object is present for this device, it
> +	 * may be accessed during suspend and resume of other devices via I2C
> +	 * operation regions, so tell the PM core and middle layers to avoid
> +	 * skipping system suspend/resume callbacks for it in that case.
> +	 */
> +	return !has_acpi_companion(dev);
> +}
> +
> +static int amd_isp_dw_i2c_plat_runtime_suspend(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	if (i_dev->shared_with_punit)
> +		return 0;
> +
> +	i2c_dw_disable(i_dev);
> +	i2c_dw_prepare_clk(i_dev, false);
> +
> +	return 0;
> +}
> +
> +static int amd_isp_dw_i2c_plat_suspend(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	i2c_mark_adapter_suspended(&i_dev->adapter);
> +
> +	return amd_isp_dw_i2c_plat_runtime_suspend(dev);
> +}
> +
> +static int amd_isp_dw_i2c_plat_runtime_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	if (!i_dev->shared_with_punit)
> +		i2c_dw_prepare_clk(i_dev, true);
> +
> +	i_dev->init(i_dev);
> +
> +	return 0;
> +}
> +
> +static int amd_isp_dw_i2c_plat_resume(struct device *dev)
> +{
> +	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> +
> +	amd_isp_dw_i2c_plat_runtime_resume(dev);
> +	i2c_mark_adapter_resumed(&i_dev->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops amd_isp_dw_i2c_dev_pm_ops = {
> +	.prepare = pm_sleep_ptr(amd_isp_dw_i2c_plat_prepare),
> +	LATE_SYSTEM_SLEEP_PM_OPS(amd_isp_dw_i2c_plat_suspend, amd_isp_dw_i2c_plat_resume)
> +	RUNTIME_PM_OPS(amd_isp_dw_i2c_plat_runtime_suspend, amd_isp_dw_i2c_plat_runtime_resume, NULL)
> +};
> +
> +/* Work with hotplug and coldplug */
> +MODULE_ALIAS("platform:amd_isp_i2c_designware");
> +
> +static struct platform_driver amd_isp_dw_i2c_driver = {
> +	.probe = amd_isp_dw_i2c_plat_probe,
> +	.remove = amd_isp_dw_i2c_plat_remove,
> +	.driver		= {
> +		.name	= "amd_isp_i2c_designware",
> +		.pm	= pm_ptr(&amd_isp_dw_i2c_dev_pm_ops),
> +	},
> +};
> +
> +static int __init amd_isp_dw_i2c_init_driver(void)
> +{
> +	return platform_driver_register(&amd_isp_dw_i2c_driver);
> +}
> +subsys_initcall(amd_isp_dw_i2c_init_driver);
> +
> +static void __exit amd_isp_dw_i2c_exit_driver(void)
> +{
> +	platform_driver_unregister(&amd_isp_dw_i2c_driver);
> +}
> +module_exit(amd_isp_dw_i2c_exit_driver);
> +
> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter in AMD ISP");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("I2C_DW");
> +MODULE_IMPORT_NS("I2C_DW_COMMON");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/i2c/busses/i2c-designware-amdisp.h b/drivers/i2c/busses/i2c-designware-amdisp.h
> new file mode 100644
> index 000000000000..f98661fdaedf
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdisp.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright 2024-2025 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +int isp_power_set(int on);

Where does this symbol actually come from?  I didn't see it in this series.

