Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5CE1E416E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 14:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbgE0MIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 08:08:04 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34980 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728583AbgE0MHc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 08:07:32 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 685CB8030838;
        Wed, 27 May 2020 12:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GxV1N7f5z9UX; Wed, 27 May 2020 15:07:26 +0300 (MSK)
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
Subject: [PATCH v4 06/11] i2c: designware: Add Baytrail sem config DW I2C platform dependency
Date:   Wed, 27 May 2020 15:01:06 +0300
Message-ID: <20200527120111.5781-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently Intel Baytrail I2C semaphore is a feature of the DW APB I2C
platform driver. It's a bit confusing to see it's config in the menu at
some separated place with no reference to the platform code. Let's move the
config definition to be below the I2C_DESIGNWARE_PLATFORM config and mark
it with "depends on I2C_DESIGNWARE_PLATFORM" statement. By doing so the
config menu will display the feature right below the DW I2C platform
driver item and will indent it to the right so signifying its belonging.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- Replace if-endif clause around the I2C_DESIGNWARE_BAYTRAIL config
  with "depends on" operator.
---
 drivers/i2c/busses/Kconfig | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 7f92f6a96042..7cd279c36898 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -549,20 +549,10 @@ config I2C_DESIGNWARE_PLATFORM
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-platform.
 
-config I2C_DESIGNWARE_PCI
-	tristate "Synopsys DesignWare PCI"
-	depends on PCI
-	select I2C_DESIGNWARE_CORE
-	help
-	  If you say yes to this option, support will be included for the
-	  Synopsys DesignWare I2C adapter. Only master mode is supported.
-
-	  This driver can also be built as a module.  If so, the module
-	  will be called i2c-designware-pci.
-
 config I2C_DESIGNWARE_BAYTRAIL
 	bool "Intel Baytrail I2C semaphore support"
 	depends on ACPI
+	depends on I2C_DESIGNWARE_PLATFORM
 	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
 		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
 	help
@@ -572,6 +562,17 @@ config I2C_DESIGNWARE_BAYTRAIL
 	  the platform firmware controlling it. You should say Y if running on
 	  a BayTrail system using the AXP288.
 
+config I2C_DESIGNWARE_PCI
+	tristate "Synopsys DesignWare PCI"
+	depends on PCI
+	select I2C_DESIGNWARE_CORE
+	help
+	  If you say yes to this option, support will be included for the
+	  Synopsys DesignWare I2C adapter. Only master mode is supported.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-designware-pci.
+
 config I2C_DIGICOLOR
 	tristate "Conexant Digicolor I2C driver"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
-- 
2.26.2

