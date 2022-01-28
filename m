Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3360549FD1C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 16:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbiA1Pun (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 10:50:43 -0500
Received: from mga05.intel.com ([192.55.52.43]:5661 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231634AbiA1Pun (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 10:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643385043; x=1674921043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=npIxVhztpMDECgOifmErszH5rV4znUpEPLrfuaXefao=;
  b=MT9QuO+9NunRCLuzatJGeNoWN55DCnigcDPAsyPHzFbOjFwBUTs1DLOF
   gXQFGki8hJWMi7MZzmopf76F7COwlj4lFnxO+o9Y/M9p0zSEB1gVzEtZN
   W+f18Kqe3oKRIiFW1aJ/93u88opR83+nMyXwznMtjtGci/QKv5sz7FJ64
   sexxDLIrsYkSjzPTbaieKMBzftaXcWasSn1J8K7ndUbLnBfsoE9E6seFU
   k8s32BHsphJfDe1iX+UQA1uL4lYPGstgl/gvboQiQjj7SpFByTDo0di7Z
   g6OuSkujugR8ScEvM3vajIIJXPPK197/a3JGqJA1riq/TTBn+kpOHO76H
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="333494488"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="333494488"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 07:50:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="480776099"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 07:50:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nDTUw-00FSg4-1p;
        Fri, 28 Jan 2022 17:49:14 +0200
Date:   Fri, 28 Jan 2022 17:49:13 +0200
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
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <YfQQeWdciv/JtqLD@smile.fi.intel.com>
References: <20220120001621.705352-2-jsd@semihalf.com>
 <20220128144811.783279-1-jsd@semihalf.com>
 <20220128144811.783279-3-jsd@semihalf.com>
 <CAOtMz3MnM6knabs0kF6urpE+Thm6rj++6Yy9G=ky2r9uOByH5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOtMz3MnM6knabs0kF6urpE+Thm6rj++6Yy9G=ky2r9uOByH5Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 28, 2022 at 03:59:40PM +0100, Jan Dąbroś wrote:
> Hi,
> 
> Adding proper Andy's email address (and removing wrong one) in the
> whole patchset. Sorry for noise!

Thanks!

> pt., 28 sty 2022 o 15:48 Jan Dabros <jsd@semihalf.com> napisał(a):
> >
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
> > The solution is similar to i2c-designware-baytrail.c implementation, where
> > we are using a generic i2c-designware-* driver with a small "wrapper".
> >
> > In contrary to baytrail semaphore implementation, beside internal
> > acquire_lock() and release_lock() methods we are also applying quirks to
> > lock_bus() and unlock_bus() global adapter methods. With this in place
> > all i2c clients drivers may lock i2c bus for a desired number of i2c
> > transactions (e.g. write-wait-read) without being aware of that such bus
> > is shared with another entity.
> >
> > Modify i2c_dw_probe_lock_support() to select correct semaphore
> > implementation at runtime, since now we have more than one available.
> >
> > Configure new matching ACPI ID "AMDI0019" and register
> > ARBITRATION_SEMAPHORE flag in order to distinguish setup with PSP
> > arbitration.
> >
> > Add myself as a reviewer for I2C DesignWare in order to help with reviewing
> > and testing possible changes touching new i2c-designware-amdpsp.c module.
> >
> > Signed-off-by: Jan Dabros <jsd@semihalf.com>

> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: kernel test robot <lkp@intel.com>

New feature can't be reported.
If you want to give a credit to CI, do it in changelog.

...

> > +       depends on X86_64

Not sure if it's better than using non-atomic IO helpers.
At least you can't run 32-bit kernels on that platforms
in order to get this functionality working. Doest it mean
those platforms do not have 32-bit compatibility mode
anymore?

...

> > +#include <linux/io-64-nonatomic-lo-hi.h>

Ah, this is not needed if you keep code running exclusively on 64-bit
platforms.

...

> > +struct psp_mbox {
> > +       u32 cmd_fields;

> > +       phys_addr_t i2c_req_addr;

But phys_addr_t is platform-dependent type. Perhaps you meant to use u64 here
always?

> > +} __packed;

...

> > +       struct psp_mbox __iomem *mbox = (struct psp_mbox __iomem *)mbox_iomem;

For void * pointers the cast is implied, i.o.w. it's not needed here.

...

> > +static int psp_send_check_i2c_req(struct psp_i2c_req *req)
> > +{
> > +       if (psp_send_cmd(req))

> > +               return -EIO;

Why is error code shadowed?

> > +       return check_i2c_req_sts(req);
> > +}

...

> > +cleanup:
> > +       mutex_unlock(&psp_i2c_access_mutex);
> > +       return 0;

Not sure I understand why we ignore all above errors here.

...

> > +       if (!dev || !dev->dev)
> > +               return -ENODEV;

At which circumstances may we get
	dev != NULL
	dev->dev == NULL
?

...

> >         if (!dev || !dev->dev)
> > -               return 0;
> > +               return -ENODEV;

I see the same here, perhaps Hans knows the answer :-)

...

> > +static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> > +{
> > +       const struct i2c_dw_semaphore_callbacks *ptr;
> > +       int i = 0;
> > +       int ret;
> > +
> > +       ptr = i2c_dw_semaphore_cb_table;
> > +
> > +       dev->semaphore_idx = -1;
> > +
> > +       while (ptr->probe) {
> > +               ret = ptr->probe(dev);
> > +               if (ret) {

> > +                       /*
> > +                        * If there is no semaphore device attached to this
> > +                        * controller, we shouldn't abort general i2c_controller
> > +                        * probe.
> > +                        */
> > +                       if (ret == -ENODEV) {
> > +                               i++;
> > +                               ptr++;
> > +                               continue;
> > +                       } else {

Redundant 'else', but see below.

> > +                               return ret;
> > +                       }

May it be

	    if (ret != -ENODEV)
	        return ret;

	    i++;
	    ptr++;
	    continue;

?

> > +               }
> > +
> > +               dev->semaphore_idx = i;
> > +               break;
> > +       }
> > +
> > +       return 0;
> > +}

-- 
With Best Regards,
Andy Shevchenko


