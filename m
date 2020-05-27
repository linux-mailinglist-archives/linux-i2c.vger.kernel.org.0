Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478411E4762
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389692AbgE0Pa4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:30:56 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:36642 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388145AbgE0Paz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 11:30:55 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 5A5368030835;
        Wed, 27 May 2020 15:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1jIxSbMp979g; Wed, 27 May 2020 18:30:48 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
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
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 00/11] i2c: designeware: Add Baikal-T1 System I2C support
Date:   Wed, 27 May 2020 18:30:35 +0300
Message-ID: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Jarkko, Wolfram, the merge window is upon us, please review/merge in/whatever
the patchset.

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

This patchset is rebased and tested on the i2c/for-next (5.7-rc7):
base-commit: 228f95c14949 ("Merge remote-tracking branch 'spi/for-5.8' into spi-next")

Note new vendor prefix for Baikal-T1 System I2C device is added in the
framework of the next patchset:
https://lkml.org/lkml/2020/5/6/1047

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

Link: https://lore.kernel.org/linux-i2c/20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru/
Changelog v3:
- Move fixes and less invasive patches to the head of the series.
- Add patch "dt-bindings: i2c: Discard i2c-slave flag from the DW I2C
  example" since Rob says the flag can be discarded until dtc is fixed.
- Add patch "i2c: designware: Retrieve quirk flags as early as possible"
  as a first preparation before adding Baikal-T1 System I2C support.
- Add patch "i2c: designware: Move reg-space remapping into a dedicated
  function" as a second preparation before adding Baikal-T1 System I2C
  support.
- Add patch "i2c: designware: Add Baikal-T1 System I2C support", which
  integrates the Baikal-T1 I2C support into the DW I2C platform driver.
- Get back the reg property being mandatory even if it's Baikal-T1 System
  I2C DT node. Rob says it has to be in the DT node if there is a
  dedicated registers range in the System Controller registers space.
- Replace if-endif clause around the I2C_DESIGNWARE_BAYTRAIL config
  with "depends on" operator.

Link: https://lore.kernel.org/linux-i2c/20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru/
Changelog v4:
- Rebase on top of the i2c/for-next branch.
- Use PTR_ERR_OR_ZERO() helper in the bt1_i2c_request_regs() and
  in the dw_i2c_plat_request_regs() methods.
- Discard devm_platform_get_and_ioremap_resource() utilization.
- Discard patch "scripts/dtc: check: Add 10bit/slave i2c reg flags
  support" since it must be merged in to the dtc upstream repository.

Link: https://lore.kernel.org/linux-i2c/20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru
Changelog v5:
- Replace or-assignment with just assignment operator when getting
  the quirk flags.
- Keep alphabetical order of the include statements.
- Discard explicit u16-type cast in the dw_reg_write_word() method.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (11):
  dt-bindings: i2c: Convert DW I2C binding to DT schema
  dt-bindings: i2c: Discard i2c-slave flag from the DW I2C example
  dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
  i2c: designware: Use `-y` to build multi-object modules
  i2c: designware: slave: Set DW I2C core module dependency
  i2c: designware: Add Baytrail sem config DW I2C platform dependency
  i2c: designware: Discard Cherry Trail model flag
  i2c: designware: Convert driver to using regmap API
  i2c: designware: Retrieve quirk flags as early as possible
  i2c: designware: Move reg-space remapping into a dedicated function
  i2c: designware: Add Baikal-T1 System I2C support

 .../bindings/i2c/i2c-designware.txt           |  73 -------
 .../bindings/i2c/snps,designware-i2c.yaml     | 156 +++++++++++++++
 drivers/i2c/busses/Kconfig                    |  28 +--
 drivers/i2c/busses/Makefile                   |  18 +-
 drivers/i2c/busses/i2c-designware-common.c    | 178 +++++++++++++-----
 drivers/i2c/busses/i2c-designware-core.h      |  28 +--
 drivers/i2c/busses/i2c-designware-master.c    | 125 ++++++------
 drivers/i2c/busses/i2c-designware-pcidrv.c    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c   |  96 +++++++++-
 drivers/i2c/busses/i2c-designware-slave.c     |  77 ++++----
 10 files changed, 520 insertions(+), 260 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml

-- 
2.26.2

