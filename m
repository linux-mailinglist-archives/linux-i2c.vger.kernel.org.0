Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A87496484
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 18:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381904AbiAURxZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 12:53:25 -0500
Received: from mga04.intel.com ([192.55.52.120]:25471 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381894AbiAURw6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jan 2022 12:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642787578; x=1674323578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Gh7ZUMv6dLhtBL1dVLe0xcJAhyXZkZeLoBKQAEtz7XQ=;
  b=g6nQWzp0xTK0o3RmITAAwzZw8uc12/+y8NUtUWcXaTWotUqFy6+u0H8l
   QIT1ZAwPlw9gl6YJnqaAEx8wqToiB0U7FPsulO820V5+hj6O51X6FhWJM
   bC5VV9rOHcQCjbZ8O0+WJWD86EyLp6qbSqA5j9QHcOgxbsHgWDmO+BJoH
   mQbY9icuAj1yKvYZmPyFVULwC3/1KuzyRGavwOpsUxpPYuFIuYfTiceEW
   Sel+NHou/IRIl/uVHBMCcwXMyk8IJvNSosLgM9bA6S+ydpfQJ69WU7z/5
   fOBBwtHrXuV2zKms8i+ItH7spd9u7HtLZ0+zAU/BaJM0VWZNG9GnqU9Ph
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="244534007"
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="244534007"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 09:52:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="694716362"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 09:52:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nAy4e-00D1bm-Cu;
        Fri, 21 Jan 2022 19:51:44 +0200
Date:   Fri, 21 Jan 2022 19:51:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YerysECShhFGl7aO@smile.fi.intel.com>
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-3-jsd@semihalf.com>
 <YelvqHuxaIOB+yP1@smile.fi.intel.com>
 <CAOtMz3OeuhKAikkwdzcEaEKU6FRrYkC7=iiwUeDg+VEZZxsQRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOtMz3OeuhKAikkwdzcEaEKU6FRrYkC7=iiwUeDg+VEZZxsQRA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 21, 2022 at 11:20:19AM +0100, Jan Dąbroś wrote:
> czw., 20 sty 2022 o 15:21 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> > On Thu, Jan 20, 2022 at 01:16:21AM +0100, Jan Dabros wrote:

...

> > > Add new entry in MAINTAINERS file to cover new module.
> >
> > It's confusing. You added yourself as a reviewer for I2C DesignWare driver,
> > which is great, but not described in the commit message.
> 
> Should I rephrase this sentence (to be more specific that I may be
> helpful for reviewing amdpsp.c module) or rather you mean to exclude
> drivers/i2c/busses/i2c-designware-amdpsp.c from the rest of
> designware-* modules and create separate entry?
> 
> Actually initially I wasn't planning to modify MAINTAINERS (after all
> I'm not an I2C DesignWare expert) until run checkpatch.pl which
> recommended to do so when adding new file. Eventually for me it made
> some sense since I have a platform equipped with AMD Cezanne SoC and I
> will be able to review and test potential changes in
> i2c-designware-amdpsp.c or in general around semaphore areas.
> 
> This may also work with different model, similar to how you pointed me
> to Hans as an owner of Bay Trail platform who is acquinted with how
> its i2c semaphore is working. I will simply remove myself from the
> MAINTAINERS file and you can add me to the threads if there is
> anything requiring my help.
> 
> Let me know which way is working for you. I just thought it is not
> good to leave you alone with a new module which you cannot actually
> test and don't have deep insight about how PSP-x86 communications
> works.

You have a few options:
- leave it for us (but it probably won't go well in long-term as you noticed)
- add yourself as a reviewer (it doesn't require to review everything, but
  you will get all i2c DesignWare driver changes)
- add a new MAINTAINERS database entry where you can put yourself for that
  file even as a maintainaer

...

> > > +#include <asm/msr.h>
> >
> > Usually linux/* followed by asm/*.
> >
> > > +#include <linux/i2c.h>
> > > +#include <linux/psp-sev.h>
> >
> > types.h?
> 
> I need to take a deeper look at the headers included here, especially
> considering errors pointed by kernel test robot. Not sure why I
> haven't seen any issues on my setup.

The problem here is not so visible. Headers should be a compromise between
what is really used and what we may include for that. There are headers
that guaranteed to be included by others, otherwise it will be an implicit
dependency which is not good in cases of generic headers, such as types.h.

...

> > > +union psp_req_buffer_hdr {
> > > +     struct {
> > > +             u32 total_size;
> > > +             u32 status;
> > > +     } __packed;
> >
> > What does packet bring you here?
> 
> In this particular case binary-wise nothing, I can as well drop this.
> It may be necessary if there are some changes in this structs fields
> in future (e.g changing total_size to u8), since PSP expects every
> field to be byte-aligned.

_packed will make another thing which you probably won't need, it brings
the entire structure to be possible on unaligned addresses and then some
warnings from compiler may be issued even if there is no problem in the
flow.

Read this discussion: https://lore.kernel.org/linux-media/20220110224656.266536-1-sakari.ailus@linux.intel.com/

> > > +     u64 hdr_val;
> >
> > And why does this not have the same alignment since it's also part of
> > the union?
> 
> __packed is not about alignment of the whole struct/union

It's. See above.

> but about
> lack of padding between its fields. As above - in this particular case
> with two u32 it doesn't matter.

...

> > > +struct psp_i2c_req {
> > > +     union psp_req_buffer_hdr hdr;
> > > +     enum psp_i2c_req_type type;
> >
> > > +} __packed __aligned(32);
> >
> > Can you explain, what this means and how it's supposed to work?
> 
> This means that each instance of the struct should be aligned (32)
> while at the same time no padding within members - thus this may
> result in non-aligned addresses of members.

32 bytes? And on unaligned address at the same time.

...

> > > +union psp_mbox_cmd_reg {
> > > +     struct psp_mbox_cmd_fields {
> > > +             u16 mbox_status;
> > > +             u8 mbox_cmd;
> > > +             u8 reserved:6;
> > > +             u8 recovery:1;
> > > +             u8 ready:1;
> >
> > > +     } __packed fields;
> >
> > So, what is the __packed purpose here?
> 
> As in all above cases - considering current layout of members and
> their sizes dropping `__packed` will not results in any errors.
> 
> However PSP expects all members os structs within shared buffers to be
> byte-aligned, that's why I've added this attributes to be on the safe
> side. If you think this doesn't make sense, I can remove them - in
> (very unlikely) case of changes, one will need to add this specifier.

I guess you don't need them at all in this case in any of the data structure
you created here.

...

> > > +     struct psp_mbox *mbox = (struct psp_mbox *)mbox_iomem;
> >
> > Heck, no!
> 
> I need to get acquinted to the kernel-reviewer language:) Pardon my
> ignorance, but just to be sure I get what you mean here:
> I'm using global mbox_iomem to keep address of PSP mailbox in IO
> memory. Casting this to struct psp_mbox layout here, to make access
> more convenient.
> Your point here is that:
> 1. I should move the assignment out from the variable declaration part
> of this function;
> 2. I should use ioremap/iounmap each time in psp_send_cmd instead of
> using it once in `probe` and unmap in `remove`?
> I thought about this option as to be less effective performance-wise
> (even though I can get rid of one global variable).
> 3. Something else?

Casting an __iomem pointer to the some struct without keeping it. I believe
sparse should blow because of this.

...

> > > +     /* Fill address of command-response buffer */
> > > +     writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
> >
> > What does this voodoo mean?!
> 
> Basically I need to take physical address (__psp_pa) of request buffer
> req and write this down into mailbox IO memory.
> This should be spread into more lines with some comments, is this your point?

It needs much better comment explaining what is this address and its meaning
for the hardware and why you need physical address here (DMA?). For me it looks
like a voodoo. Ah, and not using phys_addr_t / dma_addr_t / etc type here, but
uintptr_t just adds a confusion.

...

> > > +     start = jiffies;
> > > +     do {
> > > +             if (psp_send_cmd(req)) {
> > > +                     ret = -EIO;
> > > +                     goto cleanup;
> > > +             }
> > > +
> > > +             status = check_i2c_req_sts(req);
> > > +             if (!status) {
> > > +                     dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
> > > +                             jiffies_to_msecs(jiffies - start));
> > > +                     ret = 0;
> > > +                     goto cleanup;
> > > +             } else if (status == -EBUSY) {
> > > +                     retry_cnt--;
> > > +             } else {
> > > +                     ret = -EIO;
> > > +                     goto cleanup;
> > > +             };
> > > +
> > > +             /* IF EBUSY, give PSP time to finish its i2c activities */
> > > +             mdelay(PSP_I2C_REQ_RETRY_DELAY_MSEC);
> > > +     } while (retry_cnt);
> >
> > NIH iopoll.h API(s).
> 
> I don't think macros avaialble in iopoll.h are suitable here.
> Procedure above is not about simply reading some IO and waiting for
> particular condition to be met with this particular value. Eventually
> `psp_send_cmd()` invokes `psp_wait_cmd()` where I'm using
> `readl_poll_timeout()`, so on lower level I'm making use of this API.
> However here I don't see any obvious method how to incorporate
> iopoll.h API to reach my goal.

You do not go to clean up if and only if status == -EBUSY, so here we have
a condition. the rest can be moved to a function that you wrap by
read_poll_timeout_atomic() (pay attention to the macro name).
Here is the question, btw, why _atomic()? I.o.w. why mdelay() and not msleep()?

> > > +     ret = -ETIMEDOUT;

...

> > Handle errors first.

> Addressing above two comments - what do you think about below:
> if (status) {
>       if (status == -ETIMEDOUT)
>                dev_err(psp_i2c_dev, "Timed out waiting for PSP to
> release I2C bus\n");
>       else
>                dev_err(psp_i2c_dev, "PSP communication error\n");

>        dev_err(psp_i2c_dev, "PSP communication error\n");

This dup message is not needed, otherwise fine to me.

>        psp_i2c_mbox_fail = true;
>        goto cleanup;
> }
> 
> psp_i2c_sem_acquired = jiffies;
> psp_i2c_access_count++;
> (...)

...

> > > +static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> > > +{
> > > +     int ret;
> > > +     int i;
> > > +
> > > +     dev->semaphore_idx = -1;
> > > +
> > > +     for (i = 0; i < ARRAY_SIZE(i2c_dw_semaphore_cb_table); i++) {
> >
> > > +             if (!i2c_dw_semaphore_cb_table[i].probe)
> > > +                     continue;
> >
> > Huh?
> 
> Just to be sure I get your point.
> Once I found terminating entry, I will get out of the loop and return
> 0 as there are no semaphores to be "applied". Actually I should
> probably use `break;` here as there shouldn't be a case when certain
> type of semaphore installs without `probe` being implemented.

Yes, that's what I though, and rather using ARRAY_SIZE(), use a terminator you
provided.

Originally you have used two approaches which seems competing with each other:
- ARRAY_SIZE
- terminator entry

And on top of that so confusing continue on top of not-found ->probe() that
makes me think what the meaning of the entry that has set ->remove(), but no
->probe().

That said, I would rather see something like

	struct ... *p = &...;

	while (p->probe) {
		...
		p++;
	}

-- 
With Best Regards,
Andy Shevchenko


