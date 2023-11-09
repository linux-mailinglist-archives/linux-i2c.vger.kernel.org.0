Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3C17E717A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345059AbjKIS27 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345022AbjKIS2o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:44 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BF43C11;
        Thu,  9 Nov 2023 10:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554521; x=1731090521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J/3rNKPhtPGSbMQv1qpIa/vW5WBgEmTeFjTETFKBSGQ=;
  b=lSOL3Ne7pxeJa4NLTmbgqlXUbWwtssrtt00yXOSdmg0TFwm1Awi1NTyR
   wxZP4lHkRrq+A7+1AMtSoN/0TF3XNjd1FDOgcT8yIr9Bed/A7BGFE4eID
   28jmUPHLdn+STYsS7mRcBSqshjomqY/L7OnN5Jj1pgUDJ2DyNNnpk/awY
   e6BB8UtW2Ij+n4/iPOq8Rpqn3dtxosoSCyi2EnJ73laT7+DzLkoZKuK13
   rsWOMTL2rHFXjWAihW+Q/H426fmOgnWBBFhM7yZG7nn+V9NDfQ9Ur9DtX
   nYFRrPtfri6B0+nhAvFvg37RHYh8ktsqM/JX1cbyjbIYVZtkJFNiLq6U9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389853942"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="389853942"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936938990"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="936938990"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Nov 2023 10:28:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D0A25812; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 10/12] i2c: designware: Fix spelling and other issues in the comments
Date:   Thu,  9 Nov 2023 20:19:20 +0200
Message-ID: <20231109182823.3531846-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
In-Reply-To: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix spelling and other issues, such as kernel-doc reported about,
in the comments.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 10 +++++-----
 drivers/i2c/busses/i2c-designware-common.c |  8 +++++---
 drivers/i2c/busses/i2c-designware-core.h   | 10 +++++-----
 drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++------
 drivers/i2c/busses/i2c-designware-slave.c  |  6 ++++--
 5 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 63454b06e5da..8fbd2a10c31a 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -155,7 +155,7 @@ static void psp_release_i2c_bus_deferred(struct work_struct *work)
 
 	/*
 	 * If there is any pending transaction, cannot release the bus here.
-	 * psp_release_i2c_bus will take care of this later.
+	 * psp_release_i2c_bus() will take care of this later.
 	 */
 	if (psp_i2c_access_count)
 		goto cleanup;
@@ -210,12 +210,12 @@ static void psp_release_i2c_bus(void)
 {
 	mutex_lock(&psp_i2c_access_mutex);
 
-	/* Return early if mailbox was malfunctional */
+	/* Return early if mailbox was malfunctioned */
 	if (psp_i2c_mbox_fail)
 		goto cleanup;
 
 	/*
-	 * If we are last owner of PSP semaphore, need to release aribtration
+	 * If we are last owner of PSP semaphore, need to release arbitration
 	 * via mailbox.
 	 */
 	psp_i2c_access_count--;
@@ -235,9 +235,9 @@ static void psp_release_i2c_bus(void)
 
 /*
  * Locking methods are based on the default implementation from
- * drivers/i2c/i2c-core-base.c, but with psp acquire and release operations
+ * drivers/i2c/i2c-core-base.c, but with PSP acquire and release operations
  * added. With this in place we can ensure that i2c clients on the bus shared
- * with psp are able to lock HW access to the bus for arbitrary number of
+ * with PSP are able to lock HW access to the bus for arbitrary number of
  * operations - that is e.g. write-wait-read.
  */
 static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 4d7dc346e619..5d4e39663438 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -126,6 +126,8 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
  * Autodetects needed register access mode and creates the regmap with
  * corresponding read/write callbacks. This must be called before doing any
  * other register access.
+ *
+ * Return: 0 on success, or negative errno otherwise.
  */
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 {
@@ -173,7 +175,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	/*
 	 * Note we'll check the return value of the regmap IO accessors only
 	 * at the probe stage. The rest of the code won't do this because
-	 * basically we have MMIO-based regmap so non of the read/write methods
+	 * basically we have MMIO-based regmap, so none of the read/write methods
 	 * can fail.
 	 */
 	dev->map = devm_regmap_init(dev->dev, NULL, dev, &map_cfg);
@@ -335,7 +337,7 @@ static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
 
 	acpi_speed = i2c_acpi_find_bus_speed(device);
 	/*
-	 * Some DSTDs use a non standard speed, round down to the lowest
+	 * Some DSDTs use a non standard speed, round down to the lowest
 	 * standard speed.
 	 */
 	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
@@ -531,7 +533,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 		/*
 		 * Wait 10 times the signaling period of the highest I2C
-		 * transfer supported by the driver (for 400KHz this is
+		 * transfer supported by the driver (for 400kHz this is
 		 * 25us) as described in the DesignWare I2C databook.
 		 */
 		usleep_range(25, 250);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index a2731179a42b..9f8e5bf61ec0 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -142,10 +142,10 @@
 #define DW_IC_SLAVE				1
 
 /*
- * Hardware abort codes from the DW_IC_TX_ABRT_SOURCE register
+ * Hardware abort codes from the DW_IC_TX_ABRT_SOURCE register.
  *
- * Only expected abort codes are listed here
- * refer to the datasheet for the full list
+ * Only expected abort codes are listed here,
+ * refer to the datasheet for the full list.
  */
 #define ABRT_7B_ADDR_NOACK			0
 #define ABRT_10ADDR1_NOACK			1
@@ -200,7 +200,7 @@ struct reset_control;
  * @rst: optional reset for the controller
  * @slave: represent an I2C slave device
  * @get_clk_rate_khz: callback to retrieve IP specific bus speed
- * @cmd_err: run time hadware error code
+ * @cmd_err: run time hardware error code
  * @msgs: points to an array of messages currently being transferred
  * @msgs_num: the number of elements in msgs
  * @msg_write_idx: the element index of the current tx message in the msgs array
@@ -235,7 +235,7 @@ struct reset_control;
  * @release_lock: function to release a hardware lock on the bus
  * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
  *	-1 if there is no semaphore.
- * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
+ * @shared_with_punit: true if this bus is shared with the SoC's PUNIT
  * @disable: function to disable the controller
  * @init: function to initialize the I2C hardware
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 0b6576d7f811..9d06dd7ffe37 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -168,12 +168,14 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 }
 
 /**
- * i2c_dw_init_master() - Initialize the designware I2C master hardware
+ * i2c_dw_init_master() - Initialize the DesignWare I2C master hardware
  * @dev: device private data
  *
  * This functions configures and enables the I2C master.
  * This function is called during I2C init function, and in case of timeout at
  * run time.
+ *
+ * Return: 0 on success, or negative errno otherwise.
  */
 static int i2c_dw_init_master(struct dw_i2c_dev *dev)
 {
@@ -314,7 +316,7 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		/*
 		 * Initiate the i2c read/write transaction of buffer length,
 		 * and poll for bus busy status. For the last message transfer,
-		 * update the command with stopbit enable.
+		 * update the command with stop bit enable.
 		 */
 		for (msg_itr_lmt = buf_len; msg_itr_lmt > 0; msg_itr_lmt--) {
 			if (msg_wrt_idx == num_msgs - 1 && msg_itr_lmt == 1)
@@ -421,7 +423,7 @@ static int txgbe_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msg
 
 /*
  * Initiate (and continue) low level master read/write transaction.
- * This function is only called from i2c_dw_isr, and pumping i2c_msg
+ * This function is only called from i2c_dw_isr(), and pumping i2c_msg
  * messages into the tx buffer.  Even if the size of i2c_msg data is
  * longer than the size of the tx buffer, it handles everything.
  */
@@ -459,7 +461,8 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 			buf = msgs[dev->msg_write_idx].buf;
 			buf_len = msgs[dev->msg_write_idx].len;
 
-			/* If both IC_EMPTYFIFO_HOLD_MASTER_EN and
+			/*
+			 * If both IC_EMPTYFIFO_HOLD_MASTER_EN and
 			 * IC_RESTART_EN are set, we must manually
 			 * set restart bit between messages.
 			 */
@@ -949,7 +952,7 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
 	adap->bus_recovery_info = rinfo;
 
-	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
+	dev_info(dev->dev, "running with GPIO recovery mode! scl%s",
 		 rinfo->sda_gpiod ? ",sda" : "");
 
 	return 0;
@@ -1054,7 +1057,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
 			       dev_name(dev->dev), dev);
 	if (ret) {
-		dev_err(dev->dev, "failure requesting irq %i: %d\n",
+		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
 			dev->irq, ret);
 		return ret;
 	}
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 70d183fa3bff..0fa3a3d7a724 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -32,12 +32,14 @@ static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)
 }
 
 /**
- * i2c_dw_init_slave() - Initialize the designware i2c slave hardware
+ * i2c_dw_init_slave() - Initialize the DesignWare i2c slave hardware
  * @dev: device private data
  *
  * This function configures and enables the I2C in slave mode.
  * This function is called during I2C init function, and in case of timeout at
  * run time.
+ *
+ * Return: 0 on success, or negative errno otherwise.
  */
 static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
 {
@@ -265,7 +267,7 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr_slave,
 			       IRQF_SHARED, dev_name(dev->dev), dev);
 	if (ret) {
-		dev_err(dev->dev, "failure requesting irq %i: %d\n",
+		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
 			dev->irq, ret);
 		return ret;
 	}
-- 
2.40.0.1996.gbec44491f096

