Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3D91E5C03
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 11:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387451AbgE1Jdh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 05:33:37 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:40596 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387424AbgE1Jdg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 May 2020 05:33:36 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 6F1458030777;
        Thu, 28 May 2020 09:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RweMfMw3LjJm; Thu, 28 May 2020 12:33:33 +0300 (MSK)
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
Subject: [PATCH v6 09/11] i2c: designware: Retrieve quirk flags as early as possible
Date:   Thu, 28 May 2020 12:33:19 +0300
Message-ID: <20200528093322.23553-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
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
data is created. While at it replace the or-assignment with just
assignment operator since or-ing is redundant at this stage.

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

Changelog v5:
- Replace or-assignment with just assignment operator.
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index ca057aa9eac4..38657d821c72 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -124,6 +124,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
+	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
+
 	dev->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->base))
 		return PTR_ERR(dev->base);
@@ -146,8 +148,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	i2c_dw_acpi_adjust_bus_speed(&pdev->dev);
 
-	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
-
 	if (pdev->dev.of_node)
 		dw_i2c_of_configure(pdev);
 
-- 
2.26.2

