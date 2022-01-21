Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB72495D2A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 11:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344496AbiAUKAF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 05:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349850AbiAUKAF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 05:00:05 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DE6C06173F
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jan 2022 02:00:05 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id u130so4137478pfc.2
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jan 2022 02:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x+daZel9I9QO4njXE84dTkfP9QeEXvF18SWN8mNzkjo=;
        b=6MuXsTThptNjLal4NIYgs103kQhZYy9XD2SwikhNCbYf5sbQWgNqrh/9wgmKt8rdfd
         /iRYz3MkDMuiyd25RPKqsgA6nnzaP6aXq+75DQlFEfHO4K5M3FhX6KLO8PC21tTybF3u
         ukqXU3CkzTk9O1YB2tAG7T+bGkSJCXeS4pvHEWVYnco5CQXUCs9plvVqSTG6DLDrvCW6
         bFlb3mSefKJ9TcSnsb7OuRcaDDlGhUiP8+tEbLvA9++hpKcaSJRz+onjaF7BdJSGE8I8
         Cez/BG6Klm/lhCJj9jBe5xuxvDzTNcekIQw1rxhRg4AF1OyFqa5JthgjjObQuLh5/8Lg
         fLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+daZel9I9QO4njXE84dTkfP9QeEXvF18SWN8mNzkjo=;
        b=ZUVdzclg8ksSSzF4SaKswRNYG2GX9lH+1niFcyUTEyrvNeLVASgmBBcPWQ4PiZspSm
         1eDB4ELkb6bst4jcR7JMcwAND5jWvltKj6zCUEJ4IJ3qAc+jkISK6u+EEwh1Dezb0zW6
         O0dtzHLzgImgvzv1+m9wzlAKrqtAIZSfVu2p6BUuS4Ob9pfNg1AXZBvLGY1Qd7VNPlPq
         rDysDv3tqtBHSNqcykmaAL1IbTnwWskj1iIkSc4kj5N+b/fcA9aeA5RtClLrLGukTs7H
         RSINhk/TsDKXmFzoiS75mvf5U0UgLFMbpmZzc3MNeFTKJkpzTwjgkErQQt5DJH/yIb8j
         eKiA==
X-Gm-Message-State: AOAM530PfSJti4jrXII6WqbAGWafmBaAYluY/PqOQOuG6peMXDMDqAi9
        tmo+6BvGGepX3SyE5qmJcGk+zuYereS0DxlECDG9pQ==
X-Google-Smtp-Source: ABdhPJxCtOAfQp3dzVxSNjnG4KSWYiPhrmMd8dcT6I6SDDSp23waMxM2MKi0nmHlrnGf0s136tIXOeQq2MsbYbugW+o=
X-Received: by 2002:a05:6a00:22d1:b0:4c2:5a55:960e with SMTP id
 f17-20020a056a0022d100b004c25a55960emr3227178pfj.74.1642759204436; Fri, 21
 Jan 2022 02:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-1-jsd@semihalf.com> <20220120001621.705352-3-jsd@semihalf.com>
 <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com>
In-Reply-To: <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 21 Jan 2022 10:59:53 +0100
Message-ID: <CAOtMz3NcMZsCMO+15wzzwvF44PqRmem1eP-rCbb+dCiaWiGKzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

(...)

> > --- /dev/null
> > +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> > @@ -0,0 +1,357 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <asm/msr.h>
> > +#include <linux/i2c.h>
> > +#include <linux/psp-sev.h>
> > +
> > +#include "i2c-designware-core.h"
>
> So all the stuff starting here:
>
> > +
> > +#define MSR_AMD_PSP_ADDR     0xc00110a2
> > +#define PSP_MBOX_OFFSET              0x10570
> > +#define PSP_CMD_TIMEOUT_MS   500
> > +
> > +#define PSP_I2C_REQ_BUS_CMD          0x64
> > +#define PSP_I2C_REQ_RETRY_CNT                10
> > +#define PSP_I2C_REQ_RETRY_DELAY_MSEC 50
> > +#define PSP_I2C_REQ_STS_OK           0x0
> > +#define PSP_I2C_REQ_STS_BUS_BUSY     0x1
> > +#define PSP_I2C_REQ_STS_INV_PARAM    0x3
> > +
> > +union psp_req_buffer_hdr {
> > +     struct {
> > +             u32 total_size;
> > +             u32 status;
> > +     } __packed;
> > +     u64 hdr_val;
> > +};
> > +
> > +enum psp_i2c_req_type {
> > +     PSP_I2C_REQ_ACQUIRE,
> > +     PSP_I2C_REQ_RELEASE,
> > +     PSP_I2C_REQ_MAX,
> > +};
> > +
> > +struct psp_i2c_req {
> > +     union psp_req_buffer_hdr hdr;
> > +     enum psp_i2c_req_type type;
> > +} __packed __aligned(32);
> > +
> > +union psp_mbox_cmd_reg {
> > +     struct psp_mbox_cmd_fields {
> > +             u16 mbox_status;
> > +             u8 mbox_cmd;
> > +             u8 reserved:6;
> > +             u8 recovery:1;
> > +             u8 ready:1;
> > +     } __packed fields;
> > +     u32 val;
> > +};
> > +
> > +struct psp_mbox {
> > +     union psp_mbox_cmd_reg fields;
> > +     uintptr_t i2c_req_addr;
> > +} __packed;
> > +
> > +static DEFINE_MUTEX(psp_i2c_access_mutex);
> > +static unsigned long psp_i2c_sem_acquired;
> > +static void __iomem *mbox_iomem;
> > +static u32 psp_i2c_access_count;
> > +static bool psp_i2c_mbox_fail;
> > +static struct device *psp_i2c_dev;
> > +
> > +static int psp_get_mbox_addr(unsigned long *mbox_addr)
> > +{
> > +     unsigned long long psp_mmio;
> > +
> > +     if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> > +             return -EIO;
> > +
> > +     *mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> > +
> > +     return 0;
> > +}
> > +
> > +static int psp_mbox_probe(void)
> > +{
> > +     unsigned long mbox_addr;
> > +
> > +     if (psp_get_mbox_addr(&mbox_addr))
> > +             return -1;
> > +
> > +     mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
> > +     if (!mbox_iomem)
> > +             return -ENOMEM;
> > +
> > +     return 0;
> > +}
> > +
> > +/* Recovery field should be equal 0 to start sending commands */
> > +static int psp_check_mbox_recovery(struct psp_mbox *mbox)
> > +{
> > +     union psp_mbox_cmd_reg tmp = {0};
> > +
> > +     tmp.val = readl(&mbox->fields.val);
> > +     return !!tmp.fields.recovery;
> > +}
> > +
> > +static int psp_wait_cmd(struct psp_mbox *mbox)
> > +{
> > +     union psp_mbox_cmd_reg expected = { .val = 0 };
> > +     u32 tmp;
> > +
> > +     /* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
> > +     expected.fields.ready = 1;
> > +
> > +     return readl_poll_timeout(&mbox->fields.val, tmp, (tmp == expected.val),
> > +                               0, 1000 * PSP_CMD_TIMEOUT_MS);
> > +}
> > +
> > +/* Status equal to 0 means that PSP succeed processing command */
> > +static int psp_check_mbox_sts(struct psp_mbox *mbox)
> > +{
> > +     union psp_mbox_cmd_reg cmd_reg = {0};
> > +
> > +     cmd_reg.val = readl(&mbox->fields.val);
> > +     return cmd_reg.fields.mbox_status;
> > +}
> > +
> > +static int psp_send_cmd(struct psp_i2c_req *req)
> > +{
> > +     struct psp_mbox *mbox = (struct psp_mbox *)mbox_iomem;
> > +     union psp_mbox_cmd_reg cmd_reg = {0};
> > +
> > +     if (psp_check_mbox_recovery(mbox))
> > +             return -EIO;
> > +
> > +     if (psp_wait_cmd(mbox))
> > +             return -EBUSY;
> > +
> > +     /* Fill address of command-response buffer */
> > +     writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
> > +
> > +     /* Write command register to trigger processing */
> > +     cmd_reg.fields.mbox_cmd = PSP_I2C_REQ_BUS_CMD;
> > +     writel(cmd_reg.val, &mbox->fields.val);
> > +
> > +     if (psp_wait_cmd(mbox))
> > +             return -ETIMEDOUT;
> > +
> > +     if (psp_check_mbox_sts(mbox))
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
>
> Through here seems to all be generic code for accessing
> the AMD PSP. To me this seems like something which belongs
> in a separate AMD-PSP-mbox driver/lib, which can then be
> shared between other kernel drivers which may also want
> to access PSP.

I see your point clearly and actually it is not an accident that I've
put all PSP-mailbox methods in one "block". They are logically
different than the rest of i2c-adapter specific methods.

That being said, above PSP mailbox was created by AMD solely for the
purpose of i2c_arbitration. It has its own set of commands and
specific format of the command-response buffer. Thus it is not and it
won't be generic in the future. There are already upstreamed drivers
from AMD (under drivers/crypto/ccp/) which made use of PSP, however
their channel of communication looks completely different than the
very simple i2c_arbitration model implemented above.

Because of this I'm treating this as an i2c_semaphore-related code and
putting this in this module. In my opinion moving this into some
separate driver (which will be actually used only here) makes code
less clear. But let's also hear some voice from AMD.

>
> Sorta like the generic iosf_mbi_read() and
> iosf_mbi_write() functions from:
>
> arch/x86/platform/intel/iosf_mbi.c
>
> used on the Intel chips, which are also used outside of
> the I2C bus-locking code.
>
> This is also one of the reasons why I think it would be
> good to get some AMD folks involved in this, since they
> may be aware of other drivers which also need to access
> the PSP mbox.
>

Right, I'm adding mario.limonciello@amd.com to the CC, so that he can comment.

(...)

> > +/*
> > + * Locking methods are based on the default implementation from
> > + * drivers/i2c/i2c-core.base.c, but with psp acquire and release operations
> > + * added. With this in place we can ensure that i2c clients on the bus shared
> > + * with psp are able to lock HW access to the bus for arbitrary number of
> > + * operations - that is e.g. write-wait-read.
> > + */
> > +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
> > +                                     unsigned int flags)
> > +{
> > +     psp_acquire_i2c_bus();
> > +     rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapter));
>
> This does not do what you think it does and you will still deadlock
> when things nest because of someone taking the bus-lock and then
> the main i2c-designware transfer function calling the acquire_lock
> callback.

I haven't used rt_mutex_lock_nested() with the intent to prevent me
from deadlock when i2c-designware calls acquire_lock with bus-lock
already taken. This is a method copied from
drivers/i2c/i2c-core-base.c (BTW, I have a typo in above comment).
This is the default implementation applied by i2c-core when particular
adapter doesn't register its own locking callbacks - thus it is called
for i2c-designware for all platforms.

In case of this driver internal i2c-designware acquire_lock() is equal
to psp_acquire_i2c_bus(). In other words, bus-level lock
i2c_adapter_dw_psp_lock_bus() is a superset of internal adapter's
acquire_lock().

In order to prevent deadlock which you are talking about, I'm using
reference lock counter inside psp_acquire_i2c_bus() thus it is safe to
invoke acquire_lock() when bus-lock is already taken.

>
> The _nested postfix is only for the lockdep lock-debugger, this
> actually turns into a regular mutex_lock when lockdep is not enabled:
>
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
> extern void rt_mutex_lock_nested(struct rt_mutex *lock, unsigned int subclass);
> #define rt_mutex_lock(lock) rt_mutex_lock_nested(lock, 0)
> #else
> extern void rt_mutex_lock(struct rt_mutex *lock);
> #define rt_mutex_lock_nested(lock, subclass) rt_mutex_lock(lock)
> #endif
>
> The _nested postfix as such is only to tell the lockdep code that
> even though it seems we are trying to take the same mutex twice
> since in both cases it is of i2c_adapter.rt_mutex "lock class"
> that we are sure it is never the same i2c_adapter (but rather
> one which always gets called in a nested fashion from another
> i2c_adapter).
>
> IOW this only disables a false-positive lockdep warning, it does
> not allow taking the same mutex twice, you will still hang on
> the second mutex_lock call on the same lock.

Thanks for the technical background about rt_mutex_lock_nested. I
think we should keep using it as is, since as I wrote above I don't
have any reasoning to modify it here.

>
> Also I don't think you are allowed to use the bus_locking code
> like this. The i2c bus-locking code is intended to deal with
> busses which have muxes in them, where the mux must be set
> to the right branch of the bus to reach the client and then
> not be changed during the transfer to that client.
>
> So i2c-client drivers are never supposed to directly call
> the bus-locking functions.

I think you are not correct here. There are examples of i2c-clients
which are using i2c bus_locking for the purpose of locking adapter for
the bunch of i2c transactions.

As an example let's take drivers/char/tpm/tpm_tis_i2c_cr50.c. It
operates in write-wait-read model and there is i2c_lock_bus() call
used to ensure that bus won't be released -
https://github.com/torvalds/linux/blob/master/drivers/char/tpm/tpm_tis_i2c_cr50.c#L202.

Similar model is followed in drivers/char/tpm/tpm_i2c_infineon.c and
couple of other i2c-client drivers.

> This is why in the Bay Trail case we have i2c-drivers
> directly calling iosf_mbi_block_punit_i2c_access() and
> iosf_mbi_unblock_punit_i2c_access() to lock the bus
> for multiple i2c-transfers. We can get away with this there
> because the bus in question is only used to access the
> PMIC and that PMIC is only used on Bay Trail (and CHT)
> boards, so the PMIC drivers can just hard-code these
> calls.
>
> If you need to take the PSP I2C semaphore for multiple
> transfers in some generic drivers, then I guess that the
> i2c-subsys will need to get some new i2c_adapter callbacks
> to acquire / release the bus for i2c-controllers where
> the bus/controller is shared with some co-processor like
> in the PSP case.

This is exactly my intention to support generic i2c-clients drivers
without them being aware that i2c-adapter above is using some
semaphore/arbitration. Hopefully you can agree with me that currently
available bus_locking can be used and is enough for this purpose.

> Also note that iosf_mbi_block_punit_i2c_access() and
> iosf_mbi_unblock_punit_i2c_access() do their own
> ref/lock-counting to allow calling them multiple times and
> the first block call takes the bus and the last unblock
> call releases it.

This is exactly what I was talking about above and also implemented
within psp_acquire_i2c_bus() and psp_release_i2c_bus().

Best Regards,
Jan


>
> Regards,
>
> Hans
>
>
>
>
>
> > +}
> > +
> > +static int i2c_adapter_dw_psp_trylock_bus(struct i2c_adapter *adapter,
> > +                                       unsigned int flags)
> > +{
> > +     int ret;
> > +
> > +     ret = rt_mutex_trylock(&adapter->bus_lock);
> > +     if (!ret)
> > +             psp_acquire_i2c_bus();
> > +
> > +     return ret;
> > +}
> > +
> > +static void i2c_adapter_dw_psp_unlock_bus(struct i2c_adapter *adapter,
> > +                                       unsigned int flags)
> > +{
> > +     psp_release_i2c_bus();
> > +     rt_mutex_unlock(&adapter->bus_lock);
> > +}
> > +
> > +static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
> > +     .lock_bus = i2c_adapter_dw_psp_lock_bus,
> > +     .trylock_bus = i2c_adapter_dw_psp_trylock_bus,
> > +     .unlock_bus = i2c_adapter_dw_psp_unlock_bus,
> > +};
> > +
> > +int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
> > +{
> > +     if (!dev || !dev->dev)
> > +             return -ENODEV;
> > +
> > +     if (!(dev->flags & ARBITRATION_SEMAPHORE))
> > +             return -ENODEV;
> > +
> > +     /* Allow to bind only one instance of a driver */
> > +     if (!psp_i2c_dev)
> > +             psp_i2c_dev = dev->dev;
> > +     else
> > +             return -EEXIST;
> > +
> > +     if (psp_mbox_probe())
> > +             return -EIO;
> > +
> > +     dev_info(psp_i2c_dev, "I2C bus managed by AMD PSP\n");
> > +
> > +     /*
> > +      * Install global locking callbacks for adapter as well as internal i2c
> > +      * controller locks
> > +      */
> > +     dev->adapter.lock_ops = &i2c_dw_psp_lock_ops;
> > +     dev->acquire_lock = psp_acquire_i2c_bus;
> > +     dev->release_lock = psp_release_i2c_bus;
> > +
> > +     return 0;
> > +}
> > +
> > +/* Unmap area used as a mailbox with PSP */
> > +void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
> > +{
> > +     iounmap(mbox_iomem);
> > +}
> > diff --git a/drivers/i2c/busses/i2c-designware-baytrail.c b/drivers/i2c/busses/i2c-designware-baytrail.c
> > index c6a7a00e1d52..0c674542dd99 100644
> > --- a/drivers/i2c/busses/i2c-designware-baytrail.c
> > +++ b/drivers/i2c/busses/i2c-designware-baytrail.c
> > @@ -12,25 +12,25 @@
> >
> >  #include "i2c-designware-core.h"
> >
> > -int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> > +int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev)
> >  {
> >       acpi_status status;
> >       unsigned long long shared_host = 0;
> >       acpi_handle handle;
> >
> >       if (!dev || !dev->dev)
> > -             return 0;
> > +             return -ENODEV;
> >
> >       handle = ACPI_HANDLE(dev->dev);
> >       if (!handle)
> > -             return 0;
> > +             return -ENODEV;
> >
> >       status = acpi_evaluate_integer(handle, "_SEM", NULL, &shared_host);
> >       if (ACPI_FAILURE(status))
> > -             return 0;
> > +             return -ENODEV;
> >
> >       if (!shared_host)
> > -             return 0;
> > +             return -ENODEV;
> >
> >       if (!iosf_mbi_available())
> >               return -EPROBE_DEFER;
> > diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> > index 4b26cba40139..1d65212fddbd 100644
> > --- a/drivers/i2c/busses/i2c-designware-core.h
> > +++ b/drivers/i2c/busses/i2c-designware-core.h
> > @@ -227,6 +227,8 @@ struct reset_control;
> >   * @hs_lcnt: high speed LCNT value
> >   * @acquire_lock: function to acquire a hardware lock on the bus
> >   * @release_lock: function to release a hardware lock on the bus
> > + * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
> > + *   -1 if there is no semaphore.
> >   * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
> >   * @disable: function to disable the controller
> >   * @disable_int: function to disable all interrupts
> > @@ -285,6 +287,7 @@ struct dw_i2c_dev {
> >       u16                     hs_lcnt;
> >       int                     (*acquire_lock)(void);
> >       void                    (*release_lock)(void);
> > +     int                     semaphore_idx;
> >       bool                    shared_with_punit;
> >       void                    (*disable)(struct dw_i2c_dev *dev);
> >       void                    (*disable_int)(struct dw_i2c_dev *dev);
> > @@ -297,6 +300,7 @@ struct dw_i2c_dev {
> >
> >  #define ACCESS_INTR_MASK     BIT(0)
> >  #define ACCESS_NO_IRQ_SUSPEND        BIT(1)
> > +#define ARBITRATION_SEMAPHORE        BIT(2)
> >
> >  #define MODEL_MSCC_OCELOT    BIT(8)
> >  #define MODEL_BAIKAL_BT1     BIT(9)
> > @@ -310,6 +314,11 @@ struct dw_i2c_dev {
> >  #define AMD_UCSI_INTR_REG    0x474
> >  #define AMD_UCSI_INTR_EN     0xd
> >
> > +struct i2c_dw_semaphore_callbacks {
> > +     int     (*probe)(struct dw_i2c_dev *dev);
> > +     void    (*remove)(struct dw_i2c_dev *dev);
> > +};
> > +
> >  int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
> >  u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
> >  u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
> > @@ -370,9 +379,12 @@ static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
> >  }
> >
> >  #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
> > -extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
> > -#else
> > -static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
> > +int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
> > +#endif
> > +
> > +#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
> > +int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
> > +void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
> >  #endif
> >
> >  int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
> > diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> > index 2bd81abc86f6..5844a4df4141 100644
> > --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> > +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> > @@ -51,6 +51,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
> >       { "AMD0010", ACCESS_INTR_MASK },
> >       { "AMDI0010", ACCESS_INTR_MASK },
> >       { "AMDI0510", 0 },
> > +     { "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
> >       { "APMC0D0F", 0 },
> >       { "HISI02A1", 0 },
> >       { "HISI02A2", 0 },
> > @@ -204,6 +205,64 @@ static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
> >       { } /* terminate list */
> >  };
> >
> > +static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
> > +#ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
> > +     {
> > +             .probe = i2c_dw_baytrail_probe_lock_support,
> > +             .remove = NULL,
> > +     },
> > +#endif
> > +#ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
> > +     {
> > +             .probe = i2c_dw_amdpsp_probe_lock_support,
> > +             .remove = i2c_dw_amdpsp_remove_lock_support,
> > +     },
> > +#endif
> > +     {
> > +             .probe = NULL,
> > +             .remove = NULL,
> > +     },
> > +};
> > +
> > +static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> > +{
> > +     int ret;
> > +     int i;
> > +
> > +     dev->semaphore_idx = -1;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(i2c_dw_semaphore_cb_table); i++) {
> > +             if (!i2c_dw_semaphore_cb_table[i].probe)
> > +                     continue;
> > +
> > +             ret = i2c_dw_semaphore_cb_table[i].probe(dev);
> > +             if (!ret) {
> > +                     dev->semaphore_idx = i;
> > +                     break;
> > +             } else if (ret == -ENODEV) {
> > +                     /*
> > +                      * If there is no semaphore device attached to this
> > +                      * controller, we shouldn't abort general i2c_controller
> > +                      * probe.
> > +                      */
> > +                     continue;
> > +             } else {
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
> > +{
> > +     if (dev->semaphore_idx < 0)
> > +             return;
> > +
> > +     if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
> > +             i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
> > +}
> > +
> >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> >  {
> >       struct i2c_adapter *adap;
> > @@ -334,6 +393,8 @@ static int dw_i2c_plat_remove(struct platform_device *pdev)
> >       pm_runtime_put_sync(&pdev->dev);
> >       dw_i2c_plat_pm_cleanup(dev);
> >
> > +     i2c_dw_remove_lock_support(dev);
> > +
> >       reset_control_assert(dev->rst);
> >
> >       return 0;
> >
>
