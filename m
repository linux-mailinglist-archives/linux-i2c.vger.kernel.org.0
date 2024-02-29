Return-Path: <linux-i2c+bounces-2066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC5186D1A9
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 19:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 656E71C2136A
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 18:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9285716062E;
	Thu, 29 Feb 2024 18:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Cpk14BfT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2FD7A14B;
	Thu, 29 Feb 2024 18:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230261; cv=none; b=U2dY8kG727MyqNMUfWDnTx1qxgTzCCtH4ew1w+yMKYKYL2jVdO5f6bHvu1CBkG6AKMBbo/4k5jhSMFWZSTuwx7s7r558XGs5m/hVCzVLCoUEehOkv8IM8dIiCEDpmy2sONZM4p/IQdw/R8gfyGmwkN1cbLu0Gie9p6gT5DXra5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230261; c=relaxed/simple;
	bh=mP9ABIgXPEmFGqEbjqxNjXtSeS2IMK9lm00xUoVbHRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n336SSFiKB8tJiw9UoK8DU7VaC4ayDqgcuTYLn8xbkzWqYiPOwH4FE7zy7ISRC4jhYxVeMJ6DZkfq/OPpAXNiOB/0FU79C2iabDB2R7NZaGUKPlpHUuTbKBpLhrv4on+5lBmCpRZF5LcV5cc0BG8Yjdw5aMrMhkyyuxnRlj2fpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Cpk14BfT; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D4C56000C;
	Thu, 29 Feb 2024 18:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709230257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhbJWAePeOlXAq18CeK+BoWzpOuEusDTkmL/xbVCgow=;
	b=Cpk14BfTCsFsOT/2tbMt0Vk1Ye2bt8g6YUDNumx8MIh2aiob7GdyK7qkaCvlqqEj2ipnIH
	iKN6jI5I/KE/Rm/n5JZnpRrXFr6uQjlFj3l08/yZuDzSkDlEiV4WxhvamL3IUYefC9mzl5
	Gi0EKaaGvlarxBTJ8/pJk3/woOtadfI6z/1W1j+NVIRXBPhrkCoMbx5YmDROX+R7xwYtMT
	8I4NA4T4BJDAEFO2tD0k5liRSPVLm2qnGdrCagoYYigkgrRdQYe/wKk4asJDBnwCAO0MWL
	biPHbX4EFuIjkoFK0C1DiRrj1X7RShSSHXFnWuxsXeKJTdtX5yUJg7sz0gkGGg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 29 Feb 2024 19:10:54 +0100
Subject: [PATCH v2 06/11] i2c: nomadik: support short xfer timeouts using
 waitqueue & hrtimer
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240229-mbly-i2c-v2-6-b32ed18c098c@bootlin.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
In-Reply-To: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
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
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
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
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 70 +++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index aa68ab402b10..e68b8e0d7919 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -162,10 +162,11 @@ struct i2c_nmk_client {
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
@@ -179,10 +180,11 @@ struct nmk_i2c_dev {
 	u32				clk_freq;
 	unsigned char			tft;
 	unsigned char			rft;
-	int				timeout;
+	int				timeout_usecs;
 	enum i2c_freq_mode		sm;
 	int				stop;
-	struct completion		xfer_complete;
+	struct wait_queue_head		xfer_wq;
+	bool				xfer_done;
 	int				result;
 };
 
@@ -434,6 +436,22 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
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
@@ -445,9 +463,9 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
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
@@ -459,7 +477,8 @@ static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	/* enable the controller */
 	i2c_set_bit(priv->virtbase + I2C_CR, I2C_CR_PE);
 
-	init_completion(&priv->xfer_complete);
+	init_waitqueue_head(&priv->xfer_wq);
+	priv->xfer_done = false;
 
 	/* enable interrupts by setting the mask */
 	irq_mask = (I2C_IT_RXFNF | I2C_IT_RXFF |
@@ -475,10 +494,9 @@ static int read_i2c(struct nmk_i2c_dev *priv, u16 flags)
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
@@ -513,9 +531,9 @@ static void fill_tx_fifo(struct nmk_i2c_dev *priv, int no_bytes)
  */
 static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 {
-	u32 status = 0;
 	u32 mcr, irq_mask;
-	unsigned long timeout;
+	u32 status = 0;
+	bool xfer_done;
 
 	mcr = load_i2c_mcr_reg(priv, flags);
 
@@ -528,7 +546,8 @@ static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
 	/* enable the controller */
 	i2c_set_bit(priv->virtbase + I2C_CR, I2C_CR_PE);
 
-	init_completion(&priv->xfer_complete);
+	init_waitqueue_head(&priv->xfer_wq);
+	priv->xfer_done = false;
 
 	/* enable interrupts by settings the masks */
 	irq_mask = (I2C_IT_TXFOVR | I2C_IT_MAL | I2C_IT_BERR);
@@ -554,10 +573,9 @@ static int write_i2c(struct nmk_i2c_dev *priv, u16 flags)
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
@@ -807,7 +825,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 				priv->cli.count);
 			init_hw(priv);
 		}
-		complete(&priv->xfer_complete);
+		priv->xfer_done = true;
+		wake_up(&priv->xfer_wq);
+
 
 		break;
 
@@ -817,7 +837,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 		init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_MAL);
-		complete(&priv->xfer_complete);
+		priv->xfer_done = true;
+		wake_up(&priv->xfer_wq);
+
 
 		break;
 
@@ -834,7 +856,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 			init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_BERR);
-		complete(&priv->xfer_complete);
+		priv->xfer_done = true;
+		wake_up(&priv->xfer_wq);
+
 	}
 	break;
 
@@ -848,7 +872,9 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 		init_hw(priv);
 
 		dev_err(dev, "Tx Fifo Over run\n");
-		complete(&priv->xfer_complete);
+		priv->xfer_done = true;
+		wake_up(&priv->xfer_wq);
+
 
 		break;
 
@@ -949,7 +975,7 @@ static void nmk_i2c_of_probe(struct device_node *np,
 		priv->sm = I2C_FREQ_MODE_FAST;
 	priv->tft = 1; /* Tx FIFO threshold */
 	priv->rft = 8; /* Rx FIFO threshold */
-	priv->timeout = 200; /* Slave response timeout(ms) */
+	priv->timeout_usecs = 200 * USEC_PER_MSEC; /* Slave response timeout */
 }
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
@@ -1009,7 +1035,7 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;
-	adap->timeout = msecs_to_jiffies(priv->timeout);
+	adap->timeout = usecs_to_jiffies(priv->timeout_usecs);
 	snprintf(adap->name, sizeof(adap->name),
 		 "Nomadik I2C at %pR", &adev->res);
 

-- 
2.44.0


