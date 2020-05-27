Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE821E462C
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 16:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389372AbgE0OkD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 10:40:03 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:36292 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389179AbgE0OkC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 10:40:02 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 166CC8030833;
        Wed, 27 May 2020 14:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Qq9RTFftZtOP; Wed, 27 May 2020 17:39:58 +0300 (MSK)
Date:   Wed, 27 May 2020 17:39:57 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 08/11] i2c: designware: Convert driver to using regmap
 API
Message-ID: <20200527143957.y6fqbg2bge3qxsyi@mobilestation>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-9-Sergey.Semin@baikalelectronics.ru>
 <20200527135023.GZ1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527135023.GZ1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 04:50:23PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 03:01:08PM +0300, Serge Semin wrote:
> > Seeing the DW I2C driver is using flags-based accessors with two
> > conditional clauses it would be better to replace them with the regmap
> > API IO methods and to initialize the regmap object with read/write
> > callbacks specific to the controller registers map implementation. This
> > will be also handy for the drivers with non-standard registers mapping
> > (like an embedded into the Baikal-T1 System Controller DW I2C block, which
> > glue-driver is a part of this series).
> > 
> > As before the driver tries to detect the mapping setup at probe stage and
> > creates a regmap object accordingly, which will be used by the rest of the
> > code to correctly access the controller registers. In two places it was
> > appropriate to convert the hand-written read-modify-write and
> > read-poll-loop design patterns to the corresponding regmap API
> > ready-to-use methods.
> > 
> > Note the regmap IO methods return value is checked only at the probe
> > stage. The rest of the code won't do this because basically we have
> > MMIO-based regmap so non of the read/write methods can fail (this also
> > won't be needed for the Baikal-T1-specific I2C controller).
> 
> Thanks! My comments below.
> 
> ...
> 
> >  #include <linux/export.h>
> >  #include <linux/i2c.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/regmap.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> 

> Please, keep ordered.

Thanks. I'll fix the order. It must have been shifted after rebase.
I made sure the order was ok before that.

> 
> ...
> 
> > +static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
> > +{
> > +	struct dw_i2c_dev *dev = context;
> > +
> 
> > +	writew_relaxed((u16)val, dev->base + reg);
> > +	writew_relaxed((u16)(val >> 16), dev->base + reg + 2);
> 
> What does explicit casting here help to?
> I think you may drop it.

Good question. It has been there originally. I'll remove it in the next patchset
version.

> 
> > +	return 0;
> >  }
> 
> ...
> 
> >  #include <linux/errno.h>
> >  #include <linux/i2c.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/regmap.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> 
> Order?

Ok.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
