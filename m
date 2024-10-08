Return-Path: <linux-i2c+bounces-7269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBAB994574
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 12:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0A5D1F245F8
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6441D0BB1;
	Tue,  8 Oct 2024 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z7uD+DCK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FB1C1745;
	Tue,  8 Oct 2024 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383394; cv=none; b=Jy8R8VRYqyulW0EYKd8FEn5i5U5m9hBmo4kATjHtojotxSCvXGGhKnS8NNsM+LxiA+uXIQr4QVbRlB3wWh9bRXr2nlx6HXRTt8pRxPu3qlS8qB71LHIZy4gCDckNo7yGyhc7Q8hRpZPPWIeLzpWn6FOHd9wpEqLiMb4V3ZWf4QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383394; c=relaxed/simple;
	bh=I2Stt0MS2ZA3zwuO5y5wV2zeuA+3MTgcPN8X0D5FW3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBwpmuW6Vy8iabwDmZD936bvwiKo7XEOLTEjdax0IMeGP/R0thxH4ubBfASX23A0HglET2lSQZBX+uqVmKyxbF92BBHXpsIpXc1kTPYmx4vf36MCqMmUxFG04FtjULa94uW1XiR/5PtmnxFXPanRCrJJVoKu9h5YDTG5GGYM2mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z7uD+DCK; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFA76E0002;
	Tue,  8 Oct 2024 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728383384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtMmHbPZ23pwesmORM0pCnGzFJGwj7VpWxVSSzjsLkQ=;
	b=Z7uD+DCK6v4FGhL99TUZKfwrJsnhkqG0UVklqLvkNggxE3Tcpyd1ndQ24xFqjANZZEECjn
	oKq7L1SwWTZuNfX2uGb6e+dzTjbpEByx3xZqnQ0NhWTdlXFG70uUeYrEdVDEowJbvNDEas
	xrn8WGlP8+RYZYsCgEMc5z1yFJHAa2QTySSj4kvsKqz8zLN9drSft3vFlee2Tcae3HsjYb
	9/imEtE6hfw8KPK5eRH9hTg6tbAhrvRuBMel2fX+mSw3u4Tyd90GMHm9vjWBxgbkXS0/jE
	GLjkAio7LAR7VMjHsPtQvFtg6sci/z0GupRVmfBKh8bTu0kTO2inc/49maQ25A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 08 Oct 2024 12:29:41 +0200
Subject: [PATCH 2/4] i2c: nomadik: support Mobileye EyeQ6H I2C controller
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241008-mbly-i2c-v1-2-a06c1317a2f7@bootlin.com>
References: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
In-Reply-To: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Add EyeQ6H support to the nmk-i2c AMBA driver. It shares the same quirk
as EyeQ5: the memory bus only supports 32-bit accesses. Avoid writeb()
and readb() by reusing the same `priv->has_32b_bus` flag.

It does NOT need to write speed-mode specific value into a register;
therefore it does not depend on the mobileye,olb DT property.

Refactoring is done using is_eyeq5 and is_eyeq6h boolean local
variables. Sort variables in reverse christmas tree to try and
introduce some logic into the ordering.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index ad0f02acdb1215a1c04729f97bb14a4d93f88456..ea511d3a58073eaedb63850026e05b59427a69c6 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -6,10 +6,10 @@
  * I2C master mode controller driver, used in Nomadik 8815
  * and Ux500 platforms.
  *
- * The Mobileye EyeQ5 platform is also supported; it uses
+ * The Mobileye EyeQ5 and EyeQ6H platforms are also supported; they use
  * the same Ux500/DB8500 IP block with two quirks:
  *  - The memory bus only supports 32-bit accesses.
- *  - A register must be configured for the I2C speed mode;
+ *  - (only EyeQ5) A register must be configured for the I2C speed mode;
  *    it is located in a shared register region called OLB.
  *
  * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
@@ -1046,8 +1046,6 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
 	struct regmap *olb;
 	unsigned int id;
 
-	priv->has_32b_bus = true;
-
 	olb = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id);
 	if (IS_ERR(olb))
 		return PTR_ERR(olb);
@@ -1070,13 +1068,15 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	int ret = 0;
-	struct nmk_i2c_dev *priv;
-	struct device_node *np = adev->dev.of_node;
-	struct device *dev = &adev->dev;
-	struct i2c_adapter *adap;
 	struct i2c_vendor_data *vendor = id->data;
+	struct device_node *np = adev->dev.of_node;
+	bool is_eyeq6h = of_device_is_compatible(np, "mobileye,eyeq6h-i2c");
+	bool is_eyeq5 = of_device_is_compatible(np, "mobileye,eyeq5-i2c");
 	u32 max_fifo_threshold = (vendor->fifodepth / 2) - 1;
+	struct device *dev = &adev->dev;
+	struct nmk_i2c_dev *priv;
+	struct i2c_adapter *adap;
+	int ret = 0;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -1084,10 +1084,10 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
 	priv->vendor = vendor;
 	priv->adev = adev;
-	priv->has_32b_bus = false;
+	priv->has_32b_bus = is_eyeq5 || is_eyeq6h;
 	nmk_i2c_of_probe(np, priv);
 
-	if (of_device_is_compatible(np, "mobileye,eyeq5-i2c")) {
+	if (is_eyeq5) {
 		ret = nmk_i2c_eyeq5_probe(priv);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed OLB lookup\n");

-- 
2.46.2


