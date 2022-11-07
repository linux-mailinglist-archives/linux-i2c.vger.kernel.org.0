Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067C561F491
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbiKGNn2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbiKGNn0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:26 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F338C2DC1
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828606; x=1699364606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cA1peVNYteXIg1cwwsajJq3jRioz9TfX0pmyot8cAkM=;
  b=UVeKdhFBiBiCC38v6zZrkL8XOAVbi5GNSrxP9K2UMLBs6hlahe+TiMph
   GupH34DInBMHwCcdGGGOPAlIOS9FblUqR/mis1VjC3fAj3ivjDyEWMABg
   HE+HMjBd1r1oWZZQdyFMamLaMZ6lKUEanIPCsIjsjnpAuWCR3NCHiX07U
   lPEjdJmsrFS3sAAPlFXA2tqKAHTxwVruSoAqN+pwgxJFqCGoAX/zRZXZC
   SXplife6WvfsAHuJRsFr13L6Urygz8xC5NbLejEI5MCijheuI1oTCg4Hy
   GlzGi+bpbAXYyOqGOwutiQlUzCHHt29GKmCCvxZgP3S2oD2PlAoLlmltk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531152"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531152"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971953"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971953"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:43:23 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 10/12] i2c: designware: Remove common i2c_dw_disable_int()
Date:   Mon,  7 Nov 2022 15:42:46 +0200
Message-Id: <20221107134248.864890-11-jarkko.nikula@linux.intel.com>
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

Commit 90312351fd1e ("i2c: designware: MASTER mode as separated driver")
introduced disable_int pointer but there is no real use for it. Both
i2c-designware-master.c and i2c-designware-slave.c set it to the same
i2c_dw_disable_int() and scope is inside the same kernel module.

Since i2c_dw_disable_int() is just masking interrupts and the direct
DW_IC_INTR_MASK register write looks more clear in the code use that and
remove it from common code.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: Remove disable_int kerneldoc comment, i2c_dw_disable_int() forward
declaration and update commit log.
---
 drivers/i2c/busses/i2c-designware-common.c | 5 -----
 drivers/i2c/busses/i2c-designware-core.h   | 3 ---
 drivers/i2c/busses/i2c-designware-master.c | 9 ++++-----
 drivers/i2c/busses/i2c-designware-slave.c  | 3 +--
 4 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index c023b691441e..a3240ece55b2 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -625,10 +625,5 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 	i2c_dw_release_lock(dev);
 }
 
-void i2c_dw_disable_int(struct dw_i2c_dev *dev)
-{
-	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
-}
-
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter core");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 457e6966f85e..49e5860b1665 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -232,7 +232,6 @@ struct reset_control;
  *	-1 if there is no semaphore.
  * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
  * @disable: function to disable the controller
- * @disable_int: function to disable all interrupts
  * @init: function to initialize the I2C hardware
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
@@ -290,7 +289,6 @@ struct dw_i2c_dev {
 	int			semaphore_idx;
 	bool			shared_with_punit;
 	void			(*disable)(struct dw_i2c_dev *dev);
-	void			(*disable_int)(struct dw_i2c_dev *dev);
 	int			(*init)(struct dw_i2c_dev *dev);
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
@@ -331,7 +329,6 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev);
 int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
 u32 i2c_dw_func(struct i2c_adapter *adap);
 void i2c_dw_disable(struct dw_i2c_dev *dev);
-void i2c_dw_disable_int(struct dw_i2c_dev *dev);
 
 static inline void __i2c_dw_enable(struct dw_i2c_dev *dev)
 {
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dfb499e54c05..45f569155bfe 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -239,7 +239,7 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 		     msgs[dev->msg_write_idx].addr | ic_tar);
 
 	/* Enforce disabled interrupts (due to HW issues) */
-	i2c_dw_disable_int(dev);
+	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 
 	/* Enable the adapter */
 	__i2c_dw_enable(dev);
@@ -299,7 +299,7 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	dev->msgs = msgs;
 	dev->msgs_num = num_msgs;
 	i2c_dw_xfer_init(dev);
-	i2c_dw_disable_int(dev);
+	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 
 	/* Initiate messages read/write transaction */
 	for (msg_wrt_idx = 0; msg_wrt_idx < num_msgs; msg_wrt_idx++) {
@@ -770,7 +770,7 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 	else if (unlikely(dev->flags & ACCESS_INTR_MASK)) {
 		/* Workaround to trigger pending interrupt */
 		regmap_read(dev->map, DW_IC_INTR_MASK, &stat);
-		i2c_dw_disable_int(dev);
+		regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 		regmap_write(dev->map, DW_IC_INTR_MASK, stat);
 	}
 
@@ -871,7 +871,6 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 
 	dev->init = i2c_dw_init_master;
 	dev->disable = i2c_dw_disable;
-	dev->disable_int = i2c_dw_disable_int;
 
 	ret = i2c_dw_init_regmap(dev);
 	if (ret)
@@ -910,7 +909,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	i2c_dw_disable_int(dev);
+	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 	i2c_dw_release_lock(dev);
 
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 3c855cd45c34..c6d2e4c2ac23 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -87,7 +87,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
 
-	dev->disable_int(dev);
+	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 	dev->disable(dev);
 	synchronize_irq(dev->irq);
 	dev->slave = NULL;
@@ -232,7 +232,6 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 
 	dev->init = i2c_dw_init_slave;
 	dev->disable = i2c_dw_disable;
-	dev->disable_int = i2c_dw_disable_int;
 
 	ret = i2c_dw_init_regmap(dev);
 	if (ret)
-- 
2.35.1

