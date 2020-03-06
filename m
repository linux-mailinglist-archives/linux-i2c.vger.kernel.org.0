Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E559D17BE99
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Mar 2020 14:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgCFNdD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Mar 2020 08:33:03 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37260 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbgCFNdC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Mar 2020 08:33:02 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 74A92803078F;
        Fri,  6 Mar 2020 13:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8uvRExshPHNn; Fri,  6 Mar 2020 16:23:25 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/6] i2c: designware: Discard i2c_dw_read_comp_param() function
Date:   Fri, 6 Mar 2020 16:19:56 +0300
In-Reply-To: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306131955.12806-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132326.74A92803078F@mail.baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

There is no code left in the kernel which would be using the function.
So just remove it.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-designware-common.c | 6 ------
 drivers/i2c/busses/i2c-designware-core.h   | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 4291ff6246d8..72e93c1aa9bc 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -388,11 +388,5 @@ void i2c_dw_disable_int(struct dw_i2c_dev *dev)
 	dw_writel(dev, 0, DW_IC_INTR_MASK);
 }
 
-u32 i2c_dw_read_comp_param(struct dw_i2c_dev *dev)
-{
-	return dw_readl(dev, DW_IC_COMP_PARAM_1);
-}
-EXPORT_SYMBOL_GPL(i2c_dw_read_comp_param);
-
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter core");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 3fbc9f22fcf1..b220ad64c38d 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -314,7 +314,6 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
 
-extern u32 i2c_dw_read_comp_param(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe(struct dw_i2c_dev *dev);
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_SLAVE)
 extern int i2c_dw_probe_slave(struct dw_i2c_dev *dev);
-- 
2.25.1

