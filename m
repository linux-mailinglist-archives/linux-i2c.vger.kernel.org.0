Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBE41E4784
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 17:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgE0Pba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 11:31:30 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:36766 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389683AbgE0Pa4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 11:30:56 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A927F803083D;
        Wed, 27 May 2020 15:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KEienykBsMW7; Wed, 27 May 2020 18:30:53 +0300 (MSK)
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
Subject: [PATCH v5 07/11] i2c: designware: Discard Cherry Trail model flag
Date:   Wed, 27 May 2020 18:30:42 +0300
Message-ID: <20200527153046.6172-8-Sergey.Semin@baikalelectronics.ru>
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

A PM workaround activated by the flag MODEL_CHERRYTRAIL has been removed
since commit 9cbeeca05049 ("i2c: designware: Remove Cherry Trail PMIC I2C
bus pm_disabled workaround"), but the flag most likely by mistake has been
left in the Dw I2C drivers. Let's remove it. Since MODEL_MSCC_OCELOT is
the only model-flag left, redefine it to be 0x100 so setting a very first
bit in the MODEL_MASK bits range.

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
index 150de5e5c31b..b9ef9b0deef0 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -289,8 +289,7 @@ struct dw_i2c_dev {
 #define ACCESS_INTR_MASK	0x00000004
 #define ACCESS_NO_IRQ_SUSPEND	0x00000008
 
-#define MODEL_CHERRYTRAIL	0x00000100
-#define MODEL_MSCC_OCELOT	0x00000200
+#define MODEL_MSCC_OCELOT	0x00000100
 #define MODEL_MASK		0x00000f00
 
 u32 dw_readl(struct dw_i2c_dev *dev, int offset);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 11a5e4751eab..947c096f86e3 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -149,7 +149,6 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 	},
 	[cherrytrail] = {
 		.bus_num = -1,
-		.flags = MODEL_CHERRYTRAIL,
 		.scl_sda_cfg = &byt_config,
 	},
 	[elkhartlake] = {
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index f6d2c96e35ce..ca057aa9eac4 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -44,7 +44,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
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

