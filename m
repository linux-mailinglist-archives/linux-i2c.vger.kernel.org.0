Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C5E31C247
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 20:14:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhBOTNT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 14:13:19 -0500
Received: from smtp1.axis.com ([195.60.68.17]:5355 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230048AbhBOTNR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Feb 2021 14:13:17 -0500
X-Greylist: delayed 509 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Feb 2021 14:13:15 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1613416396;
  x=1644952396;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wFNT4rSQCM8LHPCDltTRqOCKD9W6vi98OPConvKvLXY=;
  b=MQ4bh4Ox9dnYXEryFOKVd5d9KjEAu+73/+YTglVvwMUQ1xUAkVVuFZ5O
   bZPZIjyqES0kLONLIoApks/CKaa81TXpg/SIXaPPx/WZXG8toVuTfL5aL
   noy2jm0evg/Jo35Qkmw+ZNEXHxB188oeiTDakCo3lz3wD+E9H0EX8hafm
   zV1FoBpm891YNi/XVaZrfS+2LMQCez6NXevcmAkakoY06k2lY2VBx8h+H
   7J8xgSm16VMoX0OsVXUy3hl2wxwazb9j8LhbuBwwv7n/jeD9D34KTuEgW
   1v+vu6oFjYN5h4PF4uKHfxiGteO+UvR90h0O9UWowa5oq+uInE1x9cu+a
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli@axis.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: exynos5: Preserve high speed master code
Date:   Mon, 15 Feb 2021 20:03:21 +0100
Message-ID: <20210215190322.22094-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Mårten Lindahl <martenli@axis.com>

When the controller starts to send a message with the MASTER_ID field
set (high speed), the whole I2C_ADDR register is overwritten including
MASTER_ID as the SLV_ADDR_MAS field is set.

This patch preserves already written fields in I2C_ADDR when writing
SLV_ADDR_MAS.

Signed-off-by: Mårten Lindahl <martenli@axis.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 20a9881a0d6c..f2d04c241299 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -606,6 +606,7 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 	u32 i2c_ctl;
 	u32 int_en = 0;
 	u32 i2c_auto_conf = 0;
+	u32 i2c_addr = 0;
 	u32 fifo_ctl;
 	unsigned long flags;
 	unsigned short trig_lvl;
@@ -640,7 +641,12 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 		int_en |= HSI2C_INT_TX_ALMOSTEMPTY_EN;
 	}
 
-	writel(HSI2C_SLV_ADDR_MAS(i2c->msg->addr), i2c->regs + HSI2C_ADDR);
+	i2c_addr = HSI2C_SLV_ADDR_MAS(i2c->msg->addr);
+
+	if (i2c->op_clock >= I2C_MAX_FAST_MODE_PLUS_FREQ)
+		i2c_addr |= readl(i2c->regs + HSI2C_ADDR);
+
+	writel(i2c_addr, i2c->regs + HSI2C_ADDR);
 
 	writel(fifo_ctl, i2c->regs + HSI2C_FIFO_CTL);
 	writel(i2c_ctl, i2c->regs + HSI2C_CTL);
-- 
2.11.0

