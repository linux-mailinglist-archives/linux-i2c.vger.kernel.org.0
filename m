Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE85D2ACD58
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Nov 2020 05:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732134AbgKJEB1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Nov 2020 23:01:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:57032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733221AbgKJDzg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Nov 2020 22:55:36 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CC2220731;
        Tue, 10 Nov 2020 03:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604980535;
        bh=wRygLvCtjXO9zyXTuPCpxEht8iiV7VqpMAv+S81UJiI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=w+7ts3kb/lSx84/W146iSYhU8tlRvTvH5bQ+Kno/D0Ao5t6RJjLDpiTiVimXbMqeR
         H7oTYtrhgtEHxQwnrZ8Xi12OdXrj4YvJfmtA2UICL7ONBe7mI4dYd1Boen2h5Mjz5a
         vHsmpxg5YLzHhdak1LQOvctcPGtosQ6qWRvKIjng=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@kernel.org>, Sasha Levin <sashal@kernel.org>,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 5.4 39/42] i2c: sh_mobile: implement atomic transfers
Date:   Mon,  9 Nov 2020 22:54:37 -0500
Message-Id: <20201110035440.424258-39-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110035440.424258-1-sashal@kernel.org>
References: <20201110035440.424258-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Ulrich Hecht <uli+renesas@fpond.eu>

[ Upstream commit a49cc1fe9d64a2dc4e19b599204f403e5d25f44b ]

Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
similar boards.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
[wsa: some whitespace fixing]
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 86 +++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 8777af4c695e9..d5dd58c27ce5f 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -129,6 +129,7 @@ struct sh_mobile_i2c_data {
 	int sr;
 	bool send_stop;
 	bool stop_after_dma;
+	bool atomic_xfer;
 
 	struct resource *res;
 	struct dma_chan *dma_tx;
@@ -333,13 +334,15 @@ static unsigned char i2c_op(struct sh_mobile_i2c_data *pd, enum sh_mobile_i2c_op
 		ret = iic_rd(pd, ICDR);
 		break;
 	case OP_RX_STOP: /* enable DTE interrupt, issue stop */
-		iic_wr(pd, ICIC,
-		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+		if (!pd->atomic_xfer)
+			iic_wr(pd, ICIC,
+			       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_RACK);
 		break;
 	case OP_RX_STOP_DATA: /* enable DTE interrupt, read data, issue stop */
-		iic_wr(pd, ICIC,
-		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+		if (!pd->atomic_xfer)
+			iic_wr(pd, ICIC,
+			       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 		ret = iic_rd(pd, ICDR);
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_RACK);
 		break;
@@ -435,7 +438,8 @@ static irqreturn_t sh_mobile_i2c_isr(int irq, void *dev_id)
 
 	if (wakeup) {
 		pd->sr |= SW_DONE;
-		wake_up(&pd->wait);
+		if (!pd->atomic_xfer)
+			wake_up(&pd->wait);
 	}
 
 	/* defeat write posting to avoid spurious WAIT interrupts */
@@ -587,6 +591,9 @@ static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
 	pd->pos = -1;
 	pd->sr = 0;
 
+	if (pd->atomic_xfer)
+		return;
+
 	pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
 	if (pd->dma_buf)
 		sh_mobile_i2c_xfer_dma(pd);
@@ -643,15 +650,13 @@ static int poll_busy(struct sh_mobile_i2c_data *pd)
 	return i ? 0 : -ETIMEDOUT;
 }
 
-static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
-			      struct i2c_msg *msgs,
-			      int num)
+static int sh_mobile_xfer(struct sh_mobile_i2c_data *pd,
+			 struct i2c_msg *msgs, int num)
 {
-	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
 	struct i2c_msg	*msg;
 	int err = 0;
 	int i;
-	long timeout;
+	long time_left;
 
 	/* Wake up device and enable clock */
 	pm_runtime_get_sync(pd->dev);
@@ -668,15 +673,35 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 		if (do_start)
 			i2c_op(pd, OP_START);
 
-		/* The interrupt handler takes care of the rest... */
-		timeout = wait_event_timeout(pd->wait,
-				       pd->sr & (ICSR_TACK | SW_DONE),
-				       adapter->timeout);
-
-		/* 'stop_after_dma' tells if DMA transfer was complete */
-		i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg, pd->stop_after_dma);
+		if (pd->atomic_xfer) {
+			unsigned long j = jiffies + pd->adap.timeout;
+
+			time_left = time_before_eq(jiffies, j);
+			while (time_left &&
+			       !(pd->sr & (ICSR_TACK | SW_DONE))) {
+				unsigned char sr = iic_rd(pd, ICSR);
+
+				if (sr & (ICSR_AL   | ICSR_TACK |
+					  ICSR_WAIT | ICSR_DTE)) {
+					sh_mobile_i2c_isr(0, pd);
+					udelay(150);
+				} else {
+					cpu_relax();
+				}
+				time_left = time_before_eq(jiffies, j);
+			}
+		} else {
+			/* The interrupt handler takes care of the rest... */
+			time_left = wait_event_timeout(pd->wait,
+					pd->sr & (ICSR_TACK | SW_DONE),
+					pd->adap.timeout);
+
+			/* 'stop_after_dma' tells if DMA xfer was complete */
+			i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg,
+						 pd->stop_after_dma);
+		}
 
-		if (!timeout) {
+		if (!time_left) {
 			dev_err(pd->dev, "Transfer request timed out\n");
 			if (pd->dma_direction != DMA_NONE)
 				sh_mobile_i2c_cleanup_dma(pd);
@@ -702,14 +727,35 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 	return err ?: num;
 }
 
+static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
+			      struct i2c_msg *msgs,
+			      int num)
+{
+	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
+
+	pd->atomic_xfer = false;
+	return sh_mobile_xfer(pd, msgs, num);
+}
+
+static int sh_mobile_i2c_xfer_atomic(struct i2c_adapter *adapter,
+				     struct i2c_msg *msgs,
+				     int num)
+{
+	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
+
+	pd->atomic_xfer = true;
+	return sh_mobile_xfer(pd, msgs, num);
+}
+
 static u32 sh_mobile_i2c_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
 }
 
 static const struct i2c_algorithm sh_mobile_i2c_algorithm = {
-	.functionality	= sh_mobile_i2c_func,
-	.master_xfer	= sh_mobile_i2c_xfer,
+	.functionality = sh_mobile_i2c_func,
+	.master_xfer = sh_mobile_i2c_xfer,
+	.master_xfer_atomic = sh_mobile_i2c_xfer_atomic,
 };
 
 static const struct i2c_adapter_quirks sh_mobile_i2c_quirks = {
-- 
2.27.0

