Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBAF460E0F8
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 14:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbiJZMkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Oct 2022 08:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233693AbiJZMjo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Oct 2022 08:39:44 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050661A21D
        for <linux-i2c@vger.kernel.org>; Wed, 26 Oct 2022 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666787979; x=1698323979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x5Jtv6AbdPPWg+BucsjrEwBTpIlqdJd0eCHPlqZ5yV8=;
  b=mH/9u1l8paR1HYKOiJ7AMIMzq8QQwrjxH6qi/i1fjIHzhDqKKjgT9g5d
   EPtRQ0kMJfzRteqfyePESUADBX3NjjcMUkEgZ8MyAcHQ8KhXF4Q7tld/z
   f7ylvRnEXqe1+oINaJTTzhLQXmp10Gtl6MIh8BGm6oV99YUz6zBTqbw1F
   Zlua5VyIm6+x5pqWQ67g0Xt25mB/mK6UJ26FL1bWsemumRSFa+QcQrRI3
   GCcAuc8LUBEqlcEI8Vsjh8ybTMQy+XqOePV3JgZCXo4K5eLX1wRXISxif
   rcpIMlcZrWHlh0Z57o3kCgQTPTRNZ20IiwLu5mKQaYqE8iKPGczMud9Py
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="309625017"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="309625017"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 05:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="700908630"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="700908630"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2022 05:39:34 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Michael Wu <michael.wu@vatics.com>, Tian Ye <tianye@sugon.com>,
        Luis Oliveira <luis.oliveira@synopsys.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 02/11] i2c: designware: Empty receive FIFO in slave interrupt handler
Date:   Wed, 26 Oct 2022 15:39:03 +0300
Message-Id: <20221026123912.2833271-3-jarkko.nikula@linux.intel.com>
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

Writes from I2C bus often fail when testing the i2c-designware-slave.c
with the slave-eeprom backend. The same writes work correctly when
testing with a real 24c02 EEPROM chip.

In the tests below an i2c-designware-slave.c instance with the
slave-eeprom backend is configured to act as a simulated 24c02 at
address 0x65 on an I2C host bus 6.

1. i2cset -y 6 0x65 0x00 0x55

Single byte 0x55 write into address 0x00. No data goes into simulated
EEPROM. Debug prints from the i2c_dw_irq_handler_slave():

0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4

2. i2ctransfer -y 6 w9@0x65 0x00 0xff-

Write 8 bytes with decrementing value starting from 0xff at address 0x00
and forward. Only some of the data goes into arbitrary addresses.
Content is something like below but varies:

00000000  f9 f8 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000050  00 00 00 00 00 00 ff fe  00 00 00 00 00 00 00 00  |................|
000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 fc fb fa  |................|

In this case debug prints were:

0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x714 : INTR_STAT=0x204
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x514 : INTR_STAT=0x4
0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x510 : INTR_STAT=0x0

Both cases show there is more data coming from the receive FIFO still
after detecting the STOP condition. This can be seen from interrupt
status bits DW_IC_INTR_STOP_DET (0x200) and DW_IC_INTR_RX_FULL (0x4).

Perhaps due interrupt latencies the receive FIFO is not read fast
enough, STOP detection happens synchronously when it occurs on the I2C
bus and the DW_IC_INTR_RX_FULL keeps coming as long as there are more
bytes in the receive FIFO.

Fix this by reading the receive FIFO completely empty whenever
DW_IC_INTR_RX_FULL occurs. Use RFNE, Receive FIFO Not Empty bit in the
DW_IC_STATUS register to loop through bytes in the FIFO.

While at it do not test the return code from i2c_slave_event() for the
I2C_SLAVE_WRITE_RECEIVED since to my understanding this hardware cannot
generate NACK to incoming bytes and debug print itself does not have
much value.

Reported-by: Tian Ye <tianye@sugon.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
Hi Tian Ye. I've been testing the i2c-designware-slave.c recently and
discovered these write issues. Your recent patch gave an idea what might
cause them. In my solution I went testing DW_IC_STATUS_RFNE since
according to datasheet it's equivalent to RX_FULL interrupt in case
interrupts are masked. Seems to work here too.
Does this fix the issue you were seeing?
---
 drivers/i2c/busses/i2c-designware-core.h  |  1 +
 drivers/i2c/busses/i2c-designware-slave.c | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index dbf6bdc5f01b..6d1df28dd93b 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -108,6 +108,7 @@
 
 #define DW_IC_STATUS_ACTIVITY		BIT(0)
 #define DW_IC_STATUS_TFE		BIT(2)
+#define DW_IC_STATUS_RFNE		BIT(3)
 #define DW_IC_STATUS_MASTER_ACTIVITY	BIT(5)
 #define DW_IC_STATUS_SLAVE_ACTIVITY	BIT(6)
 
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 1eac4f4d5573..295774a69b67 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -180,11 +180,13 @@ static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
 					&val);
 		}
 
-		regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
-		val = tmp;
-		if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
-				     &val))
-			dev_vdbg(dev->dev, "Byte %X acked!", val);
+		do {
+			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+			val = tmp;
+			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
+					&val);
+			regmap_read(dev->map, DW_IC_STATUS, &tmp);
+		} while (tmp & DW_IC_STATUS_RFNE);
 	}
 
 	if (stat & DW_IC_INTR_RD_REQ) {
-- 
2.35.1

