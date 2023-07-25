Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4316C761BC7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbjGYOaz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbjGYOal (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:41 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2E32132;
        Tue, 25 Jul 2023 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295432; x=1721831432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+N9ymJBNV/tblGLyZdQHs3Jj47uk20AjBI9Dx+1oNVA=;
  b=Gkpks5v2/wip1ikvtu7ShJQzFhoUFqDCyKOZcRfuaqdCaXXI4bfmp16E
   uw4eH8YCynSrR4vjRyXFvstSaMtp9S2TTUOKBeX+5KQ/zxOcyO3GU3iGg
   ZUgjNwsvp+8HCx+xK3kFbu0TcgmCSR4QaXysS0XN/7QIGvZbfi7flvm06
   znhwOQGEn/kMa1SSCQzEpjlBfMrDfTfpNsYDbcpmbVERbqrb5kGmOSnUi
   hOVHwvRDFjUwWKrYq2h3EPQJq+gFaLsPY0uCB5T6LMiSVd+c0GDGA49zn
   HoMSnyxXEQBGsfsdSiLoBJTvtNqcaTZ2mDF9nZrYIF4asy4ybHCn/0j4e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357742936"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="357742936"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869491482"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 07:30:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E9DD2474; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 9/9] i2c: designware: Fix spelling and other issues in the comments
Date:   Tue, 25 Jul 2023 17:30:23 +0300
Message-Id: <20230725143023.86325-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix spelling and other issues, such as kernel doc reported about,
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
index de28dd66c5eb..beb190f7d005 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -123,6 +123,8 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
  * Autodetects needed register access mode and creates the regmap with
  * corresponding read/write callbacks. This must be called before doing any
  * other register access.
+ *
+ * Return: 0 on success, or negative errno otherwise.
  */
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 {
@@ -170,7 +172,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 	/*
 	 * Note we'll check the return value of the regmap IO accessors only
 	 * at the probe stage. The rest of the code won't do this because
-	 * basically we have MMIO-based regmap so non of the read/write methods
+	 * basically we have MMIO-based regmap, so none of the read/write methods
 	 * can fail.
 	 */
 	dev->map = devm_regmap_init(dev->dev, NULL, dev, &map_cfg);
@@ -330,7 +332,7 @@ static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
 
 	acpi_speed = i2c_acpi_find_bus_speed(device);
 	/*
-	 * Some DSTDs use a non standard speed, round down to the lowest
+	 * Some DSDTs use a non standard speed, round down to the lowest
 	 * standard speed.
 	 */
 	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
@@ -508,7 +510,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 		/*
 		 * Wait 10 times the signaling period of the highest I2C
-		 * transfer supported by the driver (for 400KHz this is
+		 * transfer supported by the driver (for 400kHz this is
 		 * 25us) as described in the DesignWare I2C databook.
 		 */
 		usleep_range(25, 250);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 8547590fc91b..8eb037298670 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -139,10 +139,10 @@
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
@@ -197,7 +197,7 @@ struct reset_control;
  * @rst: optional reset for the controller
  * @slave: represent an I2C slave device
  * @get_clk_rate_khz: callback to retrieve IP specific bus speed
- * @cmd_err: run time hadware error code
+ * @cmd_err: run time hardware error code
  * @msgs: points to an array of messages currently being transferred
  * @msgs_num: the number of elements in msgs
  * @msg_write_idx: the element index of the current tx message in the msgs array
@@ -232,7 +232,7 @@ struct reset_control;
  * @release_lock: function to release a hardware lock on the bus
  * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
  *	-1 if there is no semaphore.
- * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
+ * @shared_with_punit: true if this bus is shared with the SoC's PUNIT
  * @disable: function to disable the controller
  * @init: function to initialize the I2C hardware
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 3bfd7a2232db..e81c5b6188a6 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -165,12 +165,14 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
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
@@ -311,7 +313,7 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		/*
 		 * Initiate the i2c read/write transaction of buffer length,
 		 * and poll for bus busy status. For the last message transfer,
-		 * update the command with stopbit enable.
+		 * update the command with stop bit enable.
 		 */
 		for (msg_itr_lmt = buf_len; msg_itr_lmt > 0; msg_itr_lmt--) {
 			if (msg_wrt_idx == num_msgs - 1 && msg_itr_lmt == 1)
@@ -418,7 +420,7 @@ static int txgbe_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msg
 
 /*
  * Initiate (and continue) low level master read/write transaction.
- * This function is only called from i2c_dw_isr, and pumping i2c_msg
+ * This function is only called from i2c_dw_isr(), and pumping i2c_msg
  * messages into the tx buffer.  Even if the size of i2c_msg data is
  * longer than the size of the tx buffer, it handles everything.
  */
@@ -456,7 +458,8 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 			buf = msgs[dev->msg_write_idx].buf;
 			buf_len = msgs[dev->msg_write_idx].len;
 
-			/* If both IC_EMPTYFIFO_HOLD_MASTER_EN and
+			/*
+			 * If both IC_EMPTYFIFO_HOLD_MASTER_EN and
 			 * IC_RESTART_EN are set, we must manually
 			 * set restart bit between messages.
 			 */
@@ -910,7 +913,7 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
 	adap->bus_recovery_info = rinfo;
 
-	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
+	dev_info(dev->dev, "running with GPIO recovery mode! scl%s",
 		 rinfo->sda_gpiod ? ",sda" : "");
 
 	return 0;
@@ -1015,7 +1018,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
 			       dev_name(dev->dev), dev);
 	if (ret) {
-		dev_err(dev->dev, "failure requesting irq %i: %d\n",
+		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
 			dev->irq, ret);
 		return ret;
 	}
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 2e079cf20bb5..bb44f41efdfc 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -30,12 +30,14 @@ static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)
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
@@ -263,7 +265,7 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr_slave,
 			       IRQF_SHARED, dev_name(dev->dev), dev);
 	if (ret) {
-		dev_err(dev->dev, "failure requesting irq %i: %d\n",
+		dev_err(dev->dev, "failure requesting IRQ %i: %d\n",
 			dev->irq, ret);
 		return ret;
 	}
-- 
2.40.0.1.gaa8946217a0b

