Return-Path: <linux-i2c+bounces-14173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430CC6FA21
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 16:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A840383D5A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 15:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C0D377E98;
	Wed, 19 Nov 2025 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c38y875G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8531E2BDC0C;
	Wed, 19 Nov 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564767; cv=none; b=NfIZoqOmd0qWvi1MpxtmwUwDBPpNdGtkLBceGOlaU4bnfWLTkUrYF+8EsDJTmKVuN3bggQQsyml7odZloIatVw0JxJemznHruUH828H341ZJHO15Uj1QeLnBcmYY0/iRoW61+dpBOEGbkXDYl0eFeP3N8DFHO3ebAttaMR88BYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564767; c=relaxed/simple;
	bh=XMjhU5xBGVE+BteNaWxQS1rFxs2lHbDdMUeAq5fPn98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrI+IRLShqS/XrWD004+i7FZ/BGnoF0sUl5XyQjrKx0RKaitW0bNPiea/0oKKGy/gpiFCth6k9YbU0IbNIwziOgpDIrwhsV1cJZPXzfcklpX9LJ7QERHYINlf+8tChZgTs78sldF+r/lmwSJVJueDRhrrg1wxq4ONCjfPjzrYBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c38y875G; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D42E4E417AC;
	Wed, 19 Nov 2025 15:06:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEED360699;
	Wed, 19 Nov 2025 15:06:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E61D10371A7C;
	Wed, 19 Nov 2025 16:05:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763564761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qlwe5TwEIuTzD/7egh2Z/AjPfw+YwtKdtWet50MaR+k=;
	b=c38y875GsbRAeytEOKF6p/L4tbghDOm1SE2hMHoTclk8/RZfYgz5QS8zv0W4hWUHTR6N5U
	Z6tOCP4ga/nWYTYwhesK/SM6U5cQg99UcVk5pZGO038mrguJgN5v0ULGi7Qd/PYRjwt3N1
	j7cCL/OsQX7IOj3M1aQvCWiDORvQfku4NMjeXXtf5x05hGbTxJp43FL/9TheQuyhu71T5h
	PXnbmfIkbLZ//r2bKaivP/dLq6pOTN1zVtmTz0ymJrNoMMA6THkmnEI94AvMr5EH1DAAph
	BZv6UJ03FBp7ItL/w8U+7P90EFS4lhajbI7dEzD3Bq66ZVGUzRKhu0rRRmkF9Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 19 Nov 2025 16:05:36 +0100
Subject: [PATCH v3 7/7] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251119-i2c-dw-v3-7-bc4bc2a2cbac@bootlin.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
In-Reply-To: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
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
Add the compatible entry for Mobileye SoCs needing the workaround.

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
 drivers/i2c/busses/i2c-designware-core.h    |  1 +
 drivers/i2c/busses/i2c-designware-master.c  | 32 +++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 3 files changed, 34 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..a31a8698e511 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -311,6 +311,7 @@ struct dw_i2c_dev {
 #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
 #define ARBITRATION_SEMAPHORE			BIT(2)
 #define ACCESS_POLLING				BIT(3)
+#define NO_EMPTYFIFO_HOLD_MASTER		BIT(4)
 
 #define MODEL_MSCC_OCELOT			BIT(8)
 #define MODEL_BAIKAL_BT1			BIT(9)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 2977c13c709c..3486a8c760e0 100644
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
@@ -896,6 +904,16 @@ i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t i
 		return false;
 	}
 
+	/*
+	 * Make sure we don't need explicit RESTART between two messages
+	 * in the same direction for controllers that cannot emit them.
+	 */
+	if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
+	    (msgs[idx - 1].flags & I2C_M_RD) == (msgs[idx].flags & I2C_M_RD)) {
+		dev_err(dev->dev, "cannot emit RESTART\n");
+		return false;
+	}
+
 	return true;
 }
 
@@ -1113,6 +1131,20 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
 	}
 
+	/*
+	 * The first writing to TX FIFO buffer causes transmission start. If
+	 * IC_EMPTYFIFO_HOLD_MASTER_EN is not set, when TX FIFO gets empty, I2C
+	 * controller finishes the transaction. If writing to FIFO is
+	 * interrupted, FIFO can get empty and the transaction will be finished
+	 * prematurely. FIFO buffer is filled in IRQ handler, but in PREEMPT_RT
+	 * kernel IRQ handler by default is executed in thread that can be
+	 * preempted with another higher priority thread or an interrupt. So,
+	 * IRQF_NO_THREAD flag is required in order to prevent any preemption
+	 * when filling the FIFO.
+	 */
+	if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER)
+		irq_flags |= IRQF_NO_THREAD;
+
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d7d764f7554d..4aad3dc51fbc 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -346,6 +346,7 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{ .compatible = "mobileye,eyeq6lplus-i2c", .data = (void *)NO_EMPTYFIFO_HOLD_MASTER },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "snps,designware-i2c" },
 	{}

-- 
2.51.1


