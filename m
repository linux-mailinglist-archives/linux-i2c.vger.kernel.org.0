Return-Path: <linux-i2c+bounces-14277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77259C89603
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 11:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BED74E3448
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED58E321448;
	Wed, 26 Nov 2025 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FruETx42"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0DB31ED95;
	Wed, 26 Nov 2025 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154015; cv=none; b=SImm9Ef4Z2skU1jv+toEnRRW0sSY6oV6SHSGeWGMIVmQcXYJeYRC5dVQyl47aHQ90JFoY2KMqUeMdMqvBwTg3DBOnFW8H3Pz6bSE5r1aKdU5Lb3BI/xOVt+NS0ONbfDD9JIAY+M+GDZQm2xHxNErj6KX9Nti/xTMHO4QBSZ5bjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154015; c=relaxed/simple;
	bh=LkyYXciWGFRGDaZZsAqr0hUiYlLTuVo9Zf8XUZJtrlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXwwCmixoboB8PGpihvY0GkAvwV/dlYQpmIqWQOkFWwda7zLt4Su0GMQ5CGIIHxcTsqM+SvPeyNnwcnG/Pevu1FLNm+X5PDFk02xM2yLykJKjq15o5XDF4ooSUf/6gjPP5zr67+CKgkJomfGwQz0MiRkkk72s5tpF4OAksAwoIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FruETx42; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6631D4E418E6;
	Wed, 26 Nov 2025 10:46:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BBE560721;
	Wed, 26 Nov 2025 10:46:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1850102F08C9;
	Wed, 26 Nov 2025 11:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764154011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OzKkisXvKa5epQi/flHcP9O680bWIEN4eKFcAiNCdnY=;
	b=FruETx429Dm1XWoZUET/07FOXP5A5GSr4il2sEDlyaL3jjcHVkEkM7YV8JQ4otYKXQqxIO
	k/P0Zv7IgYNht2NOzIYAJ0+EjqcabgaIBLdNekgFOLxjfU+vk3A4qz+dAziMpaM0lAQOcT
	h/V8M2YvA5w9dfB1E4bIch7VxDGORlXfyMbFVbpZKyDZN8I2G1X41bupnCZtUrXF89oPEm
	4efxMg+ZS0/DkVnQYa0wN4eS8Wptum9wPx8yY7Y7yb60oxI4lkZgp1iZZ1GUbj7Cn0y+dd
	KyjaIijxSqhIBE5wmbE/YbTpUNaY9mNk2QPHaFfuODpBp2lE9pXuh9aheiEoUg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 26 Nov 2025 11:46:27 +0100
Subject: [PATCH v4 4/7] i2c: designware: Add dedicated algorithm for AMD
 NAVI
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251126-i2c-dw-v4-4-b0654598e7c5@bootlin.com>
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

Apart from runtime PM, there is nothing in common between i2c_dw_xfer()
and amd_i2c_dw_xfer_quirk(), so give AMD NAVI controller its own algorithm
instead of calling the quirk from i2c_dw_xfer().

Add runtime PM handling to amd_i2c_dw_xfer_quirk() and a dedicated
i2c_algorithm for AMD NAVI controllers. The adapter algorithm is set
during probe based on the device model.

This way we avoid checking for the device model at the start of every
transfer.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index ec4fc2708d03..c33198ab5018 100644
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
@@ -813,14 +817,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	pm_runtime_get_sync(dev->dev);
 
-	switch (dev->flags & MODEL_MASK) {
-	case MODEL_AMD_NAVI_GPU:
-		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
-		goto done_nolock;
-	default:
-		break;
-	}
-
 	reinit_completion(&dev->cmd_complete);
 	dev->msgs = msgs;
 	dev->msgs_num = num;
@@ -910,6 +906,11 @@ static const struct i2c_algorithm i2c_dw_algo = {
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
@@ -1045,7 +1046,10 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
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
2.52.0


