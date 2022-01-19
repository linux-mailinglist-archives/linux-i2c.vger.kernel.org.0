Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1564F493EAA
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 17:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348542AbiASQ5x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 11:57:53 -0500
Received: from mail-bn7nam10on2071.outbound.protection.outlook.com ([40.107.92.71]:59456
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346701AbiASQ5v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 19 Jan 2022 11:57:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt2GWb0zgdkFnwmVaQyH6d5QK/amtCBCspUq8J+iu2gF5MJznWWHD1Yyyn2MpDCyKROXify+Vn2QNQ8yspXSzLFHc60ID8S+XjCl9XCSiMdNmWWTJqfQHoHxeC6sVW07EfnBhl6bmY1XTr1Yg+ujgZw2bn/tNGUq3eIG86kouR7KNPmQsaSVo29XYRU9mYqypheNGI9Norm0JAxEt1ishIggM3kf9+hITTFDOu1UGqOyJP5+6KLCjoQS78xJtMGh/FK9wJFE7gi5a8YFPrSNxyJaYV4U2TX6z802x+Wo0SvKjY6HVmNQqe2u/f2d0KajztElJDxyJ0BJQEQkj+t4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDvtMjfBuQAWrUj2MzIhQlJDWYMwlfjrTE6CgfXEh14=;
 b=h7AY7YbZVKBFCG2stzDAg7adV5z/CKXS0vwg9n2y7xInx7ICi7TVS3oHRA+QCFWWMuzYYdGzziP9EvAHvDM9310+CLKHCLLjqdGJxcZ2jv/kQzH2y7Bf21ydWKP4cMQ+PG4ottUPmmUca19PKqp9l4HAdmPUGVXXiQp4Yw/dwgZ7zpIGS/P7kEOuJyNCnOFkCqZSm7qC/BnYc2U/L6KaJq0ZXS6kJM/Pue2luk/NPtt9XBb3UHDCQO9S3Mpc8IsgueIt1IkZ2EiZFEnN4g93knoY1t9+5wawxwc9brMQP55aIYFKHri8vQQwadOoy8nHOpppx/Etvxbwe8WmVVCK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDvtMjfBuQAWrUj2MzIhQlJDWYMwlfjrTE6CgfXEh14=;
 b=o+X5knvoR1bpjJsMzJ3qfTPnjGZ52xEYWDJKc3yLPMGuXHbQ19JhMbjpaItD31bwKYSmBJh1vYg1rMtAWmHewAFOCc+zWdT1YQwynuZLIlnHfM8fW8FmqQhAoi54JAhd6pirsK8TjDIculRrvKH9/1RH5QlVGNj6fGVKUxKqogU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BN8PR12MB4785.namprd12.prod.outlook.com (2603:10b6:408:a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 16:57:48 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 16:57:48 +0000
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220118202234.410555-3-terry.bowman@amd.com>
 <CAHp75VdBFN+QMJpYDp8ytGGrBKYyjxU8u=Xrn44Lc3UGLPRQOA@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <b609230d-37e5-d7a3-3dff-5980c1cca5f7@amd.com>
Date:   Wed, 19 Jan 2022 10:57:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAHp75VdBFN+QMJpYDp8ytGGrBKYyjxU8u=Xrn44Lc3UGLPRQOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:208:e8::16) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b171e46-0d2a-4cfa-2da9-08d9db6cd214
X-MS-TrafficTypeDiagnostic: BN8PR12MB4785:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB4785B0747531C56EBB4928E183599@BN8PR12MB4785.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFTlHWwQGuzg5pd4qFyg2gSFnnLImmHSkLnnbDeCH0MxH4gDP0/6AsnBoYtvIZHAxQgSNCmzDwwrBP1sNk2FpATg3RxYElmYchLLHLXgE513LbeEyNWUoSoVyG7RugZKMRyLVeXB09hHVu/1CQB7yrI/kE9rMbd7eSHb7YlN9OYfQKxJg7zHEn681TruCnGfUBmp9DUWI8MY8+Hb4/6V+E9r70eYXkmgXabqzH3ldizmL6A5UH4CMUNWvBphp+F19t2tLlYBcx/mVsmx/hYQ1vvPK+T4B+5ZSw0UnOo+Oa653Qeft//WO4mOJlEG9bnG8PfFpaOfLg2S3ZdcBnZYf8nGXj5agQGpK/+q53vzZwSeR4PUNlGrH+pElDJNpcEoiAJ54Yzk3BqdgxTmddICMTJU2xdiuTJfO/pZZ9ShgooSDjesfUSiebDZgj6MuZ9pMgKCJfZlyXBDj9qtKA6AcN1f8Yj4T11cRWwpsmRxA4yk8ZHfsfZNkMdTUBqWYegYH6gOGHFHC21DZyiQs3IYo1gyei6+oVdLdcLkaZuJz0vVOH+qaIq9gC9ni3nwdMcIUp/N1z7villv0DEAS9hRbwNE90iocAuDqIR1XVLcwl6OkUlFo/kszRnl+kQHcE49XBdLu2LejVTikCittFc794acau3r8lqny74KxWykZaKFG4dIG81W+FVyuOm4oYWyj/lHFmQz3Em4yKt2u2Se2iBRGs5FWimjgmhftI8wce8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(31686004)(54906003)(4326008)(5660300002)(83380400001)(6506007)(53546011)(316002)(6666004)(31696002)(2906002)(38100700002)(86362001)(66946007)(6486002)(8936002)(66556008)(66476007)(36756003)(26005)(6512007)(508600001)(2616005)(186003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmVHa1VzalpyYk0rTkxmWUxPY3RsR3orb29nenF1citqU2NzTndyY09DVTRZ?=
 =?utf-8?B?NHV0WGxsbTFxUGROMm9WN3Jwd2UwZEp1Q1JqZjNIeStiOXlkOVFsMmhZNFg0?=
 =?utf-8?B?RzBZK3F3WVpsakk0RzYrOFpHNHFZQXppMTlzUUpNR25xRUZkY2MxZ3Y2cUk4?=
 =?utf-8?B?RTlkZHU5aHk2NUYrRk1xbExMamJxVWF2RlJ4SStQVngwbng1Y2ttQ3k2VXZL?=
 =?utf-8?B?cHNUVTJqVldZanNSeGJtNExHMFNLcUtRQkpaY1dHNlE5Q2J0TlQrWGZNRHN6?=
 =?utf-8?B?WFFVa1VScSs4WVBIVVBiUHA2dDVIa3FHdjFYRDZiTC9ZRis2QWRDTU85YnJO?=
 =?utf-8?B?blpDZURRSFZtbE5CbE5DUVp1SEFnYks2VVNuMW53L2lEUE04dWJGbk8zSWt3?=
 =?utf-8?B?QU9jaStQQnkxd0lqeGFpYThjUmYwTWFkY3dWcUNmb3dzbnVlN21LMmJCZyta?=
 =?utf-8?B?aWR4c0VCVzFNSlJpbkVUaXF0RmlVYisrYlNXUWVETnFpa21mUmFyMzB1TXUv?=
 =?utf-8?B?czc2bDF2d25SQmhQT09ya01RcHQwWkwyaWRIUXY4YzdKY2Vha2ZCZnNFZjEw?=
 =?utf-8?B?OFJ1cjBPbHdvUTFEVHhQcTVEb3VEVDlOTXBGSGl0RTNmYjluS2k0Sk1idUJM?=
 =?utf-8?B?K2JkR1U1SnZ2SmVyRVlHVm1GUXJzWGR1d0RGaVQyVzdRS2p2VzZWS09aSEEz?=
 =?utf-8?B?ZlQ0UWU2VzZYdlVpYnlFeFREUkt4WXd0Vk5SLzZCWXNFQ0dFeU14dCtTYW0w?=
 =?utf-8?B?aDU3LzE3NmJmeTliSW9FM0RqYlRuTCtWeCtkTHNxTFdHcnRWWVRzM0FjcDVO?=
 =?utf-8?B?ZUZ1ZCtRUlhBTW40TVFjRnMwUTJ2ZGZ4U0t3SmRzY1Nqa3F6YmsveVBhRkc1?=
 =?utf-8?B?RUYvOVlkSVg1VkJzdlRkdlVHQzhjMzkxVG8xc2lxZjZCVmdOaVJyOUNrYWQ2?=
 =?utf-8?B?aVdXdlNvV25qRHJqbjUwWXdOd3c0aytRa25rU0lqQmIzMHdHOVdOSFBNeFJj?=
 =?utf-8?B?NXdOeVBLV01ISWplN2JFUVVIU2ZGMk8wUHpHWEFlQXg4TnRqL2doK1NZUjFK?=
 =?utf-8?B?TVJJVVp3U2FvV1F6bFk5SDAwNCtWaHBERWxHUFZzTm0vekozeURlT2I4NVNV?=
 =?utf-8?B?b2VkSVNJS2F3aUJBMnlKdWZzaXNYcTZwTmVXZVRUeHZIS2VDV1VaL29KZUJ0?=
 =?utf-8?B?QlA5Z3h0M3Zxbmw1Umx1Nmw0N2FJYkpVdWJKWmlsY0ZSak1lMnlkbXdlOHRY?=
 =?utf-8?B?bFVGc1A0b1g3djBVSnlWa0pidHIxWjRxYml3aHgvZ2RTU0xyd0QwOXFPajJq?=
 =?utf-8?B?c2phOGY2N1ZGalZQcFNuRXBBYWFMQ3FRd0hRSUp0UDRGKzFJQUZhbTI3bWph?=
 =?utf-8?B?SFJhQ05yNWdmTVFHTmZXeHlXVnE3WTZiUGlCWEJGUXlWOU01WUEwUStxK0FG?=
 =?utf-8?B?ZWdjM3BOdm80NG5MV0FiOTUzMU54L3NuMytsZ0c1Z1dkYyt1Y29zUXI1Ullq?=
 =?utf-8?B?c2xuU2N2T1V4MzFCVHdMUjR6WW9sYWRnWFFmWjNuLzZybUIvVnBEdjF2dFhO?=
 =?utf-8?B?MldOVlpXUjNPV2hXc3NxWStDR0FjRGJHc1Y1V2pOdDBFcVRwZXlIMXFGOWtH?=
 =?utf-8?B?SDBGYUtxd21mVXgybTFNV1VGVDNlMTZPMUE5bndDTnlSL3RPN2lPRHZ1RUpS?=
 =?utf-8?B?S1V3My9iSUk4S2VHa2gwUmIrSXN6Vm5HYmhuaUlzUlp4Z3plSnJMMFJka1hn?=
 =?utf-8?B?VnNOMU1hMVBpSXNzK1Q0Zjlrc3BWalNaTkdZMUgxdVR5T3Qrb1RVVWZXMzdp?=
 =?utf-8?B?ODRCVlpWRk9OMFY5OTVnMFVWbFE4WmtMMUJpbXV6MDFQaitCaDBTL24zLzRN?=
 =?utf-8?B?NVR6bGRzZ3dMZHpjVGI3bkJQYVlTNDNKdTNNR0x2WTJOdDZoRS9LcFFIdXo0?=
 =?utf-8?B?STZidVpjeEdTMmdJTm9wdkIwRGZnUlZ6cm5Cd3NLRllSQytFY0dlWHVJbVl5?=
 =?utf-8?B?MlZIQ0x1WlRBcGVFY0hCT1FLRzdUTzQ1QjNVSENldkdEQmh3Ynd5V0pwa0xI?=
 =?utf-8?B?dW4zVWhGcnFtQXZTcDVMYjhtYVl1SUJVMFQwaFNVSUwrOXRPczJlM1h3cDFr?=
 =?utf-8?B?K0NtTWFVWTJwL3E5TVpVYnVoTjhiMXU3YVVCb2Z5UFJWNDdqYmFJdFZyN2tu?=
 =?utf-8?Q?XTVPG+WIbTWwqGr9lF2G3sc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b171e46-0d2a-4cfa-2da9-08d9db6cd214
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 16:57:48.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6P3nIlD+/Rj0QMV14CzblTM0HZko+5SU3VX8QLDWomHIylMKNMGdi1vHMB2GHty6P4OS+HrzlD8ZR05M5VmnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4785
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/19/22 5:53 AM, Andy Shevchenko wrote:
> On Tue, Jan 18, 2022 at 10:23 PM Terry Bowman <terry.bowman@amd.com> wrote:
>>
>> Combine MMIO base address and alternate base address detection. Combine
>> based on layout type. This will simplify the function by eliminating
>> a switch case.
>>
>> Move existing request/release code into functions. This currently only
>> supports port I/O request/release. The move into a separate function
>> will make it ready for adding MMIO region support.
> 
> ...
> 
>> To: Guenter Roeck <linux@roeck-us.net>
>> To: linux-watchdog@vger.kernel.org
>> To: Jean Delvare <jdelvare@suse.com>
>> To: linux-i2c@vger.kernel.org
>> To: Wolfram Sang <wsa@kernel.org>
>> To: Andy Shevchenko <andy.shevchenko@gmail.com>
>> To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Robert Richter <rrichter@amd.com>
>> Cc: Thomas Lendacky <thomas.lendacky@amd.com>
> 
> Same comment to all your patches.

Ok. I'll reduce the patches' to/cc list to only contain maintainers owning
the current patch. I prefer to leave the lengthy list in the cover letter 
if that is ok because it will not be added to the tree but will provide 
context this series has multiple systems and may need communication 
between maintainers. I'll use the -to & -cc commandline as you mentioned to 
send to the longer list of recipients without cluttering the patch. Let me 
know if you prefer otherwise.
> 
> ...
> 
>> +static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
>> +                                    u32 mmio_addr,
>> +                                    const char *dev_name)
>> +{
>> +       struct device *dev = tco->wdd.parent;
> 
>> +       int ret = 0;
> 
> Not really used variable.

Yes, I'll remove 'ret' and set hardcoded 0 return value below. 

> 
>> +       if (!mmio_addr)
>> +               return -ENOMEM;
>> +
>> +       if (!devm_request_mem_region(dev, mmio_addr,
>> +                                   SP5100_WDT_MEM_MAP_SIZE,
>> +                                   dev_name)) {
>> +               dev_dbg(dev, "MMIO address 0x%08x already in use\n",
>> +                       mmio_addr);
>> +               return -EBUSY;
>> +       }
>> +
>> +       tco->tcobase = devm_ioremap(dev, mmio_addr,
>> +                                   SP5100_WDT_MEM_MAP_SIZE);
>> +       if (!tco->tcobase) {
>> +               dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
>> +                       mmio_addr);
> 
>> +               devm_release_mem_region(dev, mmio_addr,
>> +                                       SP5100_WDT_MEM_MAP_SIZE);
> 
> Why? If it's a short live mapping, do not use devm.

This region isn't short lived. This is a region request for the 
WDT registers used through the lifetime of the driver.
                                                                                
The short lived mapping you may be thinking of is in 
sp5100_tco_setupdevice_mmio() from patch 3. The first register in 
this region is FCH::PM::DECODEEN and is used to setup the mmio_addr
and alt_mmio_addr MMIO (longterm) regions.

> 
>> +               return -ENOMEM;
>> +       }
> 
>> +       dev_info(dev, "Using 0x%08x for watchdog MMIO address\n",
>> +                mmio_addr);
> 
> Unneeded noise.

This was present pre-series. The current driver dmesg output with default
logging settings is:

dmesg | grep -i sp5100
[    8.508515] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    8.525172] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    8.539912] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)

I'll remove the dev_info.

> 
>> +       return ret;
> 
> On top of above it's a NIH devm_ioremap_resource().

I'm not familiar with NIH term. My friends google and grep weren't much help.

> 
>> +}
> 
> 
> ...
> 
>> +       int ret = 0;
> 
> Redundant assignment.

Thanks. I'll leave the variable but remove the 0 assignment in the definition.

> 
> ...
> 
>> +       /* Check MMIO address conflict */
>> +       ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
> 
>> +
>> +       /* Check alternate MMIO address conflict */
> 
> Unify this with the previous comment.

Ok

> 
>> +       if (ret)
>> +               ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
>> +                                               dev_name);
> 
> ...
> 
>> +               if (alt_mmio_addr & ((SB800_ACPI_MMIO_DECODE_EN |
>> +                                     SB800_ACPI_MMIO_SEL) !=
>> +                                    SB800_ACPI_MMIO_DECODE_EN)) {
> 
> The split looks ugly. Consider to use temporary variables or somehow
> rearrange the condition that it doesn't break in the middle of the one
> logical token.

I'll try splitting at the '&' as Guenter mentioned in other email.

> 
>> +                       alt_mmio_addr &= ~0xFFF;
> 
> Why capital letters?

This was already present pre-series. I'll change to lowercase to make it 
consistent with the other constants in the file.

> 
>> +                       alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
>> +               }
> 
> ...
> 
>> +               if (!(alt_mmio_addr & (((SB800_ACPI_MMIO_DECODE_EN |
>> +                                      SB800_ACPI_MMIO_SEL)) !=
>> +                     SB800_ACPI_MMIO_DECODE_EN))) {
> 
> Ditto.

My understanding is #defines should be capitalized. No?

> 
>> +                       alt_mmio_addr &= ~0xFFF;
> 
> Ditto.

Another uppercase constant I will make lowercase.

> 
>> +                       alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
> 
> ...
> 
> Okay, I see this is the original code like this... Perhaps it makes
> sense to reshuffle them (indentation-wise) at the same time and
> mention this in the changelog.
> 
> ...
> 
>>         release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
> 
> Is it still needed? I have no context to say if devm_iomap() and this
> are not colliding, please double check the correctness.
> 

Yes, this is needed. The release/request in sp5100_tco_setupdevice() is 
for the non-efch mmio layout cases. It is using port I/O registers to 
detect mmio_addr, alt_mmio_addr, and configure the device.

Regards,
Terry Bowman

