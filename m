Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBC51CC9FD
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 11:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgEJJ7q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 05:59:46 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46314 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbgEJJ7o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 05:59:44 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 905AB8000B82;
        Sun, 10 May 2020 09:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q51xkqzNECF2; Sun, 10 May 2020 12:51:09 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Hanjun Guo <guohanjun@huawei.com>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/12] i2c: designware: Use provided regmap instead of reg resource
Date:   Sun, 10 May 2020 12:50:17 +0300
Message-ID: <20200510095019.20981-12-Sergey.Semin@baikalelectronics.ru>
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

This is a preparation patch before adding a glue platform driver for the
Baikal-T1 I2C controller. Since the i2c controller registers are indirectly
accessed by means of the Baikal-T1 System Controller registers we need to
have a way to disable the default registers mapping setup procedure and
make the DW I2C core/platform code to use a provided by a glue driver
regmap.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 drivers/i2c/busses/i2c-designware-common.c  |  7 +++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 14 ++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 35c5ad7e274e..141ea0651a8f 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -133,6 +133,13 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	u32 reg;
 	int ret;
 
+	/*
+	 * Skip detecting the registers map configuration if the regmap has
+	 * already been provided by a higher code.
+	 */
+	if (dev->map)
+		return 0;
+
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index f577e2a92a4f..9d131a64ea81 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -212,10 +212,16 @@ int i2c_dw_plat_setup(struct dw_i2c_dev *dev)
 	if (dev->irq < 0)
 		return dev->irq;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(&pdev->dev, mem);
-	if (IS_ERR(dev->base))
-		return PTR_ERR(dev->base);
+	/*
+	 * Don't try to get the controller registers MMIO space if regmap has
+	 * been provided by a higher level code.
+	 */
+	if (!dev->map) {
+		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		dev->base = devm_ioremap_resource(&pdev->dev, mem);
+		if (IS_ERR(dev->base))
+			return PTR_ERR(dev->base);
+	}
 
 	dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(dev->rst))
-- 
2.25.1

