Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB46D7A57FA
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 05:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbjISDqU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Sep 2023 23:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbjISDqT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Sep 2023 23:46:19 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39507FC;
        Mon, 18 Sep 2023 20:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2jBoR0QPjZB4frlYmgcLIn3/lptFmbHYWeOHVBw5qanWLHw3wTKzpoWdnei8T+n1ktEHcmHkKUuG67sfqY08nVr7TntCMpDDnVXhZKR9GxmSQ6KNjBcaBZpm3/xLUYdm/aPsVI21fTpO9YujWRlxeAww5bszOlh9f3MIem70TFdbj8xPzoLQPMCRTGlYUoxftzO9NP0vJknc6c12xAQfzuiU8esNjs4irqVmTV3UgafNy14VR+/9OBCnwGRnrH1tl7h/PEtvHFZEsH9kq3imHTifPrD9pnM8TcCVw8qMjsPV7YI9nyesLpNJCgWS3ppxuvESsqAWEqquz/3IQGo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=km8yM3dkRbDHxmbv07c9+lmb+3kufweS1Eu97l+u/0M=;
 b=AYp93hzi4y7GPYwba6C3jKuPHZGU76D6xiDUaXOIqeEfHUUScw2f8YEaez6tw4WWHVeCG+O28ZZ51TBXVheNrUsK5U96PqRcPY0NO7Cyg+Bww2LddM7AfUDhbVqs++3pkWD+Nvp8bkHkM/9c1+Y64dPBlonwlFMKWV8Ym8L3N7/uXcbrTNWpnf5nPRy5HBTYO9rHjjDXqa0/B5qxh0e9x0RWsYSNN54ZImnl0eLxkmTfnsfONbWrDxSoWADpTybODR8l5+YWGSkJ5znGIRHGfLlXrLyVWGpKSG+KWHCW0pD4wrT2gei2BZyMSJstuVz6j81rlLqORShuhTA1PugHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=km8yM3dkRbDHxmbv07c9+lmb+3kufweS1Eu97l+u/0M=;
 b=icKQ2a91M6RJGg9K1GRd+FCDfWewLoCfKEIotLLgrs6ggLH7AaF0ZlA+8TWuAZFHQP+mfHQzcGBCcqyIefRvx3R2cGnc9dokdr0sN0VBthl/VrEHWhjmZMyFopfQox0kdoT4lFKTtThjoJsONWd5dxfXhABJKwk+f+yo6M3y3S0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 SJ2PR01MB8433.prod.exchangelabs.com (2603:10b6:a03:55c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.26; Tue, 19 Sep 2023 03:45:48 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::c00b:cb2e:a349:bcbc]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::c00b:cb2e:a349:bcbc%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 03:45:48 +0000
Message-ID: <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
Date:   Mon, 18 Sep 2023 20:45:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:610:75::19) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|SJ2PR01MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4a8a32-9b95-4c75-112b-08dbb8c2e902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7P80hv3Pa78elr7rEhmV1BcFeyyij+iIux40ghzJuSHyj+7hLfuVIk+uG4sRw1wSzbD3Cz255eUZND4Oy5HRTVJEIafZHRREtbV/gTTQS+a5T+SXCPQYk1Dp6173bdfZZS+6aabkcQwLAWr86NuG1WBs26jPT5J/eJKPm1iiJpW7PAlAC3WtpJ343e+xYMuu8Lss0sAnFmntl5B8LlvGvMfphkV3zXasxUo5UHutm6Xh/FOXgeBW7BMGZwj3BK51fmyT3xOIMhbxIQOqGCOOD2f7I8UDbn8ERzluAWVLdY5lXCR2Vbuq/awk6XqzY9bBiKJwPKIWknk9KOyWK/e4yUxgrnpV80hfuQAXC23StQ925VVphy5aSnOdrmN6SAu3dOltB+8kNQXOgta24TwxsB0jWljZwJW/eB8Ik6+/wH/lpz6M6PuciYAj7O/K57M1eRDLgxWbsSkFbYPmynflEV2oTgrsUeDvn5kLZcTlLMAhH02BhTtpyFagDL1KA4YyEwC7fsTnxOltbWSofxiC7CAo+WBBpOmT0A7mBakryaasq4qfvTybaZWc1AW4eMlpvKtPecEwbTHzznDlfFvLTd2yperXkT/gEexnX+RRg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(136003)(376002)(346002)(186009)(1800799009)(451199024)(26005)(2616005)(8936002)(8676002)(4326008)(7416002)(83380400001)(2906002)(30864003)(31696002)(66574015)(5660300002)(86362001)(53546011)(6506007)(6486002)(966005)(478600001)(31686004)(6666004)(316002)(54906003)(6512007)(66946007)(66556008)(110136005)(66476007)(38100700002)(41300700001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlZlNWhsWFZlQ24wWlQvQkkyTW4xVVJZeUh0VlozajNHVmFYditiSnFGS1lK?=
 =?utf-8?B?a1NjUnVYNnZHdlRHQVNmUmxkTUhYUGJEOW1OTmNaTUNITERCUzVvMWV5UGg2?=
 =?utf-8?B?NlZHbWJOYm1EaWVSWDAzVW9nQzIvWFN6TTRDZDV6Rld6b1kzQWFCVmdzNXp2?=
 =?utf-8?B?NWE2OUxjcW4xR1hUcjlwVEJJUzZtRlAvS1NiWnJkbkYrS1VlT3NGb3JWbTZt?=
 =?utf-8?B?MWs3L2w0ZmRGQ0hUTExFTS94WjRWb1BzVVBEN3lxa1FaYXlNdElqb0l2UWxp?=
 =?utf-8?B?MlF5ZWR5RGZ4d0U3cFZUVlZoUlE3Qm5wa1hqbFZSbXZ0WjVhMGd6K3Z4TVBt?=
 =?utf-8?B?Wjgwc0hXUlZ1YmlzS0lBTTBsRzhxenk5R1VzMWZyRWNGZ28xbGpoVFlNbDZH?=
 =?utf-8?B?dTVNSDYwdE96dEx4SW45cDFsVlN6eDFVWHRnekhkMGJVV2o2NXdVMUMzZkpK?=
 =?utf-8?B?d2tWVERJdW54cldGOWRDUmZqYmkrb1hEK3RzSGhXNDd6bVdKOWExSWxzNk5P?=
 =?utf-8?B?bHJNYVdrcTRzWUl3M2VId3VuNXp4NTZRSW5UOExza3J1OEYzak1zaFMzSWxX?=
 =?utf-8?B?SkIwVnpkRGJEeDBUUDlzdllaRVRrdzhReWJZSGxuNDBiU0duODRlQTU4T1Yx?=
 =?utf-8?B?dnhZRVZWeHZOZFErSXVlZENhN2VzeHQ3Q2JOS3huZmMwQXpsblRhdXA5dEZy?=
 =?utf-8?B?RVNlV0pzLzRNbjZlbUgvVTFGL2F3bDd5ek10U2dhb2FqdkY3bytzblNraHg5?=
 =?utf-8?B?MlRmMG9VOGtZVEUyeFozeTZLNm0zWHMzSVNmVXNJVEE2UHhYMFFSOWQ3YTl2?=
 =?utf-8?B?eXlsOGxuekcxS3VhdndNYmRLZTJoYkZsWGE0UWhZbWxvZTQ0MW9UdXpPeDBY?=
 =?utf-8?B?eHc2ZStlSXpLM0VVOUpMMHRsT01LUGhxdkRnRjJSemUyeUxhUXludW1uWW5l?=
 =?utf-8?B?N205cllrTUhBQWFVQXVaMTREQ0R3dDVnV2k0Rm90Sk9yYnAzQ2VySTRKQ3dy?=
 =?utf-8?B?TFM1KzRYY1lIWjV6WGIyVWg4OGprb2xuTmZYVDlEa2pjd3FCL2VwbjVKRWRK?=
 =?utf-8?B?ZjBNZlExcGl4UGpDR1YvUFB0cHZob1BPVldyV1F2MTZFZS9YZytjRzMzK1J4?=
 =?utf-8?B?bWh4c1g1Q21mdHNDU0dnL3pDM2RHWUdoSjk5dnZGWXEzNWduejFlZXNsNjcv?=
 =?utf-8?B?YXQrVSt6UFZQRDFHS3lKRXNpZjdGbVV5SkJ1U1RhMDhXdVFneUlid3dqNUJm?=
 =?utf-8?B?RzN4ZG9hMGl2YXZtK2QyU29UdEFFbE12ZjZQT3VVL3ozSDRJa3dyM3pteTFB?=
 =?utf-8?B?ZXhCTWpZSU1pdVFOUUNDMkJ0c0YxRU9jR2xwblYrOHJLZG51VzRGQStodWNh?=
 =?utf-8?B?ckpTYnZnRzlLaFdLREdyMWNhMUg5SXVhYlpGcUh6Sm5yM0VHQm9GeE9JK1Ir?=
 =?utf-8?B?ZnJVU0YzRU9IajRCbUk2RUNUWG9jWmdlc2JINzh3Um9jSVZMckVVd2ZrdGNn?=
 =?utf-8?B?Wk5ubWwxcld2dmJrbkhrMVlEOXJGWXdoa2diWnhGQXloOHorR01OcUlxR3Jo?=
 =?utf-8?B?UHg2NGZQaTN5eUZ4MDJVbFV2ZkFzVks5VEZyK2RZb2dOU2tsM0RXdVZGN3ZY?=
 =?utf-8?B?Tk9JMCtpK2ZTa2FZQUZ5NENEY3VxWUhjYXgyUE0vc1RKZzYreTExLzdyTWNT?=
 =?utf-8?B?T3o1ZE5NcWxCY2xWQUdsMnEwT1ZiUCs2eHNpUkY1bnNWZE9oZUo3YVZmTTNI?=
 =?utf-8?B?c3JpT29GOE54ZFNNTkFhSmYwbGE5MGZ0VnZoRHgyd0g3MEhkQTl0bTZWdUUy?=
 =?utf-8?B?WjVOQytPSEVRQjgwMHQxZEt5aGZwWTcwQkVTVVNnSnhTbDNzbTBtTG1qYW5E?=
 =?utf-8?B?aE9JOXdMVHY1TWNJN0NsU1paT04xTVgzMWpOU0ZyNEF5RnEwbU5ES1RvVjJ3?=
 =?utf-8?B?NWUxcWtsdWkrc3JMT281c1EyczNWczJYQzJFL1ZKN1Zua09JMTlmM0FYcmNT?=
 =?utf-8?B?anh5MytkUEhreGRvYVhqSFQxVmorLzU4TWFQaTFDZ21kTWw0T05iZThiZWNH?=
 =?utf-8?B?N3VURk9NQnBYcElzRHVwTi91dmh0RFpjb25MNzFrZHNPaStrZXVLRDZjcmVK?=
 =?utf-8?B?aXBiaFFZVUN3ZFVUVzJsZWNpTC9SR2g1NlhjUWk2MTRrMnkrZ3RwVGRDQStW?=
 =?utf-8?Q?u3X8uXce46nQvHq4okBE2PE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4a8a32-9b95-4c75-112b-08dbb8c2e902
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 03:45:47.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S929k63lyJDUSrZHait6mat1TsNrLGyMC2UhRbENt/jHNQ+YBSAU/CfJ+YjJY1KbHapRfJ4Wj1y7bqQydIWGvpwyd2chJ6k3wT70NWir6Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8433
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/18/2023 4:14 PM, Serge Semin wrote:
> On Sun, Sep 17, 2023 at 10:08:47PM +0200, Yann Sionneau wrote:
>> Hi all,
>>
>> Le 17/09/2023 à 02:01, Serge Semin a écrit :
>>> To += Catalin, Will
>>>
>>> Could you please join the discussion and clarify some ARM64 barriers
>>> aspects?
>>>
>>> On Fri, Sep 15, 2023 at 06:47:55PM -0700, Jan Bottorff wrote:
>>>> On 9/15/2023 8:21 AM, Serge Semin wrote:
>>>> ...
>>>>>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>>>>>> index ca1035e010c7..1694ac6bb592 100644
>>>>>> --- a/drivers/i2c/busses/i2c-designware-master.c
>>>>>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>>>>>> @@ -248,6 +248,14 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>>>>>>         /* Dummy read to avoid the register getting stuck on Bay Trail */
>>>>>>         regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
>>>>>>
>>>>>> +     /*
>>>>>> +      * To guarantee data written by the current core is visible to
>>>>>> +      * all cores, a write barrier is required. This needs to be
>>>>>> +      * before an interrupt causes execution on another core.
>>>>>> +      * For ARM processors, this needs to be a DSB barrier.
>>>>>> +      */
>>>>>> +     wmb();
>>>>> Based on the patch log and the comment, smp_wmb() seems to be more
>>>>> suitable here since the problem looks like SMP-specific. Most
>>>>> importantly the smp_wmb() will get to be just the compiler barrier on
>>>>> the UP system, so no cache and pipeline flushes in that case.
>>>>> Meanwhile
>>>>>
>>>>> I am not ARM expert, but based on the problem and the DMB/DSB barriers
>>>>> descriptions using DMB should be enough in your case since you only
>>>>> need memory syncs.
>>>>>
>>>> Hi Serge,
>>>>
>>>> I looked at the definition of smp_wmb, and it looks like on arm64 it uses a
>>>> DMB barrier not a DSB barrier.
>>>>
>>>> In /arch/arm64/include/asm/barrier.h:
>>>> ...
>>>> #define __arm_heavy_mb(x...) dsb(x)
>>>> ...
>>>> #if defined(CONFIG_ARM_DMA_MEM_BUFFERABLE) || defined(CONFIG_SMP)
>>>> ...
>>>> #define wmb()		__arm_heavy_mb(st)
>>>> ...
>>>> #define __smp_wmb()	dmb(ishst)
>>>>
>>>> And then in /include/asm-generic/barrier.h it says:
>>>> #ifdef CONFIG_SMP
>>>> ...
>>>> #ifndef smp_wmb
>>>> #define smp_wmb()	do { kcsan_wmb(); __smp_wmb(); } while (0)
>>>> #endif
>>>>
>>>> This looks like wmb() is a DSB and smp_wmb() is a DMB on SMP systems, so the
>>>> two functions are not equivalent on SMP systems.
>>>
>>> Right. They aren't. That's why I added a note regarding the DMB
>>> instruction. Anyway see further for detailed explantation of my point.
>>>
>>>> So lets explore if we think DMB or DSB is the correct barrier.
>>>>
>>>> The ARM barrier docs I referred to has a specific example that says this:
>>>>
>>>> "In some message passing systems, it is common for one observer to update
>>>> memory and then send an interrupt using a mailbox of some sort to a second
>>>> observer to indicate that memory has been updated and the new
>>>> contents have been read. Even though the sending of the interrupt using a
>>>> mailbox might be initiated using a memory access, a DSB barrier
>>>> must be used to ensure the completion of previous memory accesses.
>>>>
>>>> Therefore the following sequence is needed to ensure that P2 sees the
>>>> updated value.
>>>>
>>>> P1:
>>>>    STR R5, [R1] ; message stored to shared memory location
>>>>    DSB [ST]
>>>>    STR R1, [R4] ; R4 contains the address of a mailbox
>>>>
>>>> P2:
>>>>    ; interrupt service routine
>>>>    LDR R5, [R1]
>>>>
>>>> Even if R4 is a pointer to Strongly-Ordered memory, the update to R1 might
>>>> not be visible without the DSB executed by P1.
>>>> It should be appreciated that these rules are required in connection to the
>>>> ARM Generic Interrupt Controller (GIC).
>>>> "
>>>>
>>>> I don't positivly understand why it needs to be a DSB and not just a DMB,
>>>> but this example matches what happens in the driver. The ARM docs do some
>>>> hand waving that DSB is required because of the GIC.
>>>>
>>>> Unless we can come up with a reason why this example in the ARM Barrier docs
>>>> is not a match for what happens in the i2c driver, then ARM is saying it has
>>>> to be a DSB not a DMB. If it needs to be a DSB then smb_wmb is insufficient.
>>>>
>>>> Does anybody else have a different interpretation of this section in the ARM
>>>> barrier docs? They use the word mailbox, and show a shared memory write, an
>>>> interrupt triggering write, and a read of shared memory on a different core.
>>>> Some would describe that as a software mailbox.
>>>>
>>>> I did read someplace (although don't have a specific reference I can give)
>>>> that ordering applied to normal memory writes are in a different group than
>>>> ordering applied between strongly ordered accesses. The excerpt from the ARM
>>>> barrier document above does say "Even if R4 is a pointer to Strongly-Ordered
>>>> memory, the update to R1 might not be visible without the DSB executed by
>>>> P1", which implies a DMB is insufficient to cause ordering between normal
>>>> memory writes and strongly-ordered device memory writes.
>>>>
>>>> I know currently on ARM64 Windows, the low-level kernel device MMIO access
>>>> functions (like WRITE_REGISTER_ULONG) all have a DSB before the MMIO memory
>>>> access. That seems a little heavy handed to me, but it also may be that was
>>>> required to get all the current driver code written for AMD/Intel processors
>>>> to work correctly on ARM64 without adding barriers in the drivers. There are
>>>> also non-barrier variants that can be used if a driver wants to optimize
>>>> performance. Defaulting to correct operation with minimal code changes would
>>>> reduce the risk to delivery schedules.
>>>>
>>>> Linux doesn't seem to make any attempt to have barriers in the low level
>>>> MMIO access functions. If Linux had chosen to do that on ARM64, this patch
>>>> would not have been required. For a low speed device like an i2c controller,
>>>> optimizing barriers likely make little difference in performance.
>>>
>>> * AFAICS it does for the write(b|w|l|q)() accessors. See __dma_wb(),
>>> * __io_bw() and __raw_write*() macros. The former one is converted
>>> * to DMB.
>>>
>>>> Let's look at it from a risk analysis viewpoint. Say a DMB is sufficient and
>>>> we use the stronger DSB variant, the downside is a few cpu cycles will be
>>>> wasted in i2c transfers. Say we use a DMB when a DSB is required for correct
>>>> operation, the downside is i2c operations may malfunction. In this case,
>>>> using a few extra cpu cycles for an operation that does not happen at high
>>>> frequency is lower risk than failures in i2c transfers. If there is any
>>>> uncertainty in what barrier type to use, picking DSB over DMB would be
>>>> better. We determined from the include fragments above that wmb() give the
>>>> DSB and smp_wmb() does not.
>>>>
>>>> Based on the above info, I think wmb() is still the correct function, and a
>>>> change to smp_wmb() would not be correct.
>>>>
>>>> Sorry for the long message, I know some of you will be inspired to think
>>>> deeply about barriers, and some will be annoyed that I spent this much space
>>>> to explain how I came to the choice of wmb().
>>>
>>> Thank you very much for the very-very-very detailed justification of
>>> your point. I well understand why you insist on using the mandatory
>>> barrier on your platform. The thing is that your patch concerns the
>>> generic driver which is also executed on another archs. Thus we need
>>> to be very careful with the barrier selection since it may cause
>>> unpleasant side effects there. For instance some time ago I met a
>>> problem with using memory barriers on the MMIO accesses on the MIPS
>>> arch. Full mem access barrier caused the program execution stalling
>>> for too long so it failed to fetch data from a device Rx FIFO on time.
>>> FIFO got overrun, data got lost and communications were aborted with an
>>> error returned. I am not saying that the same problem may happen here,
>>> but just pointing out that selecting a correct barrier is important.
>>>
>>> Since you are fixing a generic driver code we should make the
>>> decisions based on the problem description and the barriers semantic
>>> defined by the kernel. If for some reason the solution turns to be not
>>> working, then it might as well indicate that the barrier isn't working
>>> as expected by the kernel. Thorough studying the platform-specific
>>> barrier implementation will be necessary then (what you've already
>>> done).
>>>
>>> Here is what you say regarding the found problem:
>>>
>>> "Errors were happening in the ISR that looked like corrupted memory.
>>> This was because memory writes from the core enabling interrupts were
>>> not yet visible to the core running the ISR...  Add a write barrier
>>> before enabling interrupts to assure data written by the current core
>>> is visible to all cores before the interrupt fires."
>>>
>>> Based on that, I can infer that the problem is relevant for the
>>> SMP-systems only and the root of it is in one CPU/core not seeing data
>>> written by another CPU/core. Indeed adding a barrier shall fix it.
>>> Seeing neither uni-processor systems nor any peripheral devices are
>>> affected, SMP-conditional barrier shall be enough. Here is what [1]
>>> says regarding the mandatory (mb/rmb/wmb) and SMP-conditional barriers
>>> (smp_mb, smp_rmb, smp_wmb):
>>>
>>> "Note that SMP memory barriers _must_ be used to control the ordering
>>> of references to shared memory on SMP systems, though the use of
>>> locking instead is sufficient. ... Mandatory barriers should not be
>>> used to control SMP effects, since mandatory barriers impose
>>> unnecessary overhead on both SMP and UP systems. They may, however, be
>>> used to control MMIO effects on accesses through relaxed memory I/O
>>> windows. ... SMP memory barriers are reduced to compiler barriers on
>>> uniprocessor compiled systems because it is assumed that a CPU will
>>> appear to be self-consistent, and will order overlapping accesses
>>> correctly with respect to itself."
>>>
>>> [1] "CPU MEMORY BARRIERS", Documentation/memory-barriers.txt
>>>
>>> (note [1] also contains an example of using the smp_rmb()/smp_wmb()
>>> barriers in a case similar to yours but involving two tasks instead of
>>> a task and ISR)
>>>
>>> Based on that description, the mandatory and SMP-conditional barriers
>>> are supposed to similarly function when it comes to ordering the
>>> shared memory accesses in the SMP systems. Meanwhile the former ones
>>> cause additional overhead on UPs and MMIO which is out of the defined
>>> problem scope.
>>>
>>> Thus this also indicate that smp_wmb() is your choice here. But adding
>>> it didn't solve the problem meanwhile using wmb() did. And here we are
>>> getting to these barriers implementation on ARM64:
>>> wmb() -> DSB
>>> smp_wmb() -> DMB
>>> Again I am not the ARM expert, but based on the text cited in your
>>> message and what can be found in the Internet I can guess that DMB
>>> doesn't guarantee the memory write _completion_, but instead make sure
>>> that the accesses are just orderly executed on the core pipeline (for
>>> instance just by fetching and dispatching these instructions within
>>> different core cycles). The writes _completion_ is guaranteed by the
>>> DSB barrier. Seeing in order to solve the problem you described all
>>> the writes before the IRQ is raised _must_ be finished for sure to be
>>> visible on another core executing an ISR, the barrier you need is DSB.
>>>
>>> Unless I am mistaken in some aspects all of the considerations above
>>> make me thinking that perhaps the smp_mb/smp_rmb/smp_wmb barriers
>>> implementations on ARM64 are incorrect in using DMB and instead should
>>> be converted to using DSB. Then you'll be able to freely utilize the
>>> smp_wmb() barrier in the i2c-driver.
>>>
>>> Catalin, Will could you please clarify whether what is stated above is
>>> wrong or correct? Could you give your opinion regarding the issue
>>> here?
>>
>> Indeed I agree with all that's been said by Serge here.
>>
>> I'm just adding some piece of information here to help understand the issue
>> and then decide what's to be done.
>>
>> * some ARM blog tips about when to use wmb() and smp_wmb() : https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/memory-access-ordering-part-2---barriers-and-the-linux-kernel
>>
>> * some details about ARMv7 barrier instructions: isb, dmb, dsb: https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/memory-access-ordering-part-3---memory-access-ordering-in-the-arm-architecture
> 
> Thanks for the links. Especially for the last one. Reading it gave the
> idea to me of another possible reason of the problem, which looks as
> more probable in this case.
> 
>>
>> * The kernel doc about memory barriers, even if I guess everybody here knows
>> this resource already:
>> https://www.kernel.org/doc/Documentation/memory-barriers.txt
>>
>> If I understand correctly what I've read in the 2nd link, indeed the DMB
>> does not guarantee that the write *completes*. So if the write was for
>> instance targeting DDR: it does not guarantee that the write reached the DDR
>> before another core could be running the ISR and checks for the data.
>>
>> *But*, it guarantees that "All data accesses by this processor/core before
>> the DMB will be visible to all other masters within the specified
>> shareability domain before any of the data accesses after it."
>>
>> In other word (If I understand correctly): maybe it won't have reached the
>> DDR yet *but* the cache coherency mechanism is done and all other cores
>> would read the new data if they load at this address.
>>
>> That seems to me to do the job for our use case.
> 
> Actually there is no need in the load and store to reach RAM as long as
> the CPU is cache-coherent. In general it means what happens on the
> per-core or per-cluster caches is visible to all CPU cores. I doubt
> any of the modern systems lack of such ability. ARM64 certainly
> doesn't lack it. But based on what is said in the second link
> the dmb/dsb barriers semantic is configurable in that regard. The
> barriers work within the specified Shareability domain. I don't
> know at what stage the domains are supposed to be configured
> (at the SoC design or at runtime), but if a barrier doesn't involve
> all the domains which need to have the preceding operations visible
> the problem described by Jan may happen.
> 
>>
>> The difference between DMB and DSB is that the DSB, on top of doing what the
>> DMB does, stalls *all* instructions (and not just stores) until the
>> synchronization mechanism is done.
> 
> Yes, that's the main difference. But (r|w)?mb() and smp_(r|w)?mb()
> barriers are converted to the DSB and DMB instructions executed for
> different domains:
> 
> #define __mb()          dsb(sy)
> #define __rmb()         dsb(ld)
> #define __wmb()         dsb(st)
> 
> #define __smp_mb()      dmb(ish)
> #define __smp_rmb()     dmb(ishld)
> #define __smp_wmb()     dmb(ishst)
> 
> The Mandatory barriers affect the System Shareability domain, The
> SMP-conditional barriers - the Inner Shareability domain. So if for
> some reason the CPU cores on the Jan's system are split up into
> several Inner domains, AFAIU the SMP barrier will involve only the one
> on which the barrier is executed. So as said on the ARM64 doc:
> "Outside of this domain, observers might not see the same order of
> memory accesses as inside it."
> 
> So Jan could you please try the next out:
> 1. Check whether all the CPU cores in your system are on the same
> Inner Shareability domain.
> 2. If not (or in anyway) please redefine SMP-barriers like this:
> #define __smp_mb()      dmb(osh)
> #define __smp_rmb()     dmb(oshld)
> #define __smp_wmb()     dmb(oshst)
> 3. If it didn't help like this
> #define __smp_mb()      dmb(sy)
> #define __smp_rmb()     dmb(ld)
> #define __smp_wmb()     dmb(st)
> 
> -Serge(y)

Hi Serge,

My understanding is all cores running the same OS instance will be in 
the same inner sharable domain. The ARM64 domain seems to be closely 
related to or maybe is just another name for cache-coherency domain. 
This is the case on the system showing this issue.

I first got involved when we saw the issue on a 2 socket 160 core per 
socket AmpereOne CPU system (all 320 cores are cache coherent, in the 
same inner sharable domain) where the ISR was running on a different 
socket than the i2c transfer setup code. It was trivial to reproduce on 
that system. It then later turned out a customer that I believe was 
running a single socket system also had seen the issue, and this patch 
fixed it on both systems.

Not only did we see the timeout messages, I saw one debug log where the 
developer logged many values from inside i2c_dw_xfer_msg, and it showed 
values like dev->msg_read_idx changing magically. Some months ago I had 
debugged a missing barrier bug on a different OS, and values changing 
magically was an indicator of a missing barrier. We had another bug 
report where it looked like dev->msgs was null on the first transfer 
after booting, which is plausibly the same issue.

My understanding is we now have had three large customers see the issue 
with their internal tests, and have reported the issue goes way with the 
barrier patch.

I did some more hunting on what ARM docs say:

On the page 
https://community.arm.com/arm-community-blogs/b/architectures-and-processors-blog/posts/memory-access-ordering-part-3---memory-access-ordering-in-the-arm-architecture 
in the section "Device memory and Strongly-ordered memory" is the sentence

"There is however no guarantee about ordering between memory accesses to 
different devices, or usually between accesses of different memory types".

I interpret that to mean memory mapped as strong-ordering only applies 
within a single device, and there is no ordering guarantee between 
different strong-ordering mapped regions or regions of other memory 
types like normal memory. I could not find any info on how DSB or DMB 
barriers interact with groups of accesses to different memory types. I 
could not find if a DMB after normal memory writes guarantees strongly 
ordered writes (device memory) after the barrier are delayed until the 
normal memory writes before the DMB barrier are fully observable by all 
observers.

The ARM docs saying a DSB barrier is required after normal memory writes 
and before a write that triggers an interrupt makes me believe DMB will 
not cause an ordering barrier between writes to normal memory and writes 
to strongly-ordered device memory.

I did find the below text in the Arm Architectural Reference Manual (DDI 
0487I.a) section K13.4 "Using a mailbox to send an interrupt". It was 
nearly the same wording as the ARM barrier document I previously 
referenced at https://developer.arm.com/documentation/genc007826/latest/ 
This too says a DSB barrier is required for memory updates to be 
observable in the ISR.

"
K13.4 Using a mailbox to send an interrupt
   In some message passing systems, it is common for one observer to 
update memory and then notify a second observer of the update by sending 
an interrupt, using a mailbox. Although a memory access might be made to 
initiate the sending of the mailbox interrupt, a DSB instruction is
required to ensure the completion of previous memory accesses.

Therefore, the following sequence is required to ensure that P2 observes 
the updated value:

AArch32
P1
   STR R5, [R1] ; message stored to shared memory location
   DSB ST
   STR R0, [R4] ; R4 contains the address of a mailbox
P2
   ; interrupt service routine
   LDR R5, [R1]

AArch64
P1
   STR W5, [X1] ; message stored to shared memory location
   DSB ST
   STR W0, [X4] ; R4 contains the address of a mailbox
P2
   ; interrupt service routine
   LDR W5, [X1]
"

I hear your concern about how this barrier in platform portable code may 
impact platforms other than the one I'm trying to fix. It almost seems 
like there is some missing type of barrier macro that on ARM64 does what 
is required for cases like this and on other platforms does whatever is 
appropriate for that platform, often nothing.

Thanks,
Jan

> 
>>
>> That's my understanding but let's wait for the experts to enlighten us :)
>>
>> Regards,
>>
>> -- 
>>
>> Yann
>>

