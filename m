Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E242E1CC9FC
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 11:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbgEJJ7p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 05:59:45 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46308 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgEJJ7o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 05:59:44 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 94EF48000AF9;
        Sun, 10 May 2020 09:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vwJi6-PpWck6; Sun, 10 May 2020 12:50:45 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 07/12] i2c: designware: Move Baytrail sem config to the platform if-clause
Date:   Sun, 10 May 2020 12:50:13 +0300
Message-ID: <20200510095019.20981-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
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
some separated place with no reference to the platform code. Lets move the
config definition under the if-I2C_DESIGNWARE_PLATFORM clause. By doing so
the config menu will display the feature right below the DW I2C platform
driver item and will indent it to the right so signifying its belonging.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 drivers/i2c/busses/Kconfig | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 368aa64e9266..ed6927c4c540 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -530,8 +530,8 @@ config I2C_DESIGNWARE_CORE
 
 config I2C_DESIGNWARE_PLATFORM
 	tristate "Synopsys DesignWare Platform"
-	select I2C_DESIGNWARE_CORE
 	depends on (ACPI && COMMON_CLK) || !ACPI
+	select I2C_DESIGNWARE_CORE
 	help
 	  If you say yes to this option, support will be included for the
 	  Synopsys DesignWare I2C adapter.
@@ -539,6 +539,22 @@ config I2C_DESIGNWARE_PLATFORM
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-platform.
 
+if I2C_DESIGNWARE_PLATFORM
+
+config I2C_DESIGNWARE_BAYTRAIL
+	bool "Intel Baytrail I2C semaphore support"
+	depends on ACPI
+	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
+		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
+	help
+	  This driver enables managed host access to the PMIC I2C bus on select
+	  Intel BayTrail platforms using the X-Powers AXP288 PMIC. It allows
+	  the host to request uninterrupted access to the PMIC's I2C bus from
+	  the platform firmware controlling it. You should say Y if running on
+	  a BayTrail system using the AXP288.
+
+endif # I2C_DESIGNWARE_PLATFORM
+
 config I2C_DESIGNWARE_SLAVE
 	bool "Synopsys DesignWare Slave"
 	depends on I2C_DESIGNWARE_CORE
@@ -561,18 +577,6 @@ config I2C_DESIGNWARE_PCI
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-pci.
 
-config I2C_DESIGNWARE_BAYTRAIL
-	bool "Intel Baytrail I2C semaphore support"
-	depends on ACPI
-	depends on (I2C_DESIGNWARE_PLATFORM=m && IOSF_MBI) || \
-		   (I2C_DESIGNWARE_PLATFORM=y && IOSF_MBI=y)
-	help
-	  This driver enables managed host access to the PMIC I2C bus on select
-	  Intel BayTrail platforms using the X-Powers AXP288 PMIC. It allows
-	  the host to request uninterrupted access to the PMIC's I2C bus from
-	  the platform firmware controlling it. You should say Y if running on
-	  a BayTrail system using the AXP288.
-
 config I2C_DIGICOLOR
 	tristate "Conexant Digicolor I2C driver"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
-- 
2.25.1

