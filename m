Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F06E61F486
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 14:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbiKGNnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 08:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbiKGNnB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 08:43:01 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA671C927
        for <linux-i2c@vger.kernel.org>; Mon,  7 Nov 2022 05:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667828580; x=1699364580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+53r0+OK+AQ7IgmYK1LQWc6tavIy5XNz9SE48bWjEZw=;
  b=JZ6LhY+CGOPpEtGHHRc1hcsZgqu2oAg4MMU6WyarHq99Zj9OIvFdG6fy
   rgNhxHeFxWXD05jO+jaVu68JFIHUCgm1Wr9sEDa7B3MA/PmeLuGfdE/4G
   YKQ3dZGvesfgwLueShnAbp7CLAdGX3+EWk5at5HnZOQnavuNH4Q3epL4r
   j6MyDLEhoI3zMoVD1HZNV+6aBCiEAFi+hQN43TTXBL9oybMyNwx/yh+bz
   XIyvO0vUT3EvASDRFpdAUmMVc4QfjAnpbceJ5VIOvR+ZzGxBL10GXAPP3
   0rqdfAwHUGKu2kcF+5sXiOQ6+9JK3gh5O6uw5UTGL+Ey3qAB5KNvhln7Q
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372531064"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="372531064"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 05:42:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586971841"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="586971841"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 05:42:56 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 01/12] i2c: designware: Fix slave state machine for sequential reads
Date:   Mon,  7 Nov 2022 15:42:37 +0200
Message-Id: <20221107134248.864890-2-jarkko.nikula@linux.intel.com>
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

Some read types from I2C bus don't work correctly when testing the
i2c-designware-slave.c with the slave-eeprom backend. The same reads
work correctly when testing with a real 24c02 EEPROM chip.

In the following tests an i2c-designware-slave.c instance with the
slave-eeprom backend is configured to act as a simulated 24c02 at
address 0x65 on an I2C host bus 6:

1. i2cdump -y 6 0x65 b (OK)
   Random read. Each byte are read using a byte address write with a
   current address read in a same message.
2. i2cdump -y 6 0x65 c (OK, was NOK before commit 3b5f7f10ff6e when it
                        was repeating the 1st byte)
   Repeated current address read. One byte address write message
   followed by repeated current address read messages.
3. i2cdump -y 6 0x65 i (NOK, each 32 byte block repeats the 1st byte of
                        block)
   Sequential read using SMBus Block Read. For each 32 byte block a byte
   address write followed by 32 sequental reads in a same message.

These findings are explained because the implementation has had a
mismatch between hardware interrupts and what I2C slave events should be
sent after those interrupts. Despite that the case 1 happened to have
always the I2C slave events sent to a right order with a right data
between backend and the I2C bus.

Hardware generates the DW_IC_INTR_RD_REQ interrupt when another host is
attempting to read and for sequential reads after. DW_IC_INTR_RX_DONE
occurs when host does not acknowledge a transmitted byte which is an
indication the end of transmission.

Those interrupts do not match directly with I2C_SLAVE_READ_REQUESTED and
I2C_SLAVE_READ_PROCESSED events which is how the code was and is
practically using them. The slave-eeprom backend increases the buffer
index with the I2C_SLAVE_READ_PROCESSED event and returns the data from
current index when receiving only the I2C_SLAVE_READ_REQUESTED event.

That explains the repeated bytes in case 3 and also case 2 before
commit 3b5f7f10ff6e ("i2c: designware: slave should do WRITE_REQUESTED
before WRITE_RECEIVED").

Patch fixes the case 3 while keep cases 1 and 2 working with following
changes:

- First DW_IC_INTR_RD_REQ interrupt will change the state machine to
  read in progress state, send I2C_SLAVE_READ_REQUESTED event and
  transmit the first byte from backend
- Subsequent DW_IC_INTR_RD_REQ interrupts will send
  I2C_SLAVE_READ_PROCESSED events and transmit next bytes from backend
- STOP won't change the state machine. Otherwise case 2 won't work since
  we cannot distinguish current address read from sequentiel read
- DW_IC_INTR_RX_DONE interrupt is needless since there is no mechanism
  to inform it to a backend. It cannot be used to change state machine
  at the end of read either due the same reason than above
- Next host write to us will change the state machine from read to write
  in progress state
- STATUS_WRITE_IN_PROGRESS and STATUS_READ_IN_PROGRESS are considered
  now to be status flags not the state of the driver. This is how we
  treat them in i2c-designware-master.c

While at it do not test the return code from i2c_slave_event() for
I2C_SLAVE_READ_REQUESTED and I2C_SLAVE_READ_PROCESSED since it returns
always 0.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h  |  1 -
 drivers/i2c/busses/i2c-designware-slave.c | 32 +++++++++++------------
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4d3a3b464ecd..dbf6bdc5f01b 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -103,7 +103,6 @@
 #define DW_IC_INTR_MASTER_MASK		(DW_IC_INTR_DEFAULT_MASK | \
 					 DW_IC_INTR_TX_EMPTY)
 #define DW_IC_INTR_SLAVE_MASK		(DW_IC_INTR_DEFAULT_MASK | \
-					 DW_IC_INTR_RX_DONE | \
 					 DW_IC_INTR_RX_UNDER | \
 					 DW_IC_INTR_RD_REQ)
 
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 0d15f4c1e9f7..1eac4f4d5573 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -173,8 +173,9 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 		enabled, slave_activity, raw_stat, stat);
 
 	if (stat & DW_IC_INTR_RX_FULL) {
-		if (dev->status != STATUS_WRITE_IN_PROGRESS) {
-			dev->status = STATUS_WRITE_IN_PROGRESS;
+		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
+			dev->status |= STATUS_WRITE_IN_PROGRESS;
+			dev->status &= ~STATUS_READ_IN_PROGRESS;
 			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED,
 					&val);
 		}
@@ -190,24 +191,23 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 		if (slave_activity) {
 			regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
 
-			dev->status = STATUS_READ_IN_PROGRESS;
-			if (!i2c_slave_event(dev->slave,
-					     I2C_SLAVE_READ_REQUESTED,
-					     &val))
-				regmap_write(dev->map, DW_IC_DATA_CMD, val);
+			if (!(dev->status & STATUS_READ_IN_PROGRESS)) {
+				i2c_slave_event(dev->slave,
+						I2C_SLAVE_READ_REQUESTED,
+						&val);
+				dev->status |= STATUS_READ_IN_PROGRESS;
+				dev->status &= ~STATUS_WRITE_IN_PROGRESS;
+			} else {
+				i2c_slave_event(dev->slave,
+						I2C_SLAVE_READ_PROCESSED,
+						&val);
+			}
+			regmap_write(dev->map, DW_IC_DATA_CMD, val);
 		}
 	}
 
-	if (stat & DW_IC_INTR_RX_DONE) {
-		if (!i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED,
-				     &val))
-			regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);
-	}
-
-	if (stat & DW_IC_INTR_STOP_DET) {
-		dev->status = STATUS_IDLE;
+	if (stat & DW_IC_INTR_STOP_DET)
 		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
-	}
 
 	return 1;
 }
-- 
2.35.1

