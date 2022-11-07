Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B4461F490
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbiKGNnZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiKGNnY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:24 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAC1C37
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828603; x=1699364603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YmnETu/E3JkxZoqpE21iffpN6PTZfuSERQltIoXyu04=;
  b=O2vHR0YZgDxhVNFjzrAnGSFKaYe/qobnX+ZMZXaTX0DkLQOGPo+6Fm4H
   KZPWLFzFWDQY8+5gSt1/GnSCNjOKK6bjEqKmNtkc7aQEcnIuT/x0WoKaW
   w0sb1nGT1ULTsAeFZwFnZsNKtMrwfSpp19KHPJqP55xKYgpJUdyvAuQfJ
   Hze27If2iINqRARi6icmovVSb5Rj/Qkk3NTPCrnO2NPlXFvecMXfJX6fb
   HrFtrxLtnhle/SIhg9DoJGqugDQd5YDFkCJHKnaKJEWAYeDF8QJxGwdco
   6HzfWN7HGbIaBWjkTWyA3hDyJ1yXtr/FTJgHfZ+m1NKHhKzks4UJlIK2m
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531147"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531147"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:43:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971929"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971929"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:43:20 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 09/12] i2c: designware: Simplify master interrupt handler nesting
Date:   Mon,  7 Nov 2022 15:42:45 +0200
Message-Id: <20221107134248.864890-10-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
References: <20221107134248.864890-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In my opinion a few lines of spurious interrupt detection code can be
moved to the actual master interrupt handling function i2c_dw_isr()
without hurting readability.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: s/opinnion/opinion/. Thanks Andy for noticing.
---
 drivers/i2c/busses/i2c-designware-master.c | 33 ++++++++--------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 9c2c9d002dc3..dfb499e54c05 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -711,9 +711,18 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
  * Interrupt service routine. This gets called whenever an I2C master interrupt
  * occurs.
  */
-static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
+static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 {
-	u32 stat;
+	struct dw_i2c_dev *dev = dev_id;
+	u32 stat, enabled;
+
+	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
+	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
+		return IRQ_NONE;
+	if (pm_runtime_suspended(dev->dev) || stat == GENMASK(31, 0))
+		return IRQ_NONE;
+	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
 
 	stat = i2c_dw_read_clear_intrbits(dev);
 
@@ -726,7 +735,7 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
 		 * the HW active).
 		 */
 		regmap_write(dev->map, DW_IC_INTR_MASK, 0);
-		return 0;
+		return IRQ_HANDLED;
 	}
 
 	if (stat & DW_IC_INTR_TX_ABRT) {
@@ -765,24 +774,6 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
 		regmap_write(dev->map, DW_IC_INTR_MASK, stat);
 	}
 
-	return 0;
-}
-
-static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
-{
-	struct dw_i2c_dev *dev = dev_id;
-	u32 stat, enabled;
-
-	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
-	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
-	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
-		return IRQ_NONE;
-	if (pm_runtime_suspended(dev->dev) || stat == GENMASK(31, 0))
-		return IRQ_NONE;
-	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
-
-	i2c_dw_irq_handler_master(dev);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.35.1

