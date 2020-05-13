Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70651D1942
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 17:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731586AbgEMPYS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 11:24:18 -0400
Received: from mga02.intel.com ([134.134.136.20]:63313 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729153AbgEMPYQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 13 May 2020 11:24:16 -0400
IronPort-SDR: ihX3aOfMkDRyoSI3BXeQDwlHzLsfm4qh59ktvA7M5GXsYGPFaezzB8OsiqZVJvnynpYmFxFOP5
 jqhfsr+xUh1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 08:24:15 -0700
IronPort-SDR: LEYmL0D8h4/MJPzQww7+nG6ZMTyIUMdrpW620uivs8d1RMOvGn0hsKExHGUYjZoUgEhe4Gmdup
 YKNkAXzriOTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; 
   d="scan'208";a="251288456"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 13 May 2020 08:24:10 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jYtEz-006Rr3-Pi; Wed, 13 May 2020 18:24:13 +0300
Date:   Wed, 13 May 2020 18:24:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     ofery@google.com, Brendan Higgins <brendanhiggins@google.com>,
        avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        kfting@nuvoton.com, Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200513152413.GQ185537@smile.fi.intel.com>
References: <20200510102330.66715-1-tali.perry1@gmail.com>
 <20200510102330.66715-3-tali.perry1@gmail.com>
 <20200511091759.GE185537@smile.fi.intel.com>
 <CAHb3i=tERsM+gwmQN1+vjnML9o5NxRK=uBokEUsd-Ljyje4s3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHb3i=tERsM+gwmQN1+vjnML9o5NxRK=uBokEUsd-Ljyje4s3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 11, 2020 at 02:28:50PM +0300, Tali Perry wrote:
> On Mon, May 11, 2020 at 12:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, May 10, 2020 at 01:23:29PM +0300, Tali Perry wrote:

...

> > > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> >
> > Why?
> 
> We wanted to add an optional feature to track i2c slave status.
> the NPCM has 16 channels handling multiple devices each. Some of the devices
> are polled periodically, and might power down.
> The user wanted to implement a health monitoring option
> to occasionally check the status of the buses (how many timeouts, recovery etc.)
> This feature is optional and depends on CONFIG_DEBUG_FS The counters are exposed
> to user through the file system.

What I meant is why do you need an #ifdef?


...

> > > +#define I2C_NUM_OF_ADDR 10
> >
> > Is it 10-bit address support or what?
> >
> 
> No, the NPCM has an option to respond to multiple slave addresses
> (10 own slave addresses)

Perhaps more descriptive name then?

...

> > > +     // Repeat the following sequence until SDA is released
> > > +     do {
> > > +             // Issue a single SCL toggle
> > > +             iowrite8(NPCM_I2CCST_TGSCL, bus->reg + NPCM_I2CCST);
> > > +             udelay(20);
> > > +             // If SDA line is inactive (high), stop
> > > +             if (npcm_i2c_get_SDA(_adap)) {
> > > +                     done = true;
> > > +                     status = 0;
> > > +             }
> > > +     } while (!done && iter--);
> >
> > readx_poll_timeout() ?
> 
> Not exactly, readx_poll_timeout includes only a read operation, here there is a
> write in the middle. (iowrite8)

Ah, indeed. Perhaps time to add writex_poll_timeout() ?

-- 
With Best Regards,
Andy Shevchenko


