Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA83C61F48A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiKGNnH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbiKGNnG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:06 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D91B1C927
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828586; x=1699364586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tSJIBciZNJcWVV4N9YBqpby8TxwpHUhVjvZHstyA73M=;
  b=CqQGVD+QePWmPSDkHzp/jfyi/zFRjI45eqBXwG0FPONlxAK2I618GMfP
   pywone7bNf/Kf7onKCVIbqqOQw6pp2fbh7c9xslQICWS49IpO0QiXpMq4
   3C1kz4vfnqdUojiCqP9IH1BN7x6gy+eZgFd1AtXCV0Xb4M7jbx7zmetP/
   tI9jFpax/BTQME4x7Ft8D1OmTXT0pwXiKZEVHRIzpMTb6XSpgoUbsX5Ne
   8iWWQgBVFZyr1PxXCZWK6nt8x1XKuGYSb+TVcmO9VCTWmy9OJFIeqUgi8
   Jj7rvV5xtqlmMRfv/rSNfyYCYXGwJmxW5xWUZ3TE0aSwpiFN08cMNDmEK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531082"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531082"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971865"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971865"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:43:03 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 03/12] i2c: designware: Define software status flags with BIT()
Date:   Mon,  7 Nov 2022 15:42:39 +0200
Message-Id: <20221107134248.864890-4-jarkko.nikula@linux.intel.com>
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

Define software status flags with a BIT() macro. While at it remove
STATUS_IDLE and replace its use with zero initialization and status
flags clearing with a mask.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

