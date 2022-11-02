Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DF461636C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Nov 2022 14:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbiKBNLo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Nov 2022 09:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbiKBNLk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Nov 2022 09:11:40 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0792A27D
        for <linux-i2c@vger.kernel.org>; Wed,  2 Nov 2022 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667394699; x=1698930699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U+WP8cv9IFqhjJKZWPS1nEznzAEpajKg9fd+T0IjFcQ=;
  b=RmgSK2wPcFKD9XHERioc8MrNwSkyBEty7SYgTL3ioMZU+xoadCVTfPVt
   7EetGUUqwTWJzsgyqIQx3I3fsaWta3RPPIp+5LYhxHKuxNdQ8cGXUH2H0
   jP7Q7P8hMm+Prv7DSKOyI4sum3FIUu+nf8bkYkfV81UBiAa5vMevN22Y+
   BRpK5nzvrLWQ4Bg3Ep5Rvtq4XkZS2SRjs7z/7h1pSAff3PbQ/8X2fQv+K
   J6EikLUXHWFnA6kN4e3rNRK0SzzmO/YyzFAyJpprqEbgYSgXcMOKxw4xF
   frOyphqKCXiTUL3ITertB8Wj5if+6PECVLDPs8lKCrUeNjdubG6//LT8e
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310507691"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="310507691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 06:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="612234788"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="612234788"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.68])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2022 06:11:37 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 03/12] i2c: designware: Define software status flags with BIT()
Date:   Wed,  2 Nov 2022 15:11:16 +0200
Message-Id: <20221102131125.421512-4-jarkko.nikula@linux.intel.com>
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

Define software status flags with a BIT() macro. While at it remove
STATUS_IDLE and replace its use with zero initialization and status
flags clearing with a mask.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h   | 10 +++++-----
 drivers/i2c/busses/i2c-designware-master.c |  4 ++--
 drivers/i2c/busses/i2c-designware-slave.c  |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 6d1df28dd93b..457e6966f85e 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -123,12 +123,12 @@
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_MASK	GENMASK(3, 2)
 
 /*
- * status codes
+ * Sofware status flags
  */
-#define STATUS_IDLE			0x0
-#define STATUS_ACTIVE			0x1
-#define STATUS_WRITE_IN_PROGRESS	0x2
-#define STATUS_READ_IN_PROGRESS		0x4
+#define STATUS_ACTIVE			BIT(0)
+#define STATUS_WRITE_IN_PROGRESS	BIT(1)
+#define STATUS_READ_IN_PROGRESS		BIT(2)
+#define STATUS_MASK			GENMASK(2, 0)
 
 /*
  * operation modes
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index dc3c5a15a95b..1b7db2b58f31 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -574,7 +574,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	dev->msg_write_idx = 0;
 	dev->msg_read_idx = 0;
 	dev->msg_err = 0;
-	dev->status = STATUS_IDLE;
+	dev->status = 0;
 	dev->abort_source = 0;
 	dev->rx_outstanding = 0;
 
@@ -731,7 +731,7 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
 
 	if (stat & DW_IC_INTR_TX_ABRT) {
 		dev->cmd_err |= DW_IC_ERR_TX_ABRT;
-		dev->status = STATUS_IDLE;
+		dev->status &= ~STATUS_MASK;
 		dev->rx_outstanding = 0;
 
 		/*
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 295774a69b67..84eb0bec70fa 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -82,7 +82,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
 	dev->msg_write_idx = 0;
 	dev->msg_read_idx = 0;
 	dev->msg_err = 0;
-	dev->status = STATUS_IDLE;
+	dev->status = 0;
 	dev->abort_source = 0;
 	dev->rx_outstanding = 0;
 
-- 
2.35.1

