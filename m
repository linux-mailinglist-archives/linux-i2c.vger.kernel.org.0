Return-Path: <linux-i2c+bounces-7290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEFF996728
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 12:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145B61F273DA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 10:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5249118FDC8;
	Wed,  9 Oct 2024 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CPK8keeX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2664918E764;
	Wed,  9 Oct 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469425; cv=none; b=lNf8kXyZvfu3J4EzxmaxwTVCfX94ZeuCr5lxjHYHseHTtAhTb8sWO0+th+zenRwKP4MUHOuVtSjDhIcIQeaFMm+KRsHsGKh4NgbqPU1d/S/ELHMDPNyMU5WQjW8Lgcg1EhbGTQbp15KwTimXsp0Ogy/i5+4hRaTF3cMiW5tdXzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469425; c=relaxed/simple;
	bh=QMCIUPpXqgRCwrZH7410pZ8JrhRNP9EubqVL/sVI/CI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iy+Q9IrjO6l1GzI/KO2Don4dyQ/oXl55ZX+6GtNEDDMzpaBO1RkvRf8haSwvTIPfcPwTrKTCK0FF5N2Yf/8hvYeEFuGtqkzich6APYgnJT83L2nyJemClFGyIWsKwJhNt1OYMWW4f8cyn1f/7X06hdXKkzFBksRUFGdB/YnIF98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CPK8keeX; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3964C0002;
	Wed,  9 Oct 2024 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728469411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0RkPb/ZmhIYMKGdFcEhqFg5pBv1BW4T9WKx57Ml1gvk=;
	b=CPK8keeXpLYeRc5B4XVCc9+5LgzrWTEVrhI0PvfIa/eFGmxVo4iKx89i9vd6RXM5x8xL6M
	tgwYN+SH9n7NCVl+0NI3tcOnQ4gO2ZOLp/jf7yiNaPFgrbIMvJ9CjRe9D29F9smL59d4Rd
	mIMbJG0XZmRGJH1Nc4AyOKD9NrTvYBp4/fFmj+9vFd0wqCIUN023lDdT+HjC5Fkfq78M9a
	Ex1K6FrwMEWxSiTGZzeVWXbSAJo2IHrpxvaDdS0tTA+Fv4Ho/OPT6o3ZBCWPunbiFUVJnW
	rRVbu4l48DOSU3ou2k5qjLpNZVfo810k/EcT0Ay6utwfAbWvN8dAe3yUPPo7yA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 09 Oct 2024 12:23:29 +0200
Subject: [PATCH v2 3/6] i2c: nomadik: switch from of_device_is_compatible()
 to of_match_device()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241009-mbly-i2c-v2-3-ac9230a8dac5@bootlin.com>
References: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v2-0-ac9230a8dac5@bootlin.com>
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

Compatible-specific behavior is implemented using a if-condition on the
return value from of_device_is_compatible(), from probe. It does not
scale well when compatible number increases. Switch to using a match
table and a call to of_match_device().

We DO NOT attach a .of_match_table field to our amba driver, as we do
not use the table to match our driver to devices.

Sort probe variable declarations in reverse christmas tree to try and
introduce some logic into the ordering.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index ad0f02acdb1215a1c04729f97bb14a4d93f88456..c40328d1bca6cdefc61906cf9160f8411e37922a 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -26,6 +26,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -1046,8 +1047,6 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
 	struct regmap *olb;
 	unsigned int id;
 
-	priv->has_32b_bus = true;
-
 	olb = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id);
 	if (IS_ERR(olb))
 		return PTR_ERR(olb);
@@ -1068,15 +1067,35 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
 	return 0;
 }
 
+#define NMK_I2C_EYEQ_FLAG_32B_BUS	BIT(0)
+#define NMK_I2C_EYEQ_FLAG_IS_EYEQ5	BIT(1)
+
+static const struct of_device_id nmk_i2c_eyeq_match_table[] = {
+	{
+		.compatible = "mobileye,eyeq5-i2c",
+		.data = (void *)(NMK_I2C_EYEQ_FLAG_32B_BUS | NMK_I2C_EYEQ_FLAG_IS_EYEQ5),
+	},
+};
+
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 {
-	int ret = 0;
-	struct nmk_i2c_dev *priv;
-	struct device_node *np = adev->dev.of_node;
-	struct device *dev = &adev->dev;
-	struct i2c_adapter *adap;
 	struct i2c_vendor_data *vendor = id->data;
 	u32 max_fifo_threshold = (vendor->fifodepth / 2) - 1;
+	struct device_node *np = adev->dev.of_node;
+	const struct of_device_id *match;
+	struct device *dev = &adev->dev;
+	unsigned long match_flags = 0;
+	struct nmk_i2c_dev *priv;
+	struct i2c_adapter *adap;
+	int ret = 0;
+
+	/*
+	 * We do not want to attach a .of_match_table to our amba driver.
+	 * Do not convert to device_get_match_data().
+	 */
+	match = of_match_device(nmk_i2c_eyeq_match_table, dev);
+	if (match)
+		match_flags = (unsigned long)match->data;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -1084,10 +1103,10 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 
 	priv->vendor = vendor;
 	priv->adev = adev;
-	priv->has_32b_bus = false;
+	priv->has_32b_bus = match_flags & NMK_I2C_EYEQ_FLAG_32B_BUS;
 	nmk_i2c_of_probe(np, priv);
 
-	if (of_device_is_compatible(np, "mobileye,eyeq5-i2c")) {
+	if (match_flags & NMK_I2C_EYEQ_FLAG_IS_EYEQ5) {
 		ret = nmk_i2c_eyeq5_probe(priv);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed OLB lookup\n");

-- 
2.46.2


