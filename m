Return-Path: <linux-i2c+bounces-14780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0473CCDE4B1
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 04:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4C1530184D8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 03:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336FE2CCC0;
	Fri, 26 Dec 2025 03:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="T7fi/e4W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2A31A08AF;
	Fri, 26 Dec 2025 03:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766719985; cv=none; b=eTWUKY64klUgGAjctIFJYv2xZxEAryR1wtO2PBgHcSFblqE2GcjHuWtG/bfI+M1LZ+HlXKsGg3X6r31hXkj2V6JBFpQk2PGD5bMcscHfKfhpH9/vXM+EQdqntPWlZ63ks3r2jX0P6HNr9AjCTdeP2tVCfx+GX7P0OYa1JlF8nxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766719985; c=relaxed/simple;
	bh=+ossNVngiIFSK6kpBiw32dx0+AmXcOPdrBGiihTMYNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1cDV+BVxODH2mZECtioXFh7inbcHFw4nWBD5BjvlN8I2I05sUhzRKQ2XAYQWe/UrmITURNdUAAFo9aHFwd3jhI1PdIZseNxqCG27oPE6EKEHq43LkB/Syvt1eyn+w6zapmIh6j5BrFCjTQA4xMPaGcb3veL5RNl2ijX42k/cy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=T7fi/e4W; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766719888;
	bh=l5QWF+3BvIL2Kuf2oXtHP/IpUWBUZauVClstV6XXwB4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=T7fi/e4Wqp5kxoyc8j8hrpJ/ld+RR9j2ovscG45xBkldqZUbi6If3i29OrlK8YI9S
	 eC60biYEf738sqcb5VPUPdZrPszgQJO/HwVXskqkF3VKqhF8c1LsWkdMc17m9zfhD/
	 J6XviNfIDhfpEk3krqxOFumMWY3xslcbk+uHvg3U=
X-QQ-mid: zesmtpgz6t1766719879t730dedc6
X-QQ-Originating-IP: 6rRAaTC74AeUJBAb4pEJ87shFEt1OSoAsPq3JaBImJ0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 11:31:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12536660555387088490
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 26 Dec 2025 11:31:11 +0800
Subject: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
In-Reply-To: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766719870; l=16119;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=+ossNVngiIFSK6kpBiw32dx0+AmXcOPdrBGiihTMYNI=;
 b=IWDZ37Q0sOmyb6f9ZZXd5iqNu5UOoqOa8KWtumvzltIJGOJyFuxkP/+uQpmGcSWDBSc1ZREVr
 r/u4MGyU55XDs/37qMEiGoQFzU/Umq0FHUSRKaru3zVs5JUQu/vdmel
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MaP/HMsInhq9hxR7Cn7LO6Iq6PWNB9yxtkUUEyoPkC0Fpr9x9z+j7SdC
	kQfvSwbLUX8KfAzEzztyory5ODoykf0UjR4xLctzRnExmWdp3S6E9aIuQ/KRniNqaDdC1Eq
	2u1AbALu+XKD6Y2i498G8WCXAXOa+h8SYhATd2TJ4Ix9iulP5Ymw/hpgb9W6js9e9oacI9Z
	Mxv5Pdn7JIHOxo5zXt7lbGPFbU5Y26DyV2Ah1d6mO7RsMsVaBQ/kdBSX6iF8zuVST2BSPcm
	xTkuuUV0zRWw6+WuCS1xaEYOTijPvMkAVR2fzm8aSakRE0LRApAZe8OGJYMuHBOlLOCtJU5
	653wRP8jhMSrNfXdl6p3w/oTiYVAkHSPUlXPh5OP5Ags3r4jxcacvNhWOdwe8VfnHvFZRtB
	9ldEA0btWODhCMSxSIsuyg0x+Nj++JcppPbEUKjb2g0g1r1PDCEZS9EQ8MHSr5uJoI0HC7i
	1LYPdc+bBckJ+p2HpjW04jbyY74H6cskqotCq+Y/rZBrWk+thzdJ/hr+RNFPqqua9R8iH5Z
	zrjkaTOc7oTvvjRWNZz8lA0vzbtt+tMQ8IgvyNdQfmWCIfrovHhEqAlZNAI9Y+xaz5iTj8a
	1m3L41F/kSx4uGDeYdMOImDMPPbUjgiEuIQVUAyBdhZ4ncplosuzof+HSw67GxTmTVAHi+A
	/Q+5/Dudj2tzU7BmbS6XT0B1+/TrTOU0Och+jKCcmjYnHUwTiurSr/6PJFZg3WLWBsQgEPo
	FG77wOwJhQ81ESbbbd+T7Rj0f5Hul9d9duU3RQB/m0qUQvPFlmjRh3LuFv6liOF6mhbiAAz
	JjUTCcJQW5rEDuRSEE/LKPhS8upCN5gjmkb6ug6I/yKVqYrEgCcxwWyOZWCGIsFYdzJeaVY
	iy5UceFyOuR94l+lTwHmr2kiyvJ7uT3id9wNJppcJM2d/3AeI+zTbcYrrHW8E4q7PeftJjC
	3oROvlJ8AUK6EfXUv4suO8P/9iCaveh4lBAVFfhruYkcDYcBjjQl+l2hWe5x3VQqoUzQ1Td
	m3TimI46K/+QxspRFs8aCFe/jwP7vPp5pQIPYUHdWQO+vTFd+ZNHdJ4S6kjqDk9FAKMk5hV
	x0b+CMR/YyA9/s0WW+hLQL25VWoft8vAudbq/vl+rr3PGeWSgn4ut7pzHlFbu8L3JJobHUQ
	yTlk
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C in atomic context.

When i2c xfer_atomic is invoked, use_pio is set accordingly.

Since an atomic context is required, all interrupts are disabled when
operating in PIO mode. Even with interrupts disabled, the bits in the
ISR (Interrupt Status Register) will still be set, so error handling can
be performed by polling the relevant status bits in the ISR.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v5:
- optimize code logic
- refactor delay handling into spacemit_i2c_delay() helper
- introduce spacemit_i2c_complete() to centralize transfer completion
- rework PIO transfer wait logic for clarity and correctness
- modify and add some comments
- modify commit message
- Link to v4: https://lore.kernel.org/all/20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com/

Changes in v4:
- refactor for better readability: simplify condition check and moving if/else (timeout/
  wait_xfer_complete) logic into a function
- remove irrelevant changes
- remove the status clear call in spacemit_i2c_xfer_common()
- sort functions to avoid forward declarations,
  move unavoidable ones above function definitions
- use udelay() in atomic context to avoid sleeping
- wait for MSD on the last byte in wait_pio_xfer()
- Link to v3: https://lore.kernel.org/r/20250929-k1-i2c-atomic-v3-1-f7e660c138b6@linux.spacemit.com

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
- add is_pio judgement in irq_handler()
- use a fixed timeout value when PIO
- use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
- Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com
---
 drivers/i2c/busses/i2c-k1.c | 297 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 225 insertions(+), 72 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index accef6653b56bd3505770328af17e441fad613a7..78a2de2c517e51e6ff997cc21402eb8f85054f85 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -97,6 +97,8 @@
 
 #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
 
+#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
+
 enum spacemit_i2c_state {
 	SPACEMIT_STATE_IDLE,
 	SPACEMIT_STATE_START,
@@ -125,6 +127,7 @@ struct spacemit_i2c_dev {
 
 	enum spacemit_i2c_state state;
 	bool read;
+	bool use_pio;
 	struct completion complete;
 	u32 status;
 };
@@ -171,6 +174,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
 	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
 }
 
+static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
+				      unsigned int min_us,
+				      unsigned int max_us)
+{
+	if (i2c->use_pio)
+		udelay(max_us);
+	else
+		usleep_range(min_us, max_us);
+}
+
 static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 {
 	u32 status;
@@ -182,7 +195,8 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 		return;
 
 	spacemit_i2c_reset(i2c);
-	usleep_range(10, 20);
+
+	spacemit_i2c_delay(i2c, 10, 20);
 
 	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
 		status = readl(i2c->base + SPACEMIT_IBMR);
@@ -211,9 +225,15 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
 	if (!(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)))
 		return 0;
 
-	ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
-				 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
-				 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+	if (i2c->use_pio)
+		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
+						val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
+						1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+	else
+		ret = readl_poll_timeout(i2c->base + SPACEMIT_ISR,
+					 val, !(val & (SPACEMIT_SR_UB | SPACEMIT_SR_IBB)),
+					 1500, SPACEMIT_I2C_BUS_BUSY_TIMEOUT);
+
 	if (ret)
 		spacemit_i2c_reset(i2c);
 
@@ -225,7 +245,7 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
 	/* in case bus is not released after transfer completes */
 	if (readl(i2c->base + SPACEMIT_ISR) & SPACEMIT_SR_EBB) {
 		spacemit_i2c_conditionally_reset_bus(i2c);
-		usleep_range(90, 150);
+		spacemit_i2c_delay(i2c, 90, 150);
 	}
 }
 
@@ -237,25 +257,30 @@ spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
 
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
@@ -267,7 +292,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	val |= SPACEMIT_CR_SCLE;
 
 	/* enable master stop detected */
-	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
+	val |= SPACEMIT_CR_MSDE;
 
 	writel(val, i2c->base + SPACEMIT_ICR);
 
@@ -300,7 +325,11 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
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
 
@@ -315,8 +344,20 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
 	return !i2c->unprocessed;
 }
 
+static inline void spacemit_i2c_complete(struct spacemit_i2c_dev *i2c)
+{
+	/* SPACEMIT_STATE_IDLE avoids triggering the next byte */
+	i2c->state = SPACEMIT_STATE_IDLE;
+
+	if (!i2c->use_pio)
+		complete(&i2c->complete);
+}
+
 static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 {
+	if (!(i2c->status & SPACEMIT_SR_ITE))
+		return;
+
 	/* if transfer completes, SPACEMIT_ISR will handle it */
 	if (i2c->status & SPACEMIT_SR_MSD)
 		return;
@@ -327,16 +368,18 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 		return;
 	}
 
-	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
-	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+	spacemit_i2c_complete(i2c);
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
@@ -347,9 +390,7 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
 	if (i2c->unprocessed)
 		return;
 
-	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
-	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+	spacemit_i2c_complete(i2c);
 }
 
 static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
@@ -383,8 +424,134 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
 
 	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
 
-	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+	spacemit_i2c_complete(i2c);
+}
+
+static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
+{
+	u32 val;
+
+	if (i2c->status & SPACEMIT_SR_ERR)
+		goto err_out;
+
+	val = readl(i2c->base + SPACEMIT_ICR);
+	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
+
+	switch (i2c->state) {
+	case SPACEMIT_STATE_START:
+		spacemit_i2c_handle_start(i2c);
+		break;
+	case SPACEMIT_STATE_READ:
+		spacemit_i2c_handle_read(i2c);
+		break;
+	case SPACEMIT_STATE_WRITE:
+		spacemit_i2c_handle_write(i2c);
+		break;
+	default:
+		break;
+	}
+
+	if (i2c->state != SPACEMIT_STATE_IDLE) {
+		val |= SPACEMIT_CR_TB;
+		if (i2c->use_pio)
+			val |= SPACEMIT_CR_ALDIE;
+
+
+		if (spacemit_i2c_is_last_msg(i2c)) {
+			/* trigger next byte with stop */
+			val |= SPACEMIT_CR_STOP;
+
+			if (i2c->read)
+				val |= SPACEMIT_CR_ACKNAK;
+		}
+		writel(val, i2c->base + SPACEMIT_ICR);
+	}
+
+err_out:
+	spacemit_i2c_err_check(i2c);
+}
+
+/*
+ * In PIO mode, this function is used as a replacement for
+ * wait_for_completion_timeout(), whose return value indicates
+ * the remaining time.
+ *
+ * We do not have a meaningful remaining-time value here, so
+ * return a non-zero value on success to indicate "not timed out".
+ * Returning 1 ensures callers treating the return value as
+ * time_left will not incorrectly report a timeout.
+ */
+static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
+{
+	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
+	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
+	int ret;
+
+	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
+
+	do {
+		i2c->status = readl(i2c->base + SPACEMIT_ISR);
+
+		spacemit_i2c_clear_int_status(i2c, i2c->status);
+
+		if (!(i2c->status & mask)) {
+			udelay(10);
+			continue;
+		}
+
+		spacemit_i2c_handle_state(i2c);
+
+
+	} while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0);
+
+	if (i2c->unprocessed)
+		return 0;
+
+	if (i2c->read)
+		return 1;
+
+	/*
+	 * If this is the last byte to write of the current message,
+	 * we have to wait here. Otherwise, control will proceed directly
+	 * to start(), which would overwrite the current data.
+	 */
+	ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
+					i2c->status, i2c->status & SPACEMIT_SR_ITE,
+					30, 1000);
+	if (ret)
+		return 0;
+
+	/*
+	 * For writes: in interrupt mode, an ITE (write-empty) interrupt is triggered
+	 * after the last byte, and the MSD-related handling takes place there.
+	 * In PIO mode, however, we need to explicitly call err_check() to emulate this
+	 * step, otherwise the next transfer will fail.
+	 */
+	if (i2c->msg_idx == i2c->msg_num - 1) {
+		mask = SPACEMIT_SR_MSD | SPACEMIT_SR_ERR;
+		/*
+		 * In some cases, MSD may not arrive immediately;
+		 * wait here to handle that.
+		 */
+		ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
+						i2c->status, i2c->status & mask,
+						30, 1000);
+		if (ret)
+			return 0;
+
+		spacemit_i2c_err_check(i2c);
+	}
+
+	return 1;
+}
+
+static int spacemit_i2c_wait_xfer_complete(struct spacemit_i2c_dev *i2c)
+{
+	if (i2c->use_pio)
+		return spacemit_i2c_wait_pio_xfer(i2c);
+
+	return wait_for_completion_timeout(&i2c->complete,
+					   i2c->adapt.timeout);
 }
 
 static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
@@ -402,8 +569,8 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 
 		spacemit_i2c_start(i2c);
 
-		time_left = wait_for_completion_timeout(&i2c->complete,
-							i2c->adapt.timeout);
+		time_left = spacemit_i2c_wait_xfer_complete(i2c);
+
 		if (!time_left) {
 			dev_err(i2c->dev, "msg completion timeout\n");
 			spacemit_i2c_conditionally_reset_bus(i2c);
@@ -421,7 +588,7 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 {
 	struct spacemit_i2c_dev *i2c = devid;
-	u32 status, val;
+	u32 status;
 
 	status = readl(i2c->base + SPACEMIT_ISR);
 	if (!status)
@@ -431,41 +598,8 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 
 	spacemit_i2c_clear_int_status(i2c, status);
 
-	if (i2c->status & SPACEMIT_SR_ERR)
-		goto err_out;
-
-	val = readl(i2c->base + SPACEMIT_ICR);
-	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
-
-	switch (i2c->state) {
-	case SPACEMIT_STATE_START:
-		spacemit_i2c_handle_start(i2c);
-		break;
-	case SPACEMIT_STATE_READ:
-		spacemit_i2c_handle_read(i2c);
-		break;
-	case SPACEMIT_STATE_WRITE:
-		spacemit_i2c_handle_write(i2c);
-		break;
-	default:
-		break;
-	}
-
-	if (i2c->state != SPACEMIT_STATE_IDLE) {
-		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
+	spacemit_i2c_handle_state(i2c);
 
-		if (spacemit_i2c_is_last_msg(i2c)) {
-			/* trigger next byte with stop */
-			val |= SPACEMIT_CR_STOP;
-
-			if (i2c->read)
-				val |= SPACEMIT_CR_ACKNAK;
-		}
-		writel(val, i2c->base + SPACEMIT_ICR);
-	}
-
-err_out:
-	spacemit_i2c_err_check(i2c);
 	return IRQ_HANDLED;
 }
 
@@ -474,6 +608,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
 	unsigned long timeout;
 	int idx = 0, cnt = 0;
 
+	if (i2c->use_pio) {
+		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
+		return;
+	}
+
 	for (; idx < i2c->msg_num; idx++)
 		cnt += (i2c->msgs + idx)->len + 1;
 
@@ -486,11 +625,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
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
 
@@ -518,6 +660,16 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
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
@@ -525,6 +677,7 @@ static u32 spacemit_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm spacemit_i2c_algo = {
 	.xfer = spacemit_i2c_xfer,
+	.xfer_atomic = spacemit_i2c_pio_xfer_atomic,
 	.functionality = spacemit_i2c_func,
 };
 

-- 
2.52.0


