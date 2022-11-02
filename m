Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89997616376
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbiKBNMe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbiKBNMI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:12:08 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954D82A730
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394720; x=1698930720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nkERn5nx0Wop4w8nz9ax9VIy9EozbSCEikGbhT2crPY=;
  b=YUBkcZ2Pmr9bEGqhCTNiC0wbvgyFhaBhkUQkpHq07IWS7aiHKXyz9MPA
   u/I2lVQEN7Q2afjv7QSj6GhUEEJG1PFYjyjBkQEemJLMiOSxnJ7UITNzU
   xnJfy6hc6s8uE7SSWxxLqvOtd24ZQpY2ywmASUyTZXDrJPG2HvtKr90OJ
   KVvHI2El/xMNRP8uzFDXBUTu8QPrAydJz7Y3qEUaKGZVsfk8d6ga7NWFt
   2SJIgGmfP8QMEC720Gijtp2wBHwJPSHGMXg7dcu5uXmv0byz3KRVQGM5Z
   UFlSVe83oSDKXK6ILEKPV3TlAjSt593iGCIwQOkHWtHN0JzupKqAQ5Vpi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="308120893"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="308120893"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234927"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234927"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:56 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 10/12] i2c: designware: Remove common i2c_dw_disable_int()
Date:   Wed,  2 Nov 2022 15:11:23 +0200
Message-Id: <20221102131125.421512-11-jarkko.nikula@linux.intel.com>
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

Commit 90312351fd1e ("i2c: designware: MASTER mode as separated driver")
introduced disable_int pointer but there is no real use for it. Both
i2c-designware-master.c and i2c-designware-slave.c set it to the same
i2c_dw_disable_int() and scope is inside the same kernel module.

Since i2c_dw_disable_int() is just masking interrupts and the direct
DW_IC_INTR_MASK register write looks more clear in the code use that and
remove it from common code.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
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

