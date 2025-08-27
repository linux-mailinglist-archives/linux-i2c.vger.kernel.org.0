Return-Path: <linux-i2c+bounces-12441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 882F7B37C0F
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 09:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3556859A3
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 07:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D1E31A078;
	Wed, 27 Aug 2025 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YFgkrUvk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1B731A04F;
	Wed, 27 Aug 2025 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280459; cv=none; b=NBM4F6KxcPfsj7bvk+M741lWI8EO260i26ExPK1WnrAV7rQkqKqfIwf+XWlAE3oGcSngGP4kpy/EXYghhgAEsfXNx85FvrM0b240cJaciAS42s+OSmYHe31Pvjg3dQ4D1msuLe7FWXVL5FcEth/TdGp4R0AV2zHTvVZtU1ha5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280459; c=relaxed/simple;
	bh=SOwxrwMY5q6SLeifggiTWiBT3jVxztapPvG1+sfX4ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iC6MO3tT3xCOLNFh9SdXV2CiIbHy8rN9BxAWXLzyAgvUfAJoSWnncnOAE/R0X+4FLVaGKxN1W64fZxQB47zD3H8nINFPLuckVVG+Eq+RStn1xCPncn2ww4QVW7n2Ai7YzE/X6qFZGkXXu2qdA9AxrSpWFMv0/XHnAM+CZloN1T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YFgkrUvk; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756280383;
	bh=gk0AuPbE2e1go6AHp83tTfSoDlCJp9KcBO9I8dQc2/w=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=YFgkrUvkBPJDF8SKkTcZ/LEwFpmJNLKvwQOPRRIkFKyxNCf+3rBy5eG8dhAud86BX
	 MPmfcuInq9e6Z0wqpW0/Z1GOCUD9CCvE9EygDs1z4A7p28oi0V1153dAAhBoWVUt7G
	 LsjJwNd3oTN8EgGeRN2wUgkcNR2jGGJigc2kp1BY=
X-QQ-mid: esmtpsz18t1756280376t60a65922
X-QQ-Originating-IP: t+rbXBFCAiMUmuHnikv4NQQjcUFmojpqdPPAsHLpmyQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:39:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13364597237366048741
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 27 Aug 2025 15:39:13 +0800
Subject: [PATCH 6/6] i2c: spacemit: introduce pio for k1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-k1-i2c-atomic-v1-6-e59bea02d680@linux.spacemit.com>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
In-Reply-To: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756280357; l=8587;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=SOwxrwMY5q6SLeifggiTWiBT3jVxztapPvG1+sfX4ZI=;
 b=IUbNhkXO6wLZ0DN2n/Z79Z/ehMLvBpWeVOlBAcc8pVB1OTfUf665KFDKRU2qq6cNGgbUChruG
 fNRe5T1CM4GDqhUTksaumB3W1PtQCDWGXUJ6H8rYkobVOrKxFyCQjng
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N32BSuq9GV7o+MV9TnBdRTukzhIXEXxy9DSgus6bc6vzM+Jjeb4zCZ3M
	Ur+0RtAzA4PETQtqi5zyOqmQunMnjqXvdEJgFJwEOHJwNj0PZibN5YLVw9z7VMEW74RS0+l
	AwR595G9JvlSFEbhhteK/8zOdE2D0hncbdgPmPxoDB16UzwJXDlQ/CSoA/YVF5SkFCxJS7O
	ntGkjpW76cRX3ELopXJQXXWOQDH1pQKLTA2V6OT+loGDtaGjwId6O6qmSFcK76XjeSeDk/n
	NFl9N3cvnmzi8C79t9MsS9GqUs9nT1TeXJSOqiorX2WkeHBm3ypBWU58jTOQeowQaQHOPSM
	L2A3jkPSW8wTEgDDQZ2+N+erSNMxJNLc2cAoffSX5mmoAEdqec/KYMucutjramisfKiaD4W
	xUH+z8zXuT79jjLhD7XoYbEkx++L74fHv+H5Lcxkm7emTz00bqyFgz5lLjcxQLW5ZSl56NA
	C6boyK34TzQVj4MvGT8cUEfCZoX28VE9OHDlnBNtQ22PS9/JJTYV9ldk3PqzMXCy8h/rNTT
	j3aghQTb9sEpS5aiV/rnM0iln0c+6B2n2OJsGS8OEz7yo00SWK/TxTCgqTChiLFED4eTDoR
	gZzrMRKq/5oTFEbSY9N1I09vbVgCabK2JN3L6OiFoTXy0CmxXBUXWE83P6WwMyfovErIySI
	x2M7AUwoZtqoOdeFeLXLZDCj1ul57+XUt0Q6TctQxZbevpcfcrUIJKMY0he8/0FfdCwZrlH
	OjOR5N2i0lhprqFnlydDcNwbeQXjAJNTUTfiMt40Z24Bpt0Um6vkqCtPKpFhP6v1gr28xAW
	EfdgoWLw+vKrocQjeiM+GJEBKRLx1ppRokHd2tCUSYvl1Ee5O55vCGWEOYmHqJK8KzKFZTr
	b4alwh2qnyZJY1/oKbTg9LmddDsYe6RoUDar1zIF8Ejzm7YaxYJK2SU2w7UyL08RKVKoC+X
	RRzEg9I3htVOHgZK2ewUHdJHChtxYFyU7UeyRLVqMNG7XXFpuTmm3FSdY5O3ltq09pFvmUE
	eca0XJk4uLXuvAGgw1BnalKzprSsdHVoVbYpTdOQD64mKQU6hVmYedwTsDCdBkn3hFi/GXR
	lQu6K0IpGlKyrozczi30QZ2/FQsf+68PgxRlnTfKfK1XgihZoumuCm3iT4JM+t4ug==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C with interrupts disabled.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 139 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 120 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d2c0d20d19ba73baa8b2e9a6acb02b2cc3b7243f..e558fe4cbd5a78b5b53b0c02cbbca818b6495d4a 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -124,6 +124,7 @@ struct spacemit_i2c_dev {
 
 	enum spacemit_i2c_state state;
 	bool read;
+	bool is_pio;
 	struct completion complete;
 	u32 status;
 };
@@ -228,7 +229,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
 
 static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 {
-	u32 val;
+	u32 val = 0;
 
 	/*
 	 * Unmask interrupt bits for all xfer mode:
@@ -236,7 +237,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	 * For transaction complete signal, we use master stop
 	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
 	 */
-	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
+	if (!i2c->is_pio)
+		val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
 
 	/*
 	 * Unmask interrupt bits for interrupt xfer mode:
@@ -246,7 +248,8 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	 * i2c_start function.
 	 * Otherwise, it will cause an erroneous empty interrupt before i2c_start.
 	 */
-	val |= SPACEMIT_CR_DRFIE;
+	if (!i2c->is_pio)
+		val |= SPACEMIT_CR_DRFIE;
 
 	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
 		val |= SPACEMIT_CR_MODE_FAST;
@@ -258,7 +261,10 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	val |= SPACEMIT_CR_SCLE;
 
 	/* enable master stop detected */
-	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
+	val |= SPACEMIT_CR_MSDE;
+
+	if (!i2c->is_pio)
+		val |= SPACEMIT_CR_MSDIE;
 
 	writel(val, i2c->base + SPACEMIT_ICR);
 
@@ -295,10 +301,54 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
 	/* send start pulse */
 	val = readl(i2c->base + SPACEMIT_ICR);
 	val &= ~SPACEMIT_CR_STOP;
-	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB | SPACEMIT_CR_DTEIE;
+	val |= SPACEMIT_CR_START | SPACEMIT_CR_TB;
+
+	if (!i2c->is_pio)
+		val |= SPACEMIT_CR_DTEIE;
+
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
+static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid);
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
+		spacemit_i2c_irq_handler(0, i2c);
+
+		i2c->status = readl(i2c->base + SPACEMIT_ISR);
+
+		/*
+		 * This is the last byte to write of the current message.
+		 * If we do not wait here, control will proceed directly to start(),
+		 * which would overwrite the current data.
+		 */
+		if (!i2c->read && !i2c->unprocessed) {
+			ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
+						i2c->status, i2c->status & SPACEMIT_SR_ITE,
+						30, 1000);
+			if (ret)
+				return 0;
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
@@ -312,10 +362,27 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 
 		reinit_completion(&i2c->complete);
 
-		spacemit_i2c_start(i2c);
+		if (i2c->is_pio) {
+			disable_irq(i2c->irq);
+
+			/*
+			 * The K1 I2C controller has a quirk:
+			 * when doing PIO transfers, the status register must be cleared
+			 * of all other bits before issuing a START.
+			 * Failing to do so will prevent the transfer from working properly.
+			 */
+			spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
+
+			spacemit_i2c_start(i2c);
+			time_left = spacemit_i2c_wait_pio_xfer(i2c);
+
+			enable_irq(i2c->irq);
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
@@ -343,6 +410,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
 
 static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 {
+	if (!(i2c->status & SPACEMIT_SR_ITE))
+		return;
+
 	/* if transfer completes, SPACEMIT_ISR will handle it */
 	if (i2c->status & SPACEMIT_SR_MSD)
 		return;
@@ -355,14 +425,20 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 
 	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->is_pio)
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
@@ -375,7 +451,9 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
 
 	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->is_pio)
+		complete(&i2c->complete);
 }
 
 static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
@@ -410,7 +488,9 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
 	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
 
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->is_pio)
+		complete(&i2c->complete);
 }
 
 static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
@@ -418,13 +498,20 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 	struct spacemit_i2c_dev *i2c = devid;
 	u32 status, val;
 
-	status = readl(i2c->base + SPACEMIT_ISR);
-	if (!status)
-		return IRQ_HANDLED;
+	/*
+	 * In PIO mode, do not read status again.
+	 * It has already been read in wait_pio_xfer(),
+	 * and reading it clears some bits.
+	 */
+	if (!i2c->is_pio) {
+		status = readl(i2c->base + SPACEMIT_ISR);
+		if (!status)
+			return IRQ_HANDLED;
 
-	i2c->status = status;
+		i2c->status = status;
 
-	spacemit_i2c_clear_int_status(i2c, status);
+		spacemit_i2c_clear_int_status(i2c, status);
+	}
 
 	if (i2c->status & SPACEMIT_SR_ERR)
 		goto err_out;
@@ -483,11 +570,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
 	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
 }
 
-static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+static inline int
+spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num, bool is_pio)
 {
 	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
 	int ret;
 
+	i2c->is_pio = is_pio;
+
 	i2c->msgs = msgs;
 	i2c->msg_num = num;
 
@@ -510,18 +600,29 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	if (ret == -ETIMEDOUT || ret == -EAGAIN)
 		dev_err(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
-			  ret, i2c->status & SPACEMIT_SR_ERR);
+			ret, i2c->status & SPACEMIT_SR_ERR);
 
 	return ret < 0 ? ret : num;
 }
 
+static int spacemit_i2c_int_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+{
+	return spacemit_i2c_xfer(adapt, msgs, num, false);
+}
+
+static int spacemit_i2c_pio_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
+{
+	return spacemit_i2c_xfer(adapt, msgs, num, true);
+}
+
 static u32 spacemit_i2c_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
 }
 
 static const struct i2c_algorithm spacemit_i2c_algo = {
-	.xfer = spacemit_i2c_xfer,
+	.xfer = spacemit_i2c_int_xfer,
+	.xfer_atomic = spacemit_i2c_pio_xfer,
 	.functionality = spacemit_i2c_func,
 };
 

-- 
2.50.1


