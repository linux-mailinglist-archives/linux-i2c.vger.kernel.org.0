Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C20F1E4772
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389770AbgE0PbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:31:19 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:36808 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389695AbgE0Pa6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 11:30:58 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 201AA8030837;
        Wed, 27 May 2020 15:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fcJ1bLUFWa8e; Wed, 27 May 2020 18:30:55 +0300 (MSK)
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
Subject: [PATCH v5 10/11] i2c: designware: Move reg-space remapping into a dedicated function
Date:   Wed, 27 May 2020 18:30:45 +0300
Message-ID: <20200527153046.6172-11-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
References: <20200527153046.6172-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is a preparation patch before adding a quirk with custom registers
map creation required for the Baikal-T1 System I2C support.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- This is a new patch, which has been created due to declining the
  glue-layer approach.

Changelog v4:
- Use PTR_ERR_OR_ZERO() helper in the bt1_i2c_request_regs() method.
- Discard devm_platform_get_and_ioremap_resource() utilization.
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 38657d821c72..9d467fa0e163 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -108,6 +108,15 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 		pm_runtime_put_noidle(dev->dev);
 }
 
+static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev->dev);
+
+	dev->base = devm_platform_ioremap_resource(pdev, 0);
+
+	return PTR_ERR_OR_ZERO(dev->base);
+}
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -125,15 +134,14 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
-
-	dev->base = devm_platform_ioremap_resource(pdev, 0);
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

