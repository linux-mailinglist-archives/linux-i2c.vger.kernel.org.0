Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C3C1E3194
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 23:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390566AbgEZVzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 17:55:52 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60006 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390202AbgEZVzw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 17:55:52 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BCCD58030833;
        Tue, 26 May 2020 21:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zgntezMAGneV; Wed, 27 May 2020 00:55:43 +0300 (MSK)
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
Subject: [PATCH v3 10/12] i2c: designware: Retrieve quirk flags as early as possible
Date:   Wed, 27 May 2020 00:55:26 +0300
Message-ID: <20200526215528.16417-11-Sergey.Semin@baikalelectronics.ru>
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

Some platforms might need to activate the driver quirks at a very early
probe stage. For instance, Baikal-T1 System I2C doesn't need to map the
registers space as ones belong to the system controller. Instead it will
request the syscon regmap from the parental DT node. In order to be able
to do so let's retrieve the model flags right after the DW I2C private
data is created.

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
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 57475f19448a..5ef7ffcf7f85 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -252,6 +252,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
+	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
+
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->base = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(dev->base))
@@ -295,8 +297,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	else
 		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 
-	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
-
 	if (pdev->dev.of_node)
 		dw_i2c_of_configure(pdev);
 
-- 
2.26.2

