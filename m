Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821211CC9FB
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 11:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgEJJ7p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 05:59:45 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46256 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgEJJ7o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 05:59:44 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 77A0E80307CB;
        Sun, 10 May 2020 09:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fTddCm_mLQ0g; Sun, 10 May 2020 12:50:23 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-mips@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 00/12] i2c: designeware: Add Baikal-T1 System I2C support
Date:   Sun, 10 May 2020 12:50:06 +0300
Message-ID: <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Initially this has been a small patchset which embedded the Baikal-T1
System I2C support into the DW APB I2C driver as is by using a simplest
way. After a short discussion with Andy we decided to implement what he
suggested (introduce regmap-based accessors and create a glue driver) and
even more than that to provide some cleanups of the code. So here is what
this patchset consists of.

First of all we've found out that current implementation of scripts/dtc
didn't support i2c dt nodes with 10bit and slave flags set in the
reg property. You'll see an error if you try to dt_binding_check it.
So the very first patch fixes the problem by adding these flags support
into the check_i2c_bus_reg() method.

Traditionally we converted the plain text-based DT binding to the DT schema
and added Baikal-T1 System I2C device support there. This required to mark
the reg property redundant for Baikal-T1 I2C since its reg-space is
indirectly accessed by means of the System Controller cmd/read/write
registers.

Then as Andy suggested we replaced the Synopsys DW APB I2C common driver
registers IO accessors into the regmap API methods. This doesn't change
the code logic much, though in two places we managed to replace some bulky
peaces of code with a ready-to-use regmap methods.

Additionally before adding the glue layer API we initiated a set of cleanups:
- Define components of the multi-object drivers (like i2c-designware-core.o
  and i2c-designware-paltform.o) with using `-y` suffixed makefile
  variables instead of `-objs` suffixed one. This is encouraged by
  Documentation/kbuild/makefiles.rst text since `-objs` is supposed to be used
  to build host programs.
- Make DW I2C slave driver depended on the DW I2C core code instead of the
  platform one, which it really is.
- Move Intel Baytrail semaphore feature to the platform if-clause of the
  kernel config.

After this we finally can introduce the glue layer API for the DW APB I2C
platform driver. So there are three methods exported from the driver:
i2c_dw_plat_setup(), i2c_dw_plat_clear(), &i2c_dw_plat_dev_pm_ops to
setup, cleanup and add PM operations to the glue driven I2C device. Before
setting the platform DW I2C device up the glue probe code is supposed to
create an instance of DW I2C device generic object and pre-initialize
its `struct device` pointer together with optional platform-specific
flags. In addition to that we converted the MSCC Ocelot SoC I2C specific
code into the glue layer seeing it's really too specific and, which is more
important, isn't that complicated so we could unpin it without much of
worrying to break something.

Meanwhile we discovered that MODEL_CHERRYTRAIL and MODEL_MASK actually
were no longer used in the code. MODEL_MSCC flag has been discarded since
the MSCC Ocelot I2C code conversion to the glue driver. So now we can get
rid of all the MODEL-specific flags.

Finally we introduced a glue driver with Baikal-T1 System I2C device
support. The driver probe tries to find a syscon regmap, creates the DW
APB I2C regmap based on it and passes it further to the DW I2C device
descriptor. Then it does normal DW APB I2C platform setup by calling a
generic setup method. Cleanup is straightforward. It's just calling a
generic DW APB I2C clean method.

This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
tag: v5.7-rc4

Note new vendor prefix for Baikal-T1 System I2C device will be added in
the framework of the next patchset:
https://lkml.org/lkml/2020/5/6/1047

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mips@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---

Changelog v2:
- Fix the SoB tags.
- Use a shorter summary describing the bindings convertion patch.
- Patch "i2c: designware: Detect the FIFO size in the common code" has
  been acked by Jarkko and applied by Wolfram to for-next so drop it from
  the set.
- Patch "i2c: designware: Discard i2c_dw_read_comp_param() function" has
  been acked by Jarkko and applied by Wolfram to for-next so drop it from
  the set.
- Make sure that "mscc,ocelot-i2c" compatible node may have up to two
  registers space defined in the DT node, while normal DW I2C controller
  will have only one registers space.
- Add "mscc,ocelot-i2c" DT schema example to test the previous fix.
- Declare "unevaluatedProperties" property instead of
  "additionalProperties" one in the DT schema.
- Due to the previous fix we can now discard the dummy boolean properties
  declaration, since the proper type evaluation will be performed by the
  generic i2c-controller.yaml schema.
- Refactor the DW I2C APB driver related series to address the Andies
  notes.
- Convert DW APB I2C driver to using regmap instead of handwritten
  accessors.
- Use `-y` to build multi-object DW APB drivers.
- Fix DW APB I2C slave code dependency. It should depend on
  I2C_DESIGNWARE_CORE instead I2C_DESIGNWARE_PLATFORM.
- Move Baytrail semaphore config to the platform if-clause.
- Introduce a glue-layer platform driver API.
- Unpin Microsemi Ocelot I2C code into a glue driver.
- Remove MODEL_CHERRYTRAIL and MODEL_MASK as no longer needed.
- Add support for custom regmap passed from glue driver.
- Add Baikal-T1 System I2C support in a dedicated glue layer driver.

Serge Semin (12):
  scripts/dtc: check: Add 10bit/slave i2c reg flags support
  dt-bindings: i2c: Convert DW I2C binding to DT schema
  dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
  i2c: designware: Convert driver to using regmap API
  i2c: designware: Use `-y` to build multi-object modules
  i2c: designware: slave: Set DW I2C core module dependency
  i2c: designware: Move Baytrail sem config to the platform if-clause
  i2c: designware: Introduce platform drivers glue layer interface
  i2c: designware: Unpin Microsemi Ocelot I2C into a glue driver
  i2c: designware: Discard Cherry Trail model flag
  i2c: designware: Use provided regmap instead of reg resource
  i2c: designware: Add Baikal-T1 System I2C glue driver

 .../bindings/i2c/i2c-designware.txt           |  73 -------
 .../bindings/i2c/snps,designware-i2c.yaml     | 164 ++++++++++++++++
 drivers/i2c/busses/Kconfig                    |  56 ++++--
 drivers/i2c/busses/Makefile                   |  19 +-
 drivers/i2c/busses/i2c-designware-bt1.c       | 129 +++++++++++++
 drivers/i2c/busses/i2c-designware-common.c    | 178 +++++++++++++-----
 drivers/i2c/busses/i2c-designware-core.h      |  26 ++-
 drivers/i2c/busses/i2c-designware-master.c    | 125 ++++++------
 drivers/i2c/busses/i2c-designware-mscc.c      |  83 ++++++++
 drivers/i2c/busses/i2c-designware-pcidrv.c    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c   | 132 ++++++-------
 drivers/i2c/busses/i2c-designware-platdrv.h   |  16 ++
 drivers/i2c/busses/i2c-designware-slave.c     |  77 ++++----
 scripts/dtc/checks.c                          |  13 +-
 14 files changed, 759 insertions(+), 333 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-designware-bt1.c
 create mode 100644 drivers/i2c/busses/i2c-designware-mscc.c
 create mode 100644 drivers/i2c/busses/i2c-designware-platdrv.h

-- 
2.25.1

