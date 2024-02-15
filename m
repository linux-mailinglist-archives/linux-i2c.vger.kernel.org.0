Return-Path: <linux-i2c+bounces-1727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBD856735
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6AF3B2563D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0261339AA;
	Thu, 15 Feb 2024 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hv4KJLdE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84E6132C2D;
	Thu, 15 Feb 2024 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010290; cv=none; b=jXC7OObq3T+J/x7jPg0Ae9NCIPPGNw2xIaKS8pzGwoFh9jSp6LcCxP9WOA+0UuQJB+vJayYaEZtmzqEe6SYu+wcwe4Zf4za81/ngiu0s3qTf0wUBi49P/6lLhaijL3ocUcHA0Z5hNWW+HId37Ydc9I0EFIZ5cJpL+UDpGKEs7sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010290; c=relaxed/simple;
	bh=5c3PEdEw9K2SWSbCnl8JZa/Az4dMYehFM7efi82xY10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVObwfY6VFbbsdfKFBxsEyOZrG4HRaWNbjRcCf6IZAe2LHt3ukqhFsOzipten9UCJnodwEsNSXua2hG73WlmDjJzLMQXwwnhgLB7tYDizb4fen43HlEa+7Ujw0OZbw+hEFgufn75dmdOJZvcVEo6dcxeKvyNiKNiX+kwGrnIBgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hv4KJLdE; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E89F240014;
	Thu, 15 Feb 2024 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708010286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPxPc7Xvb7+q1PFnLq8F3pklOXjELgiYL5RrEQlPZLM=;
	b=hv4KJLdEm3D68ygjCeQI0f6Li0bYy6g5tgDVSnZMtNe5x1p7CsSbwqLnRHg6UPqX2YrxVe
	10MkwKsoaqwKb5voo2rwB+E1cey1kphwHuEJI+D9LjchjctBi2Hgsm8bSrfselmBVdPuVh
	SEebNpingPgX6J9U4thp4aGS3BJO4liAmfG4PckUMTSG/sUAOx71jXmetVFjjVbR1BNuf7
	YwG6o1He6OZPyy76WnL8/Ke04Dc1nflsHMnflWwDL28k3u+tbMUGl0denojY3kPv8dOfy2
	/Oa1lFZtnWTPEK6ZIwkUKlkuRKgFAjwozvFucfG1Lhd4K5etvMd9xmCCo1LXMQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Thu, 15 Feb 2024 16:17:51 +0100
Subject: [PATCH v3 06/18] mux: mmio: add resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v3-6-5c2e4a3fac1f@bootlin.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
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

This cache is used by mux_chip_resume() to restore all muxes.

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


