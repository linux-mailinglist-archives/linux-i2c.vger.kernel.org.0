Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8929B7A2D1E
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Sep 2023 03:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235557AbjIPBtM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Sep 2023 21:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236002AbjIPBsm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Sep 2023 21:48:42 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2117.outbound.protection.outlook.com [40.107.93.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AC31BF8;
        Fri, 15 Sep 2023 18:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHXfLWOwErR1jCy6GNHxB28ZgL1YB3Gm5XKnStmRp/3BwCoVRqp9YlJHiswqdqpFw+pEk4SF4+FB/5Nz4pLhn5Dql918H0oxZn6O3N/9zTSsP0aE353aIDyCP1MuWPglPL4M1Cg8WqHIqgOkd6GFFNoMYiuf7jqXZ1AAgJirKfaBIT898hWX7u9ijaRoTYyBed1o7MIUCzf5KaJCQT0ouIN7aJj2jtYeeYsGKpp6WvOKcXIxST072RAPlKNSJVB2nXr8JbJqRM1SIYayjfg9cR4KGpsG/rR2mlusyTxE+fTtc6aHoWb5hR7ufOGaq9Xbfz/EOoHBHx7ooFxoe8MdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdjQ5usCuRD7FsPwVO2o+fYm6B0nBHgYmbDvXljmOiQ=;
 b=iXrFR8LiSI+Pr98mabgSp1aqBiMoIiQR7O1jojjUiyuUsYqPQi/viNwhLKJyvihlFiZtmylOD/ZvSqG9HsXlRVbApozepZb7jzRnFOKSwtSD+OZq1JvgfqeU7pLhNcjtpjFDz8rLW/PkKhXJwp6FJzdBL9MtG7m0v2g53oDiV4b8tBVpgpjXCtUEtRig3K5onP7OghDuXRtumiexWh+9ndHrsW5C9mV2Iw4yuME6hU2Ee0mOw57U+PinGIF/a/yLyiU6iwG19teCqyFrZflHK9FZlCCWXxE8xXFXQymPbwB002DihqsPLpiIZEVVBHu4dMGOPc5GmrK0IgG8aQAUrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdjQ5usCuRD7FsPwVO2o+fYm6B0nBHgYmbDvXljmOiQ=;
 b=U+qO169+9Q9ISgIsM/e5624gM4PLgGrYkGo11gUxmKsTufdWqWZL9aNcukOU9nTq924K0RlrBXG85BdMQBOaNdErxVP1EKtRq4ADuLzlApBMypUazEoXYSkYGnEU/aSdfmI5Ffr1SkrBD5l22mZzMqrdEc06rwpEjLFeqlCmZp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 CO1PR01MB6632.prod.exchangelabs.com (2603:10b6:303:d4::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.23; Sat, 16 Sep 2023 01:48:01 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2%6]) with mapi id 15.20.6792.020; Sat, 16 Sep 2023
 01:48:00 +0000
Message-ID: <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
Date:   Fri, 15 Sep 2023 18:47:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:610:20::39) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|CO1PR01MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fd42ec-1d4d-4258-8ebc-08dbb656f537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DqFBk5KwSiWNJa6HRPIhVGI0hoNemyWk0zK1ltQ6iwRZkHsnkyrNhjLl/8nq4JtadlLT5YUT8kPyYp6qEosKEQb3XLZ1XJxtyc4UMlMaYqsAPzmmyW0FKTvblBh3VR5vKeFw2vEAcm7ie3Ot9IWXXic8+BdcnGkdN8gjmOvMa6zxSlocsZa5AovoWDipxZvR1dD62HzD8XxxfmCXP2p4SK2Gukx98TLITRlYbuZpOyuJJIhOqxnaH9WMdIynWjMPhyuBJ8Eugt6WtzHNPYg/Bo8i7cRJ1Ml0GF85Ko4hehyNUGi+6AWLYJthlZs7Jy+hDdrju4qZ1tMX9ZmvlsmGoJSRy8rkIBLLqnxji7GTqqTZ3msW4Ref9m3WUejThE8ccExC46WJ1LYnzpMZSZMRjhS+VOIAekCE/9NJLBXH3ighkbPuaJxrf82DYUXHgJLZVDpxBVM0ZYAL45gIjCSGUo9FxrBLbb4SGgbSoIko5quBoow3+bzcZr04uB5SegwWP6pSn4A7kuJfixzCaBRBEgrD21YoXNvpW1FEIZSchjSLw9fkSPDDvPib+q5F08MC99/3YFlbTvN8t/y7696dYo5MBtH47XSYiif6fLwxfSDYGw+0BC7WbTnVC8t/wm0H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(366004)(376002)(346002)(1800799009)(451199024)(186009)(41300700001)(66556008)(66476007)(54906003)(66946007)(6916009)(316002)(8936002)(8676002)(4326008)(53546011)(6486002)(6506007)(6512007)(478600001)(6666004)(83380400001)(26005)(2616005)(7416002)(31696002)(86362001)(2906002)(38100700002)(5660300002)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pvT2xqRVM1UVNOTUtNUFlvVmgxeDk4czdITWJURmYxK25yWUcyRGRXaUxv?=
 =?utf-8?B?QTdnNjJhWnZBVmNWNkZHRnorVlorTUJmN2R2YWhjRmVvbG5ISjU3QWN2ekN2?=
 =?utf-8?B?S2U5RzBmMTdTMXZ4ZzVCYlRGR0FiRTdob2h2WHdEZUpob1daSGhSVDcycUZ2?=
 =?utf-8?B?UU16UUhMRW5KTXZHNXBTQXl3U0M4S05xUWkzVkV2YUdqci81Vm1US0YrbnJp?=
 =?utf-8?B?QVN3Ry9IdFN4c1VHTlQ5Q0M3c1RtbDhPWko5UStmeUNOQUR1RU5pSEhiOXRz?=
 =?utf-8?B?VEcxYzRRVjU5QTR4V1ZzTk8zTnNxYkkyR3V6ajZTTVNSZjM4RDEzWlUxTHRR?=
 =?utf-8?B?UkkwckE0UUMxdlBoSEhKeXBrd25tS2FCT2E1eDhkUnB3NGtOS2ZVaVlrZnBH?=
 =?utf-8?B?Qjg3M2k1UDA2QWR2UVhMVXNTcVZucnBJc1A2aVFML3NUZTVjZDZoVXNaTzNa?=
 =?utf-8?B?N24wSjBqaVlDZ2xlZXQxL1JiTnV6L1czZjJrUUFEQ00rRmtaemplek9VK3ZM?=
 =?utf-8?B?SkxTbVluY0lrY2RiU1hFcmRqSnFPR2lrN3Z4djdOQnVyRWtyTDlieW5XaUlE?=
 =?utf-8?B?Q0dYYnplUU5zdk5jOGpWQUUrVEdNYnNjSHZNV1R6OEd0QmQxeGtxZWMvOFJL?=
 =?utf-8?B?TGVQaUx4bzBad3ZFbUFtenYzK09yS3E0ZElGRTBjeGllcG4yak9OSWltbURL?=
 =?utf-8?B?ZHVPRjFQSDlPRUtYZm1OUHVUTmlGU242SmM3NFNjMnhkdEQ2YkNkTzhFaUMz?=
 =?utf-8?B?ZFFxR1A3WjAzRkVYMS8zdjJ2dWFkdS9OZG1PZlBicDYvdXA0d3huTjFhUHBS?=
 =?utf-8?B?QkZFOW1pVU9NaDJHZUlFSEZFblk0NWl6eFg1c2VzV1ZReGxVeEV4SU83ZVMy?=
 =?utf-8?B?eDlJRGdPNVk1UFFadHphSHpQMS9KblRnbExSUEdYY1lFSkhtdEloMVQxWDls?=
 =?utf-8?B?dThES294RUhLcjZJdFhnRVdHQUtOSmF6Vi9BNXhld0J2QTloMG9hc0xRVC9s?=
 =?utf-8?B?S0p0NjZEWVAvdm5mdXAzNUZPOTNMc1RpM3RPVGNJQjBPRWJoS3hWc2Y2cjZB?=
 =?utf-8?B?MzdROG5sMzFuUGx2L3pRNDJUTXp5QjY4a3VVUGpYUHZPNDFCczhqSUN4SEsr?=
 =?utf-8?B?TUVhVzJFT3ZWR1FPVUdxamthdHo2WlJIMm1XRzZ4aEJhLzAwUVRGMDdCYmRE?=
 =?utf-8?B?KzdGS1JZMHYwK3VUYXoxOXlKZ1NPV0ZwYW5tK0k2RWpFdEc5aUtRWTM2MXlE?=
 =?utf-8?B?OWZBTmU0MzQySmloV0E1dVZCZW1oTFNkVEhFVHZwQUloWUgwRkN2SkluWDVs?=
 =?utf-8?B?UVZkbzkzc090dURCendEeTY5VW85S1UwYmlsaTJHN3ZGYkMzWDRTSmdoN1Zq?=
 =?utf-8?B?RTh1RTJsQ2NDSUMzaXIwaTdFdytkT1NMUjd0cVV0aDZxMHI3em04RmJvem1j?=
 =?utf-8?B?OFQzbGgxTXNvZ3ZqL0x3VmtqSW55OEVtTG8veXdOQmlTN3FPam5mbVRSNXJl?=
 =?utf-8?B?Y0dGL0Yvdm8yZHJzeFRVVkFmbWpnS1UwVFRFSWJyT3lhQ2VVSVFScEJiZy9Z?=
 =?utf-8?B?QVpQS2pncXRTNzQyVWpXZUU0VTMrYlo0ZFp1MTArVjNwSndOQVAzSDBPVXB0?=
 =?utf-8?B?NHQ1bTFhL3pqMkVjZ0RIM1c4Mk5sOUdveFFrTXBKUWpJRkZlQ01aNzRZVjkr?=
 =?utf-8?B?a1JlRWVrVDVoQXJESC9vOFRrNytNSFlteDRpdXJaaGJScmFJaXJXM0YyRjB3?=
 =?utf-8?B?dTdVWCtOMGZtNHJXY0RDUitSN3lrZEpZblBGWVV4T29rY1EvR1RuTDBBeUY2?=
 =?utf-8?B?dktJcFZwc1U5eTI3cWFTdW5XQzRKU1NtWFdDZElUUlpLVHMxYzh4eGVjZENY?=
 =?utf-8?B?OW9kUll0eHRPVko3Ny95V0QwdHloUVBvOE9rZVNsSFR0alU5dG1SYi8vRUNq?=
 =?utf-8?B?cWplVys0ZW1zZGI2eGg1U20rNHRLc29kTUViSW1xZnZrbXhSVFoxL1VyaDlR?=
 =?utf-8?B?U1pEVHlkak5tNUFMdDZVVHRuZ3NBZ2xNNFRrejV5Q2xvQ3RadzVoRXNTOXlS?=
 =?utf-8?B?bG82ZTF1Q3hpT1hvZVY1ZVBVWmZkWi96WkMzb0xzOU93V3plZU14aW1xOURX?=
 =?utf-8?B?TFBSc01HZWJsTlBIYnNCOStIVDFYRXhTdlZmUUlHS0Izai93SXB3TDlHOXFV?=
 =?utf-8?Q?2+O0ivEcfRgYYIeGP0bK+B4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fd42ec-1d4d-4258-8ebc-08dbb656f537
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2023 01:48:00.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4Bh6sTUOI4WBrdsBF9M+j2bc4yLBL75s57GCNbjgS3j/Kky6IMBkoPbvsWkKbfmiZL9DyDVw8WhW47e+BrXWnJc6pbFEtpJSNDjoveFAdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6632
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/15/2023 8:21 AM, Serge Semin wrote:
...
> 
> Based on the patch log and the comment, smp_wmb() seems to be more
> suitable here since the problem looks like SMP-specific. Most
> importantly the smp_wmb() will get to be just the compiler barrier on
> the UP system, so no cache and pipeline flushes in that case.
> Meanwhile
> 
> I am not ARM expert, but based on the problem and the DMB/DSB barriers
> descriptions using DMB should be enough in your case since you only
> need memory syncs.
> 
Hi Serge,

I looked at the definition of smp_wmb, and it looks like on arm64 it 
uses a DMB barrier not a DSB barrier.

In /arch/arm64/include/asm/barrier.h:
...
#define __arm_heavy_mb(x...) dsb(x)
...
#if defined(CONFIG_ARM_DMA_MEM_BUFFERABLE) || defined(CONFIG_SMP)
...
#define wmb()		__arm_heavy_mb(st)
...
#define __smp_wmb()	dmb(ishst)

And then in /include/asm-generic/barrier.h it says:
#ifdef CONFIG_SMP
...
#ifndef smp_wmb
#define smp_wmb()	do { kcsan_wmb(); __smp_wmb(); } while (0)
#endif

This looks like wmb() is a DSB and smp_wmb() is a DMB on SMP systems, so 
the two functions are not equivalent on SMP systems.

So lets explore if we think DMB or DSB is the correct barrier.

The ARM barrier docs I referred to has a specific example that says this:

"In some message passing systems, it is common for one observer to 
update memory and then send an interrupt using a mailbox of some sort to 
a second observer to indicate that memory has been updated and the new
contents have been read. Even though the sending of the interrupt using 
a mailbox might be initiated using a memory access, a DSB barrier
must be used to ensure the completion of previous memory accesses.

Therefore the following sequence is needed to ensure that P2 sees the 
updated value.

P1:
  STR R5, [R1] ; message stored to shared memory location
  DSB [ST]
  STR R1, [R4] ; R4 contains the address of a mailbox

P2:
  ; interrupt service routine
  LDR R5, [R1]

Even if R4 is a pointer to Strongly-Ordered memory, the update to R1 
might not be visible without the DSB executed by P1.
It should be appreciated that these rules are required in connection to 
the ARM Generic Interrupt Controller (GIC).
"

I don't positivly understand why it needs to be a DSB and not just a 
DMB, but this example matches what happens in the driver. The ARM docs 
do some hand waving that DSB is required because of the GIC.

Unless we can come up with a reason why this example in the ARM Barrier 
docs is not a match for what happens in the i2c driver, then ARM is 
saying it has to be a DSB not a DMB. If it needs to be a DSB then 
smb_wmb is insufficient.

Does anybody else have a different interpretation of this section in the 
ARM barrier docs? They use the word mailbox, and show a shared memory 
write, an interrupt triggering write, and a read of shared memory on a 
different core. Some would describe that as a software mailbox.

I did read someplace (although don't have a specific reference I can 
give) that ordering applied to normal memory writes are in a different 
group than ordering applied between strongly ordered accesses. The 
excerpt from the ARM barrier document above does say "Even if R4 is a 
pointer to Strongly-Ordered memory, the update to R1 might not be 
visible without the DSB executed by P1", which implies a DMB is 
insufficient to cause ordering between normal memory writes and 
strongly-ordered device memory writes.

I know currently on ARM64 Windows, the low-level kernel device MMIO 
access functions (like WRITE_REGISTER_ULONG) all have a DSB before the 
MMIO memory access. That seems a little heavy handed to me, but it also 
may be that was required to get all the current driver code written for 
AMD/Intel processors to work correctly on ARM64 without adding barriers 
in the drivers. There are also non-barrier variants that can be used if 
a driver wants to optimize performance. Defaulting to correct operation 
with minimal code changes would reduce the risk to delivery schedules.

Linux doesn't seem to make any attempt to have barriers in the low level 
MMIO access functions. If Linux had chosen to do that on ARM64, this 
patch would not have been required. For a low speed device like an i2c 
controller, optimizing barriers likely make little difference in 
performance.

Let's look at it from a risk analysis viewpoint. Say a DMB is sufficient 
and we use the stronger DSB variant, the downside is a few cpu cycles 
will be wasted in i2c transfers. Say we use a DMB when a DSB is required 
for correct operation, the downside is i2c operations may malfunction. 
In this case, using a few extra cpu cycles for an operation that does 
not happen at high frequency is lower risk than failures in i2c 
transfers. If there is any uncertainty in what barrier type to use, 
picking DSB over DMB would be better. We determined from the include 
fragments above that wmb() give the DSB and smp_wmb() does not.

Based on the above info, I think wmb() is still the correct function, 
and a change to smp_wmb() would not be correct.

Sorry for the long message, I know some of you will be inspired to think 
deeply about barriers, and some will be annoyed that I spent this much 
space to explain how I came to the choice of wmb().

Thanks,
Jan


