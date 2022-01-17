Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32759490E6E
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jan 2022 18:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243251AbiAQRJC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jan 2022 12:09:02 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:54256 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242508AbiAQRHB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jan 2022 12:07:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 835C2B8116B;
        Mon, 17 Jan 2022 17:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DF0C36AEC;
        Mon, 17 Jan 2022 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642439218;
        bh=10N+I46ycgYorHj50Ok5rvkOkrdy4oDRd2b9iQrWrFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YveEKWL9nmwU+3T52BkOvO21EdqpD0alLs81OSMRcOzqv01H8KyqGIL7OaXRx1WOi
         d3Swb2tXlXiS/G77JBPhu+5PnVLDk6w0gt5ms1dWHBh5B38DxkFlue2Or5T66ASlkn
         EFXGYJbGEvQr6MsPd2Yd7HAp8Ta/ybSsK1MY0DWuolGh0JzeN4R8LypUQ5YQqJ0shM
         iZopvwhs7U5LAW2QTGTWxRs7VlQmgCHAuQuwh3JQNb9tDclKIR+lmtNthVL9hltM7o
         HX5g5m/LYwxy3HvAykEb85Se8CzHj51CadFVjYtgMjqRQhoytzRL4Wsx/e5Icv2ee5
         GfwosNjpRnmjg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Joakim Tjernlund <joakim.tjernlund@infinera.com>,
        Scott Wood <oss@buserror.net>, Wolfram Sang <wsa@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        chris.packham@alliedtelesis.co.nz, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 09/16] i2c: mpc: Correct I2C reset procedure
Date:   Mon, 17 Jan 2022 12:06:31 -0500
Message-Id: <20220117170638.1472900-9-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170638.1472900-1-sashal@kernel.org>
References: <20220117170638.1472900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Joakim Tjernlund <joakim.tjernlund@infinera.com>

[ Upstream commit ebe82cf92cd4825c3029434cabfcd2f1780e64be ]

Current I2C reset procedure is broken in two ways:
1) It only generate 1 START instead of 9 STARTs and STOP.
2) It leaves the bus Busy so every I2C xfer after the first
   fixup calls the reset routine again, for every xfer there after.

This fixes both errors.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Acked-by: Scott Wood <oss@buserror.net>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-mpc.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 7db5554d2b4e7..194bf06ecb25e 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -107,23 +107,30 @@ static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
 /* Sometimes 9th clock pulse isn't generated, and slave doesn't release
  * the bus, because it wants to send ACK.
  * Following sequence of enabling/disabling and sending start/stop generates
- * the 9 pulses, so it's all OK.
+ * the 9 pulses, each with a START then ending with STOP, so it's all OK.
  */
 static void mpc_i2c_fixup(struct mpc_i2c *i2c)
 {
 	int k;
-	u32 delay_val = 1000000 / i2c->real_clk + 1;
-
-	if (delay_val < 2)
-		delay_val = 2;
+	unsigned long flags;
 
 	for (k = 9; k; k--) {
 		writeccr(i2c, 0);
-		writeccr(i2c, CCR_MSTA | CCR_MTX | CCR_MEN);
+		writeb(0, i2c->base + MPC_I2C_SR); /* clear any status bits */
+		writeccr(i2c, CCR_MEN | CCR_MSTA); /* START */
+		readb(i2c->base + MPC_I2C_DR); /* init xfer */
+		udelay(15); /* let it hit the bus */
+		local_irq_save(flags); /* should not be delayed further */
+		writeccr(i2c, CCR_MEN | CCR_MSTA | CCR_RSTA); /* delay SDA */
 		readb(i2c->base + MPC_I2C_DR);
-		writeccr(i2c, CCR_MEN);
-		udelay(delay_val << 1);
+		if (k != 1)
+			udelay(5);
+		local_irq_restore(flags);
 	}
+	writeccr(i2c, CCR_MEN); /* Initiate STOP */
+	readb(i2c->base + MPC_I2C_DR);
+	udelay(15); /* Let STOP propagate */
+	writeccr(i2c, 0);
 }
 
 static int i2c_wait(struct mpc_i2c *i2c, unsigned timeout, int writing)
-- 
2.34.1

