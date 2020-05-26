Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEC11E3196
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 23:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390610AbgEZVzy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 17:55:54 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60016 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390293AbgEZVzx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 17:55:53 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 8244B8030878;
        Tue, 26 May 2020 21:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Zl9OkjrUfZnm; Wed, 27 May 2020 00:55:43 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 11/12] i2c: designware: Move reg-space remapping into a dedicated function
Date:   Wed, 27 May 2020 00:55:27 +0300
Message-ID: <20200526215528.16417-12-Sergey.Semin@baikalelectronics.ru>
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

This is a preparation patch before adding a quirk with custom registers
map creation required for the Baikal-T1 System I2C support. Since we've
touched this code anyway let's replace
platform_get_resource()-devm_ioremap_resource() tuple with ready-to-use
helper devm_platform_get_and_ioremap_resource().

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- This is a new patch, which has been created due to declining the
  glue-layer approach.
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 23 ++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 5ef7ffcf7f85..93bdcfae57df 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -234,6 +234,18 @@ static const u32 supported_speeds[] = {
 	I2C_MAX_STANDARD_MODE_FREQ,
 };
 
+static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev->dev);
+	int ret = 0;
+
+	dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(dev->base))
+		ret = PTR_ERR(dev->base);
+
+	return ret;
+}
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -241,7 +253,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	struct i2c_timings *t;
 	u32 acpi_speed;
-	struct resource *mem;
 	int i, irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
@@ -253,16 +264,14 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
-
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dev->base = devm_ioremap_resource(&pdev->dev, mem);
-	if (IS_ERR(dev->base))
-		return PTR_ERR(dev->base);
-
 	dev->dev = &pdev->dev;
 	dev->irq = irq;
 	platform_set_drvdata(pdev, dev);
 
+	ret = dw_i2c_plat_request_regs(dev);
+	if (ret)
+		return ret;
+
 	dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(dev->rst))
 		return PTR_ERR(dev->rst);
-- 
2.26.2

