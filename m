Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A34C79F2B9
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 22:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbjIMUQg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 16:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjIMUQf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 16:16:35 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2098.outbound.protection.outlook.com [40.107.212.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436601BC6;
        Wed, 13 Sep 2023 13:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M20Gmc1zLStnjcWuPBMpjlWSP30LfLFgXEQRtM8NNd0WKN7LnVrGq3gPIML/mVLdZFbH7WPK8HgjMIHMG9OgfSABRElWayR96qFFQqI8tSO+qv9eISJrk9WnkWP/ClhAm2BhahVHFwewKbkHBbsPU5fna3Cacos6zap0KPBzSXU2++H0UvI/nrIPBu7K0OLfD/OtRrevP7SktYlA1UN/kHwYh7S6wkNZ1xqVI3enA8JOTIY+tJhGMeG5nVRqLkkadC+dnQEj1fXeO3irR0tXl9RnTsvPI8M4+bje8O5gfUcrqZMS6arIW/dGLUgYWX9cG7q46u39twJ6pJ8ajOqf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L80dU31fhRTa0/hxC3amGncipzHY0PgB6tyYdhPzFQQ=;
 b=H9uXeZ6jlc8GS35NPwGnarpYEzAZDSuYSQ6NdXbu3wjq1/TFNYBjOMW6ypte6wNsC3iFKVkq+6OolkdRjiheA7SSN+IXUthJdkV64jNBBYYgd7Bo9K7ftYyy1zLB/TBVGFCURBvvZ+Hxa4k5aXqGoiVcRmn9agCqh6T+M/A+uK76Un1K0G9xoDrgBuMYbzKwmHgcMOwDc8MzOHrf2dTOR3Yk3t8q1ABOBHnPPmAp0+t5mXPdUwqOAEqm25YEVejcB7fWLDirWHncNAlujyPs4j6Do2PxUz2rbaieEEfPhDi39+i5LMhM7+8AgtEabC9IpQMVJknr9HEgIiNUdCkeRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L80dU31fhRTa0/hxC3amGncipzHY0PgB6tyYdhPzFQQ=;
 b=otSUj0j+j5Xtxa1cVr02aWQYuueQax7ehCghrO7EkMcjnnec36mGteUJo+/Ms+r6k42m2cBkttlOIdHzphh1Gu7FSXpku0Wc7nw3BLZ7XyKA0a/WZHDprZZ/xkPR8GCkY0zdRYwlnspeGDEIKVgDZJm9qQLuV4Ko8ju22WUrNNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 BL3PR01MB7044.prod.exchangelabs.com (2603:10b6:208:35f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.38; Wed, 13 Sep 2023 20:16:27 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 20:16:26 +0000
Message-ID: <f86b6eae-15c8-4f3b-affc-f24265f3da23@os.amperecomputing.com>
Date:   Wed, 13 Sep 2023 13:16:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Yann Sionneau <ysionneau@kalrayinc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230913010313.418159-1-janb@os.amperecomputing.com>
 <4537fa1c-b622-674c-026e-8453eda0a4d1@kalrayinc.com>
 <ZQGbaXTnIk0NIZbK@smile.fi.intel.com>
 <038e40c8-d6cd-150e-933e-5b2d2d7af7c5@kalrayinc.com>
 <2657e064-c537-c898-668f-b5e82228ec5a@kalrayinc.com>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <2657e064-c537-c898-668f-b5e82228ec5a@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::21) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|BL3PR01MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 5185142e-8d4b-4bfc-fcdc-08dbb4964f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K0Kif7fA1+lJ9dESxRCvZ/uut3gfewjbTbvwIGmI/FwVMUXphaBp+ceShb10+vIsa9NV95/vBU4Uy+zoHMRzcDjS9XCv3FoMfZzlD22aISKemj92b+2B3Kv3a6mb8j8H6TWvG2qXa/6mIWYVGZ1eVBlcE7qFfT2okwrStagNDdw5Sr2sjrOY4HuXhLQZxO1KJ+RHVVL23UJyMiZCU+U1Lsz2lLc6I3h1X9B1G+7JeViG0j3eTaeGhwyDxlGCm3NriPLv6UFgsoVsEpXwJC9KQfRPJP+HCJj13lTaIPwzmrSw/R8Cdt6zmC/KDjuxjdlBBFauxWCvascH8QYL+4vt3ypJNy7CUMqDCxV8jIKltwyoaMrC6nespLmx8C3p2QT1UZP3xMI0AfoJBsLoGKTU1J/BXDmeoiZRW45mWo8s/7qWec4L/TtpeOKhErl2w3bYRZXesg5Ml3DYvO+GFT2S873VcnMiKT0kFuONtegIyiIHtj8nGmq7V4lP99av1iFSVDunJ8FKOlXhmibKCoxihwo8FSmU2hQQeNVoxjI7hzPTvDKkXpOoenqIyEiiAw4aU23plyaJfV9whpLn2yvAfdcy7pXeyqoDqkx3Oesugrs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39850400004)(376002)(451199024)(186009)(1800799009)(6506007)(6486002)(6512007)(53546011)(66556008)(66946007)(66476007)(110136005)(6666004)(478600001)(966005)(31696002)(86362001)(2616005)(26005)(83380400001)(54906003)(5660300002)(8936002)(316002)(4326008)(8676002)(41300700001)(2906002)(38100700002)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmZMaVdVRU03VW14ejVaNUczMFJoS2JPMkhDc0ZrbW1hSGVFSmNMeFI2OTU4?=
 =?utf-8?B?UVdOUmJHYUhoSFpHa3h1V0NEL2ZRMHU0c1lLUGV0WFZuSXpIbWJmZzBCaldM?=
 =?utf-8?B?SEZETzFlWFE5V21JVG05Kzl3M0tsVnEvOVlndjRsemNRMzF4Wk02VXlsbGtX?=
 =?utf-8?B?ek9XSU1NcStpV1ZCejRsNGYvOVhYMFUwZEFUYU83TGpJZk42MzIraEZIUkUz?=
 =?utf-8?B?WVVLbXFSWWl2QWdPMFFXZWtjWHVSai9xU2E1SkJaRE03SXFvWVFyTWVHQWQ3?=
 =?utf-8?B?OGp3K2FjUHhuelRMMmQwRmdhcWR6by9RWU4zUDFyL3NmT3E0cWZxbmFwV1lo?=
 =?utf-8?B?UlpwKzhLcDBWa0hMdW5JT2wvKzMzeU1LVHNRMFNkOElxTW1jVWYxRmFycG5D?=
 =?utf-8?B?Zk80MjN3TDhZSFdwTWNMS09CS0UrMTJGZDF3YTBHYlBKYTdNVllhY0c4ZHBB?=
 =?utf-8?B?a2pBdFJlSVZWWERacE1UWDNvQ0Z1S0YwaGdneVpNeDNPREgzVnQvaGgzaEZS?=
 =?utf-8?B?RkNRdVVhQnRlU3B4Z3FHeVpFQTJjMWk3aFAvUStpNGJrK054aStHMzRha0t2?=
 =?utf-8?B?ZkJhQUlzMVR4OUhsYm02S3M3YTNTakIySTF6ZzNPVmpuTkJZdEloQlJ2S3pa?=
 =?utf-8?B?Z1NHaHFrOHhDNGFSdms5bVFtR3pDTHRMUi9ZL1M5eGVWUG1lUTlOOG93Y0dt?=
 =?utf-8?B?VFZmcE1acXc1QUV6c0hJOUhUQ2t3NWtiTWs3aGJRSFBHdlR5S0RqdlVXbnl4?=
 =?utf-8?B?SW83ZzhGTUlMTy9tbWhjcEdlLzlWaC9ZRzU3WitHUG8reXcwTUc3U0lSWFNh?=
 =?utf-8?B?NVo1SzArd1RPdHhabkhkbTBNTEFRclJHZjdEUzd2SlVSemo0b0FGQXExMkhF?=
 =?utf-8?B?YkVOWmJoUVEweEhtR0pqdUIwamhnTVkyN3JpM0ZRVE5SaWtFWmlFMDBYeVk3?=
 =?utf-8?B?UnRUZnc1dStwWElCaXdlbW9KQkxJQkxKMmIvN3czT2djTnBJTUVKemVuN3h5?=
 =?utf-8?B?aTdYZkJ4cjQzK3UrRjNldks1QmpaYnZiMW5EQ2Q4MndIODBVSktsdUUxTm9k?=
 =?utf-8?B?NHRXa1VDei9nd2pqT3hENkdlR09WU3hlT1ppSXdKc1NyR1R1Z0V6QVhDQlht?=
 =?utf-8?B?RGU5bURPcmZJaURwazdkc2RFdVc3VWFsZ0NNSW03N1QxNXFzcFdFbVRicXIv?=
 =?utf-8?B?cDNFWE4wdFF3NEFIQU9BVHNHK1haZk1wYmlpY1RoQ3ppeXJTdFlVOVFpRDFq?=
 =?utf-8?B?cGFtNnY1dHNhRWdIVjVKZW9kSVltdlEyYmRibWN0K1gyRm95Rzl6Y1A3eXcy?=
 =?utf-8?B?SHVBOGs3RWJZRVd6UkxnMXo2enU2V2xFMTZrZlZPVFc1Ukh5RWpBdVZIR0tV?=
 =?utf-8?B?ay93SzNrV3YyRmhacUEvQXBYc25kWUdzNWxhYW9zQ0dSN0xmcENWanFxQTd0?=
 =?utf-8?B?SkFESHRqV1NnWEx1eVJ0bkI3V0NoRlNwR25BS0RycnpKdTk5VEp3Q2EwczNR?=
 =?utf-8?B?MFFlaUZDRWgyekd6RzVKTGxlRWptbkpwVGhWS240VGl2THFsOTNzUTBuYnRL?=
 =?utf-8?B?RzZia1RyZm5QSGYwSGFxRllyMkF0RDNVR1F4TmR5SHBrVUc0MTVzdHVraWJR?=
 =?utf-8?B?ZHk3U2d5TVhMWEZkQWtad0IwSWVnS05KeFMrME02czdxUkVCQWVBRVJORENm?=
 =?utf-8?B?TUZmbFlSeWNsZFg5dzNLSjYzT3cydkJPZlBQb2U5b1oyVldYQkY5bEZqbjIy?=
 =?utf-8?B?bS9aQktid0dxUXBRUG84Y1JjM1Vnb0FvMEJ2M3hRU2w4Zlc2TlNMWjhwekly?=
 =?utf-8?B?SzU0Rk9zSXlEbVd5SjJTOTZYQlVhbDZlNnlRSFpUWksrSkt6c1RwR2tLekVk?=
 =?utf-8?B?QzVZMmlBUnlpTTl6ZG9NY1kybkhLS1FkdEM4TzVJS29WWDFYOTVTenJyQy9h?=
 =?utf-8?B?RDV0dWU4U1RCRW5WMjVWV0p4Rk1USGIwVG9ueC9YUDZPWnpaamFGdGpHc2tH?=
 =?utf-8?B?RWFLbHpGZTJnbHBXRnRNUTNaaDFLRjhTSHBNVzFMdkwyOFozUERjeHBEbG42?=
 =?utf-8?B?T0FHTnl2S3JteWVaaUdveWs2OS83MkI0bnhXZjM5UEduM2I3Y3lBb1J3dndQ?=
 =?utf-8?B?L1pFZ2hmT3c1S3dDUEQzNy81bWlESDJZa3lveUpCTHhvcVVWUGtmU2w0R3pG?=
 =?utf-8?Q?hFec4PuDfuTTCag4Da1s1cU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5185142e-8d4b-4bfc-fcdc-08dbb4964f02
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 20:16:26.8130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSew85pdLbyoagGSSoW0li74wzfACl88JMdUqE0pASQrfkdlurU86RSupkexM3Kbja2HpiyaAHxvKak6F9i5j/br491OxFhlnbAfTPGU+08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB7044
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/13/2023 4:54 AM, Yann Sionneau wrote:
> 
> On 13/09/2023 13:32, Yann Sionneau wrote:
>>
>> On 13/09/2023 13:22, Andy Shevchenko wrote:
...
>> To my knowledge the READ_ONCE()/WRITE_ONCE() only imply the use of 
>> volatile to access memory thus preventing the compiler to do weird 
>> optimizations like merging store/loads, moving store/loads, removing 
>> them etc
>>
>> They don't imply a memory barrier.
>>
>> Some systems need a memory barrier, to emit a "fence" like 
>> instruction, so that the pipeline stalls waiting for the store to 
>> "finish", for systems where the writes are posted.
>>
>> Regards,
>>
> Well, for the READ_ONCE() actually I'm wrong, it's overloaded for Alpha 
> and arm64 https://elixir.bootlin.com/linux/latest/C/ident/__READ_ONCE
>

Hi Yann,

I'll make a new submission with an improved commit message.

I looked at that ARM definition for READ_ONCE/WRITE_ONCE, and those 
didn't really look like they they addressed this kind of cross-core 
write visibility, it looked more like it was about avoiding read/write 
tearing. Read acquire and write release can sometimes replace explicit 
barrier instructions, but felt adding an explicit barrier was a simpler 
solution. If this were highly performance critical code, then the 
benefits of avoiding explicit barriers would be worth a lot more effort.

I know the ARM Barrier docs at 
https://developer.arm.com/documentation/genc007826/latest/ have an 
example under "Sending Interrupts and Barriers", page 19, that is very 
specific that a DSB barrier is required in cases where you write to 
normal memory on one core and then trigger an interrupt, and the normal 
memory is read on another core. It explicitly says that even if a memory 
write to strongly ordered memory (device memory) triggers the interrupt, 
you would need a DSB barrier. That example seemed like a very good match 
with what the DW i2c driver was doing.

I also found the video at https://www.youtube.com/watch?v=2I8OHacills 
had some useful explanations of when barriers are needed. It was a 
little puzzling in the video, it seemed to say a DMB barrier would be 
sufficient for this case, even though the ARM barrier docs say a DSB is 
needed. The DMB only stalls execution of memory accesses, the DSB stalls 
execution of all instructions. The Linux wmb macro is a DSB barrier on ARM.

Jan

