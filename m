Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48651E498F
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 18:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbgE0QPN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 12:15:13 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:37160 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgE0QPN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 12:15:13 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 3DC0C8030835;
        Wed, 27 May 2020 16:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id b5UZcRe2YfCH; Wed, 27 May 2020 19:15:08 +0300 (MSK)
Date:   Wed, 27 May 2020 19:15:07 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 00/11] i2c: designeware: Add Baikal-T1 System I2C
 support
Message-ID: <20200527161507.s7vytvkq6w7o4cjp@mobilestation>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
 <20200527160847.GN1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200527160847.GN1634618@smile.fi.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 07:08:47PM +0300, Andy Shevchenko wrote:
> On Wed, May 27, 2020 at 06:30:35PM +0300, Serge Semin wrote:
> > Jarkko, Wolfram, the merge window is upon us, please review/merge in/whatever
> > the patchset.
> > 
> > Initially this has been a small patchset which embedded the Baikal-T1
> > System I2C support into the DW APB I2C driver as is by using a simplest
> > way. After a short discussion with Andy we decided to implement what he
> > suggested (introduce regmap-based accessors and create a glue driver) and
> > even more than that to provide some cleanups of the code. So here is what
> > this patchset consists of.
> > 
> > First of all we've found out that current implementation of scripts/dtc
> > didn't support i2c dt nodes with 10bit and slave flags set in the
> > reg property. You'll see an error if you try to dt_binding_check it.
> > So the very first patch fixes the problem by adding these flags support
> > into the check_i2c_bus_reg() method.
> > 
> > Traditionally we converted the plain text-based DT binding to the DT schema
> > and added Baikal-T1 System I2C device support there. This required to mark
> > the reg property redundant for Baikal-T1 I2C since its reg-space is
> > indirectly accessed by means of the System Controller cmd/read/write
> > registers.
> > 
> > Then as Andy suggested we replaced the Synopsys DW APB I2C common driver
> > registers IO accessors into the regmap API methods. This doesn't change
> > the code logic much, though in two places we managed to replace some bulky
> > peaces of code with a ready-to-use regmap methods.
> > 
> > Additionally before adding the glue layer API we initiated a set of cleanups:
> > - Define components of the multi-object drivers (like i2c-designware-core.o
> >   and i2c-designware-paltform.o) with using `-y` suffixed makefile
> >   variables instead of `-objs` suffixed one. This is encouraged by
> >   Documentation/kbuild/makefiles.rst text since `-objs` is supposed to be used
> >   to build host programs.
> > - Make DW I2C slave driver depended on the DW I2C core code instead of the
> >   platform one, which it really is.
> > - Move Intel Baytrail semaphore feature to the platform if-clause of the
> >   kernel config.
> > 
> > After this we finally can introduce the glue layer API for the DW APB I2C
> > platform driver. So there are three methods exported from the driver:
> > i2c_dw_plat_setup(), i2c_dw_plat_clear(), &i2c_dw_plat_dev_pm_ops to
> > setup, cleanup and add PM operations to the glue driven I2C device. Before
> > setting the platform DW I2C device up the glue probe code is supposed to
> > create an instance of DW I2C device generic object and pre-initialize
> > its `struct device` pointer together with optional platform-specific
> > flags. In addition to that we converted the MSCC Ocelot SoC I2C specific
> > code into the glue layer seeing it's really too specific and, which is more
> > important, isn't that complicated so we could unpin it without much of
> > worrying to break something.
> > 
> > Meanwhile we discovered that MODEL_CHERRYTRAIL and MODEL_MASK actually
> > were no longer used in the code. MODEL_MSCC flag has been discarded since
> > the MSCC Ocelot I2C code conversion to the glue driver. So now we can get
> > rid of all the MODEL-specific flags.
> > 
> > Finally we introduced a glue driver with Baikal-T1 System I2C device
> > support. The driver probe tries to find a syscon regmap, creates the DW
> > APB I2C regmap based on it and passes it further to the DW I2C device
> > descriptor. Then it does normal DW APB I2C platform setup by calling a
> > generic setup method. Cleanup is straightforward. It's just calling a
> > generic DW APB I2C clean method.
> 
> Thank you for an update.
> 
> > This patchset is rebased and tested on the i2c/for-next (5.7-rc7):
> 
> Hmm...
> 
> > base-commit: 228f95c14949 ("Merge remote-tracking branch 'spi/for-5.8' into spi-next")
> 
> ...this is strange.

Yeah, my mistake. It should have been:
base-commit: 2a41d0f91443 ("Merge branch 'i2c/for-5.8' into i2c/for-next")

-Sergey

> 
> > Changelog v5:
> > - Replace or-assignment with just assignment operator when getting
> >   the quirk flags.
> > - Keep alphabetical order of the include statements.
> > - Discard explicit u16-type cast in the dw_reg_write_word() method.
> 
> Patches 8 and 11 have been commented solely due to previous comments for
> patches 6 and 7, which I think should be addressed.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
