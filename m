Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB51495DA1
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 11:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238159AbiAUKUb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 05:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234819AbiAUKUa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 05:20:30 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A06C061574
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jan 2022 02:20:30 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id d12-20020a17090a628c00b001b4f47e2f51so10199777pjj.3
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jan 2022 02:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4bQUQUrp6OKMRuErxCI4+Pj68RPGOV0SOzl5ywhF9EQ=;
        b=EmyvqfUJD0GuD8i2+SaKrH4FwQXg6Z/8/wL19l0IasGa6atHR5pTFuIdEptQG46/4J
         rlct4qhoj9QQoCFKK0iQLd//EQKk5XUiTFMUUk2z03fIJ0VHksdmsDwVSLtfDLRJOt4w
         1keliqAXtZmUl9wFxyD2Cli9YLX5Nw/FgiuPkbQ/FXo9TFsQgIxXcBrQ1CLHJo15DE02
         UEPr7Nt1nyiAAjVVpgkl3rujhn/elXBNPu7fRU4xkAP69eNlfusqSIoLpyOcVjPm+Sgf
         Zf+H6G1O5Ndppjfmw5ZIVqLYbUEXwMnsQs2Fw04IFclHRgG1kXOtR/FeSqpMvp3PGhDK
         ejZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4bQUQUrp6OKMRuErxCI4+Pj68RPGOV0SOzl5ywhF9EQ=;
        b=eVJD1FJmAwDHgcNKnLQLTBArjPoyuLaOxBdgrQKPEcNb6IrBFdxhikVSRLYrF3BV/+
         enathqCpJq+AGnu0+zuPTkzKwNMWGp9AAOCzbZBsDC4r7f2TNqB2c+jPVhIFvk1fO64Z
         YcB2hI7gamh6qgoeMTlARU/LMR/fjV/VqWyfPmgclyzhMO+jbH2TbM+rsXGk+WgERwnV
         javiLAgL2/ULKJ00osNJ5s7yr6sBsPCSk/qybwytcw/1PkTG1/0T4/r75OwJLQPKOjaZ
         Qj4MqVd+1rGnFeWAUkRP2xWo00eqbpfDfb/Xl2Lh4dUslqDsrgy3lxycN4b3vDjL4ezu
         VawA==
X-Gm-Message-State: AOAM530LhecRm6DJaZbewPH1Hm/S59ioZYNTwrfsBNcyLdFQAga8QbN1
        vMYIGvvoNnoyjpqq3DNyBOLzBTOpzzYgpBUMJ6Qk8w==
X-Google-Smtp-Source: ABdhPJyA9jf5RX/pUBosrIDIOM9esystJ/rjxmAUTLvxAiA6fIbjM+sg/y9MK1s0XkX0hPOjJPe01/j9XB3JmHhupH4=
X-Received: by 2002:a17:90a:d913:: with SMTP id c19mr78643pjv.90.1642760429884;
 Fri, 21 Jan 2022 02:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-1-jsd@semihalf.com> <20220120001621.705352-3-jsd@semihalf.com>
 <YelvqHuxaIOB+yP1@smile.fi.intel.com>
In-Reply-To: <YelvqHuxaIOB+yP1@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 21 Jan 2022 11:20:19 +0100
Message-ID: <CAOtMz3OeuhKAikkwdzcEaEKU6FRrYkC7=iiwUeDg+VEZZxsQRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 20 sty 2022 o 15:21 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Thu, Jan 20, 2022 at 01:16:21AM +0100, Jan Dabros wrote:
> > Implement an I2C controller sharing mechanism between the host (kernel)
> > and PSP co-processor on some platforms equipped with AMD Cezanne SoC.
> >
> > On these platforms we need to implement "software" i2c arbitration.
> > Default arbitration owner is PSP and kernel asks for acquire as well
> > as inform about release of the i2c bus via mailbox mechanism.
> >
> >             +---------+
> >  <- ACQUIRE |         |
> >   +---------|   CPU   |\
> >   |         |         | \      +----------+  SDA
> >   |         +---------+  \     |          |-------
> > MAILBOX                   +--> |  I2C-DW  |  SCL
> >   |         +---------+        |          |-------
> >   |         |         |        +----------+
> >   +---------|   PSP   |
> >    <- ACK   |         |
> >             +---------+
> >
> >             +---------+
> >  <- RELEASE |         |
> >   +---------|   CPU   |
> >   |         |         |        +----------+  SDA
> >   |         +---------+        |          |-------
> > MAILBOX                   +--> |  I2C-DW  |  SCL
> >   |         +---------+  /     |          |-------
> >   |         |         | /      +----------+
> >   +---------|   PSP   |/
> >    <- ACK   |         |
> >             +---------+
> >
> > The solution is similar to i2c-designware-baytrail.c implementation, wh=
ere
> > we are using a generic i2c-designware-* driver with a small "wrapper".
> >
> > In contrary to baytrail semaphore implementation, beside internal
> > acquire_lock() and release_lock() methods we are also applying quirks t=
o
> > lock_bus() and unlock_bus() global adapter methods. With this in place
> > all i2c clients drivers may lock i2c bus for a desired number of i2c
> > transactions (e.g. write-wait-read) without being aware of that such bu=
s
> > is shared with another entity.
> >
> > Modify i2c_dw_probe_lock_support() to select correct semaphore
> > implementation at runtime, since now we have more than one available.
> >
> > Configure new matching ACPI ID "AMDI0019" and register
> > ARBITRATION_SEMAPHORE flag in order to distinguish setup with PSP
> > arbitration.
>
> > Add new entry in MAINTAINERS file to cover new module.
>
> It's confusing. You added yourself as a reviewer for I2C DesignWare drive=
r,
> which is great, but not described in the commit message.

Should I rephrase this sentence (to be more specific that I may be
helpful for reviewing amdpsp.c module) or rather you mean to exclude
drivers/i2c/busses/i2c-designware-amdpsp.c from the rest of
designware-* modules and create separate entry?

Actually initially I wasn't planning to modify MAINTAINERS (after all
I'm not an I2C DesignWare expert) until run checkpatch.pl which
recommended to do so when adding new file. Eventually for me it made
some sense since I have a platform equipped with AMD Cezanne SoC and I
will be able to review and test potential changes in
i2c-designware-amdpsp.c or in general around semaphore areas.

This may also work with different model, similar to how you pointed me
to Hans as an owner of Bay Trail platform who is acquinted with how
its i2c semaphore is working. I will simply remove myself from the
MAINTAINERS file and you can add me to the threads if there is
anything requiring my help.

Let me know which way is working for you. I just thought it is not
good to leave you alone with a new module which you cannot actually
test and don't have deep insight about how PSP-x86 communications
works.

>
> ...
>
> >       { "AMD0020", APD_ADDR(cz_uart_desc) },
>
> >       { "AMDI0020", APD_ADDR(cz_uart_desc) },
> >       { "AMDI0022", APD_ADDR(cz_uart_desc) },
> > +     { "AMDI0019", APD_ADDR(wt_i2c_desc) },
>
> This addition adds more chaos in the ordering (the group of AMDI should b=
e
> after AMD as far as I can see here). Can you order the entries by IDs?

Sure.

>
> >       { "AMD0030", },
> >       { "AMD0040", APD_ADDR(fch_misc_desc)},
>
> ...
>
> > +#include <asm/msr.h>
>
> Usually linux/* followed by asm/*.
>
> > +#include <linux/i2c.h>
> > +#include <linux/psp-sev.h>
>
> types.h?

I need to take a deeper look at the headers included here, especially
considering errors pointed by kernel test robot. Not sure why I
haven't seen any issues on my setup.

>
> ...
>
> > +union psp_req_buffer_hdr {
> > +     struct {
> > +             u32 total_size;
> > +             u32 status;
> > +     } __packed;
>
> What does packet bring you here?

In this particular case binary-wise nothing, I can as well drop this.
It may be necessary if there are some changes in this structs fields
in future (e.g changing total_size to u8), since PSP expects every
field to be byte-aligned.

>
> > +     u64 hdr_val;
>
> And why does this not have the same alignment since it's also part of
> the union?

__packed is not about alignment of the whole struct/union but about
lack of padding between its fields. As above - in this particular case
with two u32 it doesn't matter.

>
> > +};
> > +
> > +enum psp_i2c_req_type {
> > +     PSP_I2C_REQ_ACQUIRE,
> > +     PSP_I2C_REQ_RELEASE,
>
> > +     PSP_I2C_REQ_MAX,
>
> Is MAX a terminator or not?
> If former, no comma.

ACK.

>
> > +};
> > +
> > +struct psp_i2c_req {
> > +     union psp_req_buffer_hdr hdr;
> > +     enum psp_i2c_req_type type;
>
> > +} __packed __aligned(32);
>
> Can you explain, what this means and how it's supposed to work?

This means that each instance of the struct should be aligned (32)
while at the same time no padding within members - thus this may
result in non-aligned addresses of members.

>
> > +union psp_mbox_cmd_reg {
> > +     struct psp_mbox_cmd_fields {
> > +             u16 mbox_status;
> > +             u8 mbox_cmd;
> > +             u8 reserved:6;
> > +             u8 recovery:1;
> > +             u8 ready:1;
>
> > +     } __packed fields;
>
> So, what is the __packed purpose here?

As in all above cases - considering current layout of members and
their sizes dropping `__packed` will not results in any errors.

However PSP expects all members os structs within shared buffers to be
byte-aligned, that's why I've added this attributes to be on the safe
side. If you think this doesn't make sense, I can remove them - in
(very unlikely) case of changes, one will need to add this specifier.

> > +     u32 val;
> > +};
> > +
> > +struct psp_mbox {
> > +     union psp_mbox_cmd_reg fields;
> > +     uintptr_t i2c_req_addr;
> > +} __packed;
>
> ...
>
> > +static int psp_mbox_probe(void)
> > +{
> > +     unsigned long mbox_addr;
> > +
> > +     if (psp_get_mbox_addr(&mbox_addr))
>
> > +             return -1;
>
> Use error code.

ACK.

>
> > +     mbox_iomem =3D ioremap(mbox_addr, sizeof(struct psp_mbox));
> > +     if (!mbox_iomem)
> > +             return -ENOMEM;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +     union psp_mbox_cmd_reg tmp =3D {0};
>
> > +     tmp.val =3D readl(&mbox->fields.val);
> > +     return !!tmp.fields.recovery;
>
> OK, I understood the purpose of unions, no, please use bitfield.h APIs.

OK.

> ...
>
> > +     struct psp_mbox *mbox =3D (struct psp_mbox *)mbox_iomem;
>
> Heck, no!

I need to get acquinted to the kernel-reviewer language:) Pardon my
ignorance, but just to be sure I get what you mean here:
I'm using global mbox_iomem to keep address of PSP mailbox in IO
memory. Casting this to struct psp_mbox layout here, to make access
more convenient.
Your point here is that:
1. I should move the assignment out from the variable declaration part
of this function;
2. I should use ioremap/iounmap each time in psp_send_cmd instead of
using it once in `probe` and unmap in `remove`?
I thought about this option as to be less effective performance-wise
(even though I can get rid of one global variable).
3. Something else?

> ...
>
> > +     /* Fill address of command-response buffer */
> > +     writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
>
> What does this voodoo mean?!

Basically I need to take physical address (__psp_pa) of request buffer
req and write this down into mailbox IO memory.
This should be spread into more lines with some comments, is this your poin=
t?

>
> ...
>
> > +     start =3D jiffies;
> > +     do {
> > +             if (psp_send_cmd(req)) {
> > +                     ret =3D -EIO;
> > +                     goto cleanup;
> > +             }
> > +
> > +             status =3D check_i2c_req_sts(req);
> > +             if (!status) {
> > +                     dev_dbg(psp_i2c_dev, "Request accepted by PSP aft=
er %ums\n",
> > +                             jiffies_to_msecs(jiffies - start));
> > +                     ret =3D 0;
> > +                     goto cleanup;
> > +             } else if (status =3D=3D -EBUSY) {
> > +                     retry_cnt--;
> > +             } else {
> > +                     ret =3D -EIO;
> > +                     goto cleanup;
> > +             };
> > +
> > +             /* IF EBUSY, give PSP time to finish its i2c activities *=
/
> > +             mdelay(PSP_I2C_REQ_RETRY_DELAY_MSEC);
> > +     } while (retry_cnt);
>
> NIH iopoll.h API(s).

I don't think macros avaialble in iopoll.h are suitable here.
Procedure above is not about simply reading some IO and waiting for
particular condition to be met with this particular value. Eventually
`psp_send_cmd()` invokes `psp_wait_cmd()` where I'm using
`readl_poll_timeout()`, so on lower level I'm making use of this API.
However here I don't see any obvious method how to incorporate
iopoll.h API to reach my goal.

> > +     ret =3D -ETIMEDOUT;
>
> ...
>
> > +     status =3D psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> > +     if (!status) {
>
> Handle errors first.
>
> ...
>
> > +             goto cleanup;
> > +     } else if (status =3D=3D -ETIMEDOUT) {
>
> In this case it's redundant 'else'.

Addressing above two comments - what do you think about below:
if (status) {
      if (status =3D=3D -ETIMEDOUT)
               dev_err(psp_i2c_dev, "Timed out waiting for PSP to
release I2C bus\n");
      else
               dev_err(psp_i2c_dev, "PSP communication error\n");

       dev_err(psp_i2c_dev, "PSP communication error\n");
       psp_i2c_mbox_fail =3D true;
       goto cleanup;
}

psp_i2c_sem_acquired =3D jiffies;
psp_i2c_access_count++;
(...)

> ...
>
> > +     /* Send a release command to PSP */
> > +     status =3D psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
> > +     if (!status) {
> > +             dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
> > +                     jiffies_to_msecs(jiffies - psp_i2c_sem_acquired))=
;
> > +             goto cleanup;
> > +     } else if (status =3D=3D -ETIMEDOUT) {
> > +             dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquir=
e I2C bus\n");
> > +     } else {
> > +             dev_err(psp_i2c_dev, "PSP communication error\n");
> > +     }
>
> As per above comments.

OK, will do similar as proposed above if this looks good for you.

> ...
>
> > +     int ret;
> > +
> > +     ret =3D rt_mutex_trylock(&adapter->bus_lock);
> > +     if (!ret)
>
>         if (ret)
>                 ...

ACK.

> > +             psp_acquire_i2c_bus();
> > +
> > +     return ret;
>
> ...
>
> > +     /* Allow to bind only one instance of a driver */
> > +     if (!psp_i2c_dev)
> > +             psp_i2c_dev =3D dev->dev;
> > +     else
> > +             return -EEXIST;
>
> As per above.

ACK.

> ...
>
> > +     if (psp_mbox_probe())
> > +             return -EIO;
>
> Why error code is hidden?

Will propagate error from psp_mbox_probe.

> ...
>
> > +     /*
> > +      * Install global locking callbacks for adapter as well as intern=
al i2c
> > +      * controller locks
>
> Missed period.

ACK.

> > +      */
>
> ...
>
> >       { "AMD0010", ACCESS_INTR_MASK },
> >       { "AMDI0010", ACCESS_INTR_MASK },
> >       { "AMDI0510", 0 },
> > +     { "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
>
> It's not in order.

ACK.

> ...
>
> > +static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_tab=
le[] =3D {
> > +#ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
> > +     {
> > +             .probe =3D i2c_dw_baytrail_probe_lock_support,
>
> > +             .remove =3D NULL,
>
> See below.
>
> > +     },
> > +#endif
> > +#ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
> > +     {
> > +             .probe =3D i2c_dw_amdpsp_probe_lock_support,
> > +             .remove =3D i2c_dw_amdpsp_remove_lock_support,
> > +     },
> > +#endif
>
> > +     {
> > +             .probe =3D NULL,
> > +             .remove =3D NULL,
> > +     },
>
> First of all, it should be terminating entry, so no comma.
> On top of that, no need to assign 0/NULL to static variables.
> So here, it will become as simple as
>
>         {}

ACK.

> > +};
>
> ...
>
> > +static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> > +{
> > +     int ret;
> > +     int i;
> > +
> > +     dev->semaphore_idx =3D -1;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(i2c_dw_semaphore_cb_table); i++) {
>
> > +             if (!i2c_dw_semaphore_cb_table[i].probe)
> > +                     continue;
>
> Huh?

Just to be sure I get your point.
Once I found terminating entry, I will get out of the loop and return
0 as there are no semaphores to be "applied". Actually I should
probably use `break;` here as there shouldn't be a case when certain
type of semaphore installs without `probe` being implemented.

Best Regards,
Jan

> > +     }
> > +
> > +     return 0;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
