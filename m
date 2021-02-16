Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED2F31D2A4
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Feb 2021 23:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhBPW1n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Feb 2021 17:27:43 -0500
Received: from smtp2.axis.com ([195.60.68.18]:53896 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231195AbhBPW1j (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Feb 2021 17:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1613514458;
  x=1645050458;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FisCV0Eq/9wc83laF2BLqS9yxk3LMPeu3iHBB7jiBtI=;
  b=HLjV1ro8KnaFvssHevEwJXwTCEMmiC8bV9wAiVtSUekv5Y1K3RQvrVlQ
   wlKXm0PwlBon6gYPJsTPGF2Zvg4LqIFELou2q2cx1Jzo85utGlu+devfI
   Tt2qyI29PEB9GSZoGosUbByqYA1iIDjJixBRbSsW68Q00OjWRY+a4+rKl
   0Tw7A1U95Ta2ah82RFqbz6AgLsWJ79aT7lIndnrQNh+0LucpbGMOTTiMp
   0H7u19pOODP8/60tkQ9frqf6p9UOMscpp8QtqeOub5ySHc+V8EZr8/jJa
   enxpSqWGTskg21gHGpmYfwjjkl60p1+gXgV/CmY1orxeYTaqqFLS7uQob
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <martenli@axis.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] i2c: exynos5: Preserve high speed master code
Date:   Tue, 16 Feb 2021 23:25:38 +0100
Message-ID: <20210216222538.6427-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Mårten Lindahl <martenli@axis.com>

When the driver starts to send a message with the MASTER_ID field
set (high speed), the whole I2C_ADDR register is overwritten including
MASTER_ID as the SLV_ADDR_MAS field is set.

This patch preserves already written fields in I2C_ADDR when writing
SLV_ADDR_MAS.

Signed-off-by: Mårten Lindahl <martenli@axis.com>
---
v2:
- Change commit message as the problem is not in the controller but in
  the driver.
- Use MASTER_ID macro instead of reading back register contents.

 drivers/i2c/busses/i2c-exynos5.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 20a9881a0d6c..5ac30d95650c 100644
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
+		i2c_addr |= HSI2C_MASTER_ID(MASTER_ID(i2c->adap.nr));
+
+	writel(i2c_addr, i2c->regs + HSI2C_ADDR);
 
 	writel(fifo_ctl, i2c->regs + HSI2C_FIFO_CTL);
 	writel(i2c_ctl, i2c->regs + HSI2C_CTL);
-- 
2.11.0

