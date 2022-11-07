Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E723661F48D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbiKGNnQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiKGNnQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:16 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16521CFD0
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828594; x=1699364594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QKP0GfnzthXoJU4Ca+Pk+UIxFeBkIjwNv58r9x12Y1g=;
  b=ckLt2ktvZleKepk9W+AoMCb8UV6tA07wPi79dwLBWWBLHHcC47LuVHi1
   zuovtQRvX3L18TgQW6/nBW5aXUokxNZyAUsra+gB7e0PMqz5Ge2aMRxLb
   MVxjcmmPQtdjs3uC5bka/dJqOtc0fl7mpG6kQ7z5/BvtoA1v4HaOgTxvr
   mNehNf1dP3Ebz9OCMcJ8AC80L8tRsMgkuIUL0yyxe3fbJoAFMM4eyI5uH
   DN+NUP+KO/doYI9NnmpUsvE7nemIrHybvu6fqbTxkW3yJbfsQjGOMw1TU
   UZYVv2FEv7N917dJIhPk6tfX6EAohl0mfhLvVS8QKs7vAvTssSWQbnzKP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531118"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971884"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971884"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:43:11 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 06/12] i2c: designware: Simplify slave interrupt handler nesting
Date:   Mon,  7 Nov 2022 15:42:42 +0200
Message-Id: <20221107134248.864890-7-jarkko.nikula@linux.intel.com>
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

Interrupt processing code in i2c-designware-slave.c is bit more readable
if not divided into another subroutine. Also explicit IRQ_NONE and
IRQ_HANDLED return values are more obvious.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 12f0417aa0ae..3c855cd45c34 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -147,9 +147,9 @@ static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
  * Interrupt service routine. This gets called whenever an I2C slave interrupt
  * occurs.
  */
-
-static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
+static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 {
+	struct dw_i2c_dev *dev = dev_id;
 	u32 raw_stat, stat, enabled, tmp;
 	u8 val = 0, slave_activity;
 
@@ -159,7 +159,7 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	slave_activity = ((tmp & DW_IC_STATUS_SLAVE_ACTIVITY) >> 6);
 
 	if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
-		return 0;
+		return IRQ_NONE;
 
 	stat = i2c_dw_read_clear_intrbits_slave(dev);
 	dev_dbg(dev->dev,
@@ -205,17 +205,7 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 	if (stat & DW_IC_INTR_STOP_DET)
 		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
 
-	return 1;
-}
-
-static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
-{
-	struct dw_i2c_dev *dev = dev_id;
-	int ret;
-
-	ret = i2c_dw_irq_handler_slave(dev);
-
-	return IRQ_RETVAL(ret);
+	return IRQ_HANDLED;
 }
 
 static const struct i2c_algorithm i2c_dw_algo = {
-- 
2.35.1

