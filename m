Return-Path: <linux-i2c+bounces-1327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C082E2B4
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 23:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49A951C220C7
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 22:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDB01B5BB;
	Mon, 15 Jan 2024 22:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S5onbD/K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D81B5A4
	for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 22:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqB671MPfmPPCFoGsz0/baPftsjf/q107tK0TO7Ggxhgl8yxx9zQCfZAFFiPKW1kOo4BNhHGkkq3qIaLFiC7nzvUjfRDy9PTWerx5acuQQv9sK88J7HxvTVyPJo0MQOwPvJxq5sEl/Fq7rwhJjx+NjHjSjgpQo3yhQcsJu1h2O+gi9XC/wbjMtNkwSbtCFxAmlOG8t0T0eihs+zMUFossaFLkyNWif3p64ZbLt5rpQBAKM9FaI+dbQKtAD8L3kjtxyKoFr5ex1mYYUoHkCrkN6hhWuBF1h6zbYcPA5YnI5hnz1gOU8tanXxZr5WWpAddbWw+ku9nxG55Y3M9a/gSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePPu1ALTTGp+hCTV72IqF7Bd7B8NP7bThhht+BkqSfU=;
 b=KgD7l+j69gezKydeXHO10H/42f2bvifjlVIbk4lnBx1irLa8bOfV75JGe5FFsjXJBmHTIZNVSKNDq2fZOgnha/Am+NhIAH7AqngQZvxjj22LWsQje0qNOwQpqIEolvd1CTMxvAvC25LJVNs7Qv54CrK0buAHcwq0ss6ogHWdMP6DYqf1wj4fJQXhXNETvML75KBTOC4izkuaUpVSgdc43cvM4SnETL28HiihSRWtdptm7/Zfx3LwnkqfJlMiDjhza6JfdxO5jT2+hf3RFJC141fNha4VkgdQHzcKW7eYkHqW1W5/yNe+dNqRs4eo4AavJGDObcrBvij8/eiAJvGLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePPu1ALTTGp+hCTV72IqF7Bd7B8NP7bThhht+BkqSfU=;
 b=S5onbD/K7YRPVtjXEdhRHb/EA1zi5ST7tkM5LYGVrIXn//Yi2UHlvuPGlTjCfL2ETA4+rcFiLVZoRKHSEeDQDwsVMdBUe8myL2l3f2IGNqBcgCTnUwdNQYHJRt/6GVrmNG099D/HV9QF9vvDcZVaqwwq1R3tmExwqPfmI/j4csA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6263.namprd12.prod.outlook.com (2603:10b6:8:95::17) by
 DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Mon, 15 Jan 2024 22:45:37 +0000
Received: from DS7PR12MB6263.namprd12.prod.outlook.com
 ([fe80::7a38:8f14:8998:89a7]) by DS7PR12MB6263.namprd12.prod.outlook.com
 ([fe80::7a38:8f14:8998:89a7%3]) with mapi id 15.20.7181.022; Mon, 15 Jan 2024
 22:45:37 +0000
Message-ID: <00f98ff9-ce2f-4edd-b4e4-a17e1a0170cd@amd.com>
Date: Mon, 15 Jan 2024 16:44:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Revert recent changes to
 i2c_dw_probe_lock_support()
Content-Language: en-US
From: Kim Phillips <kim.phillips@amd.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Borislav Petkov <bp@alien8.de>, V Narasimhan <Narasimhan.V@amd.com>
References: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
 <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
 <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>
 <614a9b32-d6e9-4506-a7a0-164954badffe@amd.com>
Organization: AMD
In-Reply-To: <614a9b32-d6e9-4506-a7a0-164954badffe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:806:6e::9) To DS7PR12MB6263.namprd12.prod.outlook.com
 (2603:10b6:8:95::17)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6263:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 922009ac-b13f-4bf7-1b4e-08dc161bb170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uceECKvQo+E5HHymJp3qv8aqs3Cwh5eDby1sDloBuZm4W895IANL2+8s1qW5YuzZRBPjQUqmwYTynFwBn4pmEnwNeQbaxntfPtJ39QDZNTLij8vxTT2UQ0ObX8MGmHCTPD8EixRADa69kdPsuKR8IT7z82Rb7PO8+55KVYzkFsaZouVgEkd8mbehIEec/NTUEZ77Ch/3o9KqcWJwlKaWjlFFIE6JM7DiIJyvSEFbAUFWHiIx+5NcbAJR3DmXhpympz0GPqJHt3OUgrkjMj0uxDfznFdVAj9QvDhWyNMycPiCVDl3cIDRZQos8Zv8dpgNQLxr0Xi+ZJl6Tsieo7k+f0Gzz8b07f8W8J+ypoRMHUDMRCo8TJfIoW6lspyUJk2Kt8fXt2JR91OUf8g8iUz5Ro56mlCh+iihoZdeab/Asj1cKgLd3qV4GzUQ4n9ZcE6VvupQLXsKWZXg+hZvzc4OWSEQ2X2Na9i1krfzUxYA2Ssg4SQHn4SE/NTFW/8eZGCyVBpHI7kU3KCiWPNp2fVDKSR5XL+cVwSyC1RIvzy/7rGTT6OLlnvxKuddQr2xvo/c0t0tH1OovW/DI+rVwd3DJABFklVhrgNjHxl4nJqvdeWs2PUG72gn0l/m7RIXEnj/3GSxfxiPzTQrIdeob8r7ieR58O01Dl7m+IQ6bVE2VPNuWq1YVaku6DeR4yM3fZuA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6263.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(8676002)(8936002)(4326008)(44832011)(2906002)(5660300002)(4001150100001)(478600001)(86362001)(31696002)(36756003)(6666004)(6486002)(2616005)(83380400001)(26005)(38100700002)(41300700001)(53546011)(6512007)(6506007)(36916002)(316002)(54906003)(66946007)(66476007)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDE2TVJIUSs3WVNmK0pVQ3Nrc0tTUFFFZDhaU3JvUmN0UlRqeG80djNCcXJN?=
 =?utf-8?B?TWlrOUtCQjFPSTRHVXZUYkxjazBUYUtnSWVDN3JuVTR2bEE3UVZ2VGgybWlk?=
 =?utf-8?B?K1I2RTlIUjFVZGlnclphZFpwYldXQk92dHpmNUphOFFscGdaNlB4dlRTTFY4?=
 =?utf-8?B?U2lBOG1qT1ZJZCtLK1AzSVQyUjV3bll4L1g4b0Vva0RJc2VzcE9FaENiNmpr?=
 =?utf-8?B?R0pVdXRuUFM2Ym9MUGJPNURwc3llVXIvL3FJamlaSDZuYzBLMlFac2k0WEw3?=
 =?utf-8?B?KzFUS2lTNGluMXhDZ2NnMURmK1E3d01scmFTSDQ3TUxTdllXWi9meFhxbGZC?=
 =?utf-8?B?eVcyT2t4WHIrRXJwdnRFa2MwWlB5YVRMamVzNytIaU41MitEdnBPc0d3aE1z?=
 =?utf-8?B?OG52Y0Fnd0M1Q2JycWI0c05mNG5zMWNyZzcvbFJIWlZzTUdCSkk2RDQ3akc5?=
 =?utf-8?B?eXhMMzFUU0RXSFh2b3g1VERPbzlLWVRtU25NN3F5bFlJbEhnQUNDS2g5OWxk?=
 =?utf-8?B?a2ZTS3IyU1YzQXU4ZS9rTCtmMDFrZ3dpSmNRdjl6WVNPOFhhem43bXhBNmxs?=
 =?utf-8?B?dlczZnBqaDR0VzZOSEhySzlyTFV2Z0ZvaWxQTDR2M0pobUVCUUQ4SjMrL3RO?=
 =?utf-8?B?WEI5elhFckdmSXZ0Y202YktoWGNBUjFuV1dIenlhUFVjdVhaN2NHeXVlMVNV?=
 =?utf-8?B?cnljbEJTSWV1UU83WGx3cytRZ1l4elRvdndQc1ErQWp5bXRySkZFbFpzTTBW?=
 =?utf-8?B?ZWh3Ny9sM2RPM3dOVzQ3bU9PVWIzcUZZSkgyWlBaL2VyeGpNaDU3dDNmRlhr?=
 =?utf-8?B?NnB3OE41dmJGM3JVemQxVEZmTXpkSUxlTGZJK1FydHNFTFRyNHoyK2ZyK1Mx?=
 =?utf-8?B?UDRDTkQyQW9yQWpYRU9kUHFXWkJjQ1YzZDBDQVFjLzZMMTJxaFRtZFhDZUNh?=
 =?utf-8?B?eTMybndlWFNWUGV3L0dSQThiaCtBdUwzWnNIaHd0WEV1N3hTQVh1Z1k3U3Qy?=
 =?utf-8?B?ZURKdVNlQ0VaZGNkR3Y1dkVGMkh1anJ2dzdDRFNmUm9UcFRJVHlyU3ZFOTRz?=
 =?utf-8?B?SWZLMTZ0MmdTNGxFczB2OUxmRWV5WVlydXpCNnpubDA2SFNyQmMyZDlnZ1Fk?=
 =?utf-8?B?aXdGMTJjRjFDUFhYNy9BTnZENEt1ZTZxeUlxaC9MekRsdlFlZUFNd3FYa1Zo?=
 =?utf-8?B?c2w5U2d5NTZQTlg0cWZPUkVOSytGakl4RnRZRGc1WjRXSmRnOXRjRkFOOFNC?=
 =?utf-8?B?T1gxN0daZkdXSlVCTXdhUW9NOTNCdWhhbGUrRlU4MFhqTEhObnR5NG1WL3BO?=
 =?utf-8?B?ZkZKejBxZlFHRGwzSjFsc2lydTRrWkMwK2xUcnpvcWVqUmNuUklSS25PT1JO?=
 =?utf-8?B?SGE0RWpRSU80RUI1QUUzN28xYXdxOWRhVGxCTEExVGNqOEIxYkE4emlhNGJr?=
 =?utf-8?B?cHg4YnBJc0xDTHlYVklkVGtmeHlrZlhBeHRLdERXSEtwV3JjUWJOMml3NzRv?=
 =?utf-8?B?bWlGaVZrczFOY3N4akU0K05XS3l4eHpHV1JSbStwKzVWYnFManE3VTYzZDdX?=
 =?utf-8?B?RFV4WURoOWFSVUFkYzZBSXFTbldDWG9zeXZwVFVtRVg5WWxPVHBvUXhFT2Fw?=
 =?utf-8?B?NGRRQ29vcUFmaXFKTG5GNG83cWdiNEwzU0thVzBlNlpJdG5nWkcvNlozUnVt?=
 =?utf-8?B?ckZuQkFKOEk0bm0xZEVQMXlwamJxS2lOQ2hIVWY2YzNRVlh5ZUlKUi9jc0s1?=
 =?utf-8?B?UnlMYU5kODZHS0VOK3dHVTBTZHZmczFkSlZSNW5pMlNnUStnallUUS91bTdO?=
 =?utf-8?B?STRObmZZd0FjSUlBOVNiYkM1ZDR2anBDaXk1NjBlMTBTWlBBUWhseHZkMnBH?=
 =?utf-8?B?bS9uS2ZwYzN1bG0wNWYraUtRc045V1ZVUjlwSWw3clFnaHJxZWdNc1ZVQWVO?=
 =?utf-8?B?Vll1S0VOczRlZjZQY1pxemRuZis3N0tzbW16NzB0VjAzK0hGc2poMWlDZ1Nz?=
 =?utf-8?B?WkVtRDVVMG5PWUhnT0tyV0JOdDl4d2NGYjQwdlY0L3RnUUtsbDl5UXJSV3l3?=
 =?utf-8?B?Ym8ySXZqSy8va3VJaDZsMUtJcGNhV2MvaG9sdW1BVUQ3T0dRZEw4bUsrVkpz?=
 =?utf-8?Q?eBI+Qiuncq5GNR2FE8Srk4FRJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922009ac-b13f-4bf7-1b4e-08dc161bb170
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6263.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 22:45:37.7905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNo8GWc0FtuKt1v8aau3B7yE8zNeOOKZM/KOfsS4MnehHPuvgVlbkpmYQ+AfMDtznnNcP7a4JpUcUQ83Qx689g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086



On 1/15/24 3:16 PM, Kim Phillips wrote:
> On 1/12/24 2:13 AM, Jarkko Nikula wrote:
>> Hi
> 
> Hi,
> 
>> On 1/11/24 19:56, Kim Phillips wrote:
>>>> [    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
>>
>> This has puzzled me all the time since I'm unable to see which one of Andy's patches could cause it. However controller is clearly powered down since DW_IC_COMP_TYPE register reads 0xffffffff.

Just FYI, that message is apparently 'normal' as, e.g., a stable v6.4
based tree emits it, but it doesn't crash because of it:

[    7.640335] usbcore: registered new device driver usb
[    7.663651] i2c_designware AMDI0010:00: Unknown Synopsys component type: 0xffffffff
[    7.677362] i2c_designware AMDI0010:01: Unknown Synopsys component type: 0xffffffff
[    7.738163] pps_core: LinuxPPS API ver. 1 registered

>> That I'd call as a regression one. Second regression is the Oops and I was speculating if commit bd466a892612 ("i2c: designware: Fix PM calls order in dw_i2c_plat_probe()") can cause it.

So I just tested checking out bd466a892612, and indeed it produces
the stacktrace.  Prior to that commit is v6.7-rc3, which boots fine.
So right now I'm suspecting bd466a892612 is to blame for the stacktrace.

Thanks,

Kim

>>> Hold on, I'm testing this on top of next-20240111 and still seeing the splat...
>>>
>> Btw, does this reproduce always? Can we be mislead if it happens somewhat randomly? Happens to boot once we revert some commits and then at another Andy's nearby commit does not and we make the wrong conclusion?
> 
> It's possible, yes, since we initially blamed commit 2f571a725434
> ("i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()")
> and now testing this patch produces the failure: I'm pretty sure
> that those two boots were using the same exact kernel code base,
> yet one didn't produce the stacktrace, and the other did.
> 
> I've since updated my BIOS to the latest, and did a factory reset
> on both the host and BMC to try to be more stably reproducible, but
> we shall see.
> 
>> Does bisecting between v6.7-rc1 and next-20240111 lead anywhere?
> 
> Not really, unfortunately:
> 
> # bad: [9e21984d62c56a0f6d1fc6f76b646212cfd7fe88] Add linux-next specific files for 20240111
> # good: [b85ea95d086471afb4ad062012a4d73cd328fa86] Linux 6.7-rc1
> git bisect start 'next-20240111' 'v6.7-rc1'
> # good: [0e7cc4233dafe9474ab32825bda3a8fed92b08bb] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> git bisect good 0e7cc4233dafe9474ab32825bda3a8fed92b08bb
> # bad: [627690dd85803b0ac9861751c663bad0d5ff6c1a] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
> git bisect bad 627690dd85803b0ac9861751c663bad0d5ff6c1a
> # good: [cdf1b6bad35cbc1e2be672982cb0dc7825dafe14] Merge branch 'main' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> git bisect good cdf1b6bad35cbc1e2be672982cb0dc7825dafe14
> # good: [04194a4f780895799cf83c86d5bb8bc11560a536] drm/xe: Fix lockdep warning from xe_vm_madvise
> git bisect good 04194a4f780895799cf83c86d5bb8bc11560a536
> # good: [b6e1b708176846248c87318786d22465ac96dd2c] drm/xe: Remove uninitialized variable from warning
> git bisect good b6e1b708176846248c87318786d22465ac96dd2c
> # good: [0f35b0a7b8fa402adbffa2565047cdcc4c480153] Revert "drm/amdkfd: Relocate TBA/TMA to opposite side of VM hole"
> git bisect good 0f35b0a7b8fa402adbffa2565047cdcc4c480153
> # good: [d4ca26ac4be0d9aea7005c40df75e6775749671b] drm/msm/dp: call dp_display_get_next_bridge() during probe
> git bisect good d4ca26ac4be0d9aea7005c40df75e6775749671b
> # good: [6aaff21547a08e5a151fbf7a3f7be5a68877d9e3] Merge tag 'drm-intel-next-2023-12-18' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
> git bisect good 6aaff21547a08e5a151fbf7a3f7be5a68877d9e3
> # good: [3c064aea46d071ccf95a142be5532768a7fa6f02] Merge tag 'drm-misc-next-fixes-2024-01-04' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
> git bisect good 3c064aea46d071ccf95a142be5532768a7fa6f02
> # good: [b76c01f1d950425924ee1c1377760de3c024ef78] Merge tag 'drm-intel-gt-next-2023-12-15' of git://anongit.freedesktop.org/drm/drm-intel into drm-next
> git bisect good b76c01f1d950425924ee1c1377760de3c024ef78
> # good: [f48705f473cea37efeeaa6a197ae12730c112863] Bluetooth: Remove HCI_POWER_OFF_TIMEOUT
> git bisect good f48705f473cea37efeeaa6a197ae12730c112863
> # good: [7974b2128489d062c9d21419633eebde07f07032] Bluetooth: hci_event: Fix wrongly recorded wakeup BD_ADDR
> git bisect good 7974b2128489d062c9d21419633eebde07f07032
> # good: [f8c47ee39e6dc6170da06865b84e8c8b08e87ab0] Bluetooth: hci_event: Use HCI error defines instead of magic values
> git bisect good f8c47ee39e6dc6170da06865b84e8c8b08e87ab0
> # good: [ba0bc076e90fa6ae1284fc0b34d7460531c45ab7] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
> git bisect good ba0bc076e90fa6ae1284fc0b34d7460531c45ab7
> # first bad commit: [627690dd85803b0ac9861751c663bad0d5ff6c1a] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
> 
> Let me know if there are other ideas, otherwise I'll wait for the
> series with the rearranged series from Andy.
> 
> Thanks,
> 
> Kim

