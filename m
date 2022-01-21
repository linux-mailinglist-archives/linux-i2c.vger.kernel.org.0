Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9097B495DC9
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 11:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349983AbiAUKc3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 05:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42825 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349978AbiAUKc2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 05:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642761148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BjbLuT3rjABAPmhV+7k/9649tQb9ApRyvEl0hL9eOZw=;
        b=hGxZHg/OgVa3B0yBPobE/eEw2lmn0LaF8AIU2D4DE+bUvPNT2EMVddPBBTFZPjmziOatIW
        kzjtm8UlwQ7kF4N6XMK5xnlzvRsFlK3FW0vkldap4L/n4g3Lqwd/QShKvUnHx49dLlFb3x
        nkD10jWmW8UtBs01xfOVHGSccXQbKNE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-7HEV8ewXMaOo6A5tqD_JfA-1; Fri, 21 Jan 2022 05:32:25 -0500
X-MC-Unique: 7HEV8ewXMaOo6A5tqD_JfA-1
Received: by mail-ed1-f71.google.com with SMTP id c8-20020a05640227c800b003fdc1684cdeso8725267ede.12
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jan 2022 02:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BjbLuT3rjABAPmhV+7k/9649tQb9ApRyvEl0hL9eOZw=;
        b=YOf2pW/C77GVY1aoVnpbxnbOPUdj+I+5rCUvtl3rY90cjb5AO38PwGXfrtb72jykoE
         PZhUYN+Biw4S46A/cHJmLEdLJKWB/RJzSQXZpXfIq+zBhV9xm+M5rwYMgF0J6Db7+x6H
         E3JMEP6kzA7dhXgHEEmgcnVg1YIZKFHv82EQ5D+pA0cJM1x37QaG0sF13rqUlLzJP7Yp
         SQPAs5wvPawXBT/LGZz3sBbaVfm1gjdxEYC10xJGaBi0j/YAjzFPsdH3wnBvcBQqaCVz
         Xh0jIqxeRVwAm3QW5u9sWEMum2fkUJTL3ktvuu38FyBaGzoxWfXN/3WZKPDHj79873Cu
         BZJQ==
X-Gm-Message-State: AOAM530SBj+c7Rmn5dIMlZ+F6MWU6ap48yz9FmGz4OH/wZ/6tOES3drZ
        W27VM3OG9RS+S25C62U1G0F/+6CTwFhFOIeuvCbLtuyKyBT7hHmoYdodHC1OQpC9j4v9w6hru99
        nyMo/TDNkYOnp2X8MPtnK
X-Received: by 2002:a17:906:300e:: with SMTP id 14mr2839986ejz.732.1642761144549;
        Fri, 21 Jan 2022 02:32:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6t0PnxMFnE3ygPuEfkO4j3ZJ1oGED+8racz8c5SiQEz6xgXMK6Guexkqnwq6nwH7Sm1WH1A==
X-Received: by 2002:a17:906:300e:: with SMTP id 14mr2839966ejz.732.1642761144231;
        Fri, 21 Jan 2022 02:32:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c14sm2484617edy.66.2022.01.21.02.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 02:32:23 -0800 (PST)
Message-ID: <b30a212f-643d-c85d-6301-d92ee0adf098@redhat.com>
Date:   Fri, 21 Jan 2022 11:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Content-Language: en-US
To:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
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
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-3-jsd@semihalf.com>
 <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com>
 <CAOtMz3NcMZsCMO+15wzzwvF44PqRmem1eP-rCbb+dCiaWiGKzA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOtMz3NcMZsCMO+15wzzwvF44PqRmem1eP-rCbb+dCiaWiGKzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jan,

On 1/21/22 10:59, Jan Dąbroś wrote:
> (...)
> 
>>> --- /dev/null
>>> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
>>> @@ -0,0 +1,357 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <asm/msr.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/psp-sev.h>
>>> +
>>> +#include "i2c-designware-core.h"
>>
>> So all the stuff starting here:
>>
>>> +
>>> +#define MSR_AMD_PSP_ADDR     0xc00110a2
>>> +#define PSP_MBOX_OFFSET              0x10570
>>> +#define PSP_CMD_TIMEOUT_MS   500
>>> +
>>> +#define PSP_I2C_REQ_BUS_CMD          0x64
>>> +#define PSP_I2C_REQ_RETRY_CNT                10
>>> +#define PSP_I2C_REQ_RETRY_DELAY_MSEC 50
>>> +#define PSP_I2C_REQ_STS_OK           0x0
>>> +#define PSP_I2C_REQ_STS_BUS_BUSY     0x1
>>> +#define PSP_I2C_REQ_STS_INV_PARAM    0x3
>>> +
>>> +union psp_req_buffer_hdr {
>>> +     struct {
>>> +             u32 total_size;
>>> +             u32 status;
>>> +     } __packed;
>>> +     u64 hdr_val;
>>> +};
>>> +
>>> +enum psp_i2c_req_type {
>>> +     PSP_I2C_REQ_ACQUIRE,
>>> +     PSP_I2C_REQ_RELEASE,
>>> +     PSP_I2C_REQ_MAX,
>>> +};
>>> +
>>> +struct psp_i2c_req {
>>> +     union psp_req_buffer_hdr hdr;
>>> +     enum psp_i2c_req_type type;
>>> +} __packed __aligned(32);
>>> +
>>> +union psp_mbox_cmd_reg {
>>> +     struct psp_mbox_cmd_fields {
>>> +             u16 mbox_status;
>>> +             u8 mbox_cmd;
>>> +             u8 reserved:6;
>>> +             u8 recovery:1;
>>> +             u8 ready:1;
>>> +     } __packed fields;
>>> +     u32 val;
>>> +};
>>> +
>>> +struct psp_mbox {
>>> +     union psp_mbox_cmd_reg fields;
>>> +     uintptr_t i2c_req_addr;
>>> +} __packed;
>>> +
>>> +static DEFINE_MUTEX(psp_i2c_access_mutex);
>>> +static unsigned long psp_i2c_sem_acquired;
>>> +static void __iomem *mbox_iomem;
>>> +static u32 psp_i2c_access_count;
>>> +static bool psp_i2c_mbox_fail;
>>> +static struct device *psp_i2c_dev;
>>> +
>>> +static int psp_get_mbox_addr(unsigned long *mbox_addr)
>>> +{
>>> +     unsigned long long psp_mmio;
>>> +
>>> +     if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
>>> +             return -EIO;
>>> +
>>> +     *mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int psp_mbox_probe(void)
>>> +{
>>> +     unsigned long mbox_addr;
>>> +
>>> +     if (psp_get_mbox_addr(&mbox_addr))
>>> +             return -1;
>>> +
>>> +     mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
>>> +     if (!mbox_iomem)
>>> +             return -ENOMEM;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/* Recovery field should be equal 0 to start sending commands */
>>> +static int psp_check_mbox_recovery(struct psp_mbox *mbox)
>>> +{
>>> +     union psp_mbox_cmd_reg tmp = {0};
>>> +
>>> +     tmp.val = readl(&mbox->fields.val);
>>> +     return !!tmp.fields.recovery;
>>> +}
>>> +
>>> +static int psp_wait_cmd(struct psp_mbox *mbox)
>>> +{
>>> +     union psp_mbox_cmd_reg expected = { .val = 0 };
>>> +     u32 tmp;
>>> +
>>> +     /* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
>>> +     expected.fields.ready = 1;
>>> +
>>> +     return readl_poll_timeout(&mbox->fields.val, tmp, (tmp == expected.val),
>>> +                               0, 1000 * PSP_CMD_TIMEOUT_MS);
>>> +}
>>> +
>>> +/* Status equal to 0 means that PSP succeed processing command */
>>> +static int psp_check_mbox_sts(struct psp_mbox *mbox)
>>> +{
>>> +     union psp_mbox_cmd_reg cmd_reg = {0};
>>> +
>>> +     cmd_reg.val = readl(&mbox->fields.val);
>>> +     return cmd_reg.fields.mbox_status;
>>> +}
>>> +
>>> +static int psp_send_cmd(struct psp_i2c_req *req)
>>> +{
>>> +     struct psp_mbox *mbox = (struct psp_mbox *)mbox_iomem;
>>> +     union psp_mbox_cmd_reg cmd_reg = {0};
>>> +
>>> +     if (psp_check_mbox_recovery(mbox))
>>> +             return -EIO;
>>> +
>>> +     if (psp_wait_cmd(mbox))
>>> +             return -EBUSY;
>>> +
>>> +     /* Fill address of command-response buffer */
>>> +     writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
>>> +
>>> +     /* Write command register to trigger processing */
>>> +     cmd_reg.fields.mbox_cmd = PSP_I2C_REQ_BUS_CMD;
>>> +     writel(cmd_reg.val, &mbox->fields.val);
>>> +
>>> +     if (psp_wait_cmd(mbox))
>>> +             return -ETIMEDOUT;
>>> +
>>> +     if (psp_check_mbox_sts(mbox))
>>> +             return -EIO;
>>> +
>>> +     return 0;
>>> +}
>>
>> Through here seems to all be generic code for accessing
>> the AMD PSP. To me this seems like something which belongs
>> in a separate AMD-PSP-mbox driver/lib, which can then be
>> shared between other kernel drivers which may also want
>> to access PSP.
> 
> I see your point clearly and actually it is not an accident that I've
> put all PSP-mailbox methods in one "block". They are logically
> different than the rest of i2c-adapter specific methods.
> 
> That being said, above PSP mailbox was created by AMD solely for the
> purpose of i2c_arbitration. It has its own set of commands and
> specific format of the command-response buffer. Thus it is not and it
> won't be generic in the future. There are already upstreamed drivers
> from AMD (under drivers/crypto/ccp/) which made use of PSP, however
> their channel of communication looks completely different than the
> very simple i2c_arbitration model implemented above.
> 
> Because of this I'm treating this as an i2c_semaphore-related code and
> putting this in this module. In my opinion moving this into some
> separate driver (which will be actually used only here) makes code
> less clear. But let's also hear some voice from AMD.

Since as you say this mailbox is special and only for i2c-arbitration,
keeping it inside this patch / .c file is fine.

> 
>>
>> Sorta like the generic iosf_mbi_read() and
>> iosf_mbi_write() functions from:
>>
>> arch/x86/platform/intel/iosf_mbi.c
>>
>> used on the Intel chips, which are also used outside of
>> the I2C bus-locking code.
>>
>> This is also one of the reasons why I think it would be
>> good to get some AMD folks involved in this, since they
>> may be aware of other drivers which also need to access
>> the PSP mbox.
>>
> 
> Right, I'm adding mario.limonciello@amd.com to the CC, so that he can comment.
> 
> (...)
> 
>>> +/*
>>> + * Locking methods are based on the default implementation from
>>> + * drivers/i2c/i2c-core.base.c, but with psp acquire and release operations
>>> + * added. With this in place we can ensure that i2c clients on the bus shared
>>> + * with psp are able to lock HW access to the bus for arbitrary number of
>>> + * operations - that is e.g. write-wait-read.
>>> + */
>>> +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
>>> +                                     unsigned int flags)
>>> +{
>>> +     psp_acquire_i2c_bus();
>>> +     rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapter));
>>
>> This does not do what you think it does and you will still deadlock
>> when things nest because of someone taking the bus-lock and then
>> the main i2c-designware transfer function calling the acquire_lock
>> callback.
> 
> I haven't used rt_mutex_lock_nested() with the intent to prevent me
> from deadlock when i2c-designware calls acquire_lock with bus-lock
> already taken. This is a method copied from
> drivers/i2c/i2c-core-base.c (BTW, I have a typo in above comment).
> This is the default implementation applied by i2c-core when particular
> adapter doesn't register its own locking callbacks - thus it is called
> for i2c-designware for all platforms.
> 
> In case of this driver internal i2c-designware acquire_lock() is equal
> to psp_acquire_i2c_bus(). In other words, bus-level lock
> i2c_adapter_dw_psp_lock_bus() is a superset of internal adapter's
> acquire_lock().

Ah I missed that this is just mimicking the core functions +
an extra call to psp_acquire_i2c_bus().

I assumed that the dwc->acquire callback path was also taking
the mutex and I thought you had fallen for the _nested meaning
something different then it does, my bad.

> In order to prevent deadlock which you are talking about, I'm using
> reference lock counter inside psp_acquire_i2c_bus() thus it is safe to
> invoke acquire_lock() when bus-lock is already taken.

Ah good, that is pretty much is the same as what the Bay Trail code
is doing.

> 
>>
>> The _nested postfix is only for the lockdep lock-debugger, this
>> actually turns into a regular mutex_lock when lockdep is not enabled:
>>
>> #ifdef CONFIG_DEBUG_LOCK_ALLOC
>> extern void rt_mutex_lock_nested(struct rt_mutex *lock, unsigned int subclass);
>> #define rt_mutex_lock(lock) rt_mutex_lock_nested(lock, 0)
>> #else
>> extern void rt_mutex_lock(struct rt_mutex *lock);
>> #define rt_mutex_lock_nested(lock, subclass) rt_mutex_lock(lock)
>> #endif
>>
>> The _nested postfix as such is only to tell the lockdep code that
>> even though it seems we are trying to take the same mutex twice
>> since in both cases it is of i2c_adapter.rt_mutex "lock class"
>> that we are sure it is never the same i2c_adapter (but rather
>> one which always gets called in a nested fashion from another
>> i2c_adapter).
>>
>> IOW this only disables a false-positive lockdep warning, it does
>> not allow taking the same mutex twice, you will still hang on
>> the second mutex_lock call on the same lock.
> 
> Thanks for the technical background about rt_mutex_lock_nested. I
> think we should keep using it as is, since as I wrote above I don't
> have any reasoning to modify it here.

Ack, now that my misreading of the code has been cleared up
I agree.

>> Also I don't think you are allowed to use the bus_locking code
>> like this. The i2c bus-locking code is intended to deal with
>> busses which have muxes in them, where the mux must be set
>> to the right branch of the bus to reach the client and then
>> not be changed during the transfer to that client.
>>
>> So i2c-client drivers are never supposed to directly call
>> the bus-locking functions.
> 
> I think you are not correct here. There are examples of i2c-clients
> which are using i2c bus_locking for the purpose of locking adapter for
> the bunch of i2c transactions.
> 
> As an example let's take drivers/char/tpm/tpm_tis_i2c_cr50.c. It
> operates in write-wait-read model and there is i2c_lock_bus() call
> used to ensure that bus won't be released -
> https://github.com/torvalds/linux/blob/master/drivers/char/tpm/tpm_tis_i2c_cr50.c#L202.
> 
> Similar model is followed in drivers/char/tpm/tpm_i2c_infineon.c and
> couple of other i2c-client drivers.

Ah I see, interesting (live and learn).

But this is then combined with using the special __i2c_transfer()
function for the actual i2c reads/writes, since using the regular
i2c_transfer() function after already taking the lock would deadlock.

There is a similar unlocked raw __i2c_smbus_xfer(), but as the
comment in include/linux/i2c.h above the locked i2c_smbus_xfer() says:

/* This is the very generalized SMBus access routine. You probably do not
   want to use this, though; one of the functions below may be much easier,
   and probably just as fast.
   Note that we use i2c_adapter here, because you do not need a specific
   smbus adapter to call this function. */
s32 i2c_smbus_xfer(...);

So in this case a driver cannot use the usual
i2c_smbus_read_byte/word/byte_data/word_data() helpers and
the same for writes. Also using an i2c_regmap (which is used
in a ton of places like PMIC drivers) will not work this way.

So yes you can use i2c_bus_lock() for this; but only if all the
drivers where you want to do that limit themselves to
__i2c_transfer() and __i2c_smbus_xfer() calls and/or are
rewritten to only use those.
>> This is why in the Bay Trail case we have i2c-drivers
>> directly calling iosf_mbi_block_punit_i2c_access() and
>> iosf_mbi_unblock_punit_i2c_access() to lock the bus
>> for multiple i2c-transfers. We can get away with this there
>> because the bus in question is only used to access the
>> PMIC and that PMIC is only used on Bay Trail (and CHT)
>> boards, so the PMIC drivers can just hard-code these
>> calls.
>>
>> If you need to take the PSP I2C semaphore for multiple
>> transfers in some generic drivers, then I guess that the
>> i2c-subsys will need to get some new i2c_adapter callbacks
>> to acquire / release the bus for i2c-controllers where
>> the bus/controller is shared with some co-processor like
>> in the PSP case.
> 
> This is exactly my intention to support generic i2c-clients drivers
> without them being aware that i2c-adapter above is using some
> semaphore/arbitration. Hopefully you can agree with me that currently
> available bus_locking can be used and is enough for this purpose.

It can be used, but with limitations, see above.

> 
>> Also note that iosf_mbi_block_punit_i2c_access() and
>> iosf_mbi_unblock_punit_i2c_access() do their own
>> ref/lock-counting to allow calling them multiple times and
>> the first block call takes the bus and the last unblock
>> call releases it.
> 
> This is exactly what I was talking about above and also implemented
> within psp_acquire_i2c_bus() and psp_release_i2c_bus().

Right, I was to quick in skimming over your code when
I wrote down my concerns about there being a deadlock
there, sorry.

Regards,

Hans

