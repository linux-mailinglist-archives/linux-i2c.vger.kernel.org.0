Return-Path: <linux-i2c+bounces-11124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1884AC1EA8
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 10:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DADB79E3D2C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 08:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E8D28A700;
	Fri, 23 May 2025 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Aa4S412n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA6289349;
	Fri, 23 May 2025 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988985; cv=none; b=dl1Vddxmr8dEgqj+ZWRfNpg4jaeLNiUEitOEGmhCIqhalHhsbPyLByEZiU2xDPWCZ1xtHUnyExZSrHrs89hmOfnNpJrCWoaEOtSR0mHKtwtSGGWFwzRSA8fvyZVFSRmEfYf3J3DHUqCm1GwipxdzclWGaPSGP/lqlDlLJQ6nTBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988985; c=relaxed/simple;
	bh=RYiWCNde4WdL1jZQ10n27Knj2Xzgj3hG4LPJMizSe0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XbcErh+UoPat5OK5Gi1o9jsSNuEuTK5Q5SH6dUERf4uMB5/DMR5Wc7VZey8TUkp/+NfcpaHBLILKLbK4AzFZnOGeLSsNq/0A9r+xYlNxZdakHUnTukHpxL6LQ9N8Z3X2TYwuD9bheWd4vrRciQSBga0vvQSGa4snYWjrLOwmdbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Aa4S412n; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 47F2C1F9DF;
	Fri, 23 May 2025 10:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747988980;
	bh=rMmsCMUAH+eej6NhODppzkzW6QcTqFDLUA/B/IzWvx0=; h=From:To:Subject;
	b=Aa4S412nPHjsEsR92ES7teEMTNDZy38P3V4cV+iNNDK/GFG+sGPlxsq6D7gKMlPMX
	 jgTVVwHDFSWSgls3TdhSbh4XvycvbpGJ13y5sLHVBnB4VrJAuLAQqrL/QKI0NIndSG
	 vySC7TDLOJOv+prGNrOBozq1MydXCzwDjk3onbAW4eYoBqkpR7dZ8KeSShBvUFur0V
	 LjYFM2QVlr5bkPG+z9Zj5XFTTuSvSl9IS2AXrJw0wUFyjSdDw+Ds/MlQ86+6gBJo5R
	 P3yZ4l/e1OqERJdFd7g1Xebo8cUAmx34i8QprAN+14NwJSx8Zj2ipuDwFzZckAg8WS
	 S1SXkUD0PrrlQ==
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
Subject: [PATCH v4 2/2] i2c: lpi2c: implement master_xfer_atomic callback
Date: Fri, 23 May 2025 10:29:31 +0200
Message-Id: <20250523082931.23170-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250523082931.23170-1-francesco@dolcini.it>
References: <20250523082931.23170-1-francesco@dolcini.it>
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
or perform any scheduling, e.g., via a sleep or schedule routine.

Implement atomic, sleep-free, and IRQ-less operation. This increases
complexity but is necessary for atomic I2C transfers required by some
hardware configurations, e.g., to trigger reboots on an external PMIC chip.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Carlos Song <carlos.song@nxp.com>
---
v3 -> v4
- Split the patch into two parts: one for the readl_poll_timeout() and one for the atomic implementation.
- Change the readl_poll_timeout() delay to 0 us to do not change the behavior of the driver.
- Use err variable consistently.

v2 -> v3
- Closes: https://lore.kernel.org/oe-kbuild-all/202505130735.zh3WuTNu-lkp@intel.com/. Using the return value of
lpi2c_imx_read_msr_poll_timeout() to check for errors.

v1 -> v2
- Rename READL_POLL_TIMEOUT to lpi2c_imx_read_msr_poll_timeout
- Remove addr and timeout_us parameters from lpi2c_imx_read_msr_poll_timeout since they are used always with the same value
- add r-b tag from Carlos Song
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 178 ++++++++++++++++++++++-------
 1 file changed, 136 insertions(+), 42 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 91b0f4c2b924..afde8e06c23a 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -188,9 +188,11 @@ struct lpi2c_imx_struct {
 	struct i2c_client	*target;
 };
 
-#define lpi2c_imx_read_msr_poll_timeout(val, cond)                            \
+#define lpi2c_imx_read_msr_poll_timeout(atomic, val, cond)                    \
+	(atomic ? readl_poll_timeout_atomic(lpi2c_imx->base + LPI2C_MSR, val, \
+					    cond, 0, 500000) :                \
 		  readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val, cond,  \
-				     0, 500000)
+				     0, 500000))
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
 			      unsigned int enable)
@@ -198,12 +200,12 @@ static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
 	writel(enable, lpi2c_imx->base + LPI2C_MIER);
 }
 
-static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_bus_busy(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
 	int err;
 	unsigned int temp;
 
-	err = lpi2c_imx_read_msr_poll_timeout(temp,
+	err = lpi2c_imx_read_msr_poll_timeout(atomic, temp,
 					      temp & (MSR_ALF | MSR_BBF | MSR_MBF));
 
 	/* check for arbitration lost, clear if set */
@@ -248,7 +250,7 @@ static void lpi2c_imx_set_mode(struct lpi2c_imx_struct *lpi2c_imx)
 }
 
 static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
-			   struct i2c_msg *msgs)
+			   struct i2c_msg *msgs, bool atomic)
 {
 	unsigned int temp;
 
@@ -260,17 +262,17 @@ static int lpi2c_imx_start(struct lpi2c_imx_struct *lpi2c_imx,
 	temp = i2c_8bit_addr_from_msg(msgs) | (GEN_START << 8);
 	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
 
-	return lpi2c_imx_bus_busy(lpi2c_imx);
+	return lpi2c_imx_bus_busy(lpi2c_imx, atomic);
 }
 
-static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx)
+static void lpi2c_imx_stop(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
 	unsigned int temp;
 	int err;
 
 	writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
 
-	err = lpi2c_imx_read_msr_poll_timeout(temp, temp & MSR_SDF);
+	err = lpi2c_imx_read_msr_poll_timeout(atomic, temp, temp & MSR_SDF);
 
 	if (err) {
 		dev_dbg(&lpi2c_imx->adapter.dev, "stop timeout\n");
@@ -390,12 +392,12 @@ static int lpi2c_imx_pio_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 	return time_left ? 0 : -ETIMEDOUT;
 }
 
-static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
+static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
 	unsigned int temp;
 	int err;
 
-	err = lpi2c_imx_read_msr_poll_timeout(temp,
+	err = lpi2c_imx_read_msr_poll_timeout(atomic, temp,
 					      (temp & MSR_NDF) || !lpi2c_imx_txfifo_cnt(lpi2c_imx));
 
 	if (temp & MSR_NDF) {
@@ -432,7 +434,7 @@ static void lpi2c_imx_set_rx_watermark(struct lpi2c_imx_struct *lpi2c_imx)
 	writel(temp << 16, lpi2c_imx->base + LPI2C_MFCR);
 }
 
-static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
+static bool lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx, bool atomic)
 {
 	unsigned int data, txcnt;
 
@@ -447,13 +449,19 @@ static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
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
@@ -478,8 +486,9 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 	remaining = lpi2c_imx->msglen - lpi2c_imx->delivered;
 
 	if (!remaining) {
-		complete(&lpi2c_imx->complete);
-		return;
+		if (!atomic)
+			complete(&lpi2c_imx->complete);
+		return true;
 	}
 
 	/* not finished, still waiting for rx data */
@@ -497,7 +506,10 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
 	}
 
-	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
+	if (!atomic)
+		lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
+
+	return false;
 }
 
 static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
@@ -505,11 +517,29 @@ static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
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
+					      lpi2c_imx_write_txfifo(lpi2c_imx, true));
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
 
@@ -520,8 +550,43 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
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
@@ -541,14 +606,27 @@ static int lpi2c_imx_pio_xfer(struct lpi2c_imx_struct *lpi2c_imx,
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
@@ -943,8 +1021,8 @@ static int lpi2c_imx_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
 	return ret;
 }
 
-static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
-			  struct i2c_msg *msgs, int num)
+static int lpi2c_imx_xfer_common(struct i2c_adapter *adapter,
+				 struct i2c_msg *msgs, int num, bool atomic)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = i2c_get_adapdata(adapter);
 	unsigned int temp;
@@ -955,7 +1033,7 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		return result;
 
 	for (i = 0; i < num; i++) {
-		result = lpi2c_imx_start(lpi2c_imx, &msgs[i]);
+		result = lpi2c_imx_start(lpi2c_imx, &msgs[i], atomic);
 		if (result)
 			goto disable;
 
@@ -967,28 +1045,33 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
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
@@ -1004,6 +1087,16 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
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
@@ -1066,9 +1159,9 @@ static irqreturn_t lpi2c_imx_master_isr(struct lpi2c_imx_struct *lpi2c_imx)
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
@@ -1264,10 +1357,11 @@ static u32 lpi2c_imx_func(struct i2c_adapter *adapter)
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


