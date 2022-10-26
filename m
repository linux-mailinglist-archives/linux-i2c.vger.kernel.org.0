Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACB560E104
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 14:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbiJZMks (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 08:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233935AbiJZMkO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 08:40:14 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DFF7228A
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666787996; x=1698323996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1KL0fBXHia+F6pu/IdcUgRXY26m3tCgkDApTRYgG3xs=;
  b=LwdoYQlqs98hficxYGdjOXT3MUOnxtSlGb4PM2iK1iDnr9k4ayhq8JDB
   Wr2h6lBuxqsikwDu1ziZi8SaYqC7X1PAPp8gl8kTm8k3o/Z6ozpsG1CDd
   OjSTfHKn0OdW/74g2Q7ljhlNA2XO8T8gkRx7CD7rdNUBxG8kPl+Ph/Vdp
   ppgFuGdYxdgccmu0Q2SBWrIjVW1UK4vA7t/4cIsiU1wfdfj/nKWwrkuBR
   spSuzCZxoc14CX1MULQ1lLARJVU3/C7KdlJm2DmE5VedZVTETwUpdHYUa
   +fTlfEjXmteBX9sdVFwIon1lk4veLQ3ieoBkV5D+tqYJjVvVPa70DVNMY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309625086"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309625086"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="700908714"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="700908714"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2022 05:39:53 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 09/11] i2c: designware: Simplify master interrupt handler nesting
Date:   Wed, 26 Oct 2022 15:39:10 +0300
Message-Id: <20221026123912.2833271-10-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
References: <20221026123912.2833271-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
index 46e0e6a05506..5f9b9503441c 100644
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
+	if (pm_runtime_suspended(dev->dev) || stat == ~0)
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
-	if (pm_runtime_suspended(dev->dev) || stat == ~0)
-		return IRQ_NONE;
-	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
-
-	i2c_dw_irq_handler_master(dev);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.35.1

