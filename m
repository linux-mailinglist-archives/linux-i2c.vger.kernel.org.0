Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E99118BB25
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 16:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgCSPac (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 11:30:32 -0400
Received: from mga02.intel.com ([134.134.136.20]:12687 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbgCSPab (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 19 Mar 2020 11:30:31 -0400
IronPort-SDR: +s4GzElI/TfRTnRRgVJuo1zYE1Ni6pQ8fHAYsuBqA80hcoZ9xjUZtlXhf5Q+Hgy4CgBWwJImrM
 6qGMKlVQNGTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2020 08:30:16 -0700
IronPort-SDR: 58BMKfUKpC7A+vP3iZXzgdDZdL0tNbO+fSoZiZOpKay/8CWPpxLFO0lFleklzgZCNHlsxLDpXg
 7/8GrBIikNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="418381071"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 19 Mar 2020 08:30:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2C1AF76; Thu, 19 Mar 2020 17:30:13 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] i2c: designware: Fix spelling typos in the comments
Date:   Thu, 19 Mar 2020 17:30:12 +0200
Message-Id: <20200319153012.36136-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix spelling typos in the comments with help of `codespell`.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-baytrail.c | 2 +-
 drivers/i2c/busses/i2c-designware-common.c   | 8 ++++----
 drivers/i2c/busses/i2c-designware-master.c   | 2 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c   | 2 +-
 drivers/i2c/busses/i2c-designware-slave.c    | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-baytrail.c b/drivers/i2c/busses/i2c-designware-baytrail.c
index 33da07d64494..c6a7a00e1d52 100644
--- a/drivers/i2c/busses/i2c-designware-baytrail.c
+++ b/drivers/i2c/busses/i2c-designware-baytrail.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Intel BayTrail PMIC I2C bus semaphore implementaion
+ * Intel BayTrail PMIC I2C bus semaphore implementation
  * Copyright (c) 2014, Intel Corporation.
  */
 #include <linux/device.h>
diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 2de7452fcd6d..a6265ffab556 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -102,7 +102,7 @@ int i2c_dw_set_reg_access(struct dw_i2c_dev *dev)
 	i2c_dw_release_lock(dev);
 
 	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
-		/* Configure register endianess access */
+		/* Configure register endianness access */
 		dev->flags |= ACCESS_SWAP;
 	} else if (reg == (DW_IC_COMP_TYPE_VALUE & 0x0000ffff)) {
 		/* Configure register access mode 16bit */
@@ -190,10 +190,10 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 
 		/*
 		 * Workaround for avoiding TX arbitration lost in case I2C
-		 * slave pulls SDA down "too quickly" after falling egde of
+		 * slave pulls SDA down "too quickly" after falling edge of
 		 * SCL by enabling non-zero SDA RX hold. Specification says it
 		 * extends incoming SDA low to high transition while SCL is
-		 * high but it apprears to help also above issue.
+		 * high but it appears to help also above issue.
 		 */
 		if (!(dev->sda_hold_time & DW_IC_SDA_HOLD_RX_MASK))
 			dev->sda_hold_time |= 1 << DW_IC_SDA_HOLD_RX_SHIFT;
@@ -356,7 +356,7 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 	/* Disable controller */
 	__i2c_dw_disable(dev);
 
-	/* Disable all interupts */
+	/* Disable all interrupts */
 	dw_writel(dev, 0, DW_IC_INTR_MASK);
 	dw_readl(dev, DW_IC_CLR_INTR);
 }
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e8b328242256..529f54249609 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -521,7 +521,7 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 
 	/*
 	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
-	 * Ths unmasked raw version of interrupt status bits are available
+	 * The unmasked raw version of interrupt status bits is available
 	 * in the IC_RAW_INTR_STAT register.
 	 *
 	 * That is,
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 60d9ed7543a6..6a66e7e5abff 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -110,7 +110,7 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 static int mrfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	/*
-	 * On Intel Merrifield the user visible i2c busses are enumerated
+	 * On Intel Merrifield the user visible i2c buses are enumerated
 	 * [1..7]. So, we add 1 to shift the default range. Besides that the
 	 * first PCI slot provides 4 functions, that's why we have to add 0 to
 	 * the first slot and 4 to the next one.
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index f5f001738df5..f00079e4569d 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -107,7 +107,7 @@ static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
 
 	/*
 	 * The IC_INTR_STAT register just indicates "enabled" interrupts.
-	 * Ths unmasked raw version of interrupt status bits are available
+	 * The unmasked raw version of interrupt status bits is available
 	 * in the IC_RAW_INTR_STAT register.
 	 *
 	 * That is,
-- 
2.25.1

