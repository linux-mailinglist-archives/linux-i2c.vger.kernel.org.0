Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D607A60E107
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 14:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbiJZMkw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 08:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiJZMkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 08:40:23 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E2F3C8D3
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 05:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666788001; x=1698324001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MdK2vybdUloNnZR4FLdcIAZxYYo1j8ffhaRhjeUegso=;
  b=W+ehfghCz2ELVNRwmCNZPzCQhYxj4sIAJDSPgRIFl9EywBQL831HgBjO
   E+2Th+7dnbFjZ5WhrnMndVJ1+C7sTiSTOhFmWNlY5mYoR3Ui/PJAZuvFu
   wz8/1b4Xzkl4ZtP+KnwCP2QEbSCWwGT+C/WISPcmZSiuE9Xce3WcLFojm
   p7mmIr8NyYOvg3dkxG4lbJqHOri8FHy8m0i8umG77RY5IqjnB6cia9PBp
   smTpeGc6Gkki00D3RI09urqdvKLP9Aiux9pBCq29SEJVDtKEG7oeQbrUo
   U57p1rYK/qxMHKTpLJ/Q+xGNoI9Eow1ol7t4/PUq/OOyphhiNSK1JHaBq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309625092"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309625092"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="700908725"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="700908725"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2022 05:39:56 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 10/11] i2c: designware: Remove common i2c_dw_disable_int()
Date:   Wed, 26 Oct 2022 15:39:11 +0300
Message-Id: <20221026123912.2833271-11-jarkko.nikula@linux.intel.com>
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

i2c_dw_disable_int() and disable_int pointer in struct dw_i2c_dev were
introduced by the commit 90312351fd1e ("i2c: designware: MASTER mode as
separated driver") but it looks i2c_dw_disable_int() was never called
through the pointer.

Since i2c_dw_disable_int() is just masking interrupts and the direct
DW_IC_INTR_MASK register write looks more clear in the code use that and
remove from common code.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 5 -----
 drivers/i2c/busses/i2c-designware-core.h   | 1 -
 drivers/i2c/busses/i2c-designware-master.c | 9 ++++-----
 drivers/i2c/busses/i2c-designware-slave.c  | 3 +--
 4 files changed, 5 insertions(+), 13 deletions(-)

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
index 457e6966f85e..17528a41f1af 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -290,7 +290,6 @@ struct dw_i2c_dev {
 	int			semaphore_idx;
 	bool			shared_with_punit;
 	void			(*disable)(struct dw_i2c_dev *dev);
-	void			(*disable_int)(struct dw_i2c_dev *dev);
 	int			(*init)(struct dw_i2c_dev *dev);
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 5f9b9503441c..a6e5e3773fa7 100644
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

