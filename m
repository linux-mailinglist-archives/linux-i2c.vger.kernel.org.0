Return-Path: <linux-i2c+bounces-9916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F45A69282
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 16:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5DB31BA21CA
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 14:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B151DEFD7;
	Wed, 19 Mar 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="LZzfAT/9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63D16BE3A;
	Wed, 19 Mar 2025 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395885; cv=none; b=onxin4TBvOoKQWMTBCd1LX3hpuG0z4bbOApoUSMEA7DgEGeMr3eHpSntv+//7BTwyRDiWm2Uw5fZHBA0URlKUBsKqDZeIO9L4Xe1CwY7inB33XuxQW9usaj/48A7lawyTp99S7D8mtQYkctaNRQjA1nuUeaq3BUrVv3CdXAAIwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395885; c=relaxed/simple;
	bh=n7oVDuvEeaVu8MMqISFYxosA7NlwRoVEaeHVi1mYljk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KTingi3hP/XvxpMO56M3Bf4RMy8Rk3WhMytbbVp7ScYxuzV0cKjL5LGr7BiZp5K4wSQqqxb3O2ISkG87UJKH4NaF+x50bFaV3t61MN6UPGmdNMv+NBu+M/sVEs/phcr73aGhJ8DcElY6dkIsEGERTprGeFFywYmsC4pGDpACH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=LZzfAT/9; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id DD9281FB3E;
	Wed, 19 Mar 2025 15:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1742395879;
	bh=muD7WnQZSANKgQGPUSyfQvJo1xk+BwCaj3JqhwmPV+Y=; h=From:To:Subject;
	b=LZzfAT/9VaCPgfKJlGn/gj3rtJmsI+TaiCouE5e1MQs/fFAPvWDmicYeiq37vieod
	 sPaO1PE07wi8tyG75iz2l+I4WSryix7jEhbohMNW1p8vV5qyMrIOskEGj9yMRldFgZ
	 fRq+iKlVdLrHSj78raocsYDt9cpLltB4bEja9SOGHAsUciLw09SJYICPODlZC5Mc+l
	 2LltMR6GQDEsZizTpjtJjwM89pRs6PydYqkla1Q1555e7TBY1UrZKk+Pqbogg/5pDJ
	 4C8+PbglJYRb6xtlSWz7mXGnEOyQ1pmtalXJP4BDLXZyZu+tisWxZGT6YLhbiodZ0T
	 kLutAaDMSFGog==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Date: Wed, 19 Mar 2025 15:51:14 +0100
Message-Id: <20250319145114.50771-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Rework the read and write code paths in the driver to support operation
in atomic contexts. To achieve this, the driver must not rely on IRQs
or perform any scheduling, e.g., via a sleep or schedule routine. Even
jiffies do not advance in atomic contexts, so timeouts based on them
are substituted with delays.

Implement atomic, sleep-free, and IRQ-less operation. This increases
complexity but is necessary for atomic I2C transfers required by some
hardware configurations, e.g., to trigger reboots on an external PMIC chip.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 258 +++++++++++++++++++----------
 1 file changed, 173 insertions(+), 85 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 0d4b3935e687..f34b6f07e9a4 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -187,36 +188,35 @@ struct lpi2c_imx_struct {
 	struct i2c_client	*target;
 };
 
+#define READL_POLL_TIMEOUT(atomic, addr, val, cond, delay_us, timeout_us) \
+	(atomic ? readl_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) : \
+		  readl_poll_timeout(addr, val, cond, delay_us, timeout_us))
+
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
 			      unsigned int enable)
 {
 	writel(enable, lpi2c_imx->base + LPI2C_MIER);
 }
 
-static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
-	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
 
-	while (1) {
-		temp = readl(lpi2c_imx->base + LPI2C_MSR);
+	READL_POLL_TIMEOUT(atomic, lpi2c_imx->base + LPI2C_MSR, temp,
+			   temp & (MSR_ALF | MSR_BBF | MSR_MBF), 1, 500000);
 
-		/* check for arbitration lost, clear if set */
-		if (temp & MSR_ALF) {
-			writel(temp, lpi2c_imx->base + LPI2C_MSR);
-			return -EAGAIN;
-		}
-
-		if (temp & (MSR_BBF | MSR_MBF))
-			break;
+	/* check for arbitration lost, clear if set */
+	if (temp & MSR_ALF) {
+		writel(temp, lpi2c_imx->base + LPI2C_MSR);
+		return -EAGAIN;
+	}
 
-		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
-			dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
-			if (lpi2c_imx->adapter.bus_recovery_info)
-				i2c_recover_bus(&lpi2c_imx->adapter);
-			return -ETIMEDOUT;
-		}
-		schedule();
+	/* check for bus not busy */
+	if (!(temp & (MSR_BBF | MSR_MBF))) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
+		if (lpi2c_imx->adapter.bus_recovery_info)
+			i2c_recover_bus(&lpi2c_imx->adapter);
+		return -ETIMEDOUT;
 	}
 
 	return 0;
@@ -242,7 +242,7 @@ static void lpi2c_imx_set_mode(struct lpi2c_imx_struct *lpi2c_imx)
 }
 
 static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
-			   struct i2c_msg *msgs)
+			   struct i2c_msg *msgs, bool atomic)
 {
 	unsigned int temp;
 
@@ -254,30 +254,23 @@ static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
 	temp = i2c_8bit_addr_from_msg(msgs) | (GEN_START << 8);
 	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
 
-	return lpi2c_imx_bus_busy(lpi2c_imx);
+	return lpi2c_imx_bus_busy(lpi2c_imx, atomic);
 }
 
-static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
+static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
-	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
 
 	writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
 
-	do {
-		temp = readl(lpi2c_imx->base + LPI2C_MSR);
-		if (temp & MSR_SDF)
-			break;
-
-		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
-			dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
-			if (lpi2c_imx->adapter.bus_recovery_info)
-				i2c_recover_bus(&lpi2c_imx->adapter);
-			break;
-		}
-		schedule();
+	READL_POLL_TIMEOUT(atomic, lpi2c_imx->base + LPI2C_MSR, temp,
+			   temp & MSR_SDF, 1, 500000);
 
-	} while (1);
+	if (!(temp & MSR_SDF)) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
+		if (lpi2c_imx->adapter.bus_recovery_info)
+			i2c_recover_bus(&lpi2c_imx->adapter);
+	}
 }
 
 /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
@@ -391,28 +384,31 @@ static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 	return time_left ? 0 : -ETIMEDOUT;
 }
 
-static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
+static u32 txfifo_cnt(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	unsigned long orig_jiffies = jiffies;
-	u32 txcnt;
+	return readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff;
+}
 
-	do {
-		txcnt = readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff;
+static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
+{
+	unsigned int temp;
+	int err;
 
-		if (readl(lpi2c_imx->base + LPI2C_MSR) & MSR_NDF) {
-			dev_dbg(&lpi2c_imx->adapter.dev, "NDF detected\n");
-			return -EIO;
-		}
+	err = READL_POLL_TIMEOUT(atomic, lpi2c_imx->base + LPI2C_MSR, temp,
+				 (temp & MSR_NDF) || !txfifo_cnt(lpi2c_imx),
+				 1, 500000);
 
-		if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(500))) {
-			dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
-			if (lpi2c_imx->adapter.bus_recovery_info)
-				i2c_recover_bus(&lpi2c_imx->adapter);
-			return -ETIMEDOUT;
-		}
-		schedule();
+	if (temp & MSR_NDF) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "NDF detected\n");
+		return -EIO;
+	}
 
-	} while (txcnt);
+	if (err) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
+		if (lpi2c_imx->adapter.bus_recovery_info)
+			i2c_recover_bus(&lpi2c_imx->adapter);
+		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
@@ -436,7 +432,7 @@ static void lpi2c_imx_set_rx_watermark(struct lpi2c_imx_struct *lpi2c_imx)
 	writel(temp << 16, lpi2c_imx->base + LPI2C_MFCR);
 }
 
-static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
+static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
 	unsigned int data, txcnt;
 
@@ -451,13 +447,19 @@ static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
 		txcnt++;
 	}
 
-	if (lpi2c_imx->delivered < lpi2c_imx->msglen)
-		lpi2c_imx_intctrl(lpi2c_imx, MIER_TDIE | MIER_NDIE);
-	else
+	if (lpi2c_imx->delivered < lpi2c_imx->msglen) {
+		if (!atomic)
+			lpi2c_imx_intctrl(lpi2c_imx, MIER_TDIE | MIER_NDIE);
+		return false;
+	}
+
+	if (!atomic)
 		complete(&lpi2c_imx->complete);
+
+	return true;
 }
 
-static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
+static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
 	unsigned int blocklen, remaining;
 	unsigned int temp, data;
@@ -482,8 +484,9 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
 
 	if (!remaining) {
-		complete(&lpi2c_imx->complete);
-		return;
+		if (!atomic)
+			complete(&lpi2c_imx->complete);
+		return true;
 	}
 
 	/* not finished, still waiting for rx data */
@@ -501,7 +504,10 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
 	}
 
-	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
+	if (!atomic)
+		lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
+
+	return false;
 }
 
 static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
@@ -509,11 +515,29 @@ static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
 {
 	lpi2c_imx->tx_buf = msgs->buf;
 	lpi2c_imx_set_tx_watermark(lpi2c_imx);
-	lpi2c_imx_write_txfifo(lpi2c_imx);
+	lpi2c_imx_write_txfifo(lpi2c_imx, false);
 }
 
-static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
-			   struct i2c_msg *msgs)
+static int lpi2c_imx_write_atomic(struct lpi2c_imx_struct *lpi2c_imx,
+				  struct i2c_msg *msgs)
+{
+	u32 temp;
+	int err;
+
+	lpi2c_imx->tx_buf = msgs->buf;
+
+	err = READL_POLL_TIMEOUT(true, lpi2c_imx->base + LPI2C_MSR, temp,
+				 (temp & MSR_NDF) || lpi2c_imx_write_txfifo(lpi2c_imx, true),
+				 5, 1000000);
+
+	if (temp & MSR_NDF)
+		return -EIO;
+
+	return err;
+}
+
+static void lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
+				struct i2c_msg *msgs)
 {
 	unsigned int temp;
 
@@ -524,8 +548,43 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
 	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
 	temp |= (RECV_DATA << 8);
 	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+}
+
+static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	u32 rxcnt;
+
+	rxcnt = (readl(lpi2c_imx->base + LPI2C_MFSR) >> 16) & 0xFF;
+	if (!rxcnt)
+		return false;
+
+	if (!lpi2c_imx_read_rxfifo(lpi2c_imx, true))
+		return false;
 
-	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
+	return true;
+}
+
+static int lpi2c_imx_read_atomic(struct lpi2c_imx_struct *lpi2c_imx,
+				 struct i2c_msg *msgs)
+{
+	u32 temp;
+	int tmo_us;
+
+	tmo_us = 1000000;
+	do {
+		if (lpi2c_imx_read_chunk_atomic(lpi2c_imx))
+			return 0;
+
+		temp = readl(lpi2c_imx->base + LPI2C_MSR);
+
+		if (temp & MSR_NDF)
+			return -EIO;
+
+		udelay(100);
+		tmo_us -= 100;
+	} while (tmo_us > 0);
+
+	return -ETIMEDOUT;
 }
 
 static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
@@ -545,14 +604,27 @@ static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
 {
 	reinit_completion(&lpi2c_imx->complete);
 
-	if (msg->flags & I2C_M_RD)
-		lpi2c_imx_read(lpi2c_imx, msg);
-	else
+	if (msg->flags & I2C_M_RD) {
+		lpi2c_imx_read_init(lpi2c_imx, msg);
+		lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
+	} else {
 		lpi2c_imx_write(lpi2c_imx, msg);
+	}
 
 	return lpi2c_imx_pio_msg_complete(lpi2c_imx);
 }
 
+static int lpi2c_imx_pio_xfer_atomic(struct lpi2c_imx_struct *lpi2c_imx,
+				     struct i2c_msg *msg)
+{
+	if (msg->flags & I2C_M_RD) {
+		lpi2c_imx_read_init(lpi2c_imx, msg);
+		return lpi2c_imx_read_atomic(lpi2c_imx, msg);
+	}
+
+	return lpi2c_imx_write_atomic(lpi2c_imx, msg);
+}
+
 static int lpi2c_imx_dma_timeout_calculate(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned long time = 0;
@@ -947,8 +1019,8 @@ static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
 	return ret;
 }
 
-static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
-			  struct i2c_msg *msgs, int num)
+static int lpi2c_imx_xfer_common(struct i2c_adapter *adapter,
+				 struct i2c_msg *msgs, int num, bool atomic)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(adapter);
 	unsigned int temp;
@@ -959,7 +1031,7 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		return result;
 
 	for (i = 0; i < num; i++) {
-		result = lpi2c_imx_start(lpi2c_imx, &msgs[i]);
+		result = lpi2c_imx_start(lpi2c_imx, &msgs[i], atomic);
 		if (result)
 			goto disable;
 
@@ -971,28 +1043,33 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		lpi2c_imx->tx_buf = NULL;
 		lpi2c_imx->delivered = 0;
 		lpi2c_imx->msglen = msgs[i].len;
-		init_completion(&lpi2c_imx->complete);
 
-		if (is_use_dma(lpi2c_imx, &msgs[i])) {
-			result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
-			if (result && lpi2c_imx->dma->using_pio_mode)
-				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+		if (atomic) {
+			result = lpi2c_imx_pio_xfer_atomic(lpi2c_imx, &msgs[i]);
 		} else {
-			result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+			init_completion(&lpi2c_imx->complete);
+
+			if (is_use_dma(lpi2c_imx, &msgs[i])) {
+				result = lpi2c_imx_dma_xfer(lpi2c_imx, &msgs[i]);
+				if (result && lpi2c_imx->dma->using_pio_mode)
+					result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+			} else {
+				result = lpi2c_imx_pio_xfer(lpi2c_imx, &msgs[i]);
+			}
 		}
 
 		if (result)
 			goto stop;
 
 		if (!(msgs[i].flags & I2C_M_RD)) {
-			result = lpi2c_imx_txfifo_empty(lpi2c_imx);
+			result = lpi2c_imx_txfifo_empty(lpi2c_imx, atomic);
 			if (result)
 				goto stop;
 		}
 	}
 
 stop:
-	lpi2c_imx_stop(lpi2c_imx);
+	lpi2c_imx_stop(lpi2c_imx, atomic);
 
 	temp = readl(lpi2c_imx->base + LPI2C_MSR);
 	if ((temp & MSR_NDF) && !result)
@@ -1008,6 +1085,16 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 	return (result < 0) ? result : num;
 }
 
+static int lpi2c_imx_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
+{
+	return lpi2c_imx_xfer_common(adapter, msgs, num, false);
+}
+
+static int lpi2c_imx_xfer_atomic(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
+{
+	return lpi2c_imx_xfer_common(adapter, msgs, num, true);
+}
+
 static irqreturn_t lpi2c_imx_target_isr(struct lpi2c_imx_struct *lpi2c_imx,
 					u32 ssr, u32 sier_filter)
 {
@@ -1070,9 +1157,9 @@ static irqreturn_t lpi2c_imx_master_isr(struct lpi2c_imx_struct *lpi2c_imx)
 	if (temp & MSR_NDF)
 		complete(&lpi2c_imx->complete);
 	else if (temp & MSR_RDF)
-		lpi2c_imx_read_rxfifo(lpi2c_imx);
+		lpi2c_imx_read_rxfifo(lpi2c_imx, false);
 	else if (temp & MSR_TDF)
-		lpi2c_imx_write_txfifo(lpi2c_imx);
+		lpi2c_imx_write_txfifo(lpi2c_imx, false);
 
 	return IRQ_HANDLED;
 }
@@ -1268,10 +1355,11 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm lpi2c_imx_algo = {
-	.master_xfer	= lpi2c_imx_xfer,
-	.functionality	= lpi2c_imx_func,
-	.reg_target	= lpi2c_imx_register_target,
-	.unreg_target	= lpi2c_imx_unregister_target,
+	.master_xfer		= lpi2c_imx_xfer,
+	.master_xfer_atomic	= lpi2c_imx_xfer_atomic,
+	.functionality		= lpi2c_imx_func,
+	.reg_target		= lpi2c_imx_register_target,
+	.unreg_target		= lpi2c_imx_unregister_target,
 };
 
 static const struct of_device_id lpi2c_imx_of_match[] = {
-- 
2.39.5


