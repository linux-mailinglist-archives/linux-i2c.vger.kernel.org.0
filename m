Return-Path: <linux-i2c+bounces-2231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07D873E0B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 19:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31D6028320E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 18:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773CB14263E;
	Wed,  6 Mar 2024 17:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K8/oX/Lq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5503F13E7CE;
	Wed,  6 Mar 2024 17:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747978; cv=none; b=h32wv2+3DCGnyUxDdndHoRLBcu/Q5eSSjaJOfeKVehjwxCOsix19Bt4Zwpm1e/V6SAJ3/XokcqxIjUZFlf9V0r5lx1QM0FOb8nsx3PqiAyTP4d01v1729aiZjaSjKDDMMjRN1K5JqmZS/YhYwDz1Mir/XWXNLukCw7FfMXf7ok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747978; c=relaxed/simple;
	bh=Gy7lbfHSlL/QLT1Lx6f4PW9R36O2f6hGj66uu1uWcCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y37OX7anaeemHUwxsYEGjR6ckX/fhFUGH6h065amBXBIGqcTQ2q60ff2oNYktT8MMtlvNqDBj2Z5p0KNLuQgBFvVpr36v5mfOvRm+2Hntn5zWzZiWXW2AYuLuPTM8uqFnOCCR/XCjzOlADOPptc0vrvHUOfQ9oBcYQonzlkGaNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K8/oX/Lq; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 240C240009;
	Wed,  6 Mar 2024 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709747966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTr4ZdW9OXziYRW2cJb72ygJqhfyGG5XXQz111gHa7c=;
	b=K8/oX/LqV46gGDmfHF1MefN5IUp0OAKDtpbh7b6DixvmfZbzA37UQTps62RSsnEjTGBvSC
	4Cu3ub8JHxFuCcOeKipatWgr/emOMyI59a0psVj7q1Z05Za4x6r2lua+4a4Gr89xtlwfQp
	LKQU8eNMm9yAqVlIyQz5plvVB7qO0+cSHn0j2vOwDyFq6Xg8uSsU5fqFlKDfpy6zQQwRdl
	rmSANGvt8vKkdIMXIKONoEol0T1zPkoW3x4CCjCvG3p4JAROjqOTc8RCS2GX+FKMPeOaB3
	/caQN3mvU9U/VxDLy6tv+jUUgRsiFpZa/cw2Wao+IsGy0p0cFQQL4Qz1PYXUoQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Mar 2024 18:59:25 +0100
Subject: [PATCH v3 05/11] i2c: nomadik: support short xfer timeouts using
 waitqueue & hrtimer
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240306-mbly-i2c-v3-5-605f866aa4ec@bootlin.com>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
In-Reply-To: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: theo.lebrun@bootlin.com

Replace the completion by a waitqueue for synchronization from IRQ
handler to task. For short timeouts, use hrtimers, else use timers.
Usecase: avoid blocking the I2C bus for too long when an issue occurs.

The threshold picked is one jiffy: if timeout is below that, use
hrtimers. This threshold is NOT configurable.

Implement behavior but do NOT change fetching of timeout. This means the
timeout is unchanged (200ms) and the hrtimer case will never trigger.

A waitqueue is used because it supports both desired timeout approaches.
See wait_event_timeout() and wait_event_hrtimeout(). An atomic boolean
serves as synchronization condition.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 70 +++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 63ce70f763a8..2ba7d082e205 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -168,10 +168,11 @@ struct i2c_nmk_client {
  * @clk_freq: clock frequency for the operation mode
  * @tft: Tx FIFO Threshold in bytes
  * @rft: Rx FIFO Threshold in bytes
- * @timeout: Slave response timeout (ms)
+ * @timeout_usecs: Slave response timeout
  * @sm: speed mode
  * @stop: stop condition.
- * @xfer_complete: acknowledge completion for a I2C message.
+ * @xfer_wq: xfer done wait queue.
+ * @xfer_done: xfer done boolean.
  * @result: controller propogated result.
  */
 struct nmk_i2c_dev {
@@ -185,10 +186,11 @@ struct nmk_i2c_dev {
 	u32				clk_freq;
 	unsigned char			tft;
 	unsigned char			rft;
-	int				timeout;
+	u32				timeout_usecs;
 	enum i2c_freq_mode		sm;
 	int				stop;
-	struct completion		xfer_complete;
+	struct wait_queue_head		xfer_wq;
+	bool				xfer_done;
 	int				result;
 };
 
@@ -443,6 +445,22 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	writel(priv->rft, priv->virtbase + I2C_RFTR);
 }
 
+static bool nmk_i2c_wait_xfer_done(struct nmk_i2c_dev *priv)
+{
+	if (priv->timeout_usecs < jiffies_to_usecs(1)) {
+		unsigned long timeout_usecs = priv->timeout_usecs;
+		ktime_t timeout = ktime_set(0, timeout_usecs * NSEC_PER_USEC);
+
+		wait_event_hrtimeout(priv->xfer_wq, priv->xfer_done, timeout);
+	} else {
+		unsigned long timeout = usecs_to_jiffies(priv->timeout_usecs);
+
+		wait_event_timeout(priv->xfer_wq, priv->xfer_done, timeout);
+	}
+
+	return priv->xfer_done;
+}
+
 /**
  * read_i2c() - Read from I2C client device
  * @priv: private data of I2C Driver
@@ -454,9 +472,9 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
  */
 static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
 {
-	int status = 0;
 	u32 mcr, irq_mask;
-	unsigned long timeout;
+	int status = 0;
+	bool xfer_done;
 
 	mcr = load_i2c_mcr_reg(priv, flags);
 	writel(mcr, priv->virtbase + I2C_MCR);
@@ -468,7 +486,8 @@ static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	/* enable the controller */
 	i2c_set_bit(priv->virtbase + I2C_CR, I2C_CR_PE);
 
-	init_completion(&priv->xfer_complete);
+	init_waitqueue_head(&priv->xfer_wq);
+	priv->xfer_done = false;
 
 	/* enable interrupts by setting the mask */
 	irq_mask = (I2C_IT_RXFNF | I2C_IT_RXFF |
@@ -484,10 +503,9 @@ static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	writel(readl(priv->virtbase + I2C_IMSCR) | irq_mask,
 	       priv->virtbase + I2C_IMSCR);
 
-	timeout = wait_for_completion_timeout(
-		&priv->xfer_complete, priv->adap.timeout);
+	xfer_done = nmk_i2c_wait_xfer_done(priv);
 
-	if (timeout == 0) {
+	if (!xfer_done) {
 		/* Controller timed out */
 		dev_err(&priv->adev->dev, "read from slave 0x%x timed out\n",
 			priv->cli.slave_adr);
@@ -522,9 +540,9 @@ static void fill_tx_fifo(struct nmk_i2c_dev *priv, int no_bytes)
  */
 static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 {
-	u32 status = 0;
 	u32 mcr, irq_mask;
-	unsigned long timeout;
+	u32 status = 0;
+	bool xfer_done;
 
 	mcr = load_i2c_mcr_reg(priv, flags);
 
@@ -537,7 +555,8 @@ static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	/* enable the controller */
 	i2c_set_bit(priv->virtbase + I2C_CR, I2C_CR_PE);
 
-	init_completion(&priv->xfer_complete);
+	init_waitqueue_head(&priv->xfer_wq);
+	priv->xfer_done = false;
 
 	/* enable interrupts by settings the masks */
 	irq_mask = (I2C_IT_TXFOVR | I2C_IT_MAL | I2C_IT_BERR);
@@ -563,10 +582,9 @@ static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	writel(readl(priv->virtbase + I2C_IMSCR) | irq_mask,
 	       priv->virtbase + I2C_IMSCR);
 
-	timeout = wait_for_completion_timeout(
-		&priv->xfer_complete, priv->adap.timeout);
+	xfer_done = nmk_i2c_wait_xfer_done(priv);
 
-	if (timeout == 0) {
+	if (!xfer_done) {
 		/* Controller timed out */
 		dev_err(&priv->adev->dev, "write to slave 0x%x timed out\n",
 			priv->cli.slave_adr);
@@ -816,7 +834,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 				priv->cli.count);
 			init_hw(priv);
 		}
-		complete(&priv->xfer_complete);
+		priv->xfer_done = true;
+		wake_up(&priv->xfer_wq);
+
 
 		break;
 
@@ -826,7 +846,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 		init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_MAL);
-		complete(&priv->xfer_complete);
+		priv->xfer_done = true;
+		wake_up(&priv->xfer_wq);
+
 
 		break;
 
@@ -845,7 +867,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 			init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_BERR);
-		complete(&priv->xfer_complete);
+		priv->xfer_done = true;
+		wake_up(&priv->xfer_wq);
+
 	}
 	break;
 
@@ -859,7 +883,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 		init_hw(priv);
 
 		dev_err(dev, "Tx Fifo Over run\n");
-		complete(&priv->xfer_complete);
+		priv->xfer_done = true;
+		wake_up(&priv->xfer_wq);
+
 
 		break;
 
@@ -960,7 +986,7 @@ static void nmk_i2c_of_probe(struct device_node *np,
 		priv->sm = I2C_FREQ_MODE_FAST;
 	priv->tft = 1; /* Tx FIFO threshold */
 	priv->rft = 8; /* Rx FIFO threshold */
-	priv->timeout = 200; /* Slave response timeout(ms) */
+	priv->timeout_usecs = 200 * USEC_PER_MSEC; /* Slave response timeout */
 }
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
@@ -1020,7 +1046,7 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;
-	adap->timeout = msecs_to_jiffies(priv->timeout);
+	adap->timeout = usecs_to_jiffies(priv->timeout_usecs);
 	snprintf(adap->name, sizeof(adap->name),
 		 "Nomadik I2C at %pR", &adev->res);
 

-- 
2.44.0


