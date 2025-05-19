Return-Path: <linux-i2c+bounces-11025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3EABC011
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 036CA1713F9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4382427FB2D;
	Mon, 19 May 2025 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="XjDScKpv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C83A27CCE1;
	Mon, 19 May 2025 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663178; cv=none; b=P8OAqpnPn6UKP3hT664EP5oiNqIUhrGHvpRQHoNyY06dXgVZ19E61MRmzpzYTqD2hnuDDeC5rkb5bEZaK6CMjdefqFq9jo6PrSfyNOew2WOC14WOHAPXp1nR5XJ+4SKxDp/TOHPxTw+FVHcaBszWSNYtIOjdkjIdUdSS1EZb+vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663178; c=relaxed/simple;
	bh=Ci2x5lBu41ON0jAomaOJbXBpPx1IiHNmeZitXPPWTII=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UJRVHVWuwckWITvNIZdbcE3IsrF2H8Ll9WrswpBUMkv7fqRAxBGaLn+2VOiBINHUo7Nsg9qoBmMGbFZasbFSQRSvGn61eH5OmS4EFnWMq7pyEnA2zrgjgQu+eTqc+gwPD09WFk+Yqk4azlHfvZ+klVbdLGi3DKKyEnXdEOHJRxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=XjDScKpv; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 12B5E1FC0D;
	Mon, 19 May 2025 15:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747663165;
	bh=mKKODQLSUtl6+gyZcJhx/atMe4RMloWQ8lH63taaqFg=; h=From:To:Subject;
	b=XjDScKpvF/UWdRLKw0pI1Qr8uiQYIf88ImPS07Gj/alwwUEagpDN1+nl6VypFsntx
	 5Srf3d8PAiZBCRfvtD4qr9PzSPm+PqABbtgwMpTpDsO10MwtcAPU27JqhOWRkQvMMm
	 aD2/dSu5nPoE9zNzVdhhnwcTbiOx+jgIu85vngjG+WXESLbmtw73ZSAx/Yw1ZOvS/o
	 lek9NuVNVOS0+t+tUEnjHtQhEeqmNJGLfgqBQNVh/C37JvPnHw01r2CtfJduap8J4r
	 vxez4gZoWYOuGPCIafF9ACoO7bnmW6pHcZLxQAoEYWQu2kZPg6s6iPAVBUtCywKytE
	 WHucKvhDVWvYw==
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v3] i2c: lpi2c: implement master_xfer_atomic callback
Date: Mon, 19 May 2025 15:59:19 +0200
Message-Id: <20250519135919.32046-1-francesco@dolcini.it>
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
Reviewed-by: Carlos Song <carlos.song@nxp.com>
---
v2 -> v3
 - Closes: https://lore.kernel.org/oe-kbuild-all/202505130735.zh3WuTNu-lkp@intel.com/. Using the return value of
   lpi2c_imx_read_msr_poll_timeout() to check for errors.

v1 -> v2
 - Rename READL_POLL_TIMEOUT to lpi2c_imx_read_msr_poll_timeout
 - Remove addr and timeout_us parameters from lpi2c_imx_read_msr_poll_timeout since they are used always with the same value
 - add r-b tag from Carlos Song
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 260 +++++++++++++++++++----------
 1 file changed, 175 insertions(+), 85 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 342d47e67586..20eae1842f19 100644
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
@@ -187,36 +188,38 @@ struct lpi2c_imx_struct {
 	struct i2c_client	*target;
 };
 
+#define lpi2c_imx_read_msr_poll_timeout(atomic, val, cond, delay_us)          \
+	(atomic ? readl_poll_timeout_atomic(lpi2c_imx->base + LPI2C_MSR, val, \
+					    cond, delay_us, 500000) :         \
+		  readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val, cond,  \
+				     delay_us, 500000))
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
+	int ret;
 	unsigned int temp;
 
-	while (1) {
-		temp = readl(lpi2c_imx->base + LPI2C_MSR);
-
-		/* check for arbitration lost, clear if set */
-		if (temp & MSR_ALF) {
-			writel(temp, lpi2c_imx->base + LPI2C_MSR);
-			return -EAGAIN;
-		}
+	ret = lpi2c_imx_read_msr_poll_timeout(atomic, temp,
+					      temp & (MSR_ALF | MSR_BBF | MSR_MBF), 1);
 
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
+	if (ret) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "bus not work\n");
+		if (lpi2c_imx->adapter.bus_recovery_info)
+			i2c_recover_bus(&lpi2c_imx->adapter);
+		return -ETIMEDOUT;
 	}
 
 	return 0;
@@ -242,7 +245,7 @@ static void lpi2c_imx_set_mode(struct lpi2c_imx_struct *lpi2c_imx)
 }
 
 static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
-			   struct i2c_msg *msgs)
+			   struct i2c_msg *msgs, bool atomic)
 {
 	unsigned int temp;
 
@@ -254,30 +257,23 @@ static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
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
+	int ret;
 
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
+	ret = lpi2c_imx_read_msr_poll_timeout(atomic, temp, temp & MSR_SDF, 1);
 
-	} while (1);
+	if (ret) {
+		dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
+		if (lpi2c_imx->adapter.bus_recovery_info)
+			i2c_recover_bus(&lpi2c_imx->adapter);
+	}
 }
 
 /* CLKLO = I2C_CLK_RATIO * CLKHI, SETHOLD = CLKHI, DATAVD = CLKHI/2 */
@@ -391,28 +387,30 @@ static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
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
+	err = lpi2c_imx_read_msr_poll_timeout(atomic, temp,
+					      (temp & MSR_NDF) || !txfifo_cnt(lpi2c_imx), 1);
 
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
@@ -436,7 +434,7 @@ static void lpi2c_imx_set_rx_watermark(struct lpi2c_imx_struct *lpi2c_imx)
 	writel(temp << 16, lpi2c_imx->base + LPI2C_MFCR);
 }
 
-static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
+static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
 	unsigned int data, txcnt;
 
@@ -451,13 +449,19 @@ static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
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
@@ -482,8 +486,9 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
 
 	if (!remaining) {
-		complete(&lpi2c_imx->complete);
-		return;
+		if (!atomic)
+			complete(&lpi2c_imx->complete);
+		return true;
 	}
 
 	/* not finished, still waiting for rx data */
@@ -501,7 +506,10 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
 	}
 
-	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
+	if (!atomic)
+		lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
+
+	return false;
 }
 
 static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
@@ -509,11 +517,29 @@ static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
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
+	err = lpi2c_imx_read_msr_poll_timeout(true, temp,
+					      (temp & MSR_NDF) ||
+					      lpi2c_imx_write_txfifo(lpi2c_imx, true), 5);
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
 
@@ -524,8 +550,43 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
 	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
 	temp |= (RECV_DATA << 8);
 	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+}
 
-	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
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
+
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
@@ -545,14 +606,27 @@ static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
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
@@ -947,8 +1021,8 @@ static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
 	return ret;
 }
 
-static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
-			  struct i2c_msg *msgs, int num)
+static int lpi2c_imx_xfer_common(struct i2c_adapter *adapter,
+				 struct i2c_msg *msgs, int num, bool atomic)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(adapter);
 	unsigned int temp;
@@ -959,7 +1033,7 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		return result;
 
 	for (i = 0; i < num; i++) {
-		result = lpi2c_imx_start(lpi2c_imx, &msgs[i]);
+		result = lpi2c_imx_start(lpi2c_imx, &msgs[i], atomic);
 		if (result)
 			goto disable;
 
@@ -971,28 +1045,33 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
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
@@ -1008,6 +1087,16 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
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
@@ -1070,9 +1159,9 @@ static irqreturn_t lpi2c_imx_master_isr(struct lpi2c_imx_struct *lpi2c_imx)
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
@@ -1268,10 +1357,11 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
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


