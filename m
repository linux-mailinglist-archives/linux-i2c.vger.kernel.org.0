Return-Path: <linux-i2c+bounces-13932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE9C259E0
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 15:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5513C4F81FC
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 14:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5AC34DB64;
	Fri, 31 Oct 2025 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m8L6cbPZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7D34D920;
	Fri, 31 Oct 2025 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761921368; cv=none; b=inTKba/fJXPek/x/VwUBf+Xg92f/OhSZUndzDLJHTqUYhQDSrlx3C/FHWUvNwHj2GZoltpCoec9Q3H53iU6idJXxoHbPMjxnn7lD3YzYKjNseHyEZCGmoRfOOf/yb4Yf49XCc3GsGr+rtRZn0RLa6u2HOLn1q+yrTbHcG17zXoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761921368; c=relaxed/simple;
	bh=oYqfSNYYpiWI0OuWeWxkEUd864M2lIUa8tVkyB+4/yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFQZkEnjdkEcDQONuhtptKMxs25XxD37wloJNUBbEm/H2aqD/yYM3oBZUIwcPkawYtKKJncGQEdrA+i4Dzp4xh/6KsFCkjQSoBG+PjukqRVmZWCwv440zxGMDrC+2cT0UXt4B9bH7Qg7yIuXeX7O8UmGeFkUF8jyMhfzUkioXQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m8L6cbPZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6CB5EC0E959;
	Fri, 31 Oct 2025 14:35:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED98C60704;
	Fri, 31 Oct 2025 14:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E603F11818039;
	Fri, 31 Oct 2025 15:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761921362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yjw4loEByKZMSXlcWfDPJgtA8NYHT/wALSWYb98nyPw=;
	b=m8L6cbPZmgJCiqjqzYkEPHExt+JkstsO7k6vP4FZwASJwA8kN8mCGppuK0fXspCC+eWCpm
	xqPHz0IJ8pr/+UrzdyIYULaXVVp2HBUP05lfRK96qEy/J9Sr1KIDROznexXx54Uk+SH8DW
	xwBbrmDkFOVTthuG6991Pxzie3YYRYch/AYmMlwiBijk/xfPC5dsLq9ES7k8uOoF/QoAgG
	sZ3ptJZHwOgDHxIUH4YCuHDWX4zqSoY0sDJiOsJNCuqSux2IUpXvI8s2Otd53lxze11eKn
	H4azEHPIny+2YuXHEomTrnYXcG32C4zoOecMX1accXciWNN2tX7Z1PgGAt4hSA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 31 Oct 2025 15:35:43 +0100
Subject: [PATCH v2 5/5] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251031-i2c-dw-v2-5-90416874fcc0@bootlin.com>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
In-Reply-To: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
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

In i2c_dw_xfer(), we ensure that we do not have such sequence of messages
requiring a RESTART, aborting the transfer on controller that cannot
emit them explicitly.

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
ensure that we do not keep processing a message after a FIFO underrun,
checks are added in two places.

First in i2c_dw_xfer_msg() we check the raw interrupt status register to
see if a STOP condition was detected while filling the FIFO, and abort
if so. This can happen with threaded interrupt on a PREEMPT_RT kernel
if we are preempted during the processing of each bytes of the message.

Second in i2c_dw_process_transfer(), we abort if a STOP is detected
while a read or a write is in progress. This can occur when processing
a message larger than the FIFO. In that case the message is processed in
parts, and rely on the TW EMPTY interrupt to refill the FIFO when it gets
below a threshold. If servicing this interrupt is delayed for too long,
it can trigger a FIFO underrun, thus an unwanted STOP.

Originally-by: Dmitry Guzman <dmitry.guzman@mobileye.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-core.h    |  1 +
 drivers/i2c/busses/i2c-designware-master.c  | 51 +++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
 3 files changed, 53 insertions(+)

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
index da1963d25def..329bb69485f4 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -463,6 +463,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 		rx_limit = dev->rx_fifo_depth - flr;
 
 		while (buf_len > 0 && tx_limit > 0 && rx_limit > 0) {
+			unsigned int raw_stat;
 			u32 cmd = 0;
 
 			/*
@@ -487,6 +488,21 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 				need_restart = false;
 			}
 
+			/*
+			 * With threaded interrupt on a PREEMPT-RT kernel, we may
+			 * be interrupted while filling the FIFO. Abort the
+			 * transfer in case of a FIFO underrun on controller that
+			 * emits a STOP in that case.
+			 */
+			if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER) {
+				regmap_read(dev->map, DW_IC_RAW_INTR_STAT,
+					    &raw_stat);
+				if (raw_stat & DW_IC_INTR_STOP_DET) {
+					dev->msg_err = -EIO;
+					goto done;
+				}
+			}
+
 			if (msgs[dev->msg_write_idx].flags & I2C_M_RD) {
 
 				/* Avoid rx buffer overrun */
@@ -526,6 +542,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 			dev->status &= ~STATUS_WRITE_IN_PROGRESS;
 	}
 
+done:
 	/*
 	 * If i2c_msg index search is completed, we don't need TX_EMPTY
 	 * interrupt any more.
@@ -706,6 +723,14 @@ static void i2c_dw_process_transfer(struct dw_i2c_dev *dev, unsigned int stat)
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
@@ -872,6 +897,21 @@ __i2c_dw_xfer_unlocked(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 	return ret;
 }
 
+/*
+ * Return true if the message needs an explicit RESTART before being sent.
+ * Without an explicit RESTART, two consecutive messages in the same direction
+ * will be merged into a single transfer.
+ * The adapter always emits a RESTART when the direction changes.
+ */
+static inline bool i2c_dw_msg_need_restart(struct i2c_msg msgs[], int idx)
+{
+	/* No need for a RESTART on the first message */
+	if (idx == 0)
+		return false;
+
+	return (msgs[idx - 1].flags & I2C_M_RD) == (msgs[idx].flags & I2C_M_RD);
+}
+
 static int
 i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
@@ -918,6 +958,17 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 				goto done;
 			}
 
+			/*
+			 * Make sure we don't need explicit RESTART for
+			 * controllers that cannot emit them.
+			 */
+			if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
+			    i2c_dw_msg_need_restart(msg, cnt - 1)) {
+				dev_err(dev->dev, "cannot emit RESTART\n");
+				ret = -EINVAL;
+				goto done;
+			}
+
 			if ((msg[cnt - 1].flags & I2C_M_STOP) ||
 			    (msg + cnt == msgs + num))
 				break;
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


