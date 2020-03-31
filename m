Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 066D0199EBE
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 21:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgCaTOe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 15:14:34 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53880 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbgCaTOd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 15:14:33 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E85E88030890;
        Tue, 31 Mar 2020 19:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aFi0pGcGKU0a; Tue, 31 Mar 2020 22:14:28 +0300 (MSK)
Date:   Tue, 31 Mar 2020 22:14:35 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] i2c: designeware: Add Baikal-T1 SoC DW I2C specifics
 support
Message-ID: <20200331191435.5twpxfxjccwviwx2@ubsrv2.baikal.int>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200306135451.4AF0480307C4@mail.baikalelectronics.ru>
 <20200331114824.e3uljdymvsjuh6wh@ubsrv2.baikal.int>
 <20200331142530.GM1922688@smile.fi.intel.com>
 <20200331162813.dnpmyzs35tvkeavx@ubsrv2.baikal.int>
 <CAHp75VfOxRdEZ81-rFUrAiQDdruKqhJn_Wh+PJnyB5WL2vMUCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfOxRdEZ81-rFUrAiQDdruKqhJn_Wh+PJnyB5WL2vMUCQ@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 31, 2020 at 08:17:28PM +0300, Andy Shevchenko wrote:
> On Tue, Mar 31, 2020 at 7:29 PM Sergey Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> > On Tue, Mar 31, 2020 at 05:25:30PM +0300, Andy Shevchenko wrote:
> > > On Tue, Mar 31, 2020 at 02:48:24PM +0300, Sergey Semin wrote:
> > > > On Fri, Mar 06, 2020 at 03:54:45PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > > As I see the others have not comments.) Anyway I see your point and having the
> > > > regmap-based interface might be better than the approach I've suggested
> > > > in this patchset particularly seeing that our DW i2c IP registers are
> > > > hidden behind a system controller register space.
> > > >
> > > > In order to follow your proposition to create a dedicated regmap and to supply
> > > > it to the DW i2c driver, I have to redevelop not only this patchset, but
> > > > also an adjacent drivers. In particular the changes will concern the
> > > > MFD-based System Controller driver (which will instantiate this DW i2c
> > > > controller device), Clocks Control Unit drivers set, and a few
> > > > others. The whole alteration I described in the RFC:
> > > > https://lkml.org/lkml/2020/3/22/393
> > > > You've been in Cc there, so fill free to send your comments regarding
> > > > the changes I suggested. Though this time I hope the solution will
> > > > satisfy everyone, who had issues with patchsets I've recently sent.
> > > >
> > > > Getting back to your comment in the framework of this patchset. The approach
> > > > used for CHT Whiskey Cove i2c isn't fully suitable in our case for
> > > > the reason of the DW I2C controller nature. DW I2C controller is a generic
> > > > controller and used on many different platforms, while AFAICS CHT Whiskey Cove
> > > > I2C is the SoC-specific used to access a charger-IC. So in the former case we
> > > > may have an arbitrary set of i2c-slaves connected to the controller on
> > > > different platforms, while on the latter one - there is a fixed set of
> > > > slaves. In addition due to the same reason the DW I2C IP might be
> > > > embedded into different sub-blocks on different platforms, while the CHT
> > > > Whiskey Cove I2C is known to be a part of Intel CHT WC SoC PMIC.
> > > > For instance Baikal-T1 SoC has one DW I2C controller embedded into the
> > > > System Controller with indirectly accessible registers and two DW I2C
> > > > interfaces with normal memory mapped registers. Due to this in case of DW I2C
> > > > driver we can't just "suck" the regmap out from a parental MFD or
> > > > anywhere else as it's done in the CHT Whiskey Cove I2C driver, but instead
> > > > we should somehow supply a regmap pointer to the driver.
> > > >
> > > > Taking into account all of these we can utilize a combined approach
> > > > implemented in ./drivers/i2c/busses/i2c-cht-wc.c and
> > > > drivers/mfd/intel_quark_i2c_gpio.c . I'll add a regmap pointer field to the
> > > > "struct dw_i2c_platform_data" structure, so in case if there is no
> > > > IORESOURCE_MEM resources available (platform_get_resource() fails), we
> > > > try to get a regmap pointer from the platform data. If there is no valid
> > > > regmap available, then completely fail the driver probe procedure. Though
> > > > due to this alteration I'll have to change the
> > > > dw_i2c_platform_data.i2c_scl_freq field usage a bit. In case if it's
> > > > zero, then call i2c_parse_fw_timings(). This won't hurt ACPI or dt-less
> > > > platforms, but will let us cover a case when regmap is set while i2c
> > > > clock frequency is supposed to be taken from the kernel firmware (like
> > > > dtb, etc).
> 
> Whiskey Cove case provides an I²C controller with specific access. That's it.
> In your case you will need similar glue driver which will utilize
> DesignWare core driver.
> 
> > > > So if you are Ok with this, I'll send a v2 patchset with corresponding
> > > > alteration implemented.
> > >
> > > I was thinking about something like this:
> > >
> >
> > > 1/ core driver (library + master + slave) is converted to use regmap
> >
> > Yes. I also intended to do this just by altering the dw_readl() and
> > dw_writel() methods to work over regmap IO methods if regmap is
> > available.
> 
> Why? Simple always use regmap API calls. Moreover, regmap provides
> update() which may give a leverage in some cases by dropping r-m-w
> code.
> 

See the last comment.

> Core part take a pointer to regmap when instantiate (probe) a driver
> on the device.
> 
> > > 2/ platform and PCI driver may provide regmap MMIO
> >
> > Regmap pointer will be also a part of "struct dw_i2c_dev".
> 
> Yes.
> 
> > So if PCI
> > code intends the regmap-based access to the controller registers, then
> > it shall just initialize the regmap pointer in the private i2c-designware data
> > instance of the dw_i2c_dev structure.
> 
> Why data is being involved here?
> 

This data is the driver private data. Have a better look at what I suggested.
In my solution regmap is just an optional way of accessing the registers.
The main part is left unchanged: IO-accessors usage to read/write MMIO registers
range in currently implemented dw_readl()/dw_writel().

> > So, yes, this is also covered by
> > my solution. Though the PCI code will be left untouched, since I can't
> > predict a particular regmap-related use-case of it.
> 
> > > 3/ your glue driver will provide different regmap accessors
> >
> > I was thinking of developing a more generic version so any platform
> > with a specific access to the DW I2C register could use it just by supplying
> > the regmap pointer in the dw_i2c_platform_data structure.
> 
> regmap is not a platform data.

Nothing prevents us from adding a regmap pointer to the platform_data and according
to the already defined platform_data's for other devices it could. Anyway see
my last comment.

> 
> > Our DW I2C
> > controller also perfectly fits to the generic i2c-designware-platdrv.c
> > driver, so implementing an additional glue-layer would be too much seeing
> > the difference only in the registers mapping.
> 
> Register accessing, mapping as far as I understood is the same.
> However, with regmap layer it just an implementation detail of certain
> glue driver.
> 

Yes, registers region structure is the same while the implementation is
different. Though taking that implementation specifics into account is different
in my and yours solutions. Anyway see my last comment.

> > Let me explain the difference of our solutions. In case of implementing
> > the glue layer, as you suggest, I would have to do it in a way like the DW PCIe
> > driver is designed. I would need to move the code of current dw_i2c_plat_probe()
> > function to a dedicated method named like dw_i2c_plat_init(pdev, !regmap!),
> > while former method dw_i2c_plat_probe() would just call
> > dw_i2c_plat_init(pdev, !NULL!). Then I would have to create a dedicated
> > glue-driver - i2c-designware-bt1drv.c, which would be bound to a
> > "baikal,t1-sys-i2c" device, try to find a Baikal-T1 System Controller
> > device node (though this would be just a parent device), then would get
> > it' syscon regmap handler, then would initialize a dedicated regmap handler to
> > indirectly access the DW I2C controller register, then it would call the
> > dw_i2c_plat_init(pdev, !regmap!) method with new regmap handler passed
> > (though the new regmap passing could be also implemented over the
> > platform_data pointer). Also seeing you already have a platform-specific
> > parts in the generic i2c-designware-platdrv.c driver (like ACPI-based
> > platforms and Microsemi Ocelot SoC), there might raise a necessity to
> > unpin that specifics to a dedicated method, since my glue-layer
> > wouldn't need that checks and initializations. Such alteration won't
> > be that easy to implement and regression errors prone, since I don't have
> > other platforms to test it.
> >
> > In case of my solution the whole glue-layer part would be moved to
> > the MFD-based Baikal-T1 System Controller driver and a generic
> > platform_data-based interface would be implemented, which would just
> > need to alter the registers mapping part of the i2c-designware-platdrv.c
> > driver. Note that that part would need to be fixed in case of any solution.
> >
> > So comparing these too approaches, I would select a one, which would
> > need less common code modifications and would provide a generic
> > solution. As I see it would be a platform_data-based design. What do you
> > think?
> 
> I think you may look at the existing examples how drivers are
> utilizing regmap layer.
> Along with that look how glue (or let's say quirk in your case)
> drivers are implemented, for example USB or SDHCI comes to my mind.
> 

I know how drivers use regmaps. I also know the glue layers design.
If you took a closer look at my suggestion you would find out that first
I referred to a code which utilize the glue layers, second I was describing
a solution which would have caused less changes, requires less work,
wouldn't have needed so many alterations of the common code, which
potentially would have caused less problems.

Regarding your design of the solution. Basically you want me to convert
the DW I2C driver to using the regmap API. It shall involve the IO-accessors
usage conversion so instead of calling the dw_readl() and dw_writel(),
regmap_{read,write}() are supposed to be utilized. You also want me to alter
the DW I2C generic platform and PCI code so it would convert the MMIO regions
to simple regmap_init_mmio'es. Finally you want me to implement our DW I2C
specifics in a dedicated "glue"-layer, and if not doing as I suggested
of separating the dw_i2c_plat_probe() functionality (which is glue layer
design), but to develop it as a quirk exporting a custom regmap pointer.

As I already said your solution needs much work, so will take greater
time to implement and debug. It's much more complicated than mine, and
potentially may cause more errors. While conceptually your suggestion
seems a bit more suitable, my solution is also acceptable and perfectly
fine to be part of the kernel. So I'll see what I can do in implementing
your suggestion. If I have enough time to work on that, I'll do it.
Otherwise I'll be working on my solution. Either of them will be sent in v2.

Regards,
-Sergey

> -- 
> With Best Regards,
> Andy Shevchenko
