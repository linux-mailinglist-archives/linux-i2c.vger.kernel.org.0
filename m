Return-Path: <linux-i2c+bounces-13614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 890C6BE9981
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 17:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD6966E7D79
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 15:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F45336ED9;
	Fri, 17 Oct 2025 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V6v37aVg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2262F336EE4
	for <linux-i2c@vger.kernel.org>; Fri, 17 Oct 2025 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760713326; cv=none; b=HjL+Z1TjV5zaZGVxX4qguAiycBURHQLlW93MZ222rsaEmk/YbzuWZUrwkt27lIVlE7c03h27OBejz08mAl+86tpFthxLoUjQRy+lSeau8/pBAsbOb/RaMZrKiJKfMnf1u9lF0ebdImI8qZx1Xtj01EOfSJPrQhzuql1s5vCchFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760713326; c=relaxed/simple;
	bh=CLWJhBu9K0krsl2W5BEPYqb1gmwqh8HxemHp6ZEorGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlVCx8Z7ohn5P3Z/H2GbZKSBXzucQxTkDESsF9V+boXisP1YglJkLUxCqOPjuzZErp23HuX1KSTkNt2SluLFgM1tgFVFgzHYqvefgD+/acg1rllejUJSuiLUHwfIMTz6ueLRWLjlw/5+lXrKP9/WPWiIC1tuVVgHyM6mRyOYuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V6v37aVg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B65AC041F9;
	Fri, 17 Oct 2025 15:01:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 727DA606DB;
	Fri, 17 Oct 2025 15:02:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1385102F2364;
	Fri, 17 Oct 2025 17:01:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760713321; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OumetMRwPwRmXg7GTajWsCFnQn15iaJvKy3TjGNKXhI=;
	b=V6v37aVgwogvdcW9UXTbBHOAWJDdPJ7oWTOX6zn3PJRGeZE92VLrH5MicWn7An8n/yL65P
	lY4YM62v7/t8AEtLNlVTQj9rSJXIrXQlUFIJmM6/9zooVWqE2wZme/HErsqokpwIy0ml7c
	WA4LXvYoC7MrwKpIMAzIDdobV+CAUFZ1zWBevf9wTTvUAd4NkjCONMBx7t0Ua2LnyjdHu9
	gy+h9df4mS/rXLNPlcWnCpsRIrVB8+75qZMXW8PzyWPu+fz1mIoZ3aY+V8ACnoluhLhE/q
	MYWzG1z0pWFWURGhD4238EUruBBewPu3kSqb4VR2c9asyVdkhVSeyUxI23K9pg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 17 Oct 2025 16:59:34 +0200
Subject: [PATCH 3/3] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251017-i2c-dw-v1-3-7b85b71c7a87@bootlin.com>
References: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
In-Reply-To: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
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

If IC_EMPTYFIFO_HOLD_MASTER_EN parameter is 0, "Stop" and "Repeated
Start" bits in command register doesn't exist, thus it is impossible to
send several consecutive write messages in a single hardware batch. The
existing implementation worked with such configuration incorrectly: all
consequent write messages joined into a single message without any
Start/Stop or Repeated Start conditions. For example, the following
command:

    i2ctransfer -y 0 w1@0x55 0x00 w1@0x55 0x01

does the same as

    i2ctransfer -y 0 w2@0x55 0x00 0x01

To fix it, for the controllers that behave this way, if the next message
to the same slave device has the same direction as the previous one, it
is sent to the controller only after the previous message is sent and
STOP_DET IRQ flag is raised by the controller.

This behavior is activated by compatible entries, because the state of
the IC_EMPTYFIFO_HOLD_MASTER_EN parameter cannot be detected at runtime.
Add the compatible entries of Mobileye SoCs needing the work-around and
sort the entries alphabetically.

There is another possible problem with this controller configuration:
When the CPU is putting commands to the FIFO, this process must not be
interrupted because if FIFO buffer gets empty, the controller finishes
the I2C transaction and generates STOP condition on the bus.

In a PREEMPT-RT kernel, interrupt handlers are by default executed in
thread and may be interrupted, which can lead to breaking an I2C message
by inserting an unwanted STOP.

To ensure proper operation on realtime kernel, use IRQF_NO_THREAD flag
when requesting IRQ.

Based on the work of Dmitry Guzman <dmitry.guzman@mobileye.com>

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-core.h    |  1 +
 drivers/i2c/busses/i2c-designware-master.c  | 45 +++++++++++++++++++++--------
 drivers/i2c/busses/i2c-designware-platdrv.c |  6 ++--
 3 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd7..a31a8698e511a 100644
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
index f9a180b145da8..e5af0439ec832 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -443,18 +443,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
 		u32 flags = msgs[dev->msg_write_idx].flags;
 
-		/*
-		 * If target address has changed, we need to
-		 * reprogram the target address in the I2C
-		 * adapter when we are done with this transfer.
-		 * This can be done after STOP_DET IRQ flag is raised.
-		 * So, disable "TX FIFO empty" interrupt.
-		 */
-		if (msgs[dev->msg_write_idx].addr != addr) {
-			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
-			break;
-		}
-
 		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
 			/* new i2c_msg */
 			buf = msgs[dev->msg_write_idx].buf;
@@ -470,6 +458,25 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 				need_restart = true;
 		}
 
+		/*
+		 * If target address has changed, we need to
+		 * reprogram the target address in the I2C
+		 * adapter when we are done with this transfer.
+		 * This can be done after STOP_DET IRQ flag is raised.
+		 * So, disable "TX FIFO empty" interrupt.
+		 * Also force a stop-then-start between two messages
+		 * in the same direction if we need to restart on a
+		 * adapter that does not handle restart.
+		 */
+		if (msgs[dev->msg_write_idx].addr != addr ||
+		    ((need_restart &&
+		     dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
+		     ((msgs[dev->msg_write_idx].flags & I2C_M_RD) ==
+		      (msgs[dev->msg_write_idx - 1].flags & I2C_M_RD))))) {
+			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
+			break;
+		}
+
 		regmap_read(dev->map, DW_IC_TXFLR, &flr);
 		tx_limit = dev->tx_fifo_depth - flr;
 
@@ -1062,6 +1069,20 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
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
+	 * during filling the FIFO buffer and possible data lost.
+	 */
+	if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER)
+		irq_flags |= IRQF_NO_THREAD;
+
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
 		return ret;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 34d881572351c..5e459175dcdb2 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -345,9 +345,11 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dw_i2c_of_match[] = {
-	{ .compatible = "snps,designware-i2c", },
-	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{ .compatible = "mobileye,eyeq6lplus-i2c", .data = (void *)NO_EMPTYFIFO_HOLD_MASTER },
+	{ .compatible = "mobileye,eyeq7h-i2c", .data = (void *)NO_EMPTYFIFO_HOLD_MASTER },
+	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
+	{ .compatible = "snps,designware-i2c", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);

-- 
2.51.0


