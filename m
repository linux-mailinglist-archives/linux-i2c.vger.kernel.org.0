Return-Path: <linux-i2c+bounces-13273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B2BA8121
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 08:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B3B03AC4DF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Sep 2025 06:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47791238C3A;
	Mon, 29 Sep 2025 06:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VAfAkAkh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26F239581;
	Mon, 29 Sep 2025 06:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759126186; cv=none; b=umbBKa3IExcU1LdaR7w7V6//h4HwImO4InD2Pgb/u6b0S5IIxb1aT2l10iQS2Erpn8DkDGUDC6Pmn/lDuQTr+QHirxQANzjugmhmjBIwuAL1rtKBkeqk30A0G//YO6pCdjfqj7N4rwQkTkbewk9d0UkkSoBapZlXidWu15gdQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759126186; c=relaxed/simple;
	bh=LRedx2Mi+lGLXKgAbBNj3ULKaNqUfQrWQ/nciTRLONo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e3Mk0QMRECAUcQwW1VICj9xZG5Oksz/StBg245tyAva6/jAPiyxBZsSOXV6Wm+T9F0G8+Ocry4WZfa5pX9CPwRhQcyaBpMtuuDFBZKDHFw0A3njLNubiLLh1wq8Fz48cCxl6wlIfo+bVgbJ0TR1tqmjimzIseWbg7HmsthBQTHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VAfAkAkh; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759126080;
	bh=rz29Ci/Ly5RO3EAXRxIrJ2NBDRGuPtphfU64i+yD/qU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=VAfAkAkhzhD5VOKDKKM7L+z99pzlAij0MhcqKv/JDWca0romr6s9HfEtQ1gCvb18u
	 iKcdTERX81PGMt9cpHFnolgHVmiPUXf0vbBnLvUMC7lw1YBzF0H743/jwuG86yLtsK
	 CAhX44UY9mLitEtsPt0Tx2fKJvjbo68CFfvcdJTM=
X-QQ-mid: zesmtpgz7t1759126072t7d6aa2ab
X-QQ-Originating-IP: QXQilT8k6Ocs6DZFQA8y5Veg/gNV0t06hT35lAM6Qmo=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Sep 2025 14:07:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16574500814613397744
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 29 Sep 2025 14:07:49 +0800
Subject: [PATCH v3] i2c: spacemit: introduce pio for k1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIADQi2mgC/23M0QqCMBiG4VuRHTfZv03TjrqP6GBtM39KJ5sNQ
 7z3pgSBdPh+8D0zCdajDeSUzcTbiAFdn0IcMqJb1d8tRZOacMYLVoGkD6DINVWj61DTBlTNtBF
 SlJKkz+Btg9PmXa6pWwyj8++Nj7CuX4kfd1IEyqgt6ptVjJuyYucn9q8pD4PStsMx164jKxn5j
 6l5sWd4YmRpNAgBoI36yyzL8gGmUzd8+gAAAA==
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759126070; l=12789;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=LRedx2Mi+lGLXKgAbBNj3ULKaNqUfQrWQ/nciTRLONo=;
 b=JNFpJO47vprkxqoiH0qSSwoDLjLB6L24h0zbrmLT+rVNxEU9pqw/6ICl+i5r2o/O7kiaphUrl
 9onb3mJXVH8CfIOuFjQxqXeiuM1wSjSxIItPtuuZF0LK17pSYo/hWkZ
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M/MM1vToFLXTDWFtv406SrEyLbtwOqKs6VgsENFPJ5P4ip5XtHOjuNJ9
	vDttPyKxkQEewx2PNA18d0FlyEEWsfX/cK4n0xhsdaDZBGkhWunieULQQF9TlahHj62/oVv
	RbV8E30qk2Ru6NAAvZfuj6mFHiB1Ao/lzd48l8m9srb26uo1ZaPp3+YSlIDzXSQUcaRRAbH
	CJEsd3yadB+jYLZCnBGeBcl1shn2+5aB1MTLtNT2Nk6PB108Iw3KBO0xiiORokF2XmQpfiE
	MLXURm6J3KqcX2HhbPnDK5NG/PM4wD2wBV9JuMMyetY4CK6sUABiFM0RUXW3YCD3/kCvJq7
	lkAv+zfI0/1Vmfenhdzj9Sudea7BlJnUImfXvCZ0uvTQ5s3C9iYKNU1ei4guhhxf8BhrSa7
	yUZJcXLiGegLUVFsCzIeMudEZOcQoYVg+IQQ3oqmlGgg+Wn/iUlk8kxdkLjuTgTIt+ShXkK
	rHlvhhdv/4oW+fQRAWrUO6M7kFxF2YnSZBHg5QfjTyrOmEmZ1VSB/I8InpP868Glo5eSxmP
	6hSNhGksBsSctBq3hj+AriZ6Z+8t3jly2KddSsTU0kDTPh6itwtJcelXR217T01RF+yiWvn
	RW5hI7q6Y8+6sF/QJ938lE5CT8Rk0up4DLiYANqtH/kEf3dSiyygT2BuiNaPM30ucJCpWJu
	jlBf6KSiIwEzJklH7X8YUqXKUrWe6rznHldBNlN/dFNPiXJ0zi9FwQH2vZLPnCXSy+TKYpo
	Vfxxa4Gang1fL0ygKkSsWOqL+teZSFC1JtQO7MzhjVq1XDQBBhwZ0rI2caqVR5yPjI4YgmU
	OmO2aArCFACuQKogEDRhY0XX1n09T2p81cQ8RmFEpVDpP5Sd5lNGTf0t+q2tJNZHwEt5hRm
	iwJBRo64+PnoTro7JHGtL3f7etAPFS+Bwkh0c5PaD5Gm+7etlcA6zXB4T0M1SSP3y/zBJLH
	jc04uZj4nLm87Y7Xo/O1S0+80tDyz99YSz9r1WEC8PmgbmpG7y03fnqeNjLilB8Glp4O3ob
	6Ddhjr9ZQ47s23nAnScQFkM2/B1Tt0QDkv9iT8wTgyhUHEZ7fQGW9kkF2f2jmcYu704uq2Y
	dI9JQzl7U3rdOdUXkK02X2OtyEJpF+UPD/Qk6wFv0W9rGaRXzYBGMx0vYw5M0ixonx43xZV
	uYXG
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C in atomic context.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v3:
- drop 1-5 patches (have been merged)
- modify commit message
- use readl_poll_timeout_atomic() in wait_pio_xfer()
- use msecs_to_jiffies() when get PIO mode timeout value
- factor out transfer state handling into spacemit_i2c_handle_state().
- do not disable/enable the controller IRQ around PIO transfers.
- consolidate spacemit_i2c_init() interrupt setup
- rename is_pio -> use_pio
- rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
- rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
- rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
- call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
- Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com

Changes in v2:
- Patch 1/6:
  Patch 3/6:
  Patch 4/6:
    - nothing
- Patch 2/6:
  - remove is_pio judgement in irq_handler()
- Patch 5/6:
  - fix wrong comment
  - In spacemit_i2c_conditionally_reset_bus(), once the condition is met inside the loop, it should
    return directly instead of using break.
- Patch 6/6:
  - add is_pio judgement in irq_handler()
  - use a fixed timeout value when PIO
  - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO

- Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
---
 drivers/i2c/busses/i2c-k1.c | 206 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 161 insertions(+), 45 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612e098b8ad17418f420d87c94df166..21c5dd56e71f5e59434767329fb84d50d5c04178 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -97,6 +97,9 @@
 
 #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
 
+/* Constants */
+#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
+
 enum spacemit_i2c_state {
 	SPACEMIT_STATE_IDLE,
 	SPACEMIT_STATE_START,
@@ -125,6 +128,7 @@ struct spacemit_i2c_dev {
 
 	enum spacemit_i2c_state state;
 	bool read;
+	bool use_pio;
 	struct completion complete;
 	u32 status;
 };
@@ -206,9 +210,14 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
 	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
 		return 0;
 
-	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
-				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
-				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+	if (!i2c->use_pio)
+		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
+					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
+					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+	else
+		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
+						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
+						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
 	if (ret)
 		spacemit_i2c_reset(i2c);
 
@@ -226,25 +235,30 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
 
 static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 {
-	u32 val;
-
-	/*
-	 * Unmask interrupt bits for all xfer mode:
-	 * bus error, arbitration loss detected.
-	 * For transaction complete signal, we use master stop
-	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
-	 */
-	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
-
-	/*
-	 * Unmask interrupt bits for interrupt xfer mode:
-	 * When IDBR receives a byte, an interrupt is triggered.
-	 *
-	 * For the tx empty interrupt, it will be enabled in the
-	 * i2c_start function.
-	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
-	 */
-	val |= SPACEMIT_CR_DRFIE;
+	u32 val = 0;
+
+	if (!i2c->use_pio) {
+		/*
+		 * Unmask interrupt bits for all xfer mode:
+		 * bus error, arbitration loss detected.
+		 * For transaction complete signal, we use master stop
+		 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
+		 */
+		val |= SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
+
+		/*
+		 * Unmask interrupt bits for interrupt xfer mode:
+		 * When IDBR receives a byte, an interrupt is triggered.
+		 *
+		 * For the tx empty interrupt, it will be enabled in the
+		 * i2c_start function.
+		 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
+		 */
+		val |= SPACEMIT_CR_DRFIE;
+
+		/* unmask master stop interrupt bit */
+		val |= SPACEMIT_CR_MSDIE;
+	}
 
 	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
 		val |= SPACEMIT_CR_MODE_FAST;
@@ -256,7 +270,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	val |= SPACEMIT_CR_SCLE;
 
 	/* enable master stop detected */
-	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
+	val |= SPACEMIT_CR_MSDE;
 
 	writel(val, i2c->base + SPACEMIT_ICR);
 
@@ -293,10 +307,62 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
 	/* send start pulse */
 	val = readl(i2c->base + SPACEMIT_ICR);
 	val &= ~SPACEMIT_CR_STOP;
-	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
+	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
+
+	if (!i2c->use_pio)
+		val |= SPACEMIT_CR_DTEIE;
+
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
+static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c);
+static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c);
+static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
+{
+	u32 msec = jiffies_to_msecs(i2c->adapt.timeout);
+	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
+	int ret;
+
+	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
+		udelay(10);
+		i2c->status = readl(i2c->base + SPACEMIT_ISR);
+
+		spacemit_i2c_clear_int_status(i2c, i2c->status);
+
+		if (!(i2c->status & SPACEMIT_SR_IRF) && !(i2c->status & SPACEMIT_SR_ITE))
+			continue;
+
+		spacemit_i2c_handle_state(i2c);
+
+		/*
+		 * This is the last byte to write of the current message.
+		 * If we do not wait here, control will proceed directly to start(),
+		 * which would overwrite the current data.
+		 */
+		if (!i2c->read && !i2c->unprocessed) {
+			ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
+							i2c->status, i2c->status & SPACEMIT_SR_ITE,
+							30, 1000);
+			if (ret)
+				return 0;
+			/*
+			 * In read mode, err_check() in handle_state properly handles what happens
+			 * after the MSD bit is set. For writes it is different: in interrupt mode,
+			 * an ITE (write-empty) interrupt is triggered after the last byte, and the
+			 * MSD-related handling takes place there. In PIO mode, however, we need to
+			 * explicitly call err_check() to emulate this step, otherwise the next
+			 * transfer will fail.
+			 */
+			spacemit_i2c_err_check(i2c);
+		}
+	}
+
+	if (i2c->unprocessed)
+		return 0;
+
+	return 1;
+}
+
 static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 {
 	unsigned long time_left;
@@ -310,10 +376,16 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 
 		reinit_completion(&i2c->complete);
 
-		spacemit_i2c_start(i2c);
+		if (i2c->use_pio) {
+			spacemit_i2c_start(i2c);
+
+			time_left = spacemit_i2c_wait_pio_xfer(i2c);
+		} else {
+			spacemit_i2c_start(i2c);
+			time_left = wait_for_completion_timeout(&i2c->complete,
+								i2c->adapt.timeout);
+		}
 
-		time_left = wait_for_completion_timeout(&i2c->complete,
-							i2c->adapt.timeout);
 		if (!time_left) {
 			dev_err(i2c->dev, "msg completion timeout\n");
 			spacemit_i2c_conditionally_reset_bus(i2c);
@@ -341,6 +413,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
 
 static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 {
+	if (!(i2c->status & SPACEMIT_SR_ITE))
+		return;
+
 	/* if transfer completes, SPACEMIT_ISR will handle it */
 	if (i2c->status & SPACEMIT_SR_MSD)
 		return;
@@ -353,14 +428,20 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 
 	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->use_pio)
+		complete(&i2c->complete);
 }
 
 static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
 {
+	if (!(i2c->status & SPACEMIT_SR_IRF))
+		return;
+
 	if (i2c->unprocessed) {
 		*i2c->msg_buf++ = readl(i2c->base + SPACEMIT_IDBR);
 		i2c->unprocessed--;
+		return;
 	}
 
 	/* if transfer completes, SPACEMIT_ISR will handle it */
@@ -373,7 +454,9 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
 
 	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->use_pio)
+		complete(&i2c->complete);
 }
 
 static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
@@ -408,21 +491,14 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
 	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
 
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->use_pio)
+		complete(&i2c->complete);
 }
 
-static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
+static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
 {
-	struct spacemit_i2c_dev *i2c = devid;
-	u32 status, val;
-
-	status = readl(i2c->base + SPACEMIT_ISR);
-	if (!status)
-		return IRQ_HANDLED;
-
-	i2c->status = status;
-
-	spacemit_i2c_clear_int_status(i2c, status);
+	u32 val;
 
 	if (i2c->status & SPACEMIT_SR_ERR)
 		goto err_out;
@@ -445,7 +521,10 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 	}
 
 	if (i2c->state != SPACEMIT_STATE_IDLE) {
-		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
+		val |= SPACEMIT_CR_TB;
+		if (i2c->use_pio)
+			val |= SPACEMIT_CR_ALDIE;
+
 
 		if (spacemit_i2c_is_last_msg(i2c)) {
 			/* trigger next byte with stop */
@@ -459,6 +538,23 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 
 err_out:
 	spacemit_i2c_err_check(i2c);
+}
+
+static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
+{
+	struct spacemit_i2c_dev *i2c = devid;
+	u32 status;
+
+	status = readl(i2c->base + SPACEMIT_ISR);
+	if (!status)
+		return IRQ_HANDLED;
+
+	i2c->status = status;
+
+	spacemit_i2c_clear_int_status(i2c, status);
+
+	spacemit_i2c_handle_state(i2c);
+
 	return IRQ_HANDLED;
 }
 
@@ -479,20 +575,29 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
 	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
 }
 
-static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+static inline int
+spacemit_i2c_xfer_common(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool use_pio)
 {
 	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
 	int ret;
 
+	i2c->use_pio = use_pio;
+
 	i2c->msgs = msgs;
 	i2c->msg_num = num;
 
-	spacemit_i2c_calc_timeout(i2c);
+	if (!i2c->use_pio)
+		spacemit_i2c_calc_timeout(i2c);
+	else
+		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
 
 	spacemit_i2c_init(i2c);
 
 	spacemit_i2c_enable(i2c);
 
+	/* To avoid being affected by the state of the previous transfer */
+	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
+
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret) {
 		ret = spacemit_i2c_xfer_msg(i2c);
@@ -506,11 +611,21 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	if (ret == -ETIMEDOUT || ret == -EAGAIN)
 		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
-			  ret, i2c->status & SPACEMIT_SR_ERR);
+			ret, i2c->status & SPACEMIT_SR_ERR);
 
 	return ret < 0 ? ret : num;
 }
 
+static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+{
+	return spacemit_i2c_xfer_common(adapt, msgs, num, false);
+}
+
+static int spacemit_i2c_pio_xfer_atomic(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+{
+	return spacemit_i2c_xfer_common(adapt, msgs, num, true);
+}
+
 static u32 spacemit_i2c_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
@@ -518,6 +633,7 @@ static u32 spacemit_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm spacemit_i2c_algo = {
 	.xfer = spacemit_i2c_xfer,
+	.xfer_atomic = spacemit_i2c_pio_xfer_atomic,
 	.functionality = spacemit_i2c_func,
 };
 

---
base-commit: bc574b64121525b24d52e9bab747184181c808dc
change-id: 20250814-k1-i2c-atomic-f1a90cd34364

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


