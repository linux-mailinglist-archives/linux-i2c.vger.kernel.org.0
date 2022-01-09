Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC6B488998
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jan 2022 14:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbiAIN0v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jan 2022 08:26:51 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:42931 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231201AbiAIN0v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jan 2022 08:26:51 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04407;MF=guoheyi@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0V1Il5dP_1641734775;
Received: from fdadf40dcbca.tbsite.net(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0V1Il5dP_1641734775)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 09 Jan 2022 21:26:48 +0800
From:   Heyi Guo <guoheyi@linux.alibaba.com>
To:     linux-kernel@vger.kernel.org
Cc:     Heyi Guo <guoheyi@linux.alibaba.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after timeout
Date:   Sun,  9 Jan 2022 21:26:13 +0800
Message-Id: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The memory will be freed by the caller if transfer timeout occurs,
then it would trigger kernel panic if the peer device responds with
something after timeout and triggers the interrupt handler of aspeed
i2c driver.

Set the msgs pointer to NULL to avoid invalid memory reference after
timeout to fix this potential kernel panic.

Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>

-------

Cc: Brendan Higgins <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
---
 drivers/i2c/busses/i2c-aspeed.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c950..3ab0396168680 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 		spin_lock_irqsave(&bus->lock, flags);
 		if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
 			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
+		/*
+		 * All the buffers may be freed after returning to caller, so
+		 * set msgs to NULL to avoid memory reference after freeing.
+		 */
+		bus->msgs = NULL;
 		spin_unlock_irqrestore(&bus->lock, flags);
 
 		return -ETIMEDOUT;
-- 
2.17.1

