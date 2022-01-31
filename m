Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEC74A482C
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 14:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbiAaNdG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 08:33:06 -0500
Received: from mga09.intel.com ([134.134.136.24]:53848 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1379103AbiAaNcz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Jan 2022 08:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643635975; x=1675171975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=21GzmZFe7LvEpvmmANbf4casorIY5q1J72Vb+xIjsBY=;
  b=DwekNq4aEQrFaYegLaNkdMJZKC01D59bisJk9H+Uxe2yZVOPTC19nC2v
   cjiJ+sLCi07LXJ55icTJgk6u3HJrE2ahNG0S2GlkWIuggB/a4lHF9qLFs
   r4xG6JUqtUxt0a5QE9aHBLBAevV1Y/o39G6Ll+LnkENX76QeKJ0ydBm7c
   ZqZqiJsKCc0SvVuhmMGPREYTH3rISPU1LcrNVR3czsYGrqV6OS2W3JRCL
   SDaBLIaKBZ/kCuzxEThCY9KoU4ebowjTwbq+T+Ad5WKX9es6NDai1QAyG
   a0hvU3DH+7LskxLs8VgaF3GWpZ5V68THz6x7F2lkijmTzUTYrpSBb5PdQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247230404"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="247230404"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 05:32:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="534176210"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 05:32:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nEWmZ-00Gslu-NT;
        Mon, 31 Jan 2022 15:31:47 +0200
Date:   Mon, 31 Jan 2022 15:31:47 +0200
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
Message-ID: <YffkwwxtZ/cul5CF@smile.fi.intel.com>
References: <20220120001621.705352-2-jsd@semihalf.com>
 <20220128144811.783279-1-jsd@semihalf.com>
 <20220128144811.783279-3-jsd@semihalf.com>
 <CAOtMz3MnM6knabs0kF6urpE+Thm6rj++6Yy9G=ky2r9uOByH5Q@mail.gmail.com>
 <YfQQeWdciv/JtqLD@smile.fi.intel.com>
 <CAOtMz3Oryr7mmRKf+secix_6=ZD_Lq+pMUoP=5T6AS6BPoqyQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOtMz3Oryr7mmRKf+secix_6=ZD_Lq+pMUoP=5T6AS6BPoqyQw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 31, 2022 at 12:56:27PM +0100, Jan Dąbroś wrote:
> pt., 28 sty 2022 o 16:50 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> napisał(a):
> > On Fri, Jan 28, 2022 at 03:59:40PM +0100, Jan Dąbroś wrote:
> > > pt., 28 sty 2022 o 15:48 Jan Dabros <jsd@semihalf.com> napisał(a):

...

> > > > +struct psp_mbox {
> > > > +       u32 cmd_fields;
> >
> > > > +       phys_addr_t i2c_req_addr;
> >
> > But phys_addr_t is platform-dependent type. Perhaps you meant to use u64
> > here
> > always?
> 
> Once I remove the "depends on X86_64" I believe this should be left
> platform-dependent.

If it's a protocol or HW layout, it may not be platform-dependent.

> > > > +} __packed;

...

> > > > +       if (psp_send_cmd(req))
> >
> > > > +               return -EIO;
> >
> > Why is error code shadowed?
> >
> 
> Just as a side note - it wasn't modified in v2 when moving above to
> psp_send_check_i2c_req(), but let me explain why I have introduced this
> initially.
> 
> We have two means of timeouts in the context of this driver:
> 1. Timeout of internal mailbox, which means we cannot communicate with a
> PSP for a programmed timeout. This timeout is encountered inside
> psp_send_cmd().
> 2. Timeout of i2c arbitration - which means that we can communicate with
> PSP, but PSP refuses to release i2c bus for too long. This timeout is
> returned by psp_send_i2c_req() in case of error.
> (side note: both error conditions are very unlikely to happen at runtime)
> 
> I wanted to clearly distinguish between these two and thus put all errors
> around mailbox into "-EIO category", which is actually true.

At very least this code needs more or less the above to be put as a comment.

...

> > > > +cleanup:
> > > > +       mutex_unlock(&psp_i2c_access_mutex);
> > > > +       return 0;
> >
> > Not sure I understand why we ignore all above errors here.
> >
> 
> Actually we are not ignoring them, since each error sets "psp_i2c_mbox_fail
> = true;". This means that if there is any error on x86-PSP interface, we
> are ignoring i2c-arbitration and just fall back to normal (that is
> no-quirk) operation.
> 
> From the i2c-client perspective (who is eventually gathering error code
> from above) I think we can claim that everything is fine, since bus is
> granted to it. For developers there is an error message in case some debug
> will be necessary.

Perhaps needs a comment (sorry, if I overlooked it).

...

> > > > +       if (!dev || !dev->dev)
> > > > +               return -ENODEV;
> >
> > At which circumstances may we get
> >         dev != NULL
> >         dev->dev == NULL
> > ?
> >
> > ...
> >
> > > >         if (!dev || !dev->dev)
> > > > -               return 0;
> > > > +               return -ENODEV;
> >
> > I see the same here, perhaps Hans knows the answer :-)
> 
> Right, so I must admit that I simply used *-baytrail.c as a reference and
> thinking that additional check shouldn't hurt us (always better than not
> enough safety..). Looking more at this now - `dw_i2c_plat_probe()` will
> boil-out earlier if `dev->dev == NULL`. Should I remove this extra check in
> *-baytrail.c in the same commit?

Maybe. Please, double check that it's not needed indeed.

-- 
With Best Regards,
Andy Shevchenko


