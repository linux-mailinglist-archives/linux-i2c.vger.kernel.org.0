Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3308149FC0B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 15:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349469AbiA1Oro (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 09:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349451AbiA1Orm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 09:47:42 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4D7C06173B
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:47:41 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id i17so6293860pfq.13
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=71a/UEPAhQDJ/QMoSptBxjzgk3d2AaGm4UdukemWuKk=;
        b=PPFnOq/kE8q1hs1oWkxi1V/eXCuKfAG4G/G+Sw52UEeFf611rDtmqFylkKdbY8NBsU
         DD5vJhHa7m84mjW4ei+7SO4sM8WRprNjiXUTmhf3tx52Z2orZhvjPwiFHOAS9nw9fv7U
         peFpoyAYnzX6kwi4mV8XK0vs/dTsbGcJBP41Lm/JVXF87caZPBepNoPdXIw9wQGtWiOT
         0OvNDJ8Cr7KaITYhRVF8qhCwPejPTEUhX8F3TaPVkzT6KB8sZL5fZElar5PM5Ju2HqK/
         9Bwub8kUqDqIVyD0wP6v9+e7gy6UkliZfRO5kqTPYjhKgLhXBxx+PXYqbFmR0tPNHe/r
         QZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=71a/UEPAhQDJ/QMoSptBxjzgk3d2AaGm4UdukemWuKk=;
        b=ocpvGr+rFJ0+fIIknralfEkHrGUDmnwhTbzmuzsH/d5weCt0dRS0MqIMmiv/SWB248
         jtM0tK3UdWGqEBi7zYK4N0ZQrKIKze3X80JXrq4IENoluSddQ3kvAi6DzXqKC+P4Wn/m
         j7vhGepToyktN69tBAwxGKoTs/SNRoOBBc75XNPTjGrA/w/mrTGt96fbyQ26+1mu/Eyl
         FQdRHGaTV2IHqnBdu5qY7/kdTx66vZspCvQ/OmscbgZJQmDbVRYNCMomnP8hPlVRLWDi
         yw4QvkWG/BdR6nIuWULLB1ef6CCj0uQ35LFb0bMxcVDf0ZXpF28UNhQFUyo4ZDKsQnnL
         4IPQ==
X-Gm-Message-State: AOAM531xeCTCrqGB/HXS9iG6rBaRqFqlKsUFgVDn46HmDkLCAlVC02I5
        vbUCyJ+WjL/orhZKYK2h8Js/fc0a4gjJhiBz+4+A2A==
X-Google-Smtp-Source: ABdhPJxEHqaa+WHIfKoQSnxBNh4Hj17B2MUfL96eJZPhBaMvdrZJYz5bBGWJQ68J7fT1JjQLu5Bb20ZHeYdIMrdTRiQ=
X-Received: by 2002:aa7:8484:: with SMTP id u4mr8332816pfn.70.1643381261249;
 Fri, 28 Jan 2022 06:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-1-jsd@semihalf.com> <20220120001621.705352-3-jsd@semihalf.com>
 <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com> <CAOtMz3NcMZsCMO+15wzzwvF44PqRmem1eP-rCbb+dCiaWiGKzA@mail.gmail.com>
 <b30a212f-643d-c85d-6301-d92ee0adf098@redhat.com> <BL1PR12MB5157C8952EF693A93785FBD2E25B9@BL1PR12MB5157.namprd12.prod.outlook.com>
 <d1a29d3e-c213-3478-966b-4ffbe21b1384@amd.com> <CAOtMz3N2YU14z9qngacKtwLYOcLwHFHBsAKQDjfztB3-Nuzz_A@mail.gmail.com>
 <BL1PR12MB51579285BF7D2F87F993C772E2209@BL1PR12MB5157.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB51579285BF7D2F87F993C772E2209@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 28 Jan 2022 15:47:30 +0100
Message-ID: <CAOtMz3P+sMBd2yttU_KPbRO0fa-WLewt+5iMMGwR_6Wp0heVtA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        "upstream@semihalf.com" <upstream@semihalf.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=C5=9Br., 26 sty 2022 o 20:36 Limonciello, Mario
<Mario.Limonciello@amd.com> napisa=C5=82(a):
>
> [Public]
>
> > >
> > > >>>>
> > > >>>> Through here seems to all be generic code for accessing
> > > >>>> the AMD PSP. To me this seems like something which belongs
> > > >>>> in a separate AMD-PSP-mbox driver/lib, which can then be
> > > >>>> shared between other kernel drivers which may also want
> > > >>>> to access PSP.
> > > >>>
> > > >>> I see your point clearly and actually it is not an accident that =
I've
> > > >>> put all PSP-mailbox methods in one "block". They are logically
> > > >>> different than the rest of i2c-adapter specific methods.
> > > >>>
> > > >>> That being said, above PSP mailbox was created by AMD solely for =
the
> > > >>> purpose of i2c_arbitration. It has its own set of commands and
> > > >>> specific format of the command-response buffer. Thus it is not an=
d it
> > > >>> won't be generic in the future. There are already upstreamed driv=
ers
> > > >>> from AMD (under drivers/crypto/ccp/) which made use of PSP, howev=
er
> > > >>> their channel of communication looks completely different than th=
e
> > > >>> very simple i2c_arbitration model implemented above.
> > > >>>
> > > >
> > > > Can you please double confirm no other users for this mailbox and i=
t's for
> > > > you only?  And if so is it only specific to this platform that no o=
ther users?
> > > > At least on some UEFI AMD platforms that mailbox is defined for
> > > > communication with something else.  We might need some way to attes=
t
> > > > from the firmware that it's safe to use.
> > > >
> > > > The only mailbox that is defined for OS use across different silico=
n AFAIK is
> > > > the GPU driver mailbox.  It may be safer to use that, but I'm not s=
ure if
> > > > GPU driver has come up early enough for your use.
> > >
> > > The CCP/PSP driver will load as a PCIe device driver on this platform=
 and
> > > will ioremap the MMIO space. Today, that driver doesn't reference tho=
se
> > > mailbox registers, and I don't know that there will be a need in the
> > > future. But if there is a need in the future, you could end up with a
> > > conflict between these two drivers.
> >
> > Right, so I have confirmed this with AMD PSP firmware developers, that
> > this particular x86-PSP mailbox is created and will be reserved
> > _solely_ for the purpose of i2c arbitration (and thus this driver).
> > There is no intend to use it elsewhere or share with another users.
>
> I've learned never to say never.  People move on to different roles and h=
istory
> gets lost.  As it's exclusive to this use case of I2C arbitration it will=
 probably still
> be useful to leave in the comments nearby for our future selves what mode=
l/family
> SOC this was introduced in case the number of mailboxes are extinguished =
some
> day and this ends up being needed for a secondary purpose for some future=
 SOC.

OK. I put a comment in v2. Please take a look.

>
> >
> > > Thanks,
> > > Tom
> > >
> > > >
> > > >>> Because of this I'm treating this as an i2c_semaphore-related cod=
e and
> > > >>> putting this in this module. In my opinion moving this into some
> > > >>> separate driver (which will be actually used only here) makes cod=
e
> > > >>> less clear. But let's also hear some voice from AMD.
> > > >>
> > > >> Since as you say this mailbox is special and only for i2c-arbitrat=
ion,
> > > >> keeping it inside this patch / .c file is fine.
> > > >>
> > > >>>
> > > >>>>
> > > >>>> Sorta like the generic iosf_mbi_read() and
> > > >>>> iosf_mbi_write() functions from:
> > > >>>>
> > > >>>> arch/x86/platform/intel/iosf_mbi.c
> > > >>>>
> > > >>>> used on the Intel chips, which are also used outside of
> > > >>>> the I2C bus-locking code.
> > > >>>>
> > > >>>> This is also one of the reasons why I think it would be
> > > >>>> good to get some AMD folks involved in this, since they
> > > >>>> may be aware of other drivers which also need to access
> > > >>>> the PSP mbox.
> > > >>>>
> > > >>>
> > > >>> Right, I'm adding mario.limonciello@amd.com to the CC, so that he=
 can
> > > >> comment.
> > > >>>
> > > >>> (...)
> > > >>>
> > > >>>>> +/*
> > > >>>>> + * Locking methods are based on the default implementation fro=
m
> > > >>>>> + * drivers/i2c/i2c-core.base.c, but with psp acquire and relea=
se
> > operations
> > > >>>>> + * added. With this in place we can ensure that i2c clients on=
 the bus
> > shared
> > > >>>>> + * with psp are able to lock HW access to the bus for arbitrar=
y number
> > of
> > > >>>>> + * operations - that is e.g. write-wait-read.
> > > >>>>> + */
> > > >>>>> +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *ad=
apter,
> > > >>>>> +                                     unsigned int flags)
> > > >>>>> +{
> > > >>>>> +     psp_acquire_i2c_bus();
> > > >>>>> +     rt_mutex_lock_nested(&adapter->bus_lock,
> > > >> i2c_adapter_depth(adapter));
> > > >>>>
> > > >>>> This does not do what you think it does and you will still deadl=
ock
> > > >>>> when things nest because of someone taking the bus-lock and then
> > > >>>> the main i2c-designware transfer function calling the acquire_lo=
ck
> > > >>>> callback.
> > > >>>
> > > >>> I haven't used rt_mutex_lock_nested() with the intent to prevent =
me
> > > >>> from deadlock when i2c-designware calls acquire_lock with bus-loc=
k
> > > >>> already taken. This is a method copied from
> > > >>> drivers/i2c/i2c-core-base.c (BTW, I have a typo in above comment)=
.
> > > >>> This is the default implementation applied by i2c-core when parti=
cular
> > > >>> adapter doesn't register its own locking callbacks - thus it is c=
alled
> > > >>> for i2c-designware for all platforms.
> > > >>>
> > > >>> In case of this driver internal i2c-designware acquire_lock() is =
equal
> > > >>> to psp_acquire_i2c_bus(). In other words, bus-level lock
> > > >>> i2c_adapter_dw_psp_lock_bus() is a superset of internal adapter's
> > > >>> acquire_lock().
> > > >>
> > > >> Ah I missed that this is just mimicking the core functions +
> > > >> an extra call to psp_acquire_i2c_bus().
> > > >>
> > > >> I assumed that the dwc->acquire callback path was also taking
> > > >> the mutex and I thought you had fallen for the _nested meaning
> > > >> something different then it does, my bad.
> > > >>
> > > >>> In order to prevent deadlock which you are talking about, I'm usi=
ng
> > > >>> reference lock counter inside psp_acquire_i2c_bus() thus it is sa=
fe to
> > > >>> invoke acquire_lock() when bus-lock is already taken.
> > > >>
> > > >> Ah good, that is pretty much is the same as what the Bay Trail cod=
e
> > > >> is doing.
> > > >>
> > > >>>
> > > >>>>
> > > >>>> The _nested postfix is only for the lockdep lock-debugger, this
> > > >>>> actually turns into a regular mutex_lock when lockdep is not ena=
bled:
> > > >>>>
> > > >>>> #ifdef CONFIG_DEBUG_LOCK_ALLOC
> > > >>>> extern void rt_mutex_lock_nested(struct rt_mutex *lock, unsigned=
 int
> > > >> subclass);
> > > >>>> #define rt_mutex_lock(lock) rt_mutex_lock_nested(lock, 0)
> > > >>>> #else
> > > >>>> extern void rt_mutex_lock(struct rt_mutex *lock);
> > > >>>> #define rt_mutex_lock_nested(lock, subclass) rt_mutex_lock(lock)
> > > >>>> #endif
> > > >>>>
> > > >>>> The _nested postfix as such is only to tell the lockdep code tha=
t
> > > >>>> even though it seems we are trying to take the same mutex twice
> > > >>>> since in both cases it is of i2c_adapter.rt_mutex "lock class"
> > > >>>> that we are sure it is never the same i2c_adapter (but rather
> > > >>>> one which always gets called in a nested fashion from another
> > > >>>> i2c_adapter).
> > > >>>>
> > > >>>> IOW this only disables a false-positive lockdep warning, it does
> > > >>>> not allow taking the same mutex twice, you will still hang on
> > > >>>> the second mutex_lock call on the same lock.
> > > >>>
> > > >>> Thanks for the technical background about rt_mutex_lock_nested. I
> > > >>> think we should keep using it as is, since as I wrote above I don=
't
> > > >>> have any reasoning to modify it here.
> > > >>
> > > >> Ack, now that my misreading of the code has been cleared up
> > > >> I agree.
> > > >>
> > > >>>> Also I don't think you are allowed to use the bus_locking code
> > > >>>> like this. The i2c bus-locking code is intended to deal with
> > > >>>> busses which have muxes in them, where the mux must be set
> > > >>>> to the right branch of the bus to reach the client and then
> > > >>>> not be changed during the transfer to that client.
> > > >>>>
> > > >>>> So i2c-client drivers are never supposed to directly call
> > > >>>> the bus-locking functions.
> > > >>>
> > > >>> I think you are not correct here. There are examples of i2c-clien=
ts
> > > >>> which are using i2c bus_locking for the purpose of locking adapte=
r for
> > > >>> the bunch of i2c transactions.
> > > >>>
> > > >>> As an example let's take drivers/char/tpm/tpm_tis_i2c_cr50.c. It
> > > >>> operates in write-wait-read model and there is i2c_lock_bus() cal=
l
> > > >>> used to ensure that bus won't be released -
> > > >>>
> > > >>
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.c
> > %2F&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com%7Cf8cd037a72b
> > 749fb003408d9df3f5ced%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0
> > %7C637786285501955886%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata
> > =3Ds4N9vTWbuRUww0qvsRz16fV%2Fnj41SxyLOB%2BjGFjyOaA%3D&amp;reserved
> > =3D0
> > > >>
> > om%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Fchar%2Ftpm%2Ftpm_
> > > >>
> > tis_i2c_cr50.c%23L202&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com
> > > >>
> > %7C1bdc742bc2a24f59b7d908d9dcc95438%7C3dd8961fe4884e608e11a82d994
> > > >>
> > e183d%7C0%7C0%7C637783579554955840%7CUnknown%7CTWFpbGZsb3d8ey
> > > >>
> > JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> > > >>
> > 3000&amp;sdata=3Dfr0UEka%2BxYyPxqUG6oOZo%2Bc6pWgto2mD7hWA20YulVQ
> > > >> %3D&amp;reserved=3D0.
> > > >>>
> > > >>> Similar model is followed in drivers/char/tpm/tpm_i2c_infineon.c =
and
> > > >>> couple of other i2c-client drivers.
> > > >>
> > > >> Ah I see, interesting (live and learn).
> > > >>
> > > >> But this is then combined with using the special __i2c_transfer()
> > > >> function for the actual i2c reads/writes, since using the regular
> > > >> i2c_transfer() function after already taking the lock would deadlo=
ck.
> > > >>
> > > >> There is a similar unlocked raw __i2c_smbus_xfer(), but as the
> > > >> comment in include/linux/i2c.h above the locked i2c_smbus_xfer() s=
ays:
> > > >>
> > > >> /* This is the very generalized SMBus access routine. You probably=
 do not
> > > >>     want to use this, though; one of the functions below may be mu=
ch easier,
> > > >>     and probably just as fast.
> > > >>     Note that we use i2c_adapter here, because you do not need a s=
pecific
> > > >>     smbus adapter to call this function. */
> > > >> s32 i2c_smbus_xfer(...);
> > > >>
> > > >> So in this case a driver cannot use the usual
> > > >> i2c_smbus_read_byte/word/byte_data/word_data() helpers and
> > > >> the same for writes. Also using an i2c_regmap (which is used
> > > >> in a ton of places like PMIC drivers) will not work this way.
> > > >>
> > > >> So yes you can use i2c_bus_lock() for this; but only if all the
> > > >> drivers where you want to do that limit themselves to
> > > >> __i2c_transfer() and __i2c_smbus_xfer() calls and/or are
> > > >> rewritten to only use those.
> > > >>>> This is why in the Bay Trail case we have i2c-drivers
> > > >>>> directly calling iosf_mbi_block_punit_i2c_access() and
> > > >>>> iosf_mbi_unblock_punit_i2c_access() to lock the bus
> > > >>>> for multiple i2c-transfers. We can get away with this there
> > > >>>> because the bus in question is only used to access the
> > > >>>> PMIC and that PMIC is only used on Bay Trail (and CHT)
> > > >>>> boards, so the PMIC drivers can just hard-code these
> > > >>>> calls.
> > > >>>>
> > > >>>> If you need to take the PSP I2C semaphore for multiple
> > > >>>> transfers in some generic drivers, then I guess that the
> > > >>>> i2c-subsys will need to get some new i2c_adapter callbacks
> > > >>>> to acquire / release the bus for i2c-controllers where
> > > >>>> the bus/controller is shared with some co-processor like
> > > >>>> in the PSP case.
> > > >>>
> > > >>> This is exactly my intention to support generic i2c-clients drive=
rs
> > > >>> without them being aware that i2c-adapter above is using some
> > > >>> semaphore/arbitration. Hopefully you can agree with me that curre=
ntly
> > > >>> available bus_locking can be used and is enough for this purpose.
> > > >>
> > > >> It can be used, but with limitations, see above.
> > > >>
> > > >>>
> > > >>>> Also note that iosf_mbi_block_punit_i2c_access() and
> > > >>>> iosf_mbi_unblock_punit_i2c_access() do their own
> > > >>>> ref/lock-counting to allow calling them multiple times and
> > > >>>> the first block call takes the bus and the last unblock
> > > >>>> call releases it.
> > > >>>
> > > >>> This is exactly what I was talking about above and also implement=
ed
> > > >>> within psp_acquire_i2c_bus() and psp_release_i2c_bus().
> > > >>
> > > >> Right, I was to quick in skimming over your code when
> > > >> I wrote down my concerns about there being a deadlock
> > > >> there, sorry.
> > > >>
> > > >> Regards,
> > > >>
> > > >> Hans
