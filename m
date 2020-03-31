Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018B11995AD
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 13:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730642AbgCaLs1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 07:48:27 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:52068 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730560AbgCaLs0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 07:48:26 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 746A28030774;
        Tue, 31 Mar 2020 11:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id a9g7bqgioPTM; Tue, 31 Mar 2020 14:48:18 +0300 (MSK)
Date:   Tue, 31 Mar 2020 14:48:24 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
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
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] i2c: designeware: Add Baikal-T1 SoC DW I2C specifics
 support
Message-ID: <20200331114824.e3uljdymvsjuh6wh@ubsrv2.baikal.int>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200306135451.4AF0480307C4@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306135451.4AF0480307C4@mail.baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Andy,

Finally I've thought this through reasonably conformed with the changes
requested in the framework of the other patchsets. My comments are
below.

On Fri, Mar 06, 2020 at 03:54:45PM +0200, Andy Shevchenko wrote:
> First of all, I got only 3 out of 6 patches. Are you sure you properly prepared
> the series?
> 
> On Fri, Mar 06, 2020 at 04:19:49PM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <fancer.lancer@gmail.com>
> 
> Same comment as per DMA series, try next time to link the cover letter to the
> series correctly.
> 
> > There are three DW I2C controllers embedded into the Baikal-T1 SoC. Two
> > of them are normal with standard DW I2C IP-core configurations and registers
> > accessible over normal MMIO space - so they are acceptable by the available
> > DW I2C driver with no modification.
> 
> > But there is a third, which is a bit
> > different. Its registers are indirectly accessed be means of "command/data
> > in/data out" registers tuple. In order to have it also supported by the DW
> > I2C driver, we must modify the code a bit. This is a main purpose of this
> > patchset.
> > 
> > First of all traditionally we replaced the legacy plain text-based dt-binding
> > file with yaml-based one. Then we found and fixed a bug in the DW I2C FIFO size
> > detection algorithm which tried to do it too early before dw_readl/dw_writel
> > methods could be used.
> 
> So far so good (looks like, I think colleagues of mine and myself will review
> individual patches later on).
> 
> > Finally we introduced a platform-specific flag
> > ACCESS_INDIRECT, which would enable the indirect access to the DW I2C registers
> > implemented for one of the Baikal-T1 SoC DW I2C controllers. See the commit
> > message of the corresponding patch for details.
> 
> This is quite questionable. In Intel SoCs we have indirect I�C controllers to
> access (inside PMIC, for example). The approach used to do that is usually to
> have an IPC mechanism and specific bus controller driver. See i2c-cht-wc.c for
> instance.
> 
> I'm not sure if it makes a lot of duplication and if actually switching I�C
> DesignWare driver to regmap API will solve it. At least that is the second
> approach I would consider.
> 
> But I'll wait others to comment on this. We have to settle the solution before
> going further.
> 

As I see the others have not comments.) Anyway I see your point and having the
regmap-based interface might be better than the approach I've suggested
in this patchset particularly seeing that our DW i2c IP registers are
hidden behind a system controller register space.

In order to follow your proposition to create a dedicated regmap and to supply
it to the DW i2c driver, I have to redevelop not only this patchset, but
also an adjacent drivers. In particular the changes will concern the
MFD-based System Controller driver (which will instantiate this DW i2c
controller device), Clocks Control Unit drivers set, and a few
others. The whole alteration I described in the RFC:
https://lkml.org/lkml/2020/3/22/393
You've been in Cc there, so fill free to send your comments regarding
the changes I suggested. Though this time I hope the solution will
satisfy everyone, who had issues with patchsets I've recently sent.

Getting back to your comment in the framework of this patchset. The approach
used for CHT Whiskey Cove i2c isn't fully suitable in our case for
the reason of the DW I2C controller nature. DW I2C controller is a generic
controller and used on many different platforms, while AFAICS CHT Whiskey Cove
I2C is the SoC-specific used to access a charger-IC. So in the former case we
may have an arbitrary set of i2c-slaves connected to the controller on
different platforms, while on the latter one - there is a fixed set of
slaves. In addition due to the same reason the DW I2C IP might be
embedded into different sub-blocks on different platforms, while the CHT
Whiskey Cove I2C is known to be a part of Intel CHT WC SoC PMIC.
For instance Baikal-T1 SoC has one DW I2C controller embedded into the
System Controller with indirectly accessible registers and two DW I2C
interfaces with normal memory mapped registers. Due to this in case of DW I2C
driver we can't just "suck" the regmap out from a parental MFD or
anywhere else as it's done in the CHT Whiskey Cove I2C driver, but instead
we should somehow supply a regmap pointer to the driver.

Taking into account all of these we can utilize a combined approach
implemented in ./drivers/i2c/busses/i2c-cht-wc.c and
drivers/mfd/intel_quark_i2c_gpio.c . I'll add a regmap pointer field to the
"struct dw_i2c_platform_data" structure, so in case if there is no
IORESOURCE_MEM resources available (platform_get_resource() fails), we
try to get a regmap pointer from the platform data. If there is no valid
regmap available, then completely fail the driver probe procedure. Though
due to this alteration I'll have to change the
dw_i2c_platform_data.i2c_scl_freq field usage a bit. In case if it's
zero, then call i2c_parse_fw_timings(). This won't hurt ACPI or dt-less
platforms, but will let us cover a case when regmap is set while i2c
clock frequency is supposed to be taken from the kernel firmware (like
dtb, etc).

So if you are Ok with this, I'll send a v2 patchset with corresponding
alteration implemented.

Regards,
-Sergey

> > This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
> > commit 98d54f81e36b ("Linux 5.6-rc4").
> 
> `git format-patch --base ...` should do the job.
> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> 
> Same comment as per UART patch. Who is the Alexey in relation to the work done?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
