Return-Path: <linux-i2c+bounces-15288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C14D3C421
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DC651542F39
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF973ECBC5;
	Tue, 20 Jan 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="od+Wp3ma"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3188F3E9F61
	for <linux-i2c@vger.kernel.org>; Tue, 20 Jan 2026 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901313; cv=none; b=MMRunA6UFHOWzZxzXi6PtBgEft4nVXr4AWSXp6hFQxt1TWtczdXfPJx8bHOe5j3obqvSpF+f+Zpk7zgyvPUN9xUHDuIvW9kHXc79ScynSjtnTAeHJ+GlLx6G69PcUDqf0ER6AuPNUByItZqXw/kI5VDGd1VVp0fmKstXbph0cZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901313; c=relaxed/simple;
	bh=QMqioJoP80Iu3/5uGtxuCFsLXp9UlfrL0fqbcQmIhZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcZvwfFV6Z89d+pjdzd2+TU/c6TDALexUBX9VUYoByYR+AIitDgdNNe/U+sVoU7ltF08+SfeRdTUM55IprfGr5sEFS47I56vcsfpoISwBEnkibOa3oNZRnX0/TWJMQd7De2bEmoRFd6OHCnW3cpf7FkBdWVZsg1Tnhtxh9tIHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=od+Wp3ma; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04C75C214EE;
	Tue, 20 Jan 2026 09:27:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F625606AB;
	Tue, 20 Jan 2026 09:28:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B35D510B68378;
	Tue, 20 Jan 2026 10:28:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768901303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jc6Cz28LDEeuob4AY0w3tlBij8P56e1G48BsjZWXPos=;
	b=od+Wp3maJgYXGKdoZr3NVTPJPcB3dHL6xN9MvjtZyVmJ2BbcYiYiqQbNhB3jQ1BTRwx+E1
	2ig10LrHGWjus9Wo9KceMyqUwFoQs2fxsYlhwzHQlYr1mwXj82JYAsUPOUclTURZUOJ+i3
	5NPk7G8KSbVuW72bPKSrrQv3kZc73Ril0p2/FxTgQOZUp0QrYU4MTlIIPukAnjpEopLneE
	dMnAJI5EjdtXBmtvgjMQITokW3JWuaLP3x8feKBtJrYof0ZOOp96xw0zYkoFSU0sqqiWAd
	GSu+s2ju6MP0TaeyJR97aHQPy709PSTendbERGbVQlDYb9l12tnfee1SsiKVdA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 20 Jan 2026 10:28:03 +0100
Subject: [PATCH v5 3/6] i2c: designware: Add dedicated algorithm for AMD
 NAVI
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-i2c-dw-v5-3-0e34d6d9455c@bootlin.com>
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
index 4493568e2fa3..f247cf323207 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -361,6 +361,10 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u8 *tx_buf;
 	unsigned int val;
 
+	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
+	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
+		return -ENXIO;
+
 	/*
 	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
 	 * it is mandatory to set the right value in specific register
@@ -820,14 +824,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
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
@@ -917,6 +913,11 @@ static const struct i2c_algorithm i2c_dw_algo = {
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
@@ -1052,7 +1053,10 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
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


