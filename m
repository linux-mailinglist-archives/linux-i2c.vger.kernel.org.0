Return-Path: <linux-i2c+bounces-13428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF0DBC8659
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 12:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14B6D3B1657
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 10:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7237A266584;
	Thu,  9 Oct 2025 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="fbXtAJLJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978979CD;
	Thu,  9 Oct 2025 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004116; cv=none; b=mRnD2nTJ6GqkkAZVEAtkYOkzM+/CCyFk0p1pwmvY1bijoG+OGGemu640lCykvOz1OlUd9HbpXqux3BD4r1w983uPFlSYsZGT1okgbkIfJiu3CSJUyyl1ZVI9oPj4M8GrGoAYSEzmGMG6PTGIf8HOji8miFfrfc7/p29TrJydDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004116; c=relaxed/simple;
	bh=6LzWOXoqWoEZ6S4LgImKJa1TKDA2Ji3nVpUmx3D0oNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O/pSQVdcZEp8XaDJYa1/8BfWey+0GLlB1ETR42UzJ8usDYL/99n5cxX4i8mriYaA8jLmDvp2JgcdDJqILQWElIi5RRVTSQGt+LQn8mHOguewVSnsjNrax2zFXGZGd6f1neRdq/2DWAyWk2P1hFQeMm3Jmph+QhSM2FbjV0Tbrho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=fbXtAJLJ; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760004005;
	bh=j3m/x9I7yqf88SQU+y8+tiEEY6OEjbKAofH/MvadssY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=fbXtAJLJqtCgBJZRKKIKptQflSpX4sohowheb/ewgFMoPonlkhvkLvUcL7ckKTelq
	 eU8poebXgbClsG7JvpwTpWrSjTrnIu9XyU8AQCcx6wKjxccgVZrWeSSpsU7F7SJItJ
	 wmdIH9ancT/3RYn36jboaQyPtEn969JOG1Jg4cJA=
X-QQ-mid: zesmtpgz6t1760003997tbe349592
X-QQ-Originating-IP: C7LnopWulijzMsJEWP+vDKejFd+iNFi/qL8c6Qjqj3E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Oct 2025 17:59:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9055816240526190240
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 09 Oct 2025 17:59:52 +0800
Subject: [PATCH v4] i2c: spacemit: introduce pio for k1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAJeH52gC/3XMQQrCMBCF4atI1o5kkjS2rryHuEiTqQ7aVppal
 NK7G0VQii7/B+8bRaSOKYrNYhQdDRy5bVKY5UL4o2sOBBxSCyVVJnM0cEJg5cH1bc0eKnSF9EE
 bbY1In0tHFd9e3m6f+sixb7v7ix/wub4ltZ5JA4IEyoqSnFTB5nJ75uZ6W8WL81Rzv/JtLZ7ko
 D5MobI5oxJjbPCoNaIP7i+jv5lizmhAqNZkrUxSXtqfzDRND2j6qONBAQAA
X-Change-ID: 20250814-k1-i2c-atomic-f1a90cd34364
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760003995; l=14117;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=6LzWOXoqWoEZ6S4LgImKJa1TKDA2Ji3nVpUmx3D0oNw=;
 b=v4m6MVGM+DO5kSFzLos5K/YrY/Tueo5Kb8UMCR+kzf0gOXC702Z+Dv4hB1i7LxM78sqb0TLd2
 HzrBjKpJT7bAkVi2Rh6GEwic8TZ2+sFApF6gc8OAzcGJ8Idg0HjTq/2
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MRgQkWzEGwwKhemJDCdU1vCT0NIuE6lJVhVEHnDG4bWKesqynDIxoEOb
	+nOxM/IfCWilgsfFwdcOqrdZToCORUtsX6I9GIL9F3tXOVVq7Uqj5jW+HWDXCRWr1fSxpQR
	3St2eqpyTY/+wPohfXKltIGyPAT8zaZhKX8R1OGyM6CzGJrxW2IQvhqM+eLsQFoiRUjrI6U
	nArskxdYY/bzzbIermvVIbFES0vqGzKV+xOVIFCLPhWVUJ35R+g91RYJGrKk8kLc7xwnlyK
	E9IffGI4e36JIxrpGsPBGoHtafzI+Tt6rmazPZKdi3pL8PxEl2YqQ4s4oKuICqOebv/SsHl
	saXv0TOhv0d84rbfwuZHllJIM3n0sNf2Z827G717GhRJgJPa/BkJ9zboSn5plsj89jnoB7v
	9wllMNjGtdU7Hbfn+A+UROUTR/YpDvAMlqhdnn97MKP9FNTy+QD//nrnTYmm03grdBY+vx1
	nrh3vc89YcJl/bb6fxyex/hinvP6cmhrWykwIdLSRJ8wlKTxvY1GPqeDibwHUaATuQnljAE
	9RxZt+uUSo/ggBAsfz15g3tPUR5QcvLdcf/X0eECtr9u9PRM7X/XqRN0oGeAKFg1Lo+jEAs
	qXpYrihQM1i4ReYGFqMr9NEbxR8AFf0Q3zVP2bHWqPPHDDn/fYIXGzmXPKSDyJO7rIA4k8b
	RUsa9AaEuwt5BC2DC5G93CL9rNP9pucYhAdv9vFTg9a2xbdgenEGgrZRG1NM0+bfjhCQpfC
	JPW+y7qAGZgUNDOUxzA+OeLkfVH/63/4Wz0x4V11kBIWSxvJ1o2I6Blb4rrHuqmVQ9f+wOe
	xOPwidV7ziwzr46D3I08uBTMNoMXkt6EmnAsBat5av0ut0iXyBHoLt1thAGmK516Q9AjGQx
	iaIISgNyROv86n+srCJmNgXlnl6eVBW/vBUD60s/NHILxIQaQ2d48Uo5neQg40nN2+uBalW
	Diuj8bQIFSTeOfXX+G+IBwKvb0ftWTv1NflNemo6UptVt+/twQZK7ZLQfwopdOI9S+U0tIJ
	UPo05fKbuiAPfUp+YtK7cx/hAxBeT2w7o31W5jzmKWleflhc3AYyqXUX6QuNcsNiZUbuJ4h
	mjbGPhgJbhL0ftPTN8u7aGY5vFnI3UMhZZ2KZloqtOkxujHbcpIDUeHE6gTwDpgZrN6fTqz
	N2SvYu2SGNAcCSCx88oT1p9pYhXXMkDxpNUB6NNRu2CS68Q=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
enabling the use of I2C in atomic context.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
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
 drivers/i2c/busses/i2c-k1.c | 229 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 185 insertions(+), 44 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 6b918770e612e098b8ad17418f420d87c94df166..a13284f840ee967466a01375e6603f7568a42f86 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -97,6 +97,8 @@
 
 #define SPACEMIT_BUS_RESET_CLK_CNT_MAX		9
 
+#define SPACEMIT_WAIT_TIMEOUT      1000 /* ms */
+
 enum spacemit_i2c_state {
 	SPACEMIT_STATE_IDLE,
 	SPACEMIT_STATE_START,
@@ -125,10 +127,14 @@ struct spacemit_i2c_dev {
 
 	enum spacemit_i2c_state state;
 	bool read;
+	bool use_pio;
 	struct completion complete;
 	u32 status;
 };
 
+static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c);
+static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c);
+
 static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
 {
 	u32 val;
@@ -177,7 +183,11 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
 		return;
 
 	spacemit_i2c_reset(i2c);
-	usleep_range(10, 20);
+
+	if (!i2c->use_pio)
+		usleep_range(10, 20);
+	else
+		udelay(20);
 
 	for (clk_cnt = 0; clk_cnt < SPACEMIT_BUS_RESET_CLK_CNT_MAX; clk_cnt++) {
 		status = readl(i2c->base + SPACEMIT_IBMR);
@@ -206,9 +216,14 @@ static int spacemit_i2c_wait_bus_idle(struct spacemit_i2c_dev *i2c)
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
 
@@ -220,31 +235,39 @@ static void spacemit_i2c_check_bus_release(struct spacemit_i2c_dev *i2c)
 	/* in case bus is not released after transfer completes */
 	if (readl(i2c->base + SPACEMIT_ISR) & SPACEMIT_SR_EBB) {
 		spacemit_i2c_conditionally_reset_bus(i2c);
-		usleep_range(90, 150);
+		if (!i2c->use_pio)
+			usleep_range(90, 150);
+		else
+			udelay(150);
 	}
 }
 
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
@@ -256,7 +279,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
 	val |= SPACEMIT_CR_SCLE;
 
 	/* enable master stop detected */
-	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
+	val |= SPACEMIT_CR_MSDE;
 
 	writel(val, i2c->base + SPACEMIT_ICR);
 
@@ -293,10 +316,85 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
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
 
+static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
+{
+	u32 mask, msec = jiffies_to_msecs(i2c->adapt.timeout);
+	ktime_t timeout = ktime_add_ms(ktime_get(), msec);
+	int ret;
+
+	mask = SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
+
+	while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0) {
+		udelay(10);
+		i2c->status = readl(i2c->base + SPACEMIT_ISR);
+
+		spacemit_i2c_clear_int_status(i2c, i2c->status);
+
+		if (!(i2c->status & mask))
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
+
+			/*
+			 * In read mode, err_check() in handle_state properly handles what happens
+			 * after the MSD bit is set. For writes it is different: in interrupt mode,
+			 * an ITE (write-empty) interrupt is triggered after the last byte, and the
+			 * MSD-related handling takes place there. In PIO mode, however, we need to
+			 * explicitly call err_check() to emulate this step, otherwise the next
+			 * transfer will fail.
+			 */
+			if (i2c->msg_idx == i2c->msg_num - 1) {
+				mask = SPACEMIT_SR_MSD | SPACEMIT_SR_ERR;
+				/*
+				 * In some cases, MSD may not arrive immediately;
+				 * wait here to handle that.
+				 */
+				ret = readl_poll_timeout_atomic(i2c->base + SPACEMIT_ISR,
+								i2c->status, i2c->status & mask,
+								30, 1000);
+				if (ret)
+					return 0;
+
+				spacemit_i2c_err_check(i2c);
+			}
+		}
+	}
+
+	if (i2c->unprocessed)
+		return 0;
+
+	return 1;
+}
+
+static int spacemit_i2c_wait_xfer_complete(struct spacemit_i2c_dev *i2c)
+{
+	if (i2c->use_pio)
+		return spacemit_i2c_wait_pio_xfer(i2c);
+	else
+		return wait_for_completion_timeout(&i2c->complete,
+						   i2c->adapt.timeout);
+}
+
 static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 {
 	unsigned long time_left;
@@ -312,8 +410,8 @@ static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
 
 		spacemit_i2c_start(i2c);
 
-		time_left = wait_for_completion_timeout(&i2c->complete,
-							i2c->adapt.timeout);
+		time_left = spacemit_i2c_wait_xfer_complete(i2c);
+
 		if (!time_left) {
 			dev_err(i2c->dev, "msg completion timeout\n");
 			spacemit_i2c_conditionally_reset_bus(i2c);
@@ -341,6 +439,9 @@ static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
 
 static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 {
+	if (!(i2c->status & SPACEMIT_SR_ITE))
+		return;
+
 	/* if transfer completes, SPACEMIT_ISR will handle it */
 	if (i2c->status & SPACEMIT_SR_MSD)
 		return;
@@ -353,14 +454,20 @@ static void spacemit_i2c_handle_write(struct spacemit_i2c_dev *i2c)
 
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
@@ -373,7 +480,9 @@ static void spacemit_i2c_handle_read(struct spacemit_i2c_dev *i2c)
 
 	/* SPACEMIT_STATE_IDLE avoids trigger next byte */
 	i2c->state = SPACEMIT_STATE_IDLE;
-	complete(&i2c->complete);
+
+	if (!i2c->use_pio)
+		complete(&i2c->complete);
 }
 
 static void spacemit_i2c_handle_start(struct spacemit_i2c_dev *i2c)
@@ -408,21 +517,14 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
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
@@ -445,7 +547,10 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 	}
 
 	if (i2c->state != SPACEMIT_STATE_IDLE) {
-		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
+		val |= SPACEMIT_CR_TB;
+		if (i2c->use_pio)
+			val |= SPACEMIT_CR_ALDIE;
+
 
 		if (spacemit_i2c_is_last_msg(i2c)) {
 			/* trigger next byte with stop */
@@ -459,6 +564,23 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 
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
 
@@ -467,6 +589,11 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
 	unsigned long timeout;
 	int idx = 0, cnt = 0;
 
+	if (i2c->use_pio) {
+		i2c->adapt.timeout = msecs_to_jiffies(SPACEMIT_WAIT_TIMEOUT);
+		return;
+	}
+
 	for (; idx < i2c->msg_num; idx++)
 		cnt += (i2c->msgs + idx)->len + 1;
 
@@ -479,11 +606,14 @@ static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
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
 
@@ -511,6 +641,16 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
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
@@ -518,6 +658,7 @@ static u32 spacemit_i2c_func(struct i2c_adapter *adap)
 
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


