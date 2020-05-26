Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C045A1E301D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 22:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391033AbgEZUi7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 16:38:59 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59716 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389796AbgEZUi6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 16:38:58 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A1EA3803086D;
        Tue, 26 May 2020 20:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PLU6O22MkyEn; Tue, 26 May 2020 23:38:54 +0300 (MSK)
Date:   Tue, 26 May 2020 23:38:52 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 08/12] i2c: designware: Introduce platform drivers
 glue layer interface
Message-ID: <20200526203852.bxgibrqb7lrumfnh@mobilestation>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
 <20200510095019.20981-9-Sergey.Semin@baikalelectronics.ru>
 <4950bb1e-302f-947e-1924-452a8169b504@linux.intel.com>
 <20200521023735.mja62ujmxebgwyef@mobilestation>
 <80cf1d67-5de1-f3f1-27a0-b88cc105b228@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <80cf1d67-5de1-f3f1-27a0-b88cc105b228@linux.intel.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 25, 2020 at 04:16:05PM +0300, Jarkko Nikula wrote:
> Hi
> 
> On 5/21/20 5:37 AM, Serge Semin wrote:
> > On Wed, May 20, 2020 at 03:46:11PM +0300, Jarkko Nikula wrote:
> > > Hi
> > > 
> > > On 5/10/20 12:50 PM, Serge Semin wrote:
> > > > Seeing the DW I2C platform driver is getting overcomplicated with a lot of
> > > > vendor-specific configs let's introduce a glue-layer interface so new
> > > > platforms which equipped with Synopsys Designware APB I2C IP-core would
> > > > be able to handle their peculiarities in the dedicated objects.
> > > > 
> > > Comment to this patch and patches 9/12 and 12/12:
> > > 
> > > Currently i2c-designware-platdrv.c is about 500 lines of code so I don't
> > > think it's too overcomplicated. But I feel we have already too many Kconfig
> > > options and source modules for i2c-designware and obviously would like to
> > > push back a little from adding more.
> > > 
> > > I don't think i2c-designware-platdrv.c becomes yet too complicated if Baikal
> > > related code is added there, perhaps under #ifdef CONFIG_OF like MSCC Ocelot
> > > code is currently.
> > 
> > Well, it's up to you to decide, what solution is more suitable for you to
> > maintain. My idea of detaching the MSCC and Baikal-T1 code to the dedicated
> > source files was to eventually move the whole i2c-designware-* set of files
> > into a dedicated directory drivers/i2c/buses/dw as it's done for some others
> > Synopsys DesignWare controllers: drivers/pci/controller/dwc/, drivers/usb/dwc2,
> > drivers/usb/dwc3, drivers/net/ethernet/synopsys/ . If you think, that it's too
> > early for Dw I2C code to live in a dedicated directory, fine with me. I can
> > merge the MSCC and Baikal-T1 code back into the i2c-designware-platdrv.c .
> > So what's your final word in this matter?
> > 
> I think sub directory decision under each subsystem is more subsystem rather
> than vendor/driver specific. Good point anyway.
> 
> For this patchset I'd like more if changes are done to
> i2c-designware-platdrv.c since it's not too complicated yet :-)
> 
> If it starts to look too messy in the future then it's time split I think.

Ok. I'll merge the MSCC back and add Baikal-T1 System I2C support into the
DW I2C platform driver.

-Sergey

> 
> Jarkko
