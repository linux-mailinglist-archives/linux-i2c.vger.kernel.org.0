Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3094C61637E
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiKBNMb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbiKBNMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:12:07 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F79B2AC7F
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394717; x=1698930717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=svvmg3FZeQq3/gsfbQedwIPzslos5MHr0+TQcETMhg0=;
  b=iZtRzwtCFj8obvdF2RbOTUrBscDtBamKKb6KfKdbD03/ZgXMcx9+0ltM
   663M4alzByeDXqgD+n3yJt+zPH4kfcblFesbv0nyZnb0j2tpWSDnBtRZ8
   fF9vlC9RgUaKJV4qA1/inWFcBx707+yeth0FHmghiVAxJa7F+PS1mKhBY
   EeMLh6aZAuQCwj4IIazeNXs9ZvcXu5O+QoV2PefY+6wq0QhT8sS8tyou1
   Bhc7PG2DmXViF61CAjcSMhsnL/QLaaMpnTnjy3P4GexGOW/b9nnAtPSpl
   fto00MM2eZDWj52okoqFXm9o7agR1DoR84jxLgb/qZaf2zQ/q4WYYe/9n
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="308120874"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="308120874"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234923"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234923"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:54 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 09/12] i2c: designware: Simplify master interrupt handler nesting
Date:   Wed,  2 Nov 2022 15:11:22 +0200
Message-Id: <20221102131125.421512-10-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
References: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In my opinnion a few lines of spurious interrupt detection code can be
moved to the actual master interrupt handling function i2c_dw_isr()
without hurting readability.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
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

