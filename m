Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA50468FD25
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 03:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbjBICaw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Feb 2023 21:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjBICaZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Feb 2023 21:30:25 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F1F298D3;
        Wed,  8 Feb 2023 18:30:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA5D14TxqGbc9VqyYnmmrlNo9T1bPtJ28ReJV5kWl1vtDatArBjtG6dQSJl7Z6Q8H/EZ7EKxJGLax9XHa430ZPwWMvWUEfwVBK8OG21b5aJXBNgmZksVxDPuMmOGKyrHQR6VIMDM2Qplmpi0EcdpgsAiGD/fGY07X699C/7JO8sRlzxgVsRC3+iyBAYZb/hHlbHNQStQQGHTivo0f4ytl8LOoFPj0zVmYq1Eb9ZBpbhgTgQGU3H2rvLyGK0gtpw3+mJ1qeP550w1yOlZrxCwIi77Mw7DLiGfQ3568eOwCSScf9kyN4mtj3gjiH3L2prfup3oMcod2jKcu3dMnUypTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plRQxGLHBG83GxP1tZGDFLCqUCZiNlBJMhYp6Yw5X0I=;
 b=G68QgSDFaFwX6kevWWlDKkA8Vph3AHDalXHzXX3XfH/apa4Udbo6tYs5H2Q/QU+Potl71Ez1jEBgwR8mDvHN/Rclsb1zWR6CE8gyoyEeqfrfEwsGlQ9jk4uG6w0h3EJTcXiHS+GRDFnS/9TCS5vMxCYObcxQjYu7FK8wBZy6bJ9yONqT/tbF5lH2Lrpluuo4dWUsM+Z7W8zgYDfvAbtLKy2JhczzkBRLAgt9y5hXc4gQ3uyGSUNdzLQXTeop4/Eiaf8ONZKz2RfOz+tIfxN2mIrbmfNjArZ4gngLo619KHE2y8tuDWLDfliGPIDpRjjGMe9Hal9gOghRglftXe+gGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plRQxGLHBG83GxP1tZGDFLCqUCZiNlBJMhYp6Yw5X0I=;
 b=vaVbybcHOg73/wYx7uNumUOJyBPNxcj4IHwZzP5UdTSZIFqEp//7KrWnyjapnlEsmUTJS93o7XqF28DpEvxbMTsgh8+iJe+7F85qEYyZBJbu9E/tPdnTAJAB+McRC25ekCgf7U9Axain+ElaXJGlWteXwrlh97ekK4a1OM0xax0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BN9PR12MB5180.namprd12.prod.outlook.com (2603:10b6:408:11d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 02:30:18 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%6]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 02:30:18 +0000
Message-ID: <a93d84ca-c7e5-1936-863e-444a3d7f5a92@amd.com>
Date:   Wed, 8 Feb 2023 20:30:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Content-Language: en-US
To:     Raul Rangel <rrangel@chromium.org>,
        =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
 <Y+NH9pjbFfmijHF+@black.fi.intel.com>
 <b429918f-fe63-2897-8ade-d17fe2e3646f@linux.intel.com>
 <CAHQZ30C=_aS+FefChYZFAG4vNbFZofh=wpP2mBGbfW1JTD3D_A@mail.gmail.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAHQZ30C=_aS+FefChYZFAG4vNbFZofh=wpP2mBGbfW1JTD3D_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:806:130::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BN9PR12MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: df869c13-590e-40eb-391b-08db0a459568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBO45iBlhh8lL6fl258WBRtzJc1gwWqZjHGlsjZqKau8c8BLgRHPfKp6a6J8wv689ukygRkzUr5vsuq+Oj+JHm0SX9wLoZ1esjgdSDuSx0E3EwsL8Zj6/4ob6VHglrpDmPGhmQlqNxNUeoXuZvAODr/AwYk42M6y45c+dVIt6nyyqLalESzo52/M9C59h4UBfSCcSj+p9l5hxaZhN3yVRIihrcj+WeTxr3LBOMktixJqPZA1qHTnLUWiebeY0FssVIdHc1O1/lHcLnfLUHqOO7/11h0WowioL7DjlFoaEWZVHivmJB0nNXC3Ty1mhPytZWoyqthxpc356jiiyPpkAvsmXwYwL/5R5BhlkekuiVFTYmNV9Qy26/+PSoKd5TEQWCjokRvbB0S1NRpvmkE9Ig1nZaFsRh8BLtuND0Tgyq8zIe/czCRFVZgKfwKp1epH9LzNGpnJHLL+6wGO64hJ1Bz68DP76BV9isAZrR98TbnGtFZl/3cBOHYMjKkyZzrUCcxRGC6BZb5ZNjYFiyZJULvCEHaLOTFsXotOI4Ojla+c/ERE7j4wRCHIWZJvAc/Rq5ndO0sZOGuXXwf0gNMeGTgf6tRR0cqkYHf6JENdbxpL59y5PWeE5cH9J5JxlU6J9Wx9jaVWCRGidU9WPhQOuhwYMIr4dD+6ji6JuCOWXurt7ZoPNdSLoNURKPX6rVJ7DVi+NT3ulk6B3eM/8AZj6DRTDa6HUNhArH3Q+lo/BE2aQBCZgSia7wnSm1FFn5kPCY3sBfmlrKJLFY4VS+4v28XWnVdBaUH0kKJe35h/t9hv1YFrPsIgFXaC49ggt4gf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199018)(66476007)(4326008)(66946007)(8676002)(31696002)(38100700002)(316002)(66556008)(66574015)(83380400001)(110136005)(54906003)(86362001)(5660300002)(6486002)(966005)(478600001)(31686004)(44832011)(53546011)(186003)(6506007)(6512007)(36756003)(6666004)(2906002)(41300700001)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHN5RElFMFdXMHlLR1dDdnl1VUxyaFFwcExuMXE1Q3ZuaERYU0t2S0xjVnRl?=
 =?utf-8?B?RjRVUTNFWGQxemNnQmYzQVNscDBoRGlmMSs5WEVCMG9QL2ZZRmlONlhMaS96?=
 =?utf-8?B?cFU4SS9WTUdPZ3pSU3BKOFBSNEJ0ODlIRVVVWG1mdGpzSGhDZTQzNkxnMFh5?=
 =?utf-8?B?NUQ1blZ3aUNYZmdxU3NYZVRldTFzcGR3Mmk1azJjaER4cGpueXlSWTJ4K0hO?=
 =?utf-8?B?Q2c0Ylo3WXc1ZlZaMkxzbGR2eE1zTFlycnFhOExSeUVtVGZyblI5U3dlcXNN?=
 =?utf-8?B?alZ3ckd0dDRkaDlhR1NHTEFldWlyeTJEZDkwV0JzbTFPMWI4S1dxZUY5V2RR?=
 =?utf-8?B?b3FhQWRsSS82bDJ4aVZhZGg2ZGxuTllFK2h6NXptQWJNMW1pSS9wNXNSY2Vz?=
 =?utf-8?B?N0o4a0NyejczRXNrUENxZWt1azV5QWx6RlhsY0FUZnNBeFhieHpWejFvUTRJ?=
 =?utf-8?B?WWh0TW8rZTJ5SEorRVN4OEw1TmRzWVk5TEord00zRlJqR1hEdmdDT3NGNkpp?=
 =?utf-8?B?OWlkZ3NWNy93MTNObk1HcmVhZDlDWEdCNktxK2ZwTTBVU1hpODE4SlVNOTBK?=
 =?utf-8?B?b3QxRExYWXEySTg4bVpwTDQwWGQvSGw1bnFEOWxaVFBuYisrU1FRUW02TSs1?=
 =?utf-8?B?YzBWdjdTdmYwTjlJQVZZWWgvZUpDMVY2Q0NnTGlTZGtsSDRYRzNUckhtUXI5?=
 =?utf-8?B?aVRuakV2NkxYeTZwTG1WcHlxOUFqckUvbnNkR0JMTWNKb3lrejlwR2lGL0pz?=
 =?utf-8?B?OWpCbzhzT0hna2NvR1NpbGY0R3VUNzg4bDlNeFIwWXBnNjVUMWtRVXhWcXlQ?=
 =?utf-8?B?bmsrdlkybTlHekkrM3Z2TnNEaHc3V1VSc1RwSDdWZUE4eGNGLzRtNGtzZURq?=
 =?utf-8?B?R2w3a1JEeFpWV09vViswc3IzR3ZENmxzREhIb3Q0aDlUNllnRlJEMXBEME96?=
 =?utf-8?B?UE10TGpWaFNQcHZ1b3llbU1veXErMitJZE8yYldKN21UTTgxcFJMUGxCamk4?=
 =?utf-8?B?S1J4VHlmSGJHZHAyT3BtTmo2bmRZdXMyZnhpZGlSSXJXRWZZN1p2cGtXMFcz?=
 =?utf-8?B?UnMzZW8xMWtPdFhvVlBhVHVCaW1zdHk3b3ZIMmRBdWFuTU0xcW5YYXQ2a25X?=
 =?utf-8?B?N0dtYStndTBOWko3K0Uxbk1KdlBTc0owQXNLYWxzMGc3RkZZQWJmQ3VXRkJT?=
 =?utf-8?B?TnN1ZnlaRTQ3SUszT3psRVFlMjMrTytwc0hZcTQ4YlhoaUhVWFA1eDViWjhm?=
 =?utf-8?B?QUJyaVNwZUZNNVBxMHBnSVFyOHU1WW5HZ3FqcENkVWVWZ25sL0Nxd1Q4WFhP?=
 =?utf-8?B?RGZUbDI3ZWVoSmxvQ1gvazFGVGpkSzV6QVFwL2FWREJ3Skc1Q2xmQjdHeGhs?=
 =?utf-8?B?enZ6cjlMWEVRTktDZVlqTFFUQXBhZSsvWDFqSmFqU1p0QkdEVzNBbnNZNEpm?=
 =?utf-8?B?bmR4MHBJZmFMK0I4SmxCNGg4Tnk3ZGlLZTdpYS84UkpJaHdqalFyZzdXcGNY?=
 =?utf-8?B?WUcvcWFiV3hNY2xTNXJSd0Fod21aUkhaREhta3RiQlVXenFYY1g0anBhTENI?=
 =?utf-8?B?SXprKzVSWkNJNjkwN0RuSnE0ZTdkZGcxSVJVQU1XcHRKb1pINDN5UzhreUdG?=
 =?utf-8?B?aUQvU1dMNWkramUzZ1htTEc1cE9XcXJJanlXdThtbWVxTWkraE83WFlFeTdr?=
 =?utf-8?B?LytCWVowM2N3ZFZUd0RzU3JORXFsdnRzblVNdlVyODZWa05qU2syVWZoMkhK?=
 =?utf-8?B?bks3aFM4RWNPaENWaDc0MTZmZG1oeTBxeG5CbUg2L214aHVEUkt4dU5xdGdL?=
 =?utf-8?B?QmNjRHlKL1BTNFVNMDR4U3pQZXBwVWVUcDQ4U3NKanRrV2EvSmpvQXFMbWRX?=
 =?utf-8?B?Rk9yeDExbnVZaDZOOUhxTk81Z2VoWjFzcFp3T2swUUlRSE5nd05tY0hzUGp4?=
 =?utf-8?B?Qi9weHZkbkY0ZGJUbDZuTDBHTThoMFNRYjVkR3JzNFVqTHJod0tUclFsekNs?=
 =?utf-8?B?S2NVNWZ5bDJ0YzlBRnlucHhWSmRNTm5YL2VHZlMwSTVwQ2pIbVdzWDBZUWNV?=
 =?utf-8?B?YmVzbEl1VHROSnlJd3lhcG1xRzRpbmlQQlFRem9wcjQyc0NIWFY0N1JxZkcx?=
 =?utf-8?B?T3k3MW5XR1RNVDZwc1BvVG4wdDNvM044Y0hDcFZ6UkRKQnJxcHR5amVvbUJz?=
 =?utf-8?Q?UFY4HBlQ4R4B5COypeBHqtavoIK2J05xkkXDw+IbPVTB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df869c13-590e-40eb-391b-08db0a459568
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 02:30:17.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zw7KeXnV3JFHutnD9l62bkKv815gJqqPD/SKyrq5aQaAPG3yFMLRv9JBwXGCfNLhdH28whCbjTAVwln6kggwXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5180
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/8/23 09:58, Raul Rangel wrote:
> On Wed, Feb 8, 2023 at 1:28 AM Amadeusz Sławiński
> <amadeuszx.slawinski@linux.intel.com> wrote:
>>
>> On 2/8/2023 7:57 AM, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Tue, Feb 07, 2023 at 09:33:55AM -0700, Raul Rangel wrote:
>>>> Sorry, resending in plain text mode.
>>>>
>>>> On Tue, Feb 7, 2023 at 12:25 AM Mika Westerberg
>>>> <mika.westerberg@linux.intel.com> wrote:
>>>>>
>>>>> After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
>>>>> set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
>>>>> devices if they announce to be wake capable in their device description.
>>>>> However, on certain systems where audio codec has been connected through
>>>>> I2C this causes system suspend to wake up immediately because power to
>>>>> the codec is turned off which pulls the interrupt line "low" triggering
>>>>> wake up.
>>>>>
>>>>> Possible reason why the interrupt is marked as wake capable is that some
>>>>> codecs apparently support "Wake on Voice" or similar functionality.
>>>>
>>>> That's generally a bug in the ACPI tables. The wake bit shouldn't be
>>>> set if the power domain for the device is powered off on suspend. The
>>>> best thing is to fix the ACPI tables, but if you can't, then you can
>>>> set the ignore_wake flag for the device:
>>>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L31.
>>>> If that works we can add a quirk for the device:
>>>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1633.
>>
> 
>> I've seen this one already and also tried to use it, but it didn't work.
>> Also when I was reading code I wasn't really convinced that it is linked
>> to i2c in any straightforward way. I mean i2c decides in different
>> places that it has wake support (I even added some prints to make sure
>> ;). The code you pointed out decides in
>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L387
>> but i2c code seems to decide in
>> https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-acpi.c#L176
>> where it just checks if irq flags has wake_capable flag set. When I
>> looked at it previously I was pretty sure it comes straight from BIOS
>> and passes the quirk code you mentioned, still I may have missed something.
> 
> You also need the following patch
> https://github.com/torvalds/linux/commit/0e3b175f079247f0d40d2ab695999c309d3a7498,
> otherwise the ignore flag only applies to _AEI GPIOs.
> 

I want to point out a non-obvious nuance to that as well.  When it's not 
triggered by an _AEI GPIO then it will not have the parent controller 
for the quirk but rather the string used for the ACPI device that 
declared the GPIO.

That's why the quirk that we applied for the Clevo BIOS bug was not 
AMDI0030 but was instead the string used for the ACPI device.

So if you're experimenting with this make sure you're using the right 
values, and explicitly look for the string in your kernel log that it's 
in use.

>>
>>>
>>> I think (hope) these systems are not yet available for public so there
>>> is a chance that the tables can still be fixed, without need to add any
>>> quirks.
>>>
>>> @Amadeusz, @Cezary, if that's the case I suggest filing a bug against
>>> the BIOS.
>>>
>>
>> Well, I tried custom DSDT and had problems, but I just remembered that I
>> probably need to pass "revision+1" in file, so kernel sees it as a newer
>> version, let me try again. Is it enough to replace "ExclusiveAndWake"
>> with "Exclusive"?
>>
>>>>> In any case, I don't think we should be enabling wakeup by default on
>>>>> all I2C devices that are wake capable. According to device_init_wakeup()
>>>>> documentation most devices should leave it disabled, with exceptions on
>>>>> devices such as keyboards, power buttons etc. Userspace can enable
>>>>> wakeup as needed by writing to device "power/wakeup" attribute.
>>>>
>>>> Enabling wake by default was an unintended side-effect. I didn't catch
>>>> this when I wrote the patch :/ It's been exposing all the incorrect
>>>> ACPI configurations for better or worse. Mario pushed a patch up
>>>> earlier to disable thes Wake GPIOs when using S3:
>>>> https://github.com/torvalds/linux/commit/d63f11c02b8d3e54bdb65d8c309f73b7f474aec4.
>>>> Are you having problems with S3 or S0iX?
>>>
>>> I think this case is S0ix.
>>
>> We test both cases in our setups.
> 
> IMO if a device needs to support wake from S3 the ACPI table needs to
> define a _PRW and define the proper power resources to keep the device
> functional during S3.
> 
>>
>>>
>>>>> Reported-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>>>> ---
>>>>> Hi,
>>>>>
>>>>> Sending this as RFC because I'm not too familiar with the usage of
>>>>> I2C_CLIENT_WAKE and whether this is something that is expected behaviour
>>>>> in users of I2C devices. On ACPI side I think this is the correct thing
>>>>> to do at least.
>>>>>
>>>>>    drivers/i2c/i2c-core-base.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>>>>> index 087e480b624c..7046549bdae7 100644
>>>>> --- a/drivers/i2c/i2c-core-base.c
>>>>> +++ b/drivers/i2c/i2c-core-base.c
>>>>> @@ -527,7 +527,7 @@ static int i2c_device_probe(struct device *dev)
>>>>>                           goto put_sync_adapter;
>>>>>                   }
>>>>>
>>>>> -               device_init_wakeup(&client->dev, true);
>>>>> +               device_init_wakeup(&client->dev, false);
>>>>
>>>> This would be a change in behavior for Device Tree. Maybe you can
>>>> declare a `bool enable_wake = true`, then in the ACPI branch
>>>> (https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-base.c#L495)
>>>> set `enable_wake = false`. This would keep wakes enabled by default on
>>>> device tree and disabled for ACPI. This matches the original behavior
>>>> before my patch.
>>>
>>> I don't think it's a good idea to make the behaviour different. Drivers
>>> in general do not need to know whether the device was enumerated on ACPI
>>> or DT or whatnot. Same goes for users who should expect similar
>>> behaviour on the same device.
>>>
>>> I wonder what is the reason why I2C bus does this for all wake capable
>>> devices in the first place? Typically it should be up to the user to
>>> enable them not the opposite.
>>

