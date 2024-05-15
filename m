Return-Path: <linux-i2c+bounces-3496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CD8C6483
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 12:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 829631C23477
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 10:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EF361694;
	Wed, 15 May 2024 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cNBRb8zB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD7857CB5;
	Wed, 15 May 2024 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715767294; cv=none; b=JcPRVJnP1n36rbJ2zsMDygT/sS9UfX/CqPatt5C97OMLP6yWsw99GwoP0uPivnJWkz3XdlWRfH0oydWl5rRnQ+9ZcvyNOegV2wIQe/xcithCSlWwAyGuhDd5uvVZCmRtkztiWYBMqIFwKo2LUt5ZGuA7EzxrYOXgpOKphUD7Ck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715767294; c=relaxed/simple;
	bh=bhAcdQhNVtJ/WY7T35xnlNhq8WgY2YmZ/UU091QPnqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwLQCu1BmEwz83uxeRNbkt9e2CoX7/LvCnHlF5UNUYUmxWF/JJCkHpmLtcJANgDm+TcKKEPQkmeEVQh1eBzWfrTkZU/Xu3totPVa6qpwYH+NgGLLDgrilx627PEVOonwX3AqFW/nGM0DqayOfEzFobRrXYF6wIY83/aYSI3xVfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cNBRb8zB; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6D1D1BF210;
	Wed, 15 May 2024 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715767290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+wkZZoLT0Vq8kTdRlFm+WcHMzeYn9ukxLpZ0zVifpE=;
	b=cNBRb8zBe+JjMEZF6FT1jsL9U4lBNAlJGwJ8GS5VMrImE4s0mjD0BJKL7wretuCqvmeNi0
	pd1TNX1ChQG0UrHj3htbepPRSyXAiKWpO4VX6FGZDy/iEhA5aQBZLvAfGKtg/YKF0O18vC
	+H5zg1Zb8yCBDdAqBr7DvDZHtFdlxGSsC7o3nwqN0m4B3eWtzpazkj/CANyenJss7M4iT1
	sEL/05ypLF5l4uoAXFXnWn3xY8hnV1UbM0YFOiE4yYOqhfpVJ6kfKtQbBdLJc4/BVwDzRN
	xkSZN8+Q10U6mn7dNxUKjf65IbSZZgXc5l2rEnYA4jQiac+hm/HUy+QzWyOELQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 15 May 2024 12:01:05 +0200
Subject: [PATCH v6 04/12] mux: add mux_chip_resume() function
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v6-4-4656ef6e6d66@bootlin.com>
References: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
 thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

The mux_chip_resume() function restores a mux_chip using the cached state
of each mux.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/mux/core.c         | 29 +++++++++++++++++++++++++++++
 include/linux/mux/driver.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 775816112932..0742aa2a7c73 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -215,6 +215,35 @@ void mux_chip_free(struct mux_chip *mux_chip)
 }
 EXPORT_SYMBOL_GPL(mux_chip_free);
 
+/**
+ * mux_chip_resume() - restores the mux-chip state
+ * @mux_chip: The mux-chip to resume.
+ *
+ * Restores the mux-chip state.
+ *
+ * Return: Zero on success or a negative errno on error.
+ */
+int mux_chip_resume(struct mux_chip *mux_chip)
+{
+	int ret, i;
+
+	for (i = 0; i < mux_chip->controllers; ++i) {
+		struct mux_control *mux = &mux_chip->mux[i];
+
+		if (mux->cached_state == MUX_CACHE_UNKNOWN)
+			continue;
+
+		ret = mux_control_set(mux, mux->cached_state);
+		if (ret < 0) {
+			dev_err(&mux_chip->dev, "unable to restore state\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mux_chip_resume);
+
 static void devm_mux_chip_release(struct device *dev, void *res)
 {
 	struct mux_chip *mux_chip = *(struct mux_chip **)res;
diff --git a/include/linux/mux/driver.h b/include/linux/mux/driver.h
index 18824064f8c0..2a7e5ec5d540 100644
--- a/include/linux/mux/driver.h
+++ b/include/linux/mux/driver.h
@@ -88,6 +88,7 @@ struct mux_chip *mux_chip_alloc(struct device *dev,
 int mux_chip_register(struct mux_chip *mux_chip);
 void mux_chip_unregister(struct mux_chip *mux_chip);
 void mux_chip_free(struct mux_chip *mux_chip);
+int mux_chip_resume(struct mux_chip *mux_chip);
 
 struct mux_chip *devm_mux_chip_alloc(struct device *dev,
 				     unsigned int controllers,

-- 
2.39.2


