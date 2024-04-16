Return-Path: <linux-i2c+bounces-2964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51B8A6C51
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C95A1F2201D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 13:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5E912D1EC;
	Tue, 16 Apr 2024 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZL1ooC7L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A9C12C7FB;
	Tue, 16 Apr 2024 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713274220; cv=none; b=JlZi1Kvr/8CwZgqhc917vKkcGie5uQn4/HYzV3kwnagEkVPMdYrZnMwKvHdLpoeOaReaQtHKFcYlkCfjU3xmZbOVJ7E5D3CWWqtiXR8KN7lL71cy/6di/yFhpE8fPtL/JTkQqVIa8lIPkkOwxsN/QShhckth56oF2AcZNYYAevU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713274220; c=relaxed/simple;
	bh=KoeKOC9BxNbULIOx5THehrA2LvyMrmoh0J2kqk1uxqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbC8mxck8GIpvsjvTnq+W8MF15dxiSLghTgIF9VtPL7cgnk5TTA9QyzR+b3YH16l+ptJteIA3gwxNSTFh+qxTpg9hfkLmbj0QC2ra4aPmLmt9dV9Iqwr9tsEP7ZlIfrHZUJu3CnwcuV4GTU7d9onWd+JObk1jsfniC0zAZwCUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZL1ooC7L; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8E9540007;
	Tue, 16 Apr 2024 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713274216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPqUbSf1Qdf1yloJtVBeCvPFg+XlI7QIXeQdbRho+l4=;
	b=ZL1ooC7LClW/wnvSt9rJuIpcwX5TWts2+cJjbvrpFVnpjNZufsfCmP2cqcJQNAl9PbIW+d
	5tuOzJov3/7Ae6ugSkqS9GwyVK2siy5qOX2dgriDOQ1thf4bg2jGuKSZoUnSR9d4yG5nik
	fIejV3ZSVPwW1J0kR0cIzSyKTheiz7pW6LPX6A3NPbfwDkkhr6yLELst5HTGSLSXVwWqvW
	e6vqxmRt5O/TGKbV1OtVSI8y4admj+tdIR9X3qP3EqQJRyA5Ofsyi2xJ27x4CIdogD6Wyb
	wtPdFIa2K8zOMmrJwUUz8PRQleuuOW4JFm2W7HrC7Dl3ct4X2a6moS0vGTX7aw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 16 Apr 2024 15:29:53 +0200
Subject: [PATCH v5 04/11] mux: mmio: add resume support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240102-j7200-pcie-s2r-v5-4-4b8c46711ded@bootlin.com>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
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
index 30a952c34365..00405abe3ce3 100644
--- a/drivers/mux/mmio.c
+++ b/drivers/mux/mmio.c
@@ -130,13 +130,25 @@ static int mux_mmio_probe(struct platform_device *pdev)
 
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


