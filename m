Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4286B3248E7
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 03:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbhBYCgV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 21:36:21 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:39020 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234554AbhBYCgU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Feb 2021 21:36:20 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R671e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=zhangliguang@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UPUjdrG_1614220530;
Received: from localhost(mailfrom:zhangliguang@linux.alibaba.com fp:SMTPD_---0UPUjdrG_1614220530)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Feb 2021 10:35:37 +0800
From:   Liguang Zhang <zhangliguang@linux.alibaba.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liguang Zhang <zhangliguang@linux.alibaba.com>
Subject: [PATCH] i2c: designware: Get right data length
Date:   Thu, 25 Feb 2021 10:35:28 +0800
Message-Id: <20210225023528.121135-1-zhangliguang@linux.alibaba.com>
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
lower 8 bits to get the right data length.

Signed-off-by: Liguang Zhang <zhangliguang@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d6425ad6e6a3..c3cf76f6c607 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -432,7 +432,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			/* Ensure length byte is a valid value */
 			if (flags & I2C_M_RECV_LEN &&
-			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
+			    (tmp & 0xff) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
 				len = i2c_dw_recv_len(dev, tmp);
 			}
 			*buf++ = tmp;
-- 
2.19.1.6.gb485710b

