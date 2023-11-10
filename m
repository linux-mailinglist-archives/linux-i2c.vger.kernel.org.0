Return-Path: <linux-i2c+bounces-21-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E57E8160
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F59EB20CA3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9983A26B;
	Fri, 10 Nov 2023 18:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msWTmW4C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE12938DCF
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:27:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A71A2C0D;
	Fri, 10 Nov 2023 10:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699640843; x=1731176843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o53zdXseAz9Kll8t96wURrzxC/7CqkWq6XM+E7VVfyU=;
  b=msWTmW4C0olXMJHlL266RUFyIirJN+f28QBT1KF96tQh8i0PrE3Wy7Cf
   K4Gmg47pgXleMAM264VvU6mlYXNMd7d0i3dAKVHWXLtJONFhvIVjwSd69
   uFLjsN06fJqz1/EvWaotm4ucG5tTfvXOm13jNJpZx6pbkZAYkKWNzL3sa
   Ikccy2EEigMGinouYvvJEO2zCX4wy+eyS7JhWH7xMLXAfNRp7St8duZ3Z
   Oi6mKRDzp9F10kQtHFta9FdcBoTtrLzJWK9OYBJ0Ogzl/huF9HXNgqBgS
   Qp4pTUJi008+nbmF+caxoYx5ept0ZHmZtQDbJEcTdXUjTgI9d5KWBxDv8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375251997"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375251997"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:23:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798663776"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="798663776"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2023 10:23:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 784F1923; Fri, 10 Nov 2023 20:23:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 25/25] i2c: designware: Fix spelling and other issues in the comments
Date: Fri, 10 Nov 2023 20:11:45 +0200
Message-ID: <20231110182304.3894319-26-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling and other issues, such as kernel-doc reported about,
in the comments. While at it, fix some indentation issues as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 10 +++++-----
 drivers/i2c/busses/i2c-designware-common.c  |  8 +++++---
 drivers/i2c/busses/i2c-designware-core.h    | 10 +++++-----
 drivers/i2c/busses/i2c-designware-master.c  | 15 +++++++++------
 drivers/i2c/busses/i2c-designware-platdrv.c |  4 ++--
 drivers/i2c/busses/i2c-designware-slave.c   |  6 ++++--
 6 files changed, 30 insertions(+), 23 deletions(-)

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
index 5e28f50e4ce6..91bdedbe1a02 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -127,6 +127,8 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
  * Autodetects needed register access mode and creates the regmap with
  * corresponding read/write callbacks. This must be called before doing any
  * other register access.
+ *
+ * Return: 0 on success, or negative errno otherwise.
  */
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 {
@@ -174,7 +176,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	/*
 	 * Note we'll check the return value of the regmap IO accessors only
 	 * at the probe stage. The rest of the code won't do this because
-	 * basically we have MMIO-based regmap so non of the read/write methods
+	 * basically we have MMIO-based regmap, so none of the read/write methods
 	 * can fail.
 	 */
 	dev->map = devm_regmap_init(dev->dev, NULL, dev, &map_cfg);
@@ -336,7 +338,7 @@ static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
 
 	acpi_speed = i2c_acpi_find_bus_speed(device);
 	/*
-	 * Some DSTDs use a non standard speed, round down to the lowest
+	 * Some DSDTs use a non standard speed, round down to the lowest
 	 * standard speed.
 	 */
 	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
@@ -532,7 +534,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 		/*
 		 * Wait 10 times the signaling period of the highest I2C
-		 * transfer supported by the driver (for 400KHz this is
+		 * transfer supported by the driver (for 400kHz this is
 		 * 25us) as described in the DesignWare I2C databook.
 		 */
 		usleep_range(25, 250);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 7479cb3a450d..5405d4da2b7d 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -141,10 +141,10 @@
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
@@ -201,7 +201,7 @@ struct i2c_dw_semaphore_callbacks;
  * @rst: optional reset for the controller
  * @slave: represent an I2C slave device
  * @get_clk_rate_khz: callback to retrieve IP specific bus speed
- * @cmd_err: run time hadware error code
+ * @cmd_err: run time hardware error code
  * @msgs: points to an array of messages currently being transferred
  * @msgs_num: the number of elements in msgs
  * @msg_write_idx: the element index of the current tx message in the msgs array
@@ -236,7 +236,7 @@ struct i2c_dw_semaphore_callbacks;
  * @release_lock: function to release a hardware lock on the bus
  * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
  *	-1 if there is no semaphore.
- * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
+ * @shared_with_punit: true if this bus is shared with the SoC's PUNIT
  * @init: function to initialize the I2C hardware
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index bd3c8db521de..4ef4160db01f 100644
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
@@ -1053,7 +1056,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
 			       dev_name(dev->dev), dev);
 	if (ret) {
-		dev_err(dev->dev, "failure requesting irq %i: %d\n",
+		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
 			dev->irq, ret);
 		return ret;
 	}
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 02dc1d1001f2..fa9c0c56b11e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -72,7 +72,7 @@ static int bt1_i2c_write(void *context, unsigned int reg, unsigned int val)
 		return ret;
 
 	return regmap_write(dev->sysmap, BT1_I2C_CTL,
-		BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
+			    BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
 }
 
 static struct regmap_config bt1_i2c_cfg = {
@@ -304,7 +304,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
 	adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
-					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
+				       I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
 	adap->nr = -1;
 
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND)
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 5abd5ec41954..21d80fe81cfe 100644
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
@@ -264,7 +266,7 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr_slave,
 			       IRQF_SHARED, dev_name(dev->dev), dev);
 	if (ret) {
-		dev_err(dev->dev, "failure requesting irq %i: %d\n",
+		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
 			dev->irq, ret);
 		return ret;
 	}
-- 
2.43.0.rc1.1.gbec44491f096


