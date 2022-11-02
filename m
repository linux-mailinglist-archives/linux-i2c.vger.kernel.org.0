Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C26E61637C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKBNMS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbiKBNL6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:11:58 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61592A707
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394708; x=1698930708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6nOPVVUAo1HLV89nMlgmsHgATC1jLLquQXoG2m1KX9Y=;
  b=cvoNLyHhng/J8unLnUdvq/3E2/OLqBu+msWHJ8yQ/0qKgBY1Oa1Q2skl
   q3XLkJBBdtzs6tBeVyT5BjiGtnNbd62BBkckUaBDxAk1KprsIFAu1WmeW
   HtG64mdtFnhaYfbtFIymvRKj8tRZTn87hRGIGgKhDXR0lYve/FElKa3e0
   rZSM0OZX5ONmzg6HizGN+7yqgNfV0wqeK4q2i+uVnbmtBiZ52Fgz01VmJ
   OxC24yCubXqI1VLlGY/ukNnIozVml7ec5bSSZDMIGWU7e7+QeGir8OXxc
   jbeWa0rBZ6C3Fm93ZcMEeJ6eKOmw49+fixqbSSgHxz2uAReB0wWlLq4P3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310507734"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="310507734"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234829"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234829"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:46 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 06/12] i2c: designware: Simplify slave interrupt handler nesting
Date:   Wed,  2 Nov 2022 15:11:19 +0200
Message-Id: <20221102131125.421512-7-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
References: <20221102131125.421512-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Interrupt processing code in i2c-designware-slave.c is bit more readable
if not divided into another subroutine. Also explicit IRQ_NONE and
IRQ_HANDLED return values are more obvious.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
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

