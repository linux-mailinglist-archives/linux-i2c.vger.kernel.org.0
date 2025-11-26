Return-Path: <linux-i2c+bounces-14280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E79C8961E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 11:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E51503455C4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04FF3242CE;
	Wed, 26 Nov 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TG8YJP0o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5996322A21
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154023; cv=none; b=jcNwm3UNPeOGeh49Kxr2ALGLfIk3k0KV9UWCy7K4Kj3JGwyg0nEh13o+KQnRivXSz09mLR4nLU4ycbFJwfIL3ib8mWOgIiYsXCH3U7/Gc8Qq7PNblopuaAB58KulinVIYvHQE31Ullfs2YfeG2TK+MtnUgrfuWnkvWZ1tteaJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154023; c=relaxed/simple;
	bh=zfNxIsoGGcHLp4dAZtbBdFX5D0e6AXXZvgFVxvU84fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVTfKAOf/4g1yVdVSY921jN1czcOEY7vK161yECWXPPfMP0RxPCVroEQ0hjFlRjOf12he4ve2sW8W61DFauosWxztMdMwYSIBAsxFWEux+K8sfwWQqn7/pr0dSRM/CEm3AUZ7CaQZwQq5GkZlt4t4n7jWuegsqZYj9xGQWkC6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TG8YJP0o; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5EB544E418DE;
	Wed, 26 Nov 2025 10:46:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35DD660721;
	Wed, 26 Nov 2025 10:46:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC19F102F08E5;
	Wed, 26 Nov 2025 11:46:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764154018; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aL19MBw9rbt+Wa3zJ/ps4nC2JNiqTqhjMhgiPrDJBog=;
	b=TG8YJP0o2/imzBbXwob/bYHNMd5Kzoq6+RE73scw4AlMIA0xUvjefKKGhfRAoYUUsRLlpq
	wf0Fkt/RBgFfl9oZa33bXTR9JVxMWGrSbJHpl5GzoSBTmgDCuMwXx+n039WtTTHhshmB0c
	utgsV0DohjhFn7XE9FtwEfCeHVwxXfJA0EN7skGh+Hk0JEEzQ1GeVIAeKgVvDjmpy3A/ZJ
	jKsq9hIZ3LlLBhoB+nwgFE86XfYy9VfN9nUZFsiE9LymvrCGp96eefBROcZagLsGmmOF0A
	MB4wAaR2WdXyBLypvORJgfjXqkouoOjwkU6olGnU7+ZMuZDZd0zQKhScaqSYgA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 26 Nov 2025 11:46:30 +0100
Subject: [PATCH v4 7/7] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251126-i2c-dw-v4-7-b0654598e7c5@bootlin.com>
References: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
In-Reply-To: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

If IC_EMPTYFIFO_HOLD_MASTER_EN parameter is 0, "Stop" and "Repeated Start"
bits in command register does not exist, thus it is impossible to send
several consecutive write messages in a single hardware batch. The
existing implementation worked with such configuration incorrectly:
all consecutive write messages are joined into a single message without
any Start/Stop or Repeated Start conditions. For example, the following
command:

    i2ctransfer -y 0 w1@0x55 0x00 w1@0x55 0x01

does the same as

    i2ctransfer -y 0 w2@0x55 0x00 0x01

In i2c_dw_msg_is_valid(), we ensure that we do not have such sequence
of messages requiring a RESTART, aborting the transfer on controller
that cannot emit them explicitly.

This behavior is activated by compatible entries because the state of
the IC_EMPTYFIFO_HOLD_MASTER_EN parameter cannot be detected at runtime.
The new flag emptyfifo_hold_master reflects the state of the parameter,
it is set to true for all controllers except those found in Mobileye
SoCs. For now, the controllers in Mobileye SoCs are the only ones known
to need the workaround. The behavior of the driver is left unmodified
for other controllers.

There is another possible problem with this controller configuration:
When the CPU is putting commands to the FIFO, this process must not be
interrupted because if FIFO buffer gets empty, the controller finishes
the I2C transaction and generates STOP condition on the bus.

If we continue writing the remainder of the message to the FIFO, the
controller will start emitting a new transaction with those data. This
turns a single a single message into multiple I2C transactions. To
protect against FIFO underrun, two changes are done:

First we flag the interrupt with IRQF_NO_THREAD, to prevent it from
running in a thread on PREEMPT-RT kernel. This ensures that we are not
interrupted when filling the FIFO as it is very time-senstive. For
example, being preempted after writing a single byte in the FIFO with
a 1MHz bus gives us only 18µs before an underrun.

Second in i2c_dw_process_transfer(), we abort if a STOP is detected
while a read or a write is in progress. This can occur when processing
a message larger than the FIFO. In that case the message is processed in
parts, and rely on the TX EMPTY interrupt to refill the FIFO when it gets
below a threshold. If servicing this interrupt is delayed for too long,
it can trigger a FIFO underrun, thus an unwanted STOP.

Originally-by: Dmitry Guzman <dmitry.guzman@mobileye.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-common.c  |  6 ++++++
 drivers/i2c/busses/i2c-designware-core.h    |  3 +++
 drivers/i2c/busses/i2c-designware-master.c  | 32 +++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 4 files changed, 42 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4ac..446d567eafeb 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -388,6 +388,12 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 
 	dev->clk_freq_optimized = device_property_read_bool(device, "snps,clk-freq-optimized");
 
+	/* Mobileye controllers do not hold the clock on empty FIFO */
+	if (device_is_compatible(device, "mobileye,eyeq6lplus-i2c"))
+		dev->emptyfifo_hold_master = false;
+	else
+		dev->emptyfifo_hold_master = true;
+
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (is_of_node(fwnode))
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..620472b15730 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -246,6 +246,8 @@ struct reset_control;
  * @clk_freq_optimized: if this value is true, it means the hardware reduces
  *	its internal clock frequency by reducing the internal latency required
  *	to generate the high period and low period of SCL line.
+ * @emptyfifo_hold_master: true if the controller acting as master holds
+ *	the clock when the Tx FIFO is empty instead of emitting a stop.
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -305,6 +307,7 @@ struct dw_i2c_dev {
 	struct i2c_bus_recovery_info rinfo;
 	u32			bus_capacitance_pF;
 	bool			clk_freq_optimized;
+	bool			emptyfifo_hold_master;
 };
 
 #define ACCESS_INTR_MASK			BIT(0)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 907597c7a05c..cef2231a2571 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -710,6 +710,14 @@ static void i2c_dw_process_transfer(struct dw_i2c_dev *dev, unsigned int stat)
 	if (stat & DW_IC_INTR_TX_EMPTY)
 		i2c_dw_xfer_msg(dev);
 
+	/* Abort if we detect a STOP in the middle of a read or a write */
+	if ((stat & DW_IC_INTR_STOP_DET) &&
+	    (dev->status & (STATUS_READ_IN_PROGRESS | STATUS_WRITE_IN_PROGRESS))) {
+		dev_err(dev->dev, "spurious STOP detected\n");
+		dev->rx_outstanding = 0;
+		dev->msg_err = -EIO;
+	}
+
 	/*
 	 * No need to modify or disable the interrupt mask here.
 	 * i2c_dw_xfer_msg() will take care of it according to
@@ -892,6 +900,16 @@ i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t i
 		return false;
 	}
 
+	/*
+	 * Make sure we don't need explicit RESTART between two messages
+	 * in the same direction for controllers that cannot emit them.
+	 */
+	if (!dev->emptyfifo_hold_master &&
+	    (msgs[idx - 1].flags & I2C_M_RD) == (msgs[idx].flags & I2C_M_RD)) {
+		dev_err(dev->dev, "cannot emit RESTART\n");
+		return false;
+	}
+
 	return true;
 }
 
@@ -1110,6 +1128,20 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
 	}
 
+	/*
+	 * The first writing to TX FIFO buffer causes transmission start.
+	 * If IC_EMPTYFIFO_HOLD_MASTER_EN is not set, when TX FIFO gets
+	 * empty, I2C controller finishes the transaction. If writing to
+	 * FIFO is interrupted, FIFO can get empty and the transaction will
+	 * be finished prematurely. FIFO buffer is filled in IRQ handler,
+	 * but in PREEMPT_RT kernel IRQ handler by default is executed
+	 * in thread that can be preempted with another higher priority
+	 * thread or an interrupt. So, IRQF_NO_THREAD flag is required in
+	 * order to prevent any preemption when filling the FIFO.
+	 */
+	if (!dev->emptyfifo_hold_master)
+		irq_flags |= IRQF_NO_THREAD;
+
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d7d764f7554d..f1714d287462 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -346,6 +346,7 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{ .compatible = "mobileye,eyeq6lplus-i2c" },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "snps,designware-i2c" },
 	{}

-- 
2.52.0


