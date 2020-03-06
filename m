Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 887B917BE56
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 14:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgCFN2D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 08:28:03 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37068 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgCFN2D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Mar 2020 08:28:03 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 1B875803087C;
        Fri,  6 Mar 2020 13:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AuQSr6ZhEDbM; Fri,  6 Mar 2020 16:20:00 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
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
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/6] i2c: designeware: Add Baikal-T1 SoC DW I2C specifics support
Date:   Fri, 6 Mar 2020 16:19:49 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Serge Semin <fancer.lancer@gmail.com>

There are three DW I2C controllers embedded into the Baikal-T1 SoC. Two
of them are normal with standard DW I2C IP-core configurations and registers
accessible over normal MMIO space - so they are acceptable by the available
DW I2C driver with no modification. But there is a third, which is a bit
different. Its registers are indirectly accessed be means of "command/data
in/data out" registers tuple. In order to have it also supported by the DW
I2C driver, we must modify the code a bit. This is a main purpose of this
patchset.

First of all traditionally we replaced the legacy plain text-based dt-binding
file with yaml-based one. Then we found and fixed a bug in the DW I2C FIFO size
detection algorithm which tried to do it too early before dw_readl/dw_writel
methods could be used. Finally we introduced a platform-specific flag
ACCESS_INDIRECT, which would enable the indirect access to the DW I2C registers
implemented for one of the Baikal-T1 SoC DW I2C controllers. See the commit
message of the corresponding patch for details.

This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
commit 98d54f81e36b ("Linux 5.6-rc4").

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (6):
  scripts/dtc: check: Add additional i2c reg flags support
  dt-bindings: i2c: Replace DW I2C legacy bindings with YAML-based one
  dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C controller
  i2c: designware: Detect the FIFO size in the common code
  i2c: designware: Discard i2c_dw_read_comp_param() function
  i2c: designware: Add Baikal-T1 SoC I2C controller support

 .../bindings/i2c/i2c-designware.txt           |  73 --------
 .../bindings/i2c/snps,designware-i2c.yaml     | 158 ++++++++++++++++++
 drivers/i2c/busses/i2c-designware-common.c    | 107 ++++++++++--
 drivers/i2c/busses/i2c-designware-core.h      |  16 +-
 drivers/i2c/busses/i2c-designware-master.c    |   3 +
 drivers/i2c/busses/i2c-designware-platdrv.c   |  25 +--
 drivers/i2c/busses/i2c-designware-slave.c     |   3 +
 scripts/dtc/checks.c                          |  13 +-
 8 files changed, 280 insertions(+), 118 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml

-- 
2.25.1

