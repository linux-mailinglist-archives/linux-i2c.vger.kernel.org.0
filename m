Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BC9325178
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 15:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhBYO1i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 09:27:38 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:54627 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229507AbhBYO1h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Feb 2021 09:27:37 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=zhangliguang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UPYnEh._1614263193;
Received: from localhost(mailfrom:zhangliguang@linux.alibaba.com fp:SMTPD_---0UPYnEh._1614263193)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Feb 2021 22:26:41 +0800
From:   Liguang Zhang <zhangliguang@linux.alibaba.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liguang Zhang <zhangliguang@linux.alibaba.com>
Subject: [PATCH v2] i2c: designware: Get right data length
Date:   Thu, 25 Feb 2021 22:26:31 +0800
Message-Id: <20210225142631.1882-1-zhangliguang@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

IC_DATA_CMD[11] indicates the first data byte received after the address
phase for receive transfer in Master receiver or Slave receiver mode,
this bit was set in some transfer flow. IC_DATA_CMD[7:0] contains the
data to be transmitted or received on the I2C bus, so we should use the
lower 8 bits to get the real data length.

Signed-off-by: Liguang Zhang <zhangliguang@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-designware-core.h   | 2 ++
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 85307cfa7109..5392b82f68a4 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -38,6 +38,8 @@
 #define DW_IC_CON_TX_EMPTY_CTRL			BIT(8)
 #define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
 
+#define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
+
 /*
  * Registers offset
  */
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d6425ad6e6a3..dd27b9dbe931 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -432,7 +432,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			/* Ensure length byte is a valid value */
 			if (flags & I2C_M_RECV_LEN &&
-			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
+			    (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
 				len = i2c_dw_recv_len(dev, tmp);
 			}
 			*buf++ = tmp;
-- 
2.19.1.6.gb485710b

