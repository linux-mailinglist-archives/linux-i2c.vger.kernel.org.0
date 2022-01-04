Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA404848A7
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jan 2022 20:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiADTe7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jan 2022 14:34:59 -0500
Received: from mail-dm3nam07on2072.outbound.protection.outlook.com ([40.107.95.72]:44896
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230041AbiADTe7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jan 2022 14:34:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAj6QzrgutdE8lTTQylnmGCfBYClFH3gmcoqfne/NXkTJiDVNvwEPmhtBlmXrYgHpOiL0eJThvZZN1GJ6h9Lz4HC2geVKXU9jYYUvFM68nlVDuQXrxgTgMch+niBnUrbo+id0ak/zf4LeAXQ9MydukSHSjRgp4ovjUhr76vXZdYXlvq9HvYuqTkLxP31+eIF1tiYdrvj5BazqmJ5+r9ORFtjGW9EXXQiJihsMs5i9nu/9ImRsjbfk/B5EBbsDzf8m9wyn2yTNx/7uEJWcmCTSK3Vk72qJhhNU2x7tJqoP8E+kYp1CuQ4yEOQkvu6ERXCGH2mm5X0N56mNatfln0YeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1lsqpzfRR4v37zro0Q4ZdkqaIKJR/CtjW14c/yvVr0=;
 b=PiYOp3ameduwAfB+LXc4Wwb3KbDQgmGGD0rfxfKlmna6+qB2PmJN50efl5MHWbd9stnN306NVhvHFCPdt4q3pu9K+B1gHxdietAVufW2j7MXcBEXAvjHmFIKDqwi2iRBok8A/XvdzDZDADLB6muB7rKOwlKbZ3YK0WJZE561n/3ykre1n6asu7cNIScfWwdTOTlTk08xzbuVoRyoV41qrQ/xdjZjNLUb4ti7ckiUTouvTI/4Iao5NjE9P95qy7LwM0lqgy4D6kPJyH8A74bqr2t683Z7vpTEc1nf0mTtBtaqdAlIp6eqZpTPugFFzWSxLqlOIOI2+VkpbDKoHSWs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1lsqpzfRR4v37zro0Q4ZdkqaIKJR/CtjW14c/yvVr0=;
 b=L+E3d+HNhrsYy/+h7dI7VJub5vSEaFo3MOZFbrW/NvgMgt4ezm2UaaIp2lSLjlh3CxtLuWTTrP/d1imXl6MSKKIMgpJWKMA3hNPPb7d+KfJKtOa7CLUWZCCB8JZ5+wveXJy+jhND194VYl8T79VO5nxUpj4QaoB018C4ea8LhJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by CH0PR12MB5057.namprd12.prod.outlook.com (2603:10b6:610:e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 4 Jan
 2022 19:34:56 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::4843:2718:efe2:f1aa]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::4843:2718:efe2:f1aa%5]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 19:34:56 +0000
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
From:   Terry Bowman <Terry.Bowman@amd.com>
To:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
        terry.bowman@amd.com
Reply-To: Terry.Bowman@amd.com
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
 <20210907183720.6e0be6b6@endymion> <20211105170550.746443b9@endymion>
 <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
Message-ID: <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
Date:   Tue, 4 Jan 2022 13:34:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:610:b2::14) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a3bf61e-6e34-4f52-6a74-08d9cfb949eb
X-MS-TrafficTypeDiagnostic: CH0PR12MB5057:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB50570323396A3B37B82A46CF834A9@CH0PR12MB5057.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CxBzhsvBHijbMRmcEODxrkOHyxwPTdM0glDvTOU73p1f+C9X4iPum3qq4UUYHE3BGDL1EtKkIPKcBKd/or2EKchzpU9b/iEANz2QDG1NYDHXvrLN7e+zmyV2LgpCG77U2aOm1G5Q6OhT0bYVOi+bEN3mqfg2ThebpqKIJBowGeT4rSkPmNnHGjWJK1IPJb3A4Cz12Ez51OH6supJkovlp0Qb2p+5IWB1Xq9wj1fcAUxfK3y+gZlcO16IBIU7ryqzNQzbwYTYnA7nFTwW2Bu7FZ0FCfLddiAsRmPFJNBpwYA74/N4raWW6/4V3YzDJA4b1CXHvXWoOdIV5+LU2aDpG6t8TIyKiVIWrdhzDV/1VyE0RrmQiawKsOsWAfy3idpOKL1SFivPAn3cB1dK6uUhUnW1Lk7ZaRCBVNy7icolIyEb9DZCZUABCa12fxdjsF8cd0Z23svrYiu/nEr/tblo3/tw1Fi+p36SWEWhc1SXj/KSo5ZxPkP000pHUkUijlZfwdgSr0V7YScj8XtegC6R5YKJ2pOaxnaxKt5r/iHlWiPlXF8Xvb2iqWy2UosFCKqKzxljiggBzW0506hI+8ff+qxwOsIsl08Uz47yBMY8m/PrXNp1gIJxSFvTYR0TNcZ7bw+J3Sc4F27s/GogX1b6MzhCFhAIXDmndfRWDHoIdNL2dAfsxSd88KXpSmG8q/7zNmwSofbheW0pGeT48NGmkIDFu/V2J5bB7NQjcmUalLwv45jX6TguGT/nQCwTg7A2VFOrrAnn+GvRk86B2sYXbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(36756003)(3450700001)(38100700002)(186003)(53546011)(8676002)(6506007)(86362001)(31686004)(2906002)(8936002)(316002)(66946007)(4326008)(6486002)(2616005)(83380400001)(31696002)(110136005)(6512007)(5660300002)(66476007)(66556008)(508600001)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpneVAzTWtQZWNHWkxheDZlaTE0Uk1YZWp2cC8zcEcxaTcrM3h2bHJiZVRS?=
 =?utf-8?B?bTlaZWJSWW9JS1RSamg3UjNGRFU1dUgwZW9mcmxZT2lxbFQxbjRwSEd0MEdy?=
 =?utf-8?B?KzR1WDlwOEUxM0l5b0Zhc0wyNkxsV1hIZ0p2akR1RDd1bHlXcitoTm5PSnNN?=
 =?utf-8?B?ZExFU3lyRkppMHJueWpzR0xhYzBXOEp3Y3o2aVd2eXZoQlNEU2FNMFgwayt5?=
 =?utf-8?B?R0plZlZ0bzBDS3phRlEwSzg1WmlrMVlvdFNJcWtCTlo5N0s5MEN6RWhWMXpi?=
 =?utf-8?B?b216ZlRhUWZJYlpCTFp0Zjdtd2R6bjR1ZFU5NlhRb21JZ3lJR0JDZ0hXR1Fi?=
 =?utf-8?B?cTlSMHZRdXZseUNmK1Q1ajl3V2VJbFBCNm4vanZQWnM5aFRTeFpsSmlLVG5C?=
 =?utf-8?B?eW54WGczMzFTNmpYMmNPTTR1TG9TRmJDMi9BcVIxclNheS9rN0c3b1RTaENI?=
 =?utf-8?B?RStKSUswYkxoRXBNNEZnODVuVFZBWWZUM1hxUFYzNnpaamEveHF4K1FaOTVt?=
 =?utf-8?B?YmVRWW9iSStOeTNpTzI1UEN3ZGprdlBVQ1VFK1RuSDhjZlRFb05IQmNwVnFZ?=
 =?utf-8?B?T2dzdlYvSE9ZMzVZTWlQSDRGYytNNW1sQU45ZUlwcmh6NEtRVmpHYThycE1m?=
 =?utf-8?B?eXFqOVk1V1RiQ2JhK1ViOHNORGw2U2tnSzFQcFpVSGEwS1dCVllkY2RNbUk0?=
 =?utf-8?B?WFNhU2pJbU0xNzlDbnRlTEVuUVNxUFRYYnp0ajlaVU9SQU1jZWduL3FHcHIx?=
 =?utf-8?B?Unkwc0FBYS9SUnlKVlJZR05LRTI5YzRJT2UwRk56U3JBQmRzVVJ6ZU94M0xj?=
 =?utf-8?B?Vy9VY0kxOElkeFYzMzFRMUQ5ejFaQkVGc1R2MkxmK0FRMm81U3hRWFlwWUN5?=
 =?utf-8?B?TlZybUUxeHROWmV5djNGaVNnNyt5NzRXOUpaUW1BRlMrb2wzQzVzeGNkaEw0?=
 =?utf-8?B?WCtZMzEwZzdGSHRQU2lzaUp4SHZKS0tDRFRFMVlWVzBrTXg3S1VOdjBlMTg2?=
 =?utf-8?B?alR3MnIzU3h2NjBJTTZ2L0pxSnNwQ0YvdVNKb2pkT0R5YUorZVJTWmgzTUJw?=
 =?utf-8?B?MXM1ODB4Z1FieE91SjN0ZzJSL0dmakI0b0FVallEQ0tZWTN4U045M2wrVFpS?=
 =?utf-8?B?aFJaM2pvaHA4Z2orTE9FZkQ1S242WUxNOTB5WTY4ODFTWnZFaktxSDlnNnR6?=
 =?utf-8?B?b3N4SGxqanFvbHd0VktMRVZRb2dQN1BwWEJ6amtHZmF2dmRJSGthWDNMYnhz?=
 =?utf-8?B?S2V1QWppS0lqSVV0QlZVOHF6THJ6cC8xempiV1QyTHYxRjJQeFVadTdNVE43?=
 =?utf-8?B?RWZTeXhyMmxzUVJsenhQbTJDMUh4aHlLcDRJQ0VheUVoR0JRR0RXYks4cU0v?=
 =?utf-8?B?dVVGRkMyNTBveWtXcmYrZDNpMGpqVk5pVWRKbU1uYm5SUnA0d1dZejRtUXlT?=
 =?utf-8?B?Y0dzYmlIQ1NWejFzTW5wWWJ4Znk1QURlTmNSMHI0dVVJY3pJTkdWWlNQK212?=
 =?utf-8?B?SlVPenQvMWlWNS95MmMwRnpVN3Jxc3gyWCtrYkFUSlZGMmx4QjBYdHNROG9P?=
 =?utf-8?B?TDhMa2pjRnZDQUttZHZJN2tDRXVhYktGOFV6TW54RWpIU3pqSjBERmF2L2xu?=
 =?utf-8?B?QXZ3aUVqTTU3MlhaV01abWh0NXlsbk5renhYanV4UEZOWFExeUh2QklrU0FL?=
 =?utf-8?B?TEdiRkpHYUloQjJiUjR3cjg1TUtzbXA2RXFGSlJ4dHJVczVNMVRNY0J2eWNO?=
 =?utf-8?B?LzVveHFEQTJkdU1BajV4TWZ4NkRkdU5RNllBNHR2Y3JDNU1yZHhUWWYyQjVQ?=
 =?utf-8?B?c2pvMUdpcUdVeEFIb1lhcEdhV2E2TVJEelk1aGpjNk1nNUlxRmJSaDlwR3g4?=
 =?utf-8?B?bzVTam5INENxT1N2RU8rUkk4TUdNSTEwOWpqVkZZbzdVL09SMXgwR2NUNUdq?=
 =?utf-8?B?S0xJdjRTQUNyNkkwRTI2UDQrUm05Y0xJNGk1UjhPcGhuVzlOMUdOYmxnUnlk?=
 =?utf-8?B?ZEV0WndSYUNweWxNcFZwd2dpbDg4ZWNsOFQ1c3RMZjYvV3BLTW96ZHh6Smtx?=
 =?utf-8?B?UFpSZjR1UVlTOU5XTHRkamxWWWhPclJLZjZMdkpkcEUxeTVuOEZuV25PQ2E0?=
 =?utf-8?B?TDhOMEFnN2RvY1hDaDJSL01WdkhaMW5ZN1Z2RDNsNlBvMGpYclhRQ0Rua3Z3?=
 =?utf-8?Q?2F9emJOpXN3n2nJAV/1WeEU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3bf61e-6e34-4f52-6a74-08d9cfb949eb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 19:34:56.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gv349P86u/jUSpEOm3BOhIF6vFgAiHOl5zur+jwLG5cBMA/4UfQSOkQgkl+o/SlTmt/28WJMSIqWHqPR9usOIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5057
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean and Guenter,

This is a gentle reminder to review my previous response when possible. Thanks!

Regards,
Terry

On 12/13/21 11:48 AM, Terry Bowman wrote:
> Hi Jean and Guenter,
> 
> Jean, Thanks for your responses. I added comments below.
> 
> I added Guenter to this email because his input is needed for adding the same
> changes to the sp5100_tco driver. The sp5100_tco and piix4_smbus driver
> must use the same synchronization logic for the shared register.
> 
> On 11/5/21 11:05, Jean Delvare wrote:
>> On Tue, 7 Sep 2021 18:37:20 +0200, Jean Delvare wrote:
>>> More generally, I am worried about the overall design. The driver
>>> originally used per-access I/O port requesting because keeping the I/O
>>> ports busy all the time would prevent other drivers from working. Do we
>>> still need to do the same with the new code? If it is possible and safe
>>> to have a permanent mapping to the memory ports, that would be a lot
>>> faster.
>>>
> 
> Permanent mapping would likely improve performance but will not provide the
> needed synchronization. As you mentioned below the sp5100 driver only uses
> the DECODEEN register during initialization but the access must be
> synchronized or an i2c transaction or sp5100_tco timer enable access may be
> lost. I considered alternatives but most lead to driver coupling or considerable
> complexity.
> 
>>> On the other hand, the read-modify-write cycle in
>>> piix4_setup_sb800_smba() is unsafe if 2 drivers can actually call
>>> request_mem_region() on the same memory area successfully.
>>>
>>> I'm not opposed to taking your patch with minimal changes (as long as
>>> the code is safe) and working on performance improvements later.
>>
> 
> I confirmed through testing the request_mem_region() and request_muxed_region() 
> macros provide exclusive locking. One difference between the 2 macros is the 
> flag parameter, IORESOURCE_MUXED. request_muxed_region() uses the 
> IORESOURCE_MUXED flag to retry the region lock if it's already locked. 
> request_mem_region() does not use the IORESOURCE_MUXED and as a result will 
> return -EBUSY immediately if the region is already locked.
> 
> I must clarify: the piix4_smbus v1 patch uses request_mem_region() which is not 
> correct because it doesn't retry locking an already locked region.  The driver 
> must support retrying the lock or piix4_smbus and sp5100_tco drivers may 
> potentially fail loading. I added proposed piix4_smbus v2 changes below to solve.
> 
> I propose reusing the existing request_*() framework from include/linux/ioport.h 
> and kernel/resource.c. A new helper macro will be required to provide an 
> interface to the "muxed" iomem locking functionality already present in 
> kernel/resource.c. The new macro will be similar to request_muxed_region() 
> but will instead operate on iomem. This should provide the same performance 
> while using the existing framework.
> 
> My plan is to add the following to include/linux/ioport.h in v2. This macro
> will add the interface for using "muxed" iomem support:
> #define request_mem_muxed_region(start,n,name)  __request_region(&iomem_resource, (start), (n), (name), IORESOURCE_MUXED)
> 
> The proposed changes will need review from more than one subsystem maintainer.
> The macro addition in include/linux/ioport.h would reside in a
> different maintainer's tree than this driver. The change to use the
> request_mem_muxed_region() macro will also be made to the sp5100_tco driver.
> The v2 review will include maintainers from subsystems owning piix4_smbus
> driver, sp5100_tco driver, and include/linux/ioport.h.
> 
> The details provided above are described in a piix4_smbus context but would also be 
> applied to the sp5100_tco driver for synchronizing the shared register.
> 
> Jean and Guenter, do you have concerns or changes you prefer to the proposal I 
> described above? 
> 
>> I looked some more at the code. I was thinking that maybe if the
>> registers accessed by the two drivers (i2c-piix4 and sp5100_tco) were
>> disjoint, then each driver could simply request subsets of the mapped
>> memory.
>>
>> Unfortunately, while most registers are indeed exclusively used by one
>> of the drivers, there's one register (0x00 = IsaDecode) which is used
>> by both. So this simple approach isn't possible.
>>
>> That being said, the register in question is only accessed at device
>> initialization time (on the sp5100_tco side, that's in function
>> sp5100_tco_setupdevice) and only for some devices (Embedded FCH). So
>> one approach which may work is to let the i2c-piix4 driver instantiate
>> the watchdog platform device in that case, instead of having sp5100_tco
>> instantiate its own device as is currently the case. That way, the
>> i2c-piix4 driver would request the "shared" memory area, perform the
>> initialization steps for both functions (SMBus and watchdog) and then
>> instantiate the watchdog device so that sp5100_tco gets loaded and goes
>> on with the runtime management of the watchdog device.
>>
>> If I'm not mistaken, this is what the i2c-i801 driver is already doing
>> for the watchdog device in all recent Intel chipsets. So maybe the same
>> approach can work for the i2c-piix4 driver for the AMD chipsets.
>> However I must confess that I did not try to do it nor am I familiar
>> with the sp5100_tco driver details, so maybe it's not possible for some
>> reason.
>>
>> If it's not possible then the only safe approach would be to migrate
>> i2c-piix4 and sp5100_tco to a true MFD setup with 3 separate drivers:
>> one new MFD PCI driver binding to the PCI device, providing access to
>> the registers with proper locking, and instantiating the platform
>> device, one driver for SMBus (basically i2c-piix4 converted to a
>> platform driver and relying on the MFD driver for register access) and
>> one driver for the watchdog (basically sp5100_tco converted to a
>> platform driver and relying on the MFD driver for register access).
>> That's a much larger change though, so I suppose we'd try avoid it if
>> at all possible.
>>
