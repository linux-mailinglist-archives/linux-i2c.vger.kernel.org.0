Return-Path: <linux-i2c+bounces-1757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D31856A21
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 17:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 099441F23397
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64304139578;
	Thu, 15 Feb 2024 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CTzkAeoF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E141369A2;
	Thu, 15 Feb 2024 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708015963; cv=none; b=vDMVzeLxriCnDlKuly8Ua4+pzZ2O7j5+MGaYxSIgYs6kR3GWZiDsklxRW7lgkBmhsu5qMAz34xUtouefN0+2sp2veDP9HmCcDInggGqzP2mA7q2hyxlXrIWYMOcZT1hlH7b3Bld+onQI8nqyjfgTQU/XThQhEmMCIOGEUfnk4ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708015963; c=relaxed/simple;
	bh=V3gZLN+w/mkBqPuFUYzzbfQP1UJw5tQQp1kCk8OmWgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeMb8T6wUSU28LslHauZc1LfxxjXMfXuUVogfz7/25YfcehlrPD1/J2l9G4r3Oaeb5+OwBgUuk3/SnKOaIyj3qOOqx8Tbjx7pYCQryUjl9xKhWeA2YOeFNNx7VticfBPASVl6OPCcExDm6d9BC8CD0w8RtWme9x6NtVwtA6lybg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CTzkAeoF; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8CCDE0022;
	Thu, 15 Feb 2024 16:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708015958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6nKfxjjL9YJKMVRbZ9zGHy5EtFlaaVeaCPp72QOiJ54=;
	b=CTzkAeoFsqhnE2t41G4MU1FRxz/HQTMRdeIrSrPJhfiG3UcATEK9QuOADFWVMGcp42xO6f
	WFqCh2y/FWJmwopMpMnLU1Ao6zIBLB+SaGpBLHt+TjnGEjDhgWAh4bZRPjlb6GmGQjqJtg
	jAK9lQEcnliuJKMAv7/BXefpTwjIqpq6oaY7vwUfDEvb8W4G6y8su2hM5Ox6QL5RSIYUFJ
	ohzrJzPpDRqK40pAulCl1ytBhhG8LjoCombqJtUxuxMLRW1VR8vdU5kuo/XJcl+wjAqK+Z
	b32OADQNxnNWfFbf5N5yKLICuWyvK66UPUlQVgzMkaqzAfWMYmsAK+ybICjPyQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 15 Feb 2024 17:52:14 +0100
Subject: [PATCH 07/13] i2c: nomadik: support short xfer timeouts using
 waitqueue & hrtimer
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240215-mbly-i2c-v1-7-19a336e91dca@bootlin.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
In-Reply-To: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
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
X-Mailer: b4 0.12.4
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
2.43.1


