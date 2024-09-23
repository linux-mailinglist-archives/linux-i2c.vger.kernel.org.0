Return-Path: <linux-i2c+bounces-6922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C655497E6A5
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 09:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DA82814F9
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 07:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE8B17741;
	Mon, 23 Sep 2024 07:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RipBIPtm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2D82EB1D
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076729; cv=fail; b=WMnpn7SrSzSJ2gJIthY8rWA7jB1JZGRCM4nFVC97eEC5vGckyo4l/LPWieOCr2XYxt9KnXjGUFgb7efw3F8GHH6fv9U9h39OMPbqo/NbJZ+cuzN5qhePRMkFye0XBxx2zUrJtIGGInSikVpeUIS9kcS9yWRNVgdk3XU8jh65yyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076729; c=relaxed/simple;
	bh=Bs0uGqcspoahVQjL/oisHY7URzN5lsZjHMOOqciyZLg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HamqpZXb9wdfRnKgqkhk4vXEyhrnrzrpc9Bixbwiq5GFxKqs/V235lcOvhq0/Zj6EJ0r3tcIk69T9gOTzKjlTA9YyhDrz/VTB6pKO8eI1vYmLcLBoBy8s45KlnBqbjTpjkQkCumSX72wCASdi4faV0+odmOTlwBYfV9TxwQ63L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RipBIPtm; arc=fail smtp.client-ip=40.107.95.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCMcZonShWUMKhu9VtvYx6vIQL3zp74/MtuMIOc70YVeQAWNgD8rbsTTqmawSS6i3aaZqB0MtjbCv7gcfkLf7+XvUOYQAKuZiulmXnB1wzAAT/EM0UwicY29qN3aUwYv5tdtNigkZ07/hyy8UHCmu4zCjx4oW3etEWIrTyMDybWkrdBszhaZj9h4UFrYqmseEFxUtJ+Q9lCb39MEVQ9wdB0d0E10D68YeGoI2coDMzCQbYJNh6Iy89b0V5JTx5qc0VXmKBMxc7pWwQQFeRQDfJl8OTbXccmtCZAqmBgsoks8wG+hKeauquxIj2DhlrLWfIXkCvzZzKtzGZosE4u+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jrxt3F/ODFfnqphLi3I+W+QeoSiJalUgdlpCYC2epXI=;
 b=RrgzR0r3nJP0KL+xzrV41BiSml2L7rxiXl21mE837kZEI8ECdypTtD8pQDNo8m1iUncVxX8AzXRtFgM7qNjNgf/RiAAm0w08KpscHYO9n+DHxqAsJBlNOT9cnLGmRCNzBh12RyhwqNxcAb4Lzx85k9vfk2JDQNlqQ3fXNlP0VhHhInDzcExH+sh9TwumHQAFgqimoO19lX6vYfQCUY3NCyP+aOq6rd96KUAz0mo50TI5gVTpQqsZSrcYyei7Uj0Wn1pKfl45heTsrwiGqS/UOmyVhIn2gwELWXXUluHvVCChuB6IkFEMBWXuiZ4dhiFAom0CchQrBJIzB6FTXplapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jrxt3F/ODFfnqphLi3I+W+QeoSiJalUgdlpCYC2epXI=;
 b=RipBIPtmJcR6NhtTd1NLv2wgRCCIIYCqHHxLi/QJ+PI+VhfGRBS9NSRLqQZSQ13V6oK1MlFY+rnFXfj3RUanDj5m7cEGGiyeLmowUcOoxLg/hNh3sfyAJRWGfmkKbTPmctdXW2dfnxLp03t/VCUdSXrX6kgTTb711jhYmpHzCEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 07:32:05 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 07:32:04 +0000
Message-ID: <e16b889e-667a-4fd3-bbb3-fb9b849e8293@amd.com>
Date: Mon, 23 Sep 2024 13:01:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] MAINTAINERS: Add AMD ASF driver entry
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
 <20240919175913.1895670-9-Shyam-sundar.S-k@amd.com>
 <Zu2PaSOws6ANkILL@smile.fi.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Zu2PaSOws6ANkILL@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f14f99-e2d9-4757-6e2f-08dcdba1d24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzNLSzFQMDBtYW1pT25PbExuWlplSnR2bmlCVENlUmFVZ2w5QStQTmdJdjE2?=
 =?utf-8?B?Nm1KczA5UkVqY0dGTUU1MXNYQmZqZm8xOWtENSttemxWZzJvSGd1OFVhTUpm?=
 =?utf-8?B?dmdaWk1XVEo0WlJ4RmMwWmE1a09LVWxhV081TUFUdHNDazhuTmhGNTdLK2oz?=
 =?utf-8?B?dXBqM2cycTZUV0haUjZpMm93dUZJZ1cwVU1STjJobWp0T0t6SmgvRlpOVmVy?=
 =?utf-8?B?a1lNZ2RFWXI2NUp2YUdKbUlocWdudTN5UktOemlaaVg5VVJIQy9aVFQyaHhJ?=
 =?utf-8?B?eU8zQWRSbWEzVUM2REV0RnFXalN5dk4yeXYrNXBLdjNHaWo1RnZtbmFiRStt?=
 =?utf-8?B?WXIzQnRKWnU0OWdEc0ZSSHZEVllDbCtidk44eGZJRGtJR0pGUlZkSlVLdHZn?=
 =?utf-8?B?NS9YNWwyL0lWRkJBYjFWL3FmL2ExdkRHTzJ4UDRmMmp6aTdtRVNWTjdiU2Rw?=
 =?utf-8?B?V2hMTFNZVmx2T2ZtT3VNc3pkL1QyV0hUdDMvYmxHVDRhSHhzUmRKbTFobjZU?=
 =?utf-8?B?UXEvb1BoSGRhcEJBcUNRTHRsZmp2b01JU2E3bnkvMStOaHR4TU1uK1YxMGxZ?=
 =?utf-8?B?VnJPM2FsNWUzdklrMTU4Ty9RTUwzdjg2cDJtcGFRdkduaFBhWTFNOGlHWGRm?=
 =?utf-8?B?MmVPdGdlclFud0FyZ1QzMGd6RE03eW81aTdlcXFJU21oWTZ4ZXhZdXkwNi9s?=
 =?utf-8?B?M3NiWC9BNEUyckRFYnIvL0NrT2NXbXFQdzRaVzNwZ3ZmUmFUYko3VlhoTnNL?=
 =?utf-8?B?WGxXUHZzanh5ak56NDBDeXE2WFd5N0gzRCt2VDlnMGN1c3d4YWtXdHRxZERU?=
 =?utf-8?B?eG9tSlZ4SHFVRkJuVEY1UHpta1NsZzJoRG4yeWhpeEtzd1ZyYlQvdisrbEJN?=
 =?utf-8?B?dHAzK0RmbzRFK1RxSzFvNDNkZTl0QjdTemRUK0NZL0YycXQ0akYrVExmaE5R?=
 =?utf-8?B?SWZOdlZSTzQ5ekpod2xHa0NiZ2NsUkVOTDE1ZUJ5WnBMQWxTTVRLQVEzT1BJ?=
 =?utf-8?B?cGhZbTFPTmlkZVM4Vlh4UDkwTm5NaHVKeDhOcVQ1ajhRTTMrakxGZ0lYVXhQ?=
 =?utf-8?B?akQ5c3BnTWkvRWNOQU00WEk1MEM3RXJid0QrNEhBaUhyRW0zbjVZREhDVXVz?=
 =?utf-8?B?ZHJJZWVqYUlUendibUV2LzJsbDJNMTFvZndJZmhwYUJ5dmdYS2JLNHRxa0l3?=
 =?utf-8?B?MnVLNWRtMWUzajBGSzBmY3dtOGpUYVV2bkpWQ0ZVMi9oR1R4endBcndibDRY?=
 =?utf-8?B?cmI0N2JYLzhrQlp5QTZQb3hLV0NBSEFMSFpsUCtqYk9YeXR0UklCMW9Ibkth?=
 =?utf-8?B?Vm9QTmFBRVRGUDhMRzFpSGs0eit6TEpKSUIvdlBYMXVxd2l3NjNkNUtYSEVx?=
 =?utf-8?B?U0tjTGJMOTdxV2lzeWd6cnRDNmZzNm1VSlRFNUNTb1hxR1ZLTWdPVGVjeSt4?=
 =?utf-8?B?NVFxQXBnOTgzamlZa2QzT2dRc05NTVZySng2THNWaGgzbFZQb2loQmxqUXdJ?=
 =?utf-8?B?RGdjSmtYWk5LMGsvUWtSWERJTjVZUzVlVVNzT25xMUhMZHp6TWMxZEdvbmJp?=
 =?utf-8?B?TXVxL2V2eUtrUk1nTXJ3UnZPcnFJM3BLc2JMa1RIT3pJUWkwVGZRYVNnNDIx?=
 =?utf-8?B?Y0NVRkl4Vk02ZW56NGVkajFSN2RST0l6ZEV0cU5kUE9CTDV5bVJ1WTlvMm14?=
 =?utf-8?B?N3duMkw0VzhKNUl3aEE2NVZ0bUNNR0s1dWVWS1BzWWpxQm1iNTFRT3dBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXhla05STllLaEhiNUdWbTVVTWJ5N0FQVngyS0lzeGVWd0t2VzMxSFltZGlN?=
 =?utf-8?B?QUpyKzZYNHZWb09JUHh6Yk9yRldiQkZNN21yL0s0Z0NyWEhZTlU2YXkrbnhw?=
 =?utf-8?B?VWYwRU9YMnFSck5WakFBRnpNQ3JUOHRqVy93K0VNSmFzZHU5RzNoVmxZcXJK?=
 =?utf-8?B?eFBjaWVIS0Q4SllGVEFHWGhRWFhQUDRUUndEQjB1OWNOSmFFZ3Z0Qnd5Tksz?=
 =?utf-8?B?dWdkY3VkVUJ3QWV1cWMvNUlVY0FCd0VWanh5RXJtV3hGNUZmT2Mwb1MrUSt0?=
 =?utf-8?B?UzRHRmlsd2RDUmhVaVp6SnFkUzRDTVNralFBeDRQYnFlNDJ4dFVLU2E1b1pH?=
 =?utf-8?B?emoxNkh1R25ScUg1RFptaDk3RE8wa2RvZk1YdTh6dGtFUHpFOUhEMi9HQ0tl?=
 =?utf-8?B?NWJ2enBucEpVeXBleFBUQnFVbGpVZTZFNU9WY1JxRmZTTXkvQzdReSt4alpr?=
 =?utf-8?B?L2dLL1NKY1JTRUQrTFlpb1dpM1dPRHE4cWtDMFlrVytkUlVtNVhLRjh2Nnkv?=
 =?utf-8?B?QUxrTWRFVWZwbUkrMEhaRHZNbXI5anFhOFNSK0lmblJEMkpaUmM4VFNvMWZI?=
 =?utf-8?B?MUZKZi91a1RoWFZQc2VxRkt0ZlY4cmU4RFYzalpyNWtHZG96RHoxOEFSVlpa?=
 =?utf-8?B?V0F6c1dDSzRvRFY4bjVBTkJZTlRROFRHTC9YT3h5R01JSm5LVTBrQWVFSy92?=
 =?utf-8?B?L2JUZVlDNnZuWmNCbE5uOUZ2Y0pCSFpjazJHYzlwazRnZDVrZk1XTXhMVXc5?=
 =?utf-8?B?U2RxeWp2ZldyQXVmZmVaOUloTXhOSkxORHBpVUZ0OG11RWgyYXBxNWwzV05s?=
 =?utf-8?B?ekJsYWhzeUhsc0NCbkNNMHpwaVBJWld2QmxPdXZpZ2NhM3RKakkwQ1p6dGhR?=
 =?utf-8?B?MWpDRWNGWTVySkVVVks3Tm5VdFNqODErOWREYnEwbzZRK3h5UTM2NGlEbkw1?=
 =?utf-8?B?U2tUcnVqeDh4ZGZJdjI4OHA4WUc3U0xLZi92QTZ6eEJQYkcxU3RTajR3TmZo?=
 =?utf-8?B?WjVyN0pITVd3WkxHSGpFdXJMeXhJZFNnZUcxZDVQSzRNU25QcDFHVHpjeW91?=
 =?utf-8?B?WDVueUlHY1pBWk80U1UyNnZpYTU2bVNWdURCZXJ0dzhRcWx0QUFwUnlkNlZx?=
 =?utf-8?B?dmJta09sTEFuNW1uYlh0a0t3a0xmak43OXJyT0dQNWlXaE90bUNZZHhhMUk4?=
 =?utf-8?B?V1pDU0Vyd1lsaEM4dDRoek5oLzIvaVF1WXF5SGZzMFNqQitKQ2NGN3B6YXc1?=
 =?utf-8?B?a0syMUVqU1crV05ielZPMEVwTUF4a1o3eWZzZExwLytpRml1ZjRwMjA1Vk0z?=
 =?utf-8?B?b2REYnBZQ2g0MWFWcUxMWWEyZjFnS0Q0M0ZBSjFMbXRPZzF2NlhLb1RERUdm?=
 =?utf-8?B?dC96SWFHK3pxNmhOb3E4RVoxNko0Z0tuSmw3RkRjeU90WloyM3RKUE83K0J3?=
 =?utf-8?B?YjZjSmtjd2NpTXhzYVdxenlTMjlxcUhKbGhHd2xocUVKU3JKWlYvSldkaEZi?=
 =?utf-8?B?SDVHMDZMMUJ3MVRmbTdISWVjN1BvOGlmd25HeGJyNmpZMTAwM2gxKzdMY2h5?=
 =?utf-8?B?TDhMZ0FGalZhU3MzdGFaNVZ3L21FVEFkSk1rMlVNaGIzemxHYmszTUM2OWc2?=
 =?utf-8?B?elRNYWN6MDdiRnpEbWtRMFkxSGxrZGtNbmFqNE9mVFJ3Y3hKTjZhTzBTMmtl?=
 =?utf-8?B?MVUzWHFoWkx3Z3VrdTUvZjIyUTBGUmllZm9nVk8xcHRXMDRnWDRRY0JVWFJT?=
 =?utf-8?B?dlhqdVJycEl2Z1JTaER5V0V6eEZVM2FYSTIrRlByWDI4THNIMUpjY3JoUFZm?=
 =?utf-8?B?K3Z2eWFQQzBUVmFINUZQenFtMkNvbkxOTUZrSTdlampRRXRxakRsbFZOd0JM?=
 =?utf-8?B?bm5ESjlqM2NZcXcxenhTYmlOV2lmNzkxVkM4bWwvU0ZUZ0lXMGIyMzNaY0xr?=
 =?utf-8?B?Nnc2YWR0eVJuQ3VPZDJ2VjFaUDlrdWNaR0oxNVd4NlBDOUEwZkFQbXpuS3Ju?=
 =?utf-8?B?VXNYbkJSRkxvSWlXbnRXQW9YcnNUQ2FZUkcyV2NvYURheTRpUDBzYmhhODhj?=
 =?utf-8?B?TmpCSXhXMmVsNXFsbWREYkZSa29lelhDTkVaNXJNcGJkMG9Gb2ErWDFSSlEv?=
 =?utf-8?Q?xqeNQSlF0gxoElZzQg7ynK385?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f14f99-e2d9-4757-6e2f-08dcdba1d24d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 07:32:04.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Mf66JNRxr1rfX3tiomUUdbHvbiJxBlNrJcmq/q6MCvHQVOIeu6/Bm+qmg8+4QdqdfrGvKiZe0mTIke/9aBrDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384



On 9/20/2024 20:36, Andy Shevchenko wrote:
> On Thu, Sep 19, 2024 at 11:29:13PM +0530, Shyam Sundar S K wrote:
>> Update the MAINTAINERS file with AMD ASF driver details.
> 
> ...
> 
>> +AMD ASF I2C DRIVER
>> +M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
>> +L:	linux-i2c@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/i2c/busses/i2c-amd-asf-plat.c
> 
> Just to be sure that people at AMD understand the difference between
> Maintained and Supported in S: line.
> 
> The first one more for volunteers, while the second one for paid job.
> Maybe someone should go through the entire MAINTAINERS database and
> revisit AMD related records?
> 

That's right. Thanks for bringing this up. I do see a bit of odds out
there and will bring this up in the next internal summit.

Thanks,
Shyam

