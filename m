Return-Path: <linux-i2c+bounces-13613-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F1BE9A21
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 17:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C8C36E7984
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 15:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38EB336EEF;
	Fri, 17 Oct 2025 15:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IQoZu3gX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FAE33509F;
	Fri, 17 Oct 2025 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760713324; cv=none; b=P1yg91NafcBnGlTw4GOGYE/Pox1aNexwjwJ5Vc7E6akEgwpVYQwlu3A0qlBjpGjA1NHGvniyMbJuCEdOObnvCIE1FR/EyoJNomB4I+rJMI5lvgNiZ5zdehg8tHkp6lbrQmvKcVQM3VO9EHzbowCY9teLTcLZcZfYCfPnT/s8z1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760713324; c=relaxed/simple;
	bh=CDYayh8Pxyj68cp2eLLP40bJ9vQMBBenjdICB9J5eb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EC+9o0ZT7PTx5ZI1vqdIGOK9nUZhhEX5PDL4sURTkAvutlHY5ZkNp8+2JNd59k3sRpH2sjSIVraLEYlplFlJkQ7tNQvjbBfMiN/RK/A6KwQd7eZvl7emylnor87IcYkA4LzFQHDmG7rklOwHP7MwJ8Tn9PNlnxP3vqoHdL0yVB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IQoZu3gX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A1E8F4E41147;
	Fri, 17 Oct 2025 15:02:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70607606DB;
	Fri, 17 Oct 2025 15:02:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CD8F102F233F;
	Fri, 17 Oct 2025 17:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760713319; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lqaqDANIG/HsBzrXDtn2cFYQaaghRdRiFDBrzoTMERw=;
	b=IQoZu3gXUKP8Ss0bOQGB6yA3mdKlITAvNvEcsuVE9sq8P640SB/VBJA5g3TD4jtmPsDT41
	HQGxjEEnB7V/CY3QRGNAgSxQ1jwdv5SiLzOHYakCWBqO+NYXHBdkcoMOQoLzQrSJOGugVN
	hfW8PI0WgXa6fvsMJaq4ndcJ5iwmiTYrGPw0EGjPXHwAYvLGGx0iBbD0GozFTWA9gEGpVM
	BHaSfe0NkzJGm9FVAnqwLh1RqcB1CMlthUIzK/03B8+pco4NejjkNd7cd2QLG0ZFZvP5TC
	DENm+kDeWSfPXNhBD4MosuKjLaWJLC6hdLVsIztCzQlFrYaxvRJEgjShz3DBQg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 17 Oct 2025 16:59:33 +0200
Subject: [PATCH 2/3] i2c: designware: Enable transfer with different target
 addresses
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251017-i2c-dw-v1-2-7b85b71c7a87@bootlin.com>
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

When i2c_dw_xfer() is called with more than one message, it sets the
target address according to the first message. If any of the following
messages have a different target address, the transfer finishes with
an error.

Instead, if the next message has a different target address, wait until
all previous messages are sent and the STOP condition is detected. This
will complete the current part of the transfer. The next part is then
handled by looping in i2c_dw_xfer(), calling i2c_dw_xfer_init() and
i2c_dw_wait_transfer() until all messages of the transfer have been
processed, or an error is detected.

The RESTART bit is now set after the first message of each part of the
transfer, instead of just after the very first message of the whole
transfer.

For each address change, i2c_dw_xfer_init() is called, which takes care
of disabling the adapter before changing the target address register,
then re-enabling it. Given that we cannot know the value of the
I2C_DYNAMIC_TAR_UPDATE parameter, this is the only sure way to change
the target address.

Based on the work of Dmitry Guzman <dmitry.guzman@mobileye.com>

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 58 ++++++++++++++++--------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7a72c28786c2..f9a180b145da8 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -436,6 +436,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	u8 *buf = dev->tx_buf;
 	bool need_restart = false;
 	unsigned int flr;
+	int first_idx = dev->msg_write_idx;
 
 	intr_mask = DW_IC_INTR_MASTER_MASK;
 
@@ -446,11 +447,11 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 		 * If target address has changed, we need to
 		 * reprogram the target address in the I2C
 		 * adapter when we are done with this transfer.
+		 * This can be done after STOP_DET IRQ flag is raised.
+		 * So, disable "TX FIFO empty" interrupt.
 		 */
 		if (msgs[dev->msg_write_idx].addr != addr) {
-			dev_err(dev->dev,
-				"%s: invalid target address\n", __func__);
-			dev->msg_err = -EINVAL;
+			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
 			break;
 		}
 
@@ -465,7 +466,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 			 * set restart bit between messages.
 			 */
 			if ((dev->master_cfg & DW_IC_CON_RESTART_EN) &&
-					(dev->msg_write_idx > 0))
+					(dev->msg_write_idx > first_idx))
 				need_restart = true;
 		}
 
@@ -822,7 +823,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		break;
 	}
 
-	reinit_completion(&dev->cmd_complete);
 	dev->msgs = msgs;
 	dev->msgs_num = num;
 	dev->cmd_err = 0;
@@ -841,18 +841,33 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	if (ret < 0)
 		goto done;
 
-	/* Start the transfers */
-	i2c_dw_xfer_init(dev);
+	do {
+		reinit_completion(&dev->cmd_complete);
 
-	/* Wait for tx to complete */
-	ret = i2c_dw_wait_transfer(dev);
-	if (ret) {
-		dev_err(dev->dev, "controller timed out\n");
-		/* i2c_dw_init_master() implicitly disables the adapter */
-		i2c_recover_bus(&dev->adapter);
-		i2c_dw_init_master(dev);
-		goto done;
-	}
+		/* Start the transfers */
+		i2c_dw_xfer_init(dev);
+
+		/* Wait for tx to complete */
+		ret = i2c_dw_wait_transfer(dev);
+		if (ret) {
+			dev_err(dev->dev, "controller timed out\n");
+			/* i2c_dw_init_master() implicitly disables the adapter */
+			i2c_recover_bus(&dev->adapter);
+			i2c_dw_init_master(dev);
+			goto done;
+		}
+
+		if (dev->msg_err) {
+			ret = dev->msg_err;
+			goto done;
+		}
+
+		/* We have an error */
+		if (dev->cmd_err == DW_IC_ERR_TX_ABRT) {
+			ret = i2c_dw_handle_tx_abort(dev);
+			goto done;
+		}
+	} while (dev->msg_write_idx < num);
 
 	/*
 	 * This happens rarely (~1:500) and is hard to reproduce. Debug trace
@@ -874,23 +889,12 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	 */
 	__i2c_dw_disable_nowait(dev);
 
-	if (dev->msg_err) {
-		ret = dev->msg_err;
-		goto done;
-	}
-
 	/* No error */
 	if (likely(!dev->cmd_err && !dev->status)) {
 		ret = num;
 		goto done;
 	}
 
-	/* We have an error */
-	if (dev->cmd_err == DW_IC_ERR_TX_ABRT) {
-		ret = i2c_dw_handle_tx_abort(dev);
-		goto done;
-	}
-
 	if (dev->status)
 		dev_err(dev->dev,
 			"transfer terminated early - interrupt latency too high?\n");

-- 
2.51.0


