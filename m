Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DE4496580
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 20:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbiAUTSn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 14:18:43 -0500
Received: from mail-co1nam11on2077.outbound.protection.outlook.com ([40.107.220.77]:5248
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231400AbiAUTSk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jan 2022 14:18:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKMhlMiA1V9LdPoe9Zs8E0Dm+Y/zcx9EjMoEdkJOhcytsO0+lRd9J1cXttFI03z0GPr31h+ckT6X2+L4afE/1Gc03njSVPUuRJ/Qg5xeREo+vPlWQJnR89chbrtLNvSk3LnkFAVO8N9ghQwR1Q9YZxc5DB3ziLZ295srZvbZxevjaukClS1dSvHbSLvey1J+pN56UT88X49tt9BDQW69p9USVpETD4Qk8dUU4lEC1xhgd19gwqBywKpc19tDeSEvi/Y7stbdvs9Sqz1m6/ad4HTe/AV7Cl5uN5yR9NUgkaFdxoCXYXS1x+ws4TNpiOCVd1ZSE/W5qg/eVgFOS7Q6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDeSkOdEklulDTkk5YmN0Pas45f7NPDmYiJ4DIrADqY=;
 b=QuBOYxDNvhgUT+HaBb0C8P9PvIA6J/zVymUFpy3jry5xW453S8KbQyydl/a/8az1aqXOvdFMny7judz8u7C6XGoIcK6PfdMYo2PTBUaGrXSqtFaB/zRobRTjWG2jsTfT4/aAjJquJQVZfRE3YNW8e7tnvOgKHJbl8i9xpDwAvJ6Hw0H7IOpZQV3H/rFE0L8n9/mWXBPyH6n02Ag2AZyNOUrC06iKQZsgbskcbedcyrxhSoF8tZRvSotZM0uoUahIFlivkj8GwTJXdjQoDHiE8TbLBcXXC5k52optCplPhUHwupbfBxAHF+6rY4IHuSrrUFAqwWPhqY+SnngjKC58Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDeSkOdEklulDTkk5YmN0Pas45f7NPDmYiJ4DIrADqY=;
 b=gegsgPmY8xRZDbYYaoSNPu7qu1QoRpu5hRbzxialMFcjLA/jTzVwJZvblpfMDmqGQ3kpV7ZJ+BkNTxEgNFDSLDXTLkAa6EU0/x3+T5cdmDT0Est9zuQ7d8pol6JupZvpoNIjP/2VSSga4OOdMaSgYalk0hx2ihmqueFijCLC0kY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by BN6PR12MB1123.namprd12.prod.outlook.com (2603:10b6:404:1b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 19:18:38 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::ccd7:e520:c726:d0b]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::ccd7:e520:c726:d0b%7]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 19:18:38 +0000
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        "upstream@semihalf.com" <upstream@semihalf.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-3-jsd@semihalf.com>
 <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com>
 <CAOtMz3NcMZsCMO+15wzzwvF44PqRmem1eP-rCbb+dCiaWiGKzA@mail.gmail.com>
 <b30a212f-643d-c85d-6301-d92ee0adf098@redhat.com>
 <BL1PR12MB5157C8952EF693A93785FBD2E25B9@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <d1a29d3e-c213-3478-966b-4ffbe21b1384@amd.com>
Date:   Fri, 21 Jan 2022 13:18:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB5157C8952EF693A93785FBD2E25B9@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::8) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c52e8b27-371e-4222-79c1-08d9dd12d38e
X-MS-TrafficTypeDiagnostic: BN6PR12MB1123:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1123EBB173F1FA915BF2C58DEC5B9@BN6PR12MB1123.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hDlbGmOVMvtyQoKuK/p/dj3nCpeI3zYZafhIBq7B6OA065f3rBT0qUvkPT/DbxnRuJyjf45Ns91UkgI1o/ak/XAojNJ5AQv7BfNfPtEQ17zQCsFJjlxDkdf/HyGTulAu+qo5dBJfZ4nZ+ozLq5SetEb3DvGSsLy+F0Beqfp8D2GHGBfuw+Z/Bg0t5FYb05RmauYyBqYYtHW09bYScZuKWS9ZFevNbpSrkFC46lopNb2kNV5+poYcswVJZ2d1pSNI6Tz1nhGLAu9urFj6PlIfaNfbNTuLxF+UmEUN+i15JeDWKof4cKZlsUDrWRk6LI6z2whfM0kSTdzq8LAdbA4sGq444Tf+l7UrrFX8Mzn4ZOpjCqZB5KYGFBgvOxUKFVSRmUonoDxCjA+CQlhMorKXYpmuGcQPa7gS46WP9GexssLOGFtLW5QyWNQEErn/CpEoalzOz5/j4tE36Su1wWcOE/Ek+A7WmsXYB+n94QtuYHuaaJOPYqyBNQvUAmTonNB6LsxU/ooTvHbaSeWt4GIvNEHMXDj3yj/TCw3Mifw2E9tFSbn/bSrWFBJSFHoBlLor7ZQgl3x8qKlOelunANyjo2rGa+OL2eK0/CcIbqPvNn1qdBXKX6IDyToX4OP9wqEJWxBAWuXXNZlfCLeJ+0fm8K10vzl+h8IjU6iVEIdoUQBNAGQkuWKfRWUEi1cJhXxX/tF1h/GE6ideWZU5T9j6yzT57uNgUuL67CYNZvOI33pXFuDuWQnWl8v6dMfEGPn0SFee64mbmr/7VVU+iPGph1DXMbDhRiEEcr5Sg1F+qfC9FdoQzG0mbN+WVQQS0/QD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66556008)(4326008)(6506007)(54906003)(6486002)(6666004)(31696002)(8676002)(508600001)(2616005)(110136005)(66574015)(53546011)(966005)(83380400001)(38100700002)(45080400002)(66476007)(66946007)(6512007)(86362001)(2906002)(186003)(7416002)(26005)(8936002)(30864003)(36756003)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-2?Q?9gHJcdZfn5S/2I4p4kVOuw/Hr2VNxGB0OJVxqhtXQgSSPr9mBGvNZZ0Dka?=
 =?iso-8859-2?Q?zVZmWw5h4IHHJP/zFIfWIvTXJRmeuZViCCzZcz8yT5iJgWTRa+kU7Nmoe1?=
 =?iso-8859-2?Q?cbp7phq0MWBfCibf94sFtGLtkzv3hIbkOfLjV2/UWOyxiaRoCk1oMRQig9?=
 =?iso-8859-2?Q?XO/AYppSVLBAs5k/NcoE/01s4aeh0BC44yr1K4dr9Bcjsnz0Dbu77aFLUS?=
 =?iso-8859-2?Q?Rerqt91yFJOUFyj7h+aBcZsLkmmJ9zLBfHS0tfPXOqqYBtRygLq14/GD+v?=
 =?iso-8859-2?Q?Oxfh87vUJTnhhPwdUzsrhRIxojSwFB9z223Z0AIBQm/T0QTWkk++ARQQEL?=
 =?iso-8859-2?Q?s1o7NhWk4xrMD+JL7YYHQRiOqO+BB9mkAMEc2iR6eDcsuPASwO8LyshhTO?=
 =?iso-8859-2?Q?tn95GnEmJwlzSSjAzukBzcDc5aG5d3bMBHsr9TD9FQWYgbFePrBUf4acUU?=
 =?iso-8859-2?Q?lw4nzbS28p5fxq8yQ16Z+2GPQq+DMwSrAyXv0NYRHepyomoYdoFx3vHsLs?=
 =?iso-8859-2?Q?kCOczqz+jfi5HDkXWwsLTmmgMDKjWxRbkBddwuqVIav6RWss+AlnEMhtVA?=
 =?iso-8859-2?Q?1QIVtkwr5HZcPDLMEa5Cfg/S9Kj1IhZGWHlgRoqT3OivI+n5GHzOA9yas6?=
 =?iso-8859-2?Q?UHei7QIbPFTgBl6RdcU0aENYPK0haGGeg61C99PXQWg83YAXPsEYrau0Bz?=
 =?iso-8859-2?Q?S1i5iyO5EYa1zGe8+cvroPSCrTfAezG5W4MouAESh4Py0kKSzodCVDnYS2?=
 =?iso-8859-2?Q?BoRxkAQn6Juc2yU36WaYlI10sFAK+btacTxe/8FgggfnW/GBbBsrU08smB?=
 =?iso-8859-2?Q?L5w0FI7GW4IOi28dLRO6mBOyQQvLDKvwYUTw+Khz6OYnM+MWt9FOs3D7la?=
 =?iso-8859-2?Q?hj7cVSuWmZoO9xuNXjt/fK9nDhMoK25rSw4uf9KvCuJee5FBnoPUXHnx98?=
 =?iso-8859-2?Q?X6bosZLrKoK7AP6MlFHtqFVxwzucEM14wIpQheA0pIyJow3vgA9iXK5zqc?=
 =?iso-8859-2?Q?bjV/7YupdKrlTNtGsn3MJ7qEaNhOan0khc+EOmMzOAYCJ5wlpQWkY+OMMa?=
 =?iso-8859-2?Q?ZEuhfF0vJx4XczRJJC4ga3fnhShISrvRndKDQpM43Ryw/hucDeJC0BcWdt?=
 =?iso-8859-2?Q?m92rczPFFlJ5SvEblIcFpASqtENDRRZ2koEJ+fpysS2r8CxGWnE0I3Pj2b?=
 =?iso-8859-2?Q?n4E/bNdgqxMOMyKugWhF5Nh42uMAn+jZ/Wh/GtKkUos/O3AnHmTf7iF82w?=
 =?iso-8859-2?Q?SoCwN1o3hngysEYNhmaYcxd56YYDn2+V/w2MNZv8NZSFMjZYUmaJicCMWh?=
 =?iso-8859-2?Q?wSlLEBgvZ8wtA9RsGfLZry8wuBytN+453v69cewym7bvQFVPbiN6vg2v1z?=
 =?iso-8859-2?Q?kjOTbt7dpqT5d0FofP1vuC2j+B4NRffyfJFeKJWPeqQZQLXUDjILuvzfrr?=
 =?iso-8859-2?Q?X5Vgiz3+4QnzEHwY9SUs9njNqFZ6+RopAPDFMAJH1w5lZGCyd4iqv7fi6e?=
 =?iso-8859-2?Q?Ww+Oc8lKP607AL3QuQGe5cZao1KSaSWCYr18iO8Za+zOfjbTiKfFiwPg3r?=
 =?iso-8859-2?Q?yddW+S43LA1Vf5oD/DidT1XmJGjDX9uq0qJvAsG5A7odInklF/HSOuNt1h?=
 =?iso-8859-2?Q?uE3EN1M3KV0Ot86VuK8Kzbm1X8x1M3EjjqrKV4+OsS85dKELqZt29X0rtU?=
 =?iso-8859-2?Q?3jn4kfOQRJShgaNKMok=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52e8b27-371e-4222-79c1-08d9dd12d38e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 19:18:37.9521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKqrr5D/2rKrmPdh3gKlzQhUIFbunxZQt51rhWknB/S52k5Uj3leNisA9Iobs1UQoggDJyki9yVNa9HzPHtBVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1123
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/21/22 11:38 AM, Limonciello, Mario wrote:
> [Public]
> 
> +Thomas (ccp driver)
> +Alex (amdgpu driver)
> 
>>
>> On 1/21/22 10:59, Jan D±bro¶ wrote:

>>>>
>>>> Through here seems to all be generic code for accessing
>>>> the AMD PSP. To me this seems like something which belongs
>>>> in a separate AMD-PSP-mbox driver/lib, which can then be
>>>> shared between other kernel drivers which may also want
>>>> to access PSP.
>>>
>>> I see your point clearly and actually it is not an accident that I've
>>> put all PSP-mailbox methods in one "block". They are logically
>>> different than the rest of i2c-adapter specific methods.
>>>
>>> That being said, above PSP mailbox was created by AMD solely for the
>>> purpose of i2c_arbitration. It has its own set of commands and
>>> specific format of the command-response buffer. Thus it is not and it
>>> won't be generic in the future. There are already upstreamed drivers
>>> from AMD (under drivers/crypto/ccp/) which made use of PSP, however
>>> their channel of communication looks completely different than the
>>> very simple i2c_arbitration model implemented above.
>>>
> 
> Can you please double confirm no other users for this mailbox and it's for
> you only?  And if so is it only specific to this platform that no other users?
> At least on some UEFI AMD platforms that mailbox is defined for
> communication with something else.  We might need some way to attest
> from the firmware that it's safe to use.
> 
> The only mailbox that is defined for OS use across different silicon AFAIK is
> the GPU driver mailbox.  It may be safer to use that, but I'm not sure if
> GPU driver has come up early enough for your use.

The CCP/PSP driver will load as a PCIe device driver on this platform and 
will ioremap the MMIO space. Today, that driver doesn't reference those 
mailbox registers, and I don't know that there will be a need in the 
future. But if there is a need in the future, you could end up with a 
conflict between these two drivers.

Thanks,
Tom

> 
>>> Because of this I'm treating this as an i2c_semaphore-related code and
>>> putting this in this module. In my opinion moving this into some
>>> separate driver (which will be actually used only here) makes code
>>> less clear. But let's also hear some voice from AMD.
>>
>> Since as you say this mailbox is special and only for i2c-arbitration,
>> keeping it inside this patch / .c file is fine.
>>
>>>
>>>>
>>>> Sorta like the generic iosf_mbi_read() and
>>>> iosf_mbi_write() functions from:
>>>>
>>>> arch/x86/platform/intel/iosf_mbi.c
>>>>
>>>> used on the Intel chips, which are also used outside of
>>>> the I2C bus-locking code.
>>>>
>>>> This is also one of the reasons why I think it would be
>>>> good to get some AMD folks involved in this, since they
>>>> may be aware of other drivers which also need to access
>>>> the PSP mbox.
>>>>
>>>
>>> Right, I'm adding mario.limonciello@amd.com to the CC, so that he can
>> comment.
>>>
>>> (...)
>>>
>>>>> +/*
>>>>> + * Locking methods are based on the default implementation from
>>>>> + * drivers/i2c/i2c-core.base.c, but with psp acquire and release operations
>>>>> + * added. With this in place we can ensure that i2c clients on the bus shared
>>>>> + * with psp are able to lock HW access to the bus for arbitrary number of
>>>>> + * operations - that is e.g. write-wait-read.
>>>>> + */
>>>>> +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
>>>>> +                                     unsigned int flags)
>>>>> +{
>>>>> +     psp_acquire_i2c_bus();
>>>>> +     rt_mutex_lock_nested(&adapter->bus_lock,
>> i2c_adapter_depth(adapter));
>>>>
>>>> This does not do what you think it does and you will still deadlock
>>>> when things nest because of someone taking the bus-lock and then
>>>> the main i2c-designware transfer function calling the acquire_lock
>>>> callback.
>>>
>>> I haven't used rt_mutex_lock_nested() with the intent to prevent me
>>> from deadlock when i2c-designware calls acquire_lock with bus-lock
>>> already taken. This is a method copied from
>>> drivers/i2c/i2c-core-base.c (BTW, I have a typo in above comment).
>>> This is the default implementation applied by i2c-core when particular
>>> adapter doesn't register its own locking callbacks - thus it is called
>>> for i2c-designware for all platforms.
>>>
>>> In case of this driver internal i2c-designware acquire_lock() is equal
>>> to psp_acquire_i2c_bus(). In other words, bus-level lock
>>> i2c_adapter_dw_psp_lock_bus() is a superset of internal adapter's
>>> acquire_lock().
>>
>> Ah I missed that this is just mimicking the core functions +
>> an extra call to psp_acquire_i2c_bus().
>>
>> I assumed that the dwc->acquire callback path was also taking
>> the mutex and I thought you had fallen for the _nested meaning
>> something different then it does, my bad.
>>
>>> In order to prevent deadlock which you are talking about, I'm using
>>> reference lock counter inside psp_acquire_i2c_bus() thus it is safe to
>>> invoke acquire_lock() when bus-lock is already taken.
>>
>> Ah good, that is pretty much is the same as what the Bay Trail code
>> is doing.
>>
>>>
>>>>
>>>> The _nested postfix is only for the lockdep lock-debugger, this
>>>> actually turns into a regular mutex_lock when lockdep is not enabled:
>>>>
>>>> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>>> extern void rt_mutex_lock_nested(struct rt_mutex *lock, unsigned int
>> subclass);
>>>> #define rt_mutex_lock(lock) rt_mutex_lock_nested(lock, 0)
>>>> #else
>>>> extern void rt_mutex_lock(struct rt_mutex *lock);
>>>> #define rt_mutex_lock_nested(lock, subclass) rt_mutex_lock(lock)
>>>> #endif
>>>>
>>>> The _nested postfix as such is only to tell the lockdep code that
>>>> even though it seems we are trying to take the same mutex twice
>>>> since in both cases it is of i2c_adapter.rt_mutex "lock class"
>>>> that we are sure it is never the same i2c_adapter (but rather
>>>> one which always gets called in a nested fashion from another
>>>> i2c_adapter).
>>>>
>>>> IOW this only disables a false-positive lockdep warning, it does
>>>> not allow taking the same mutex twice, you will still hang on
>>>> the second mutex_lock call on the same lock.
>>>
>>> Thanks for the technical background about rt_mutex_lock_nested. I
>>> think we should keep using it as is, since as I wrote above I don't
>>> have any reasoning to modify it here.
>>
>> Ack, now that my misreading of the code has been cleared up
>> I agree.
>>
>>>> Also I don't think you are allowed to use the bus_locking code
>>>> like this. The i2c bus-locking code is intended to deal with
>>>> busses which have muxes in them, where the mux must be set
>>>> to the right branch of the bus to reach the client and then
>>>> not be changed during the transfer to that client.
>>>>
>>>> So i2c-client drivers are never supposed to directly call
>>>> the bus-locking functions.
>>>
>>> I think you are not correct here. There are examples of i2c-clients
>>> which are using i2c bus_locking for the purpose of locking adapter for
>>> the bunch of i2c transactions.
>>>
>>> As an example let's take drivers/char/tpm/tpm_tis_i2c_cr50.c. It
>>> operates in write-wait-read model and there is i2c_lock_bus() call
>>> used to ensure that bus won't be released -
>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.c
>> om%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Fchar%2Ftpm%2Ftpm_
>> tis_i2c_cr50.c%23L202&amp;data=04%7C01%7Cmario.limonciello%40amd.com
>> %7C1bdc742bc2a24f59b7d908d9dcc95438%7C3dd8961fe4884e608e11a82d994
>> e183d%7C0%7C0%7C637783579554955840%7CUnknown%7CTWFpbGZsb3d8ey
>> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
>> 3000&amp;sdata=fr0UEka%2BxYyPxqUG6oOZo%2Bc6pWgto2mD7hWA20YulVQ
>> %3D&amp;reserved=0.
>>>
>>> Similar model is followed in drivers/char/tpm/tpm_i2c_infineon.c and
>>> couple of other i2c-client drivers.
>>
>> Ah I see, interesting (live and learn).
>>
>> But this is then combined with using the special __i2c_transfer()
>> function for the actual i2c reads/writes, since using the regular
>> i2c_transfer() function after already taking the lock would deadlock.
>>
>> There is a similar unlocked raw __i2c_smbus_xfer(), but as the
>> comment in include/linux/i2c.h above the locked i2c_smbus_xfer() says:
>>
>> /* This is the very generalized SMBus access routine. You probably do not
>>     want to use this, though; one of the functions below may be much easier,
>>     and probably just as fast.
>>     Note that we use i2c_adapter here, because you do not need a specific
>>     smbus adapter to call this function. */
>> s32 i2c_smbus_xfer(...);
>>
>> So in this case a driver cannot use the usual
>> i2c_smbus_read_byte/word/byte_data/word_data() helpers and
>> the same for writes. Also using an i2c_regmap (which is used
>> in a ton of places like PMIC drivers) will not work this way.
>>
>> So yes you can use i2c_bus_lock() for this; but only if all the
>> drivers where you want to do that limit themselves to
>> __i2c_transfer() and __i2c_smbus_xfer() calls and/or are
>> rewritten to only use those.
>>>> This is why in the Bay Trail case we have i2c-drivers
>>>> directly calling iosf_mbi_block_punit_i2c_access() and
>>>> iosf_mbi_unblock_punit_i2c_access() to lock the bus
>>>> for multiple i2c-transfers. We can get away with this there
>>>> because the bus in question is only used to access the
>>>> PMIC and that PMIC is only used on Bay Trail (and CHT)
>>>> boards, so the PMIC drivers can just hard-code these
>>>> calls.
>>>>
>>>> If you need to take the PSP I2C semaphore for multiple
>>>> transfers in some generic drivers, then I guess that the
>>>> i2c-subsys will need to get some new i2c_adapter callbacks
>>>> to acquire / release the bus for i2c-controllers where
>>>> the bus/controller is shared with some co-processor like
>>>> in the PSP case.
>>>
>>> This is exactly my intention to support generic i2c-clients drivers
>>> without them being aware that i2c-adapter above is using some
>>> semaphore/arbitration. Hopefully you can agree with me that currently
>>> available bus_locking can be used and is enough for this purpose.
>>
>> It can be used, but with limitations, see above.
>>
>>>
>>>> Also note that iosf_mbi_block_punit_i2c_access() and
>>>> iosf_mbi_unblock_punit_i2c_access() do their own
>>>> ref/lock-counting to allow calling them multiple times and
>>>> the first block call takes the bus and the last unblock
>>>> call releases it.
>>>
>>> This is exactly what I was talking about above and also implemented
>>> within psp_acquire_i2c_bus() and psp_release_i2c_bus().
>>
>> Right, I was to quick in skimming over your code when
>> I wrote down my concerns about there being a deadlock
>> there, sorry.
>>
>> Regards,
>>
>> Hans
