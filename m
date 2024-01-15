Return-Path: <linux-i2c+bounces-1325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B0082E225
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 22:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2713C1C22025
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 21:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778171B26E;
	Mon, 15 Jan 2024 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I0lIh7Gv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C781B263
	for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsPomPrmwQlyLntS7aQV3Vtv7DGsmouOHZjbTcLzVNvdvS7TVjHDXdEYpZo/1x1JEYmCqXUoDuyh0nJ8DAXjPKBgVqmEY4d/YA7RTC7TUZSg0Bq/y7Yj1MH8pCPJ70jom0KWzIaXT2G117VZR70LnMDUlt0aoxKbHHSDPMVv2eUfIULWhoVIKBxpfABtFektk8IS3oU7yudZkJ7ec2T/1fgchAmVDH2NOREfcxn9jXhl+o3M/Q6DrGm71xg7w9V6CcF6NjtXfP2cgTey9A1yDiEpVONZ/shw1VJa48gKhG6MymKSAxwNgLgCxk0523QTtxFE7WwLmieDmx70NJtaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RAQpbosI2z9dqubs72k/Pc8MAjd3nS7afshq/lXWJs=;
 b=Osd6Ug4hR5YF/PFHweJgKJAbOvQm/tCBKqEMPo4esGIFO8zWtbf+J8AfxKU4ngGbaDA6F9QHRg1MYHoXgJVkT8zx8R151bZVAo+CCS7QDCe1ENXtuy5XyDMyD4VB4kN5/wdD1Awpn+fW21TMP3Yv/w9V9j0EpYWXc1eE+pw6bbNoLyQkiF38L0mp1GaWe1x9p+7S0ilEZHipGM+2fi6cYzwUE9FBx0xi6EqkaDG7YnhJ1oX7eCJDjF3mBeHvQSZmrKd/0SC74w5mJBU3gFSV84jrhWWEKWY+yWCeqoso350L1nOvyOgVGgTsiHx6zapPklGv+0Ntp3/tnERyp0XtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RAQpbosI2z9dqubs72k/Pc8MAjd3nS7afshq/lXWJs=;
 b=I0lIh7GvX6PrwK2GF1q5mnDjjuKCgJvnmAozwHA4AWVZzgoXDSuWsKQZIHVP6+7XFPzcbFEGUEFXIOSgPSIktpSgPxPJy+cCmEm/BxUOjZ4h72fs6WkvkWtrtZapzCx6T+r+yM7oLwIsdTvteZ56L4zxTiGPK3cD21yOe/SuqZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6263.namprd12.prod.outlook.com (2603:10b6:8:95::17) by
 MN6PR12MB8491.namprd12.prod.outlook.com (2603:10b6:208:46f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 15 Jan
 2024 21:17:42 +0000
Received: from DS7PR12MB6263.namprd12.prod.outlook.com
 ([fe80::7a38:8f14:8998:89a7]) by DS7PR12MB6263.namprd12.prod.outlook.com
 ([fe80::7a38:8f14:8998:89a7%3]) with mapi id 15.20.7181.022; Mon, 15 Jan 2024
 21:17:42 +0000
Message-ID: <614a9b32-d6e9-4506-a7a0-164954badffe@amd.com>
Date: Mon, 15 Jan 2024 15:16:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Revert recent changes to
 i2c_dw_probe_lock_support()
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Borislav Petkov <bp@alien8.de>, V Narasimhan <Narasimhan.V@amd.com>
References: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
 <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
 <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>
Content-Language: en-US
From: Kim Phillips <kim.phillips@amd.com>
Organization: AMD
In-Reply-To: <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::19) To DS7PR12MB6263.namprd12.prod.outlook.com
 (2603:10b6:8:95::17)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6263:EE_|MN6PR12MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bc4a20-5aff-4c59-9d98-08dc160f6940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GPGyPSIwh52UmEPT3ra6Sm2EdgdvTrrXH/ZXR0ShdOjSNvIcEabjrCVC2zGrC67Q6Kx5csUMR/5F4j42F83pgT0DNg708uhTiGs3VxdkVsDZb0lU1oDItlzSocTCRAUSys9ZNmQw8C70XBJ1qYKkAyk6u8snbCqEpVEO/pqYjPpRINp7+Qa7W7G//8vtEt3iI2QdJUjJhQLRN3UP2tlywv1W+2Ild/Go9NnzCHoz30lNbCINAUMVkadaAZXfnr5p4EdVNCR44cuKiUnoIcD9jTXjfLXpoYMTRaROkEi1NX9UQFXEwLPlHjKc5vF5UL5VBmSUqt5Um4ETQMxgsBgZLo4Uic7bpGlSurBKv3LJ3oAP+vFqOoJy6tl9CH6SqBzA1oEaZJSwpOgBIFV2tGjYIXyjsFPs7XKpBDogZB2FOPYB4wzh6DnZQbNQxX3xekhnThn1UAb32/E94ZZnQRqC18nLSGFPZbDA564ZWRKn7G/2OBsA/Oxy44KB9oxzHvZc5LV8ZX3UU8OPbtRTTABo2Zi7uyRUPJ9SGmhfYd6kDWmLuPaeSFBakTZLC921RvIQ2yVLI6OR30kH5PshpG78AfulHeWrcG0BVAmqOzHTZpu+7XVpZaEgJ0D2KzByV125rolC34SFmIQoF2yTEMG/h0vmIbNDtpOEyrKrSQCrOyZOnWHG284IEdot/lDd9ULN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6263.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(86362001)(8936002)(66476007)(6666004)(66556008)(2616005)(26005)(8676002)(38100700002)(53546011)(478600001)(41300700001)(5660300002)(6512007)(4326008)(36916002)(2906002)(6486002)(316002)(44832011)(66946007)(6506007)(54906003)(4001150100001)(83380400001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZVWkJLQmpUR3RPV1pOSkw2T2RxTCs5MERVTEM3ak8zZ2g2NklGVGtDMGhZ?=
 =?utf-8?B?aDdSWmRvUWM2WGVXZE5YeVZJUmt2QW90VVkwMFB4VERWRzYwSGFXMytZK2NY?=
 =?utf-8?B?OFgrb1lRaGRmdXN4bXNWRXRXeTcvQjlVYVhZTnA2VWRLYlVJbUZYWEZEblBw?=
 =?utf-8?B?MXI4RWIrc1hQZ0hjSDc0TnBBQkdLU2laOUVmWGlWTFhzSEZzQzZtem9VSHlY?=
 =?utf-8?B?TDgwODk4aFZXZ3BQSUN3SXpEN0Q3MjNNdTJjTXZOV3VhM1BnS2tRaHp5U2sz?=
 =?utf-8?B?TUlYVDExTmhWMjZUblIxQXg3SXhtc25Idkd2QlFkSGJBTDE2TUNnMUxVaFUr?=
 =?utf-8?B?dXdJa2owWnZRbzFuckN0M1o2YXMxdWFkUE1qTUFYU0NwSHBMNGJhdDJNTmdU?=
 =?utf-8?B?NHdrcW1JZjJhdnBvbWtrMk5EOHVUV2YxYkxCc0VNMTE0UWpPYUM1cU5jM01v?=
 =?utf-8?B?Z01hWkwvanNBN3ZUNW55dkJXSE55QmxQaWJsMU8xWjAxNGY3eWFUaEN1d3lQ?=
 =?utf-8?B?VTNocmJIZ1FEaUtuL05TVit3eE9sRGM4bStSWXlJM2xFUkVKZTlhbFh0YURV?=
 =?utf-8?B?NVRwOWgvT0xzTCs0S0ZjTVZ3L2dyNG1ZTjBac2prWWxtNlVQYXlPQUQ5cWY0?=
 =?utf-8?B?NkJkRWNBbi9pZ2hqUmFnMkswUWVPYmlrNWNXWDR6dHVlQmxjMC9KUDY1UFJx?=
 =?utf-8?B?MUpua3B2UE5yK0lHOEk4RmZ6NEJrdFpCQStZS1JLSFphNmlBdWRzaEQ0REtl?=
 =?utf-8?B?clV1S1owSHJFSTRZZXdIeW1CNXRLRy9oamc4MHRuZk5aa0R3VXpyVE8wS1dW?=
 =?utf-8?B?MTV0dHl2eWhQUGE2cDFCV3M5QW1XQTlmWFdLWXZHRllMVEFsUXB5RlBpK2ov?=
 =?utf-8?B?S0FGNXZ2M0tiRjdsYTNBZENDeGt6ZjJCdFZFVzZJR1ZtQ29YRDFBSFRlMXNE?=
 =?utf-8?B?eGh6VFpuVWRBQXUwTkVzb3dROURuVlo3VGRnZHdETFY1dHdDL3pYQW9RWjZV?=
 =?utf-8?B?RkhnZ0hTL2ZoQ1RhSmtnUWRBcDBzZ3NHQ0V3dC9Xa2c2OVk5Wk5iTENYOWlu?=
 =?utf-8?B?cnVBRGdDOUQvR3pDS09CQ1VpRzJuellLZXRSNGxNYStlemRXZzU0dDZOdUkr?=
 =?utf-8?B?RDZ3OHE1di9mQTJaWUNoWU5sUXZJR3J6YUl1UTBCL000cjlyWm5QQzN5aG1D?=
 =?utf-8?B?RENkUG5mc3NYTXV3SVFpcW1NUDFRVSswYmNkUHJmbnZOZXNuNWN5OGZSVWJO?=
 =?utf-8?B?T09XZWpscFlIdllWczVuS1pxMjZLRGxzUmo3dEFQVmFuQTJRZ1hsaTVWY1Nx?=
 =?utf-8?B?TFp1ck01bEt1cHZXdm5Bc3FqeEJ4eUtuN2ZtU29TNUFJQ3E3cjh5REYzejF3?=
 =?utf-8?B?Rlhvc0RyaXpwV3lRSzd0cG4ycWd3eHhDVk50UUd1Qi9TbFl2ZExITHlKOTVh?=
 =?utf-8?B?Z1RFWUlzZmhJRnd0VGNnL0pkSVUvTGlLRTd0aThyQjI5YWVPSTBpaHlZdTRx?=
 =?utf-8?B?enFQbWRuYWZGcS9FYkQwTUZPTm0rTFprWlFpcENuS283MkI5OEJlVlFzRDR1?=
 =?utf-8?B?OFJNZG9tZGszZ3ZIVEI5VW5HTVp3UUJJS3UvRjNqOWJqSlhQeEtCSnE0Q3Nk?=
 =?utf-8?B?cnVwb0M3Z084MzV6VUFzY1lrWUdQSmNobnN0d1BBTWM3Wml4Q3NwYmZHdXRJ?=
 =?utf-8?B?aEsvOCtCbVZjM0s1VXJpU3pWMERhdHFpcktyb0xxNTNIKzN6WXJlRGZwa1o0?=
 =?utf-8?B?WGJCUmtySXJWM0N0ZmpoWFNrQWRIeUt3NHZnUGxPSFVISU9LTmp4bW04STRa?=
 =?utf-8?B?S2dIQVBhQzBDMmxUdUdIaEhmd1FZNi8weW05akR0blVWb2pyTDJFbkp4ZzZH?=
 =?utf-8?B?S1JEUjBrdTMvYzFYWWFsc3JIeUFubFFRZHhYcElpclAzQTFHQkQyUjBXTVE1?=
 =?utf-8?B?WndoekRuWEtoSkNVMGRkRGNDR2lTNTdzV1pxL2xRRE9jRFRVWnhiQ29VYld3?=
 =?utf-8?B?SnJDRXJlbHBRUDVCbWdlaEZKMWFoaFFmQWtPUFBsTmdXSkorRUtmMkdXNkZq?=
 =?utf-8?B?cTRRZmYxR0t1Y3ZWK3dhMkswaCtlQUVSaGFPb1loSy8zWXZrbG0yS0luODlv?=
 =?utf-8?Q?Cs0PDgl9IpdhL5v+PtNCjC/h9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bc4a20-5aff-4c59-9d98-08dc160f6940
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6263.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 21:17:42.7343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9wHAv7Wqq2rNE0n6MaBA9fSoE4Ugw4yjdxAJK7fKgUr1C8tOP31JLGIM8bK3b63quoJt3JtJlT5uPU1p2mrrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8491

On 1/12/24 2:13 AM, Jarkko Nikula wrote:
> Hi

Hi,

> On 1/11/24 19:56, Kim Phillips wrote:
>>> [    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
> 
> This has puzzled me all the time since I'm unable to see which one of Andy's patches could cause it. However controller is clearly powered down since DW_IC_COMP_TYPE register reads 0xffffffff.
> 
> That I'd call as a regression one. Second regression is the Oops and I was speculating if commit bd466a892612 ("i2c: designware: Fix PM calls order in dw_i2c_plat_probe()") can cause it.
> 
>>
>> Hold on, I'm testing this on top of next-20240111 and still seeing the splat...
>>
> Btw, does this reproduce always? Can we be mislead if it happens somewhat randomly? Happens to boot once we revert some commits and then at another Andy's nearby commit does not and we make the wrong conclusion?

It's possible, yes, since we initially blamed commit 2f571a725434
("i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()")
and now testing this patch produces the failure: I'm pretty sure
that those two boots were using the same exact kernel code base,
yet one didn't produce the stacktrace, and the other did.

I've since updated my BIOS to the latest, and did a factory reset
on both the host and BMC to try to be more stably reproducible, but
we shall see.
  
> Does bisecting between v6.7-rc1 and next-20240111 lead anywhere?

Not really, unfortunately:

# bad: [9e21984d62c56a0f6d1fc6f76b646212cfd7fe88] Add linux-next specific files for 20240111
# good: [b85ea95d086471afb4ad062012a4d73cd328fa86] Linux 6.7-rc1
git bisect start 'next-20240111' 'v6.7-rc1'
# good: [0e7cc4233dafe9474ab32825bda3a8fed92b08bb] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
git bisect good 0e7cc4233dafe9474ab32825bda3a8fed92b08bb
# bad: [627690dd85803b0ac9861751c663bad0d5ff6c1a] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
git bisect bad 627690dd85803b0ac9861751c663bad0d5ff6c1a
# good: [cdf1b6bad35cbc1e2be672982cb0dc7825dafe14] Merge branch 'main' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect good cdf1b6bad35cbc1e2be672982cb0dc7825dafe14
# good: [04194a4f780895799cf83c86d5bb8bc11560a536] drm/xe: Fix lockdep warning from xe_vm_madvise
git bisect good 04194a4f780895799cf83c86d5bb8bc11560a536
# good: [b6e1b708176846248c87318786d22465ac96dd2c] drm/xe: Remove uninitialized variable from warning
git bisect good b6e1b708176846248c87318786d22465ac96dd2c
# good: [0f35b0a7b8fa402adbffa2565047cdcc4c480153] Revert "drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole"
git bisect good 0f35b0a7b8fa402adbffa2565047cdcc4c480153
# good: [d4ca26ac4be0d9aea7005c40df75e6775749671b] drm/msm/dp: call dp_display_get_next_bridge() during probe
git bisect good d4ca26ac4be0d9aea7005c40df75e6775749671b
# good: [6aaff21547a08e5a151fbf7a3f7be5a68877d9e3] Merge tag 'drm-intel-next-2023-12-18' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
git bisect good 6aaff21547a08e5a151fbf7a3f7be5a68877d9e3
# good: [3c064aea46d071ccf95a142be5532768a7fa6f02] Merge tag 'drm-misc-next-fixes-2024-01-04' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
git bisect good 3c064aea46d071ccf95a142be5532768a7fa6f02
# good: [b76c01f1d950425924ee1c1377760de3c024ef78] Merge tag 'drm-intel-gt-next-2023-12-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
git bisect good b76c01f1d950425924ee1c1377760de3c024ef78
# good: [f48705f473cea37efeeaa6a197ae12730c112863] Bluetooth: Remove HCI_POWER_OFF_TIMEOUT
git bisect good f48705f473cea37efeeaa6a197ae12730c112863
# good: [7974b2128489d062c9d21419633eebde07f07032] Bluetooth: hci_event: Fix wrongly recorded wakeup BD_ADDR
git bisect good 7974b2128489d062c9d21419633eebde07f07032
# good: [f8c47ee39e6dc6170da06865b84e8c8b08e87ab0] Bluetooth: hci_event: Use HCI error defines instead of magic values
git bisect good f8c47ee39e6dc6170da06865b84e8c8b08e87ab0
# good: [ba0bc076e90fa6ae1284fc0b34d7460531c45ab7] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
git bisect good ba0bc076e90fa6ae1284fc0b34d7460531c45ab7
# first bad commit: [627690dd85803b0ac9861751c663bad0d5ff6c1a] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git

Let me know if there are other ideas, otherwise I'll wait for the
series with the rearranged series from Andy.

Thanks,

Kim

