Return-Path: <linux-i2c+bounces-15287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 32103D3C3E2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A206B542C56
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEA93E9F9B;
	Tue, 20 Jan 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eIRWKPHy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2203DA7D5
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901313; cv=none; b=Jc7Rrzgtc072StCKCCeDE1/wgWzfdFLi5+pH1pwxM1eB6jUJ9tnNJ032oIJ31LTYH+aK1E5mrmaCi/iVRyZpFMHMyCIsgFPm7xwB1aiUtUEjVtMO0EdrucppprLNU2d22YkGjZAawZ9NInuz/JS94EGZicQgI7gbizVPiMSY090=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901313; c=relaxed/simple;
	bh=UvCBtd+0WytDlAjKySJ/wr6A6eol4G1jcsXPkIdCnRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DA8JQxqrGh7YCoEunRh0vSOKCGNHUXwpXHNjEfVI0o+TuRFYUUifuYHQ5hk6BLZLPdTUEAZMLbEOILF063kKUMX9zRfY+Tj2hZ6IeYxQVzinKuMLbuqLgAPp7LrfY/9uJ0Rc/CHqD6bjztCQImZc7cq8jtml4dH0Bo8XZLBfDWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eIRWKPHy; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3E83F1A295C;
	Tue, 20 Jan 2026 09:28:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13AE9606AB;
	Tue, 20 Jan 2026 09:28:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D984210B6B33E;
	Tue, 20 Jan 2026 10:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768901308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H05iW0kzIWEOui1ZiKX8TzTjaxK0Vd5WNaHAzBzB53I=;
	b=eIRWKPHy4GwABI4jjUZTCJJAhLEGtM9T/jQXeHU+qXYl7JuUDUlNltdRzYVBFCrqfxhYTe
	cAl3K/+cTu3QodFUELXkuQ/d8l9oHZFG9y0XkiW3yPio6Fdn2R1O51Tld1PVHkegkRcOl9
	nsnrn6Oy53ZEFQLRlG8Hu7vLRVw9R35FCYWJ4TgFnMrtjnverMA3Xl+cCwLcgO3lDAu7CO
	HaPUqHcIyE3SheY3fnmGxeIE+11GWFDKJXzD3VekWueTdfD9bWJTFypLU2iwCT3bDim6+E
	uAGG7Zso4NgZpXWM3xN1ulkge7YcczJSbZVsjisYZ1tE6iDQyhZmhL9JafE/mw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 20 Jan 2026 10:28:06 +0100
Subject: [PATCH v5 6/6] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-i2c-dw-v5-6-0e34d6d9455c@bootlin.com>
References: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
In-Reply-To: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
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
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
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
index bb5ce0a382f9..215b6161f242 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -247,6 +247,8 @@ struct reset_control;
  * @clk_freq_optimized: if this value is true, it means the hardware reduces
  *	its internal clock frequency by reducing the internal latency required
  *	to generate the high period and low period of SCL line.
+ * @emptyfifo_hold_master: true if the controller acting as master holds
+ *	the clock when the Tx FIFO is empty instead of emitting a stop.
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -306,6 +308,7 @@ struct dw_i2c_dev {
 	struct i2c_bus_recovery_info rinfo;
 	u32			bus_capacitance_pF;
 	bool			clk_freq_optimized;
+	bool			emptyfifo_hold_master;
 };
 
 #define ACCESS_INTR_MASK			BIT(0)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index ebebd8e0409c..ac4fbb6aa6ab 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -717,6 +717,14 @@ static void i2c_dw_process_transfer(struct dw_i2c_dev *dev, unsigned int stat)
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
@@ -899,6 +907,16 @@ i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t i
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
 
@@ -1117,6 +1135,20 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
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
index 077b34535ec7..0fe6f10a14c0 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -335,6 +335,7 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{ .compatible = "mobileye,eyeq6lplus-i2c" },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "snps,designware-i2c" },
 	{}

-- 
2.52.0


