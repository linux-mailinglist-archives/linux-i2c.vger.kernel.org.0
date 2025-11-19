Return-Path: <linux-i2c+bounces-14170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EA143C6FA2A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 16:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7B73E35541B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 15:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C3936CE0C;
	Wed, 19 Nov 2025 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e/in0rUY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC1A36C0C3
	for <linux-i2c@vger.kernel.org>; Wed, 19 Nov 2025 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564759; cv=none; b=Q7JxyuIopGYB7wClj0pPsCUI5rtcV1N9BvTVlQiJGJwWr6eO4bOxHw/j7k33i3M358F1f/50lt/xXH5SoORArOGmYGgMzLTrFdUnYdqYe8wMnp+AsGS4pHq8ouwa2X/8cxM3/MCvXByNZUx5e0qB1BznrRFFgwKIeE0HnylyUXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564759; c=relaxed/simple;
	bh=JAD3o+Asv4ra2douzOxGIAujqehO/m/bD7MQB3mKQOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBIPR/c3AWc9TEX0rlQsZxs1PRwrK0jlgx5MD8u9d85Ho7XzDMaFRyKZDKtc4KT+10NO0Gk52Q4O6hNVxrqjyExho+TD0qrIXUNDYeWKNcan2xcomrq1IaDEIolXjK3D7CuQFLeGZ7kNlnTOheQeEI0MmCBSj1ID4G6un4RQ/zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e/in0rUY; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 86DB11A1BB0;
	Wed, 19 Nov 2025 15:05:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5DF7E60699;
	Wed, 19 Nov 2025 15:05:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1364310371A72;
	Wed, 19 Nov 2025 16:05:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763564753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qzc+vWJ+lMZNvL35gxSncb6y0244QxztXKe0Ufrhtu0=;
	b=e/in0rUYVRnahj3Kiblq14cIxtCSTEa/Ra4dtgZvkAXjiAjGkT/8NoawlhqIIFJaAR4FHH
	7wG8YFqcmgmYv0AwkEFyJ2d2b0ucd9CcSYr8hh08l+VSe4kv5wFIO7EY60iZFO/npAjis5
	OGUlSGChwqkzPt51kj3JYAYU/bc4EcKM7rZFriP2BDMpnp0RtQWj95oO/HnLtGsrxof9WD
	MY6TEh557VbCUIS0uP94JaMhXa6dFXwTj4fWz2n2bfPLRABo02hisG6WIY1chp8Y3f8iIY
	0K2KjtiWXZCR5PocNocJXrK8VsKCjkKNka8XsuYYzyBYsoYDVmyT79rTC92GAg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 19 Nov 2025 16:05:33 +0100
Subject: [PATCH v3 4/7] i2c: designware: Use runtime PM macro for
 auto-cleanup
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251119-i2c-dw-v3-4-bc4bc2a2cbac@bootlin.com>
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

Simplify runtime PM handling in i2c_dw_xfer() by using the
pm_runtime_active_auto_try guard. This adds the proper handling for
runtime PM resume errors and allows us to get rid of the done_nolock
label.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index ec4fc2708d03..fe708c7cd282 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -811,12 +811,13 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
 
-	pm_runtime_get_sync(dev->dev);
+	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
+	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
+		return -ENXIO;
 
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_AMD_NAVI_GPU:
-		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
-		goto done_nolock;
+		return amd_i2c_dw_xfer_quirk(adap, msgs, num);
 	default:
 		break;
 	}
@@ -834,7 +835,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
-		goto done_nolock;
+		return ret;
 
 	ret = i2c_dw_wait_bus_not_busy(dev);
 	if (ret < 0)
@@ -899,9 +900,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 done:
 	i2c_dw_release_lock(dev);
 
-done_nolock:
-	pm_runtime_put_autosuspend(dev->dev);
-
 	return ret;
 }
 

-- 
2.51.1


