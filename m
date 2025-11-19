Return-Path: <linux-i2c+bounces-14171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635CC6FA4B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 16:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 674BA3460BC
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 15:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6753702E8;
	Wed, 19 Nov 2025 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gx/4zp65"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434F36CDF4;
	Wed, 19 Nov 2025 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564760; cv=none; b=SpaOspkhUU/yjJkiw7j4tRl8Wlg3DnCBm/PQPoirwRkPSr3QHcXrfvfmwIUyw5Q2MjhPyFsGHFlnEPqTn4KdmjDeDqz4CibVV7sS51sbJvsFzIzFH94h/fvpXMyZScoYLe6mru+L3LRbe95BvH8QvFAm+QfKJ2KPFDhh4nK2RRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564760; c=relaxed/simple;
	bh=IHl2DvpSuwQKADH4Pe7EPdpN4Sz/hS3LMkepCgaFm/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1XNyOYBIdgf8QfYvXJcS4QSrbuspkN7cFTCSyosfuqJd9bN7JOfyAoeKuHB/uea9UIKB0OKOUycvN9uqbf3RozdhLaAIDnAfCjYYvA4b/+45vIfA6PxDP56myWhdJ0Qfx4bqfFs4Bpi1Hry9gmVkBiBGYrYpz6guULKAiUExuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gx/4zp65; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF9241A1BB1;
	Wed, 19 Nov 2025 15:05:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A551560699;
	Wed, 19 Nov 2025 15:05:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46D3A10371A7A;
	Wed, 19 Nov 2025 16:05:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763564756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=65yzdyfBuP2Eg+ljTJ7FEAcjZHmS44KiAE99qDDTtos=;
	b=gx/4zp65DJdIxVpNefbXa7nUQ/DHwLnpLg39wmIoT/bGhb41MOrs3cLSWUoLK+d7/rDMfV
	ImPgmfE6uYSXf0a1IfOMNAj5gz2P/1OhuPzoVks2uGuJs0vNuEWx4ZIKs7p9KZWH5m/km3
	+bXUKkkIUKVrJSdBIiGOIORcf61jajetIEnXb+lEY8CuhAUFwsiPDI0sQ6lgjGJOfJKLx/
	twWKbu/uS0oppSvOhT5d3/WqmPMm+KqviqgEmENZTEV82ei2FhYBcjokPLrWNy+xZkX214
	MXouwnWNdJNyiDszd8dY5TP5bZY7PUGWfYM32495oW45/BYlHHApeBOUPII0mQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 19 Nov 2025 16:05:34 +0100
Subject: [PATCH v3 5/7] i2c: designware: Add dedicated algorithm for AMD
 NAVI
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251119-i2c-dw-v3-5-bc4bc2a2cbac@bootlin.com>
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

Apart from runtime PM, there is nothing in common between i2c_dw_xfer()
and amd_i2c_dw_xfer_quirk(), so give AMD NAVI controller its own algorithm
instead of calling the quirk from i2c_dw_xfer().

Add runtime PM handling to amd_i2c_dw_xfer_quirk() and a dedicated
i2c_algorithm for AMD NAVI controllers. The adapter algorithm is set
during probe based on the device model.

This way we avoid checking for the device model at the start of every
transfer.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index fe708c7cd282..12a1194bec52 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -354,6 +354,10 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u8 *tx_buf;
 	unsigned int val;
 
+	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
+	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
+		return -ENXIO;
+
 	/*
 	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
 	 * it is mandatory to set the right value in specific register
@@ -815,13 +819,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
 		return -ENXIO;
 
-	switch (dev->flags & MODEL_MASK) {
-	case MODEL_AMD_NAVI_GPU:
-		return amd_i2c_dw_xfer_quirk(adap, msgs, num);
-	default:
-		break;
-	}
-
 	reinit_completion(&dev->cmd_complete);
 	dev->msgs = msgs;
 	dev->msgs_num = num;
@@ -908,6 +905,11 @@ static const struct i2c_algorithm i2c_dw_algo = {
 	.functionality = i2c_dw_func,
 };
 
+static const struct i2c_algorithm amd_i2c_dw_algo = {
+	.xfer = amd_i2c_dw_xfer_quirk,
+	.functionality = i2c_dw_func,
+};
+
 static const struct i2c_adapter_quirks i2c_dw_quirks = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 };
@@ -1043,7 +1045,10 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 		scnprintf(adap->name, sizeof(adap->name),
 			  "Synopsys DesignWare I2C adapter");
 	adap->retries = 3;
-	adap->algo = &i2c_dw_algo;
+	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
+		adap->algo = &amd_i2c_dw_algo;
+	else
+		adap->algo = &i2c_dw_algo;
 	adap->quirks = &i2c_dw_quirks;
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);

-- 
2.51.1


