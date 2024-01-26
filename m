Return-Path: <linux-i2c+bounces-1461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1683DC45
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E811284C4D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784E41DA58;
	Fri, 26 Jan 2024 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HIsJspIS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6EB1CFAE;
	Fri, 26 Jan 2024 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279868; cv=none; b=cRxEkOKmu5Cw+tNQcfDGaqXR6x3DCmJrZHmYkpAWZOa+tUpq0xEupd+FsbeS71fqXt9YXQXCbo5wjZxhcNAvLc/cswBboyQpxfQbvUU3OII7xBKUaK5kYqUHQlo5R1MeJzPWgKUjj1UQRhcor+oYsHQt4cMlQg9/74tRhVTK2DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279868; c=relaxed/simple;
	bh=dQ5Zh+9goreKLgpbAXuuVsk4U2eqh0p5tYj9u6TxiXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdfxlA9C3wWuA+dh003s19lGZLDoaqs5JWkZ9WmFLz5GfLdTlghZy2e9b+T5+N5EEVxMGgBUU+GHMenOyJJQhH/vUJtsjmML+COMnPBT7xYOSzPf3S1iU/5IXNETxA0P95UKebn6Eg2twMEaVymyyxp13xYyusPmWhgH2Vy+cyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HIsJspIS; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 564F440014;
	Fri, 26 Jan 2024 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cbw3dfSNoiflIv8mn1Y7eM6xBgXjeUJCd/7i0kUTDu4=;
	b=HIsJspISmq9+z03H8FRmqs/PxBEH2bY6w4YjXjpYjf84eeKJKyfRd8h7X97Ckfs/vM3MN8
	ajG8doZk8ZKGo0M0j2VzYTFIybcYp+s+vCjyP/8oxsw2XTGpgO2xoXsDHyJFC72xsmtC4f
	AXZsPD7frToR88bXP3aSHZaNt/l/vagv9KnKtzOiWYuEwG3tAnhnHslb77YNE1AKgWGWWX
	qNQ9WKUME2rM1gjPiHlGBxFadl0hJzjDgSgSdsUbR93+dFkFXzMl7gwvUWiR/Qv1nMJAGk
	37288DOuqlcr95ZCxnsxf3sZcdeb0yMzaNJhmrcILe74lVQjnNpKzbZiaQEOvw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:46 +0100
Subject: [PATCH v2 04/15] mux: add mux_chip_resume() function
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v2-4-8e4f7d228ec2@bootlin.com>
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

The mux_chip_resume() function restores a mux_chip using the cached state
of each mux.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/mux/core.c         | 27 +++++++++++++++++++++++++++
 include/linux/mux/driver.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 775816112932..896f74b34eb8 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -215,6 +215,33 @@ void mux_chip_free(struct mux_chip *mux_chip)
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
+		if (mux->cached_state != MUX_CACHE_UNKNOWN) {
+			ret = mux_control_set(mux, mux->cached_state);
+			if (ret < 0) {
+				dev_err(&mux_chip->dev, "unable to restore state\n");
+				return ret;
+			}
+		}
+	}
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


