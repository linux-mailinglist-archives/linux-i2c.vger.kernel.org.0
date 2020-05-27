Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1A31E490A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 18:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388552AbgE0QBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 12:01:01 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:36992 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388395AbgE0QBB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 12:01:01 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 661C88030809;
        Wed, 27 May 2020 16:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id z4Dur32t_e9w; Wed, 27 May 2020 19:00:57 +0300 (MSK)
Date:   Wed, 27 May 2020 19:00:56 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 06/11] i2c: designware: Add Baytrail sem config DW I2C
 platform dependency
Message-ID: <20200527160056.rg66gsubwhrwtnwf@mobilestation>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-7-Sergey.Semin@baikalelectronics.ru>
 <20200527134220.GX1634618@smile.fi.intel.com>
 <20200527142406.jzdtkbdb2q6st7e6@mobilestation>
 <20200527154632.GG1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527154632.GG1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 06:46:32PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 05:24:06PM +0300, Serge Semin wrote:
> > On Wed, May 27, 2020 at 04:42:20PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 27, 2020 at 03:01:06PM +0300, Serge Semin wrote:
> > > > Currently Intel Baytrail I2C semaphore is a feature of the DW APB I2C
> > > > platform driver. It's a bit confusing to see it's config in the menu at
> > > > some separated place with no reference to the platform code. Let's move the
> > > > config definition to be below the I2C_DESIGNWARE_PLATFORM config and mark
> > > > it with "depends on I2C_DESIGNWARE_PLATFORM" statement. By doing so the
> > > > config menu will display the feature right below the DW I2C platform
> > > > driver item and will indent it to the right so signifying its belonging.
> 
> ...
> 
> > > >  config I2C_DESIGNWARE_BAYTRAIL
> > > >  	bool "Intel Baytrail I2C semaphore support"
> > > >  	depends on ACPI
> > > > +	depends on I2C_DESIGNWARE_PLATFORM
> > > >  	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
> > > >  		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
> > > 
> > > I didn't get this. What is broken now with existing dependencies?
> > 
> > With no explicit "depends on I2C_DESIGNWARE_PLATFORM" the entry isn't right
> > shifted with respect to the I2C_DESIGNWARE_PLATFORM config entry in the kernel
> > menuconfig. So it looks like a normal no-yes driver without it. 
> 
> I didn't get. Is there problems with current case? (I don't see it).
> If there is a problem, it should have a separate patch and commit message.
> 
> As for now above excerpt seems redundant and unneeded churn.

Please read the commit log more carefully.

Without explicit "depends on I2C_DESIGNWARE_PLATFORM" you'd see the DW
I2C-related menuconfig as:
[*] Synopsys DesignWare Platform
[ ] Intel Baytrail I2C semaphore support
with that "depends on I2C_DESIGNWARE_PLATFORM" added:
[*] Synopsys DesignWare Platform
[ ]     Intel Baytrail I2C semaphore support
The second case presents the Baytrail semaphore as the DW I2C platform
feature. Otherwise it's just a simple menuentry. As I see it without adding
the explicit "depends on I2C_DESIGNWARE_PLATFORM" there is no need in moving
the config at all. So if you think it's a churn. Well, I'll wait for
Jarkko' comment in this regard.

BTW Jarkko asked in v3 whether it would work with just explicit "depends on"
without if-endif enclosing the config.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
