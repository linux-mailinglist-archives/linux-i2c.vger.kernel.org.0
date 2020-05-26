Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C881E31AC
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 23:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391084AbgEZV4M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 17:56:12 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:59998 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390131AbgEZVzv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 17:55:51 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id BDDF28030879;
        Tue, 26 May 2020 21:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id deP-GqHay-pQ; Wed, 27 May 2020 00:55:41 +0300 (MSK)
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
Subject: [PATCH v3 08/12] i2c: designware: Discard Cherry Trail model flag
Date:   Wed, 27 May 2020 00:55:24 +0300
Message-ID: <20200526215528.16417-9-Sergey.Semin@baikalelectronics.ru>
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

A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
bus pm_disabled workaround"), but the flag most likely by mistake has been
left in the Dw I2C drivers. Lets remove it.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- Since MSCC and Baikal-T1 will be a part of the platform driver code, we
  have to preserve the MODEL_MASK macro to use it to filter the model
  flags during the IP-specific quirks activation.
---
 drivers/i2c/busses/i2c-designware-core.h    | 3 +--
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 1 -
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index b220ad64c38d..e036e7268d3b 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -281,8 +281,7 @@ struct dw_i2c_dev {
 #define ACCESS_INTR_MASK	0x00000004
 #define ACCESS_NO_IRQ_SUSPEND	0x00000008
 
-#define MODEL_CHERRYTRAIL	0x00000100
-#define MODEL_MSCC_OCELOT	0x00000200
+#define MODEL_MSCC_OCELOT	0x00000100
 #define MODEL_MASK		0x00000f00
 
 u32 dw_readl(struct dw_i2c_dev *dev, int offset);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7a0b65b5b5b5..76357b575aa5 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -166,7 +166,6 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 		.tx_fifo_depth = 32,
 		.rx_fifo_depth = 32,
 		.functionality = I2C_FUNC_10BIT_ADDR,
-		.flags = MODEL_CHERRYTRAIL,
 		.scl_sda_cfg = &byt_config,
 	},
 	[elkhartlake] = {
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 5536673060cc..57475f19448a 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -123,7 +123,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "INT3432", 0 },
 	{ "INT3433", 0 },
 	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
-	{ "808622C1", ACCESS_NO_IRQ_SUSPEND | MODEL_CHERRYTRAIL },
+	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
 	{ "AMD0010", ACCESS_INTR_MASK },
 	{ "AMDI0010", ACCESS_INTR_MASK },
 	{ "AMDI0510", 0 },
-- 
2.26.2

