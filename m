Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87CE11CC9FA
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 11:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbgEJJ7m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 05:59:42 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46248 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbgEJJ7m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 05:59:42 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 362448000B81;
        Sun, 10 May 2020 09:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RTYjy1LzhIKT; Sun, 10 May 2020 12:51:05 +0300 (MSK)
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
        Jean Delvare <jdelvare@suse.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 10/12] i2c: designware: Discard Cherry Trail model flag
Date:   Sun, 10 May 2020 12:50:16 +0300
Message-ID: <20200510095019.20981-11-Sergey.Semin@baikalelectronics.ru>
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

A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
bus pm_disabled workaround"), but the flag most likely by mistake has been
left in the Dw I2C drivers. Lets remove it.

By doing so we get rid from the last DW APB I2C IP-core model flag, so we
can remove the MODEL_MASK macro too.

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
 drivers/i2c/busses/i2c-designware-core.h    | 3 ---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 1 -
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 64544777a1fa..5a1f6b623a9a 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -281,9 +281,6 @@ struct dw_i2c_dev {
 #define ACCESS_INTR_MASK	0x00000004
 #define ACCESS_NO_IRQ_SUSPEND	0x00000008
 
-#define MODEL_CHERRYTRAIL	0x00000100
-#define MODEL_MASK		0x00000f00
-
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
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
index 1f56865bb6ca..f577e2a92a4f 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -124,7 +124,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "INT3432", 0 },
 	{ "INT3433", 0 },
 	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
-	{ "808622C1", ACCESS_NO_IRQ_SUSPEND | MODEL_CHERRYTRAIL },
+	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
 	{ "AMD0010", ACCESS_INTR_MASK },
 	{ "AMDI0010", ACCESS_INTR_MASK },
 	{ "AMDI0510", 0 },
-- 
2.25.1

