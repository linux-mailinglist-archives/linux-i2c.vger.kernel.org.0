Return-Path: <linux-i2c+bounces-1462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D683DC52
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 15:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71482B2A28D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 14:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA7A1DFEC;
	Fri, 26 Jan 2024 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UpAgNFun"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53C1DA40;
	Fri, 26 Jan 2024 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279870; cv=none; b=Jp/ST4/l9tjZsh5HoyA64wo5qmH64icaxFmtsqS+BScdUcRd6inLz6IVMAkGnwC6yyCmK8IUbwmJi0K8wKkHtK1T8crGbdK+qOF5T8Yww3otGwQcV3cmmZlz42mu9AfV+SY5U43AJXSXmWOcfADAV8f0NwqfTha4XBw30rKPGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279870; c=relaxed/simple;
	bh=NovYJkg9hWLmm6w5SFRQCUJycR7xJIZD4whepEe3ZIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rf3TfKa6bPktRpHSROwJwT5SRysQlohLQ93BVmqBYpbtfBcnjkzMwssCgjlJU0/LZN1gIGXGpN2ynOqCqflevRy8mmI0pagncqhs4wZ98sHNay9W8Atl+UB5WIFLiuAPNGZzQy8j+d8vCxZ/KjcplDvIRktqE8H83ca2lNyGpB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UpAgNFun; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F15CA4000C;
	Fri, 26 Jan 2024 14:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706279866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZJ+2FIjmJ3bZ38rbdAVVTffmaC+WvVgUK7GwRKTE04=;
	b=UpAgNFun0NVNnY8k9eOqBgvyd6OtEWrfn5hfbdJb2qghuKCU3lVrcVGffgLMqHcaoxFviT
	pTB1e8YU8XTPwd+W2XZD+RUiodvkRevqbKPCk8pAvEBeHmF6HaEvTfhvub2s3Kbn4Bcdtf
	2p5ppt4VTXli4/hl0EtBoYu7wcoP8i+4mZMeC1kawKLhTFwjx3Aco3xV6GwgSUKN9BPGD2
	2KiZAq5m5s1Ng8xEyE2NhWoxf3oyc6Ns5GFn+gClI8BpgUTB5xhVZquAI1fVWPmIH5bOZJ
	oj0upQRBh/YBaMDou6cDcjCbj+IPpvU9i7NZ5GJ+i5XhNhGpiF4hhnePELNHbA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 26 Jan 2024 15:36:47 +0100
Subject: [PATCH v2 05/15] mux: mmio: add resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v2-5-8e4f7d228ec2@bootlin.com>
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

From: Théo Lebrun <theo.lebrun@bootlin.com>

No need to save something during the suspend stage, as the mux core has an
internal cache to store the state of muxes.

This cache is used by mux_chip_resume to restore all muxes.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/mux/mmio.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
index fd1d121a584b..892ff4714b68 100644
--- a/drivers/mux/mmio.c
+++ b/drivers/mux/mmio.c
@@ -125,13 +125,25 @@ static int mux_mmio_probe(struct platform_device *pdev)
 
 	mux_chip->ops = &mux_mmio_ops;
 
+	dev_set_drvdata(dev, mux_chip);
+
 	return devm_mux_chip_register(dev, mux_chip);
 }
 
+static int mux_mmio_resume_noirq(struct device *dev)
+{
+	struct mux_chip *mux_chip = dev_get_drvdata(dev);
+
+	return mux_chip_resume(mux_chip);
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(mux_mmio_pm_ops, NULL, mux_mmio_resume_noirq);
+
 static struct platform_driver mux_mmio_driver = {
 	.driver = {
 		.name = "mmio-mux",
 		.of_match_table	= mux_mmio_dt_ids,
+		.pm = pm_sleep_ptr(&mux_mmio_pm_ops),
 	},
 	.probe = mux_mmio_probe,
 };

-- 
2.39.2


