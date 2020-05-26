Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5701E31B9
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 23:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391290AbgEZV4Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 17:56:25 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59984 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390057AbgEZVzs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 17:55:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9E9CF803086E;
        Tue, 26 May 2020 21:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KCV9AUaEzgVv; Wed, 27 May 2020 00:55:39 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 05/12] i2c: designware: Use `-y` to build multi-object modules
Date:   Wed, 27 May 2020 00:55:21 +0300
Message-ID: <20200526215528.16417-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since commit 4f8272802739 ("Documentation: update kbuild loadable modules
goals & examples") `-objs` is fitted for building host programs, lets
change DW I2C core, platform and PCI driver kbuild directives to using
`-y`, which more straightforward for device drivers. By doing so we can
discard the ifeq construction in favor to the more natural and less bulky
`<module>-$(CONFIG_X) += x.o`

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 drivers/i2c/busses/Makefile | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 25d60889713c..c6813d7b2780 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -48,16 +48,15 @@ obj-$(CONFIG_I2C_CADENCE)	+= i2c-cadence.o
 obj-$(CONFIG_I2C_CBUS_GPIO)	+= i2c-cbus-gpio.o
 obj-$(CONFIG_I2C_CPM)		+= i2c-cpm.o
 obj-$(CONFIG_I2C_DAVINCI)	+= i2c-davinci.o
-obj-$(CONFIG_I2C_DESIGNWARE_CORE)	+= i2c-designware-core.o
-i2c-designware-core-objs := i2c-designware-common.o i2c-designware-master.o
-ifeq ($(CONFIG_I2C_DESIGNWARE_SLAVE),y)
-i2c-designware-core-objs += i2c-designware-slave.o
-endif
-obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)	+= i2c-designware-platform.o
-i2c-designware-platform-objs := i2c-designware-platdrv.o
+obj-$(CONFIG_I2C_DESIGNWARE_CORE)			+= i2c-designware-core.o
+i2c-designware-core-y					:= i2c-designware-common.o
+i2c-designware-core-y					+= i2c-designware-master.o
+i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o
+obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
+i2c-designware-platform-y 				:= i2c-designware-platdrv.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
-obj-$(CONFIG_I2C_DESIGNWARE_PCI)	+= i2c-designware-pci.o
-i2c-designware-pci-objs := i2c-designware-pcidrv.o
+obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
+i2c-designware-pci-y					:= i2c-designware-pcidrv.o
 obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
 obj-$(CONFIG_I2C_EFM32)		+= i2c-efm32.o
 obj-$(CONFIG_I2C_EG20T)		+= i2c-eg20t.o
-- 
2.26.2

