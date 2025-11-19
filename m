Return-Path: <linux-i2c+bounces-14172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D185BC6FA0C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 16:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F7773A1C35
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 15:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374223730F0;
	Wed, 19 Nov 2025 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cUJflAV7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71C736C0C6;
	Wed, 19 Nov 2025 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564763; cv=none; b=G88NYnr0GCpPJExxBVBw6kdO00V5ZrnsL/FFfhCG9yl/2vDHJxTM4dHRhlTFrFdDMPMxWIt1BmQ/tR76f0zk/Xpaz2OMVmu8tp5YFcZ5JLEq42UNcgXg/hGAMLWNjCQ2qzPi22VfCKsW+9lrhlkYV9kfXsMmMtD9OZzITYjPPCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564763; c=relaxed/simple;
	bh=LhCfcJ35YQcG/24/9rqQ3ufLfEUur75OY9iQ8U3ea6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dzgfhno/8Rbts8kTeKr8u0rBR1npLaKVDGRnccwCriWHI1RpYiITWuWR4TO9tLzUGGlGE5QFE0xp/xyJliLOFNjFYs51ZGQnm2DUeJqXEl7Y9NVzH281q1t6UO7Nncp7BLBxVM/L7te2Ehn8TvOYO+wcgwybrCAH8yNwDp5+79g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cUJflAV7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6DD3A4E417AB;
	Wed, 19 Nov 2025 15:06:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CB1F60699;
	Wed, 19 Nov 2025 15:06:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A933310371A6A;
	Wed, 19 Nov 2025 16:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763564759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8hxzXQ0hH1z9qNYjukKB00iVarsR6FUGtWFVY0f4TCI=;
	b=cUJflAV7FUTGdVeNB1FRN/uMjD5g4Ib1J0GP7XRMZxBpWzuf7fikbWbzClsyUvsN3D0CMc
	JHvjO9wk8XLitWKXK7weGjZTEemzauhRDBzagc5fxBtN13GSFxC0HU5UCjMM0yI3BEAHuH
	A0R0dA3wq4IBNzANeN4GoIEqOfZ77b92gq7cxyy8SEYSx8GkjeW4dfnueOCEuBeJMt4qCH
	seeL5joNtEuSbAAKA4l/Q6YvpR/w+8ZmX3+E9P0xnju7rL4WZ7PjtgqixXdby0Z5/zFNh1
	X38v8BuaxGlsQGISimdJwh5d3ojAOzn2ueOT/wd1H3E3JNozMbznRiFL5EjvBg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 19 Nov 2025 16:05:35 +0100
Subject: [PATCH v3 6/7] i2c: designware: Implement I2C_M_STOP support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251119-i2c-dw-v3-6-bc4bc2a2cbac@bootlin.com>
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

Add the support of the I2C_M_STOP flag in i2c_msg by splitting
i2c_dw_xfer() in two: __i2c_dw_xfer_one_part() for the core transfer logic
and i2c_dw_xfer() for handling the high-level transaction management.

In detail __i2c_dw_xfer_one_part() starts a transaction and wait for its
completion, either with a STOP on the bus or an error. i2c_dw_xfer()
loops over the messages to search for the I2C_M_STOP flag and calls
__i2c_dw_xfer_one_part() for each part of the messages up to a STOP or
the end of the messages array.

i2c_dw_xfer() takes care of runtime PM and holds the hardware lock on
the bus while calling __i2c_dw_xfer_one_part(), this allows grouping
multiple accesses to device that support a STOP in a transaction when
done via i2c_dev I2C_RDWR ioctl.

Also, now that we have a lookup of the messages in i2c_dw_xfer() prior
to each transaction, we use it to make sure the messages are valid for
the transaction. We check that the target address does not change before
starting the transaction instead of aborting the transfer while it is
happening, as it was done in i2c_dw_xfer_msg(). The target address can
only be changed after an I2C_M_STOP flag, i.e after a STOP on the i2c bus.

The I2C_FUNC_PROTOCOL_MANGLING flag is added to the list of
functionalities supported by the controller, except for the AMD NAVI
i2c controller which uses its own xfer() function and is left untouched.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 108 +++++++++++++++++++++--------
 1 file changed, 81 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 12a1194bec52..2977c13c709c 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -435,7 +435,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	struct i2c_msg *msgs = dev->msgs;
 	u32 intr_mask;
 	int tx_limit, rx_limit;
-	u32 addr = msgs[dev->msg_write_idx].addr;
 	u32 buf_len = dev->tx_buf_len;
 	u8 *buf = dev->tx_buf;
 	bool need_restart = false;
@@ -446,18 +445,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
 		u32 flags = msgs[dev->msg_write_idx].flags;
 
-		/*
-		 * If target address has changed, we need to
-		 * reprogram the target address in the I2C
-		 * adapter when we are done with this transfer.
-		 */
-		if (msgs[dev->msg_write_idx].addr != addr) {
-			dev_err(dev->dev,
-				"%s: invalid target address\n", __func__);
-			dev->msg_err = -EINVAL;
-			break;
-		}
-
 		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
 			/* new i2c_msg */
 			buf = msgs[dev->msg_write_idx].buf;
@@ -805,20 +792,15 @@ static int i2c_dw_wait_transfer(struct dw_i2c_dev *dev)
 }
 
 /*
- * Prepare controller for a transaction and call i2c_dw_xfer_msg.
+ * Prepare controller for a transaction, start the transfer of the msgs
+ * and wait for completion, either a STOP or a error.
+ * Return the number of messages transferred or a negative error code.
  */
 static int
-i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+__i2c_dw_xfer_one_part(struct dw_i2c_dev *dev, struct i2c_msg *msgs, size_t num)
 {
-	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 	int ret;
 
-	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
-
-	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
-	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
-		return -ENXIO;
-
 	reinit_completion(&dev->cmd_complete);
 	dev->msgs = msgs;
 	dev->msgs_num = num;
@@ -830,10 +812,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	dev->abort_source = 0;
 	dev->rx_outstanding = 0;
 
-	ret = i2c_dw_acquire_lock(dev);
-	if (ret)
-		return ret;
-
 	ret = i2c_dw_wait_bus_not_busy(dev);
 	if (ret < 0)
 		goto done;
@@ -894,10 +872,83 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	ret = -EIO;
 
+done:
+	return ret;
+}
+
+/*
+ * Check that the message pointed by @idx in the @msgs array
+ * respects the limitation of the controller.
+ */
+static inline bool
+i2c_dw_msg_is_valid(struct dw_i2c_dev *dev, const struct i2c_msg *msgs, size_t idx)
+{
+	/* The first message of a transaction is valid */
+	if (!idx)
+		return true;
+
+	/*
+	 * We cannot change the target address during a transaction, so make
+	 * sure the address is identical to the one of the previous message.
+	 */
+	if (msgs[idx - 1].addr != msgs[idx].addr) {
+		dev_err(dev->dev, "invalid target address\n");
+		return false;
+	}
+
+	return true;
+}
+
+static int
+i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+	struct i2c_msg *msgs_part;
+	size_t cnt;
+	int ret;
+
+	dev_dbg(dev->dev, "msgs: %d\n", num);
+
+	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
+	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
+		return -ENXIO;
+
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * If the I2C_M_STOP is present in some the messages,
+	 * we do one transaction for each part up to the STOP.
+	 */
+	for (msgs_part = msgs; msgs_part < msgs + num; msgs_part += cnt) {
+		/*
+		 * Count the messages in a transaction, up to a STOP
+		 * or the end of the msgs.
+		 */
+		for (cnt = 1; ; cnt++) {
+			if (!i2c_dw_msg_is_valid(dev, msgs_part, cnt - 1)) {
+				ret = -EINVAL;
+				goto done;
+			}
+
+			if ((msgs_part[cnt - 1].flags & I2C_M_STOP) ||
+			    (msgs_part + cnt == msgs + num))
+				break;
+		}
+
+		/* transfer one part up to a STOP */
+		ret = __i2c_dw_xfer_one_part(dev, msgs_part, cnt);
+		if (ret < 0)
+			break;
+	}
+
 done:
 	i2c_dw_release_lock(dev);
 
-	return ret;
+	if (ret < 0)
+		return ret;
+	return num;
 }
 
 static const struct i2c_algorithm i2c_dw_algo = {
@@ -920,6 +971,9 @@ void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 
 	dev->functionality = I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONALITY;
 
+	if ((dev->flags & MODEL_MASK) != MODEL_AMD_NAVI_GPU)
+		dev->functionality |= I2C_FUNC_PROTOCOL_MANGLING;
+
 	dev->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE |
 			  DW_IC_CON_RESTART_EN;
 

-- 
2.51.1


