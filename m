Return-Path: <linux-i2c+bounces-5588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264CA958406
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 12:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5500B1C247E9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 10:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB0618DF69;
	Tue, 20 Aug 2024 10:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="E4oOT8cH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186D318CBE2
	for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149174; cv=none; b=lvXvc/Nuwy32y/lqXzFC+iIKHJyCjsr34UFc+N8FHtxrJt70b/3GetZvS5RONODNmrPprCcKe6ACf5bs+jBkJYeEPT4rEzl0eot24LBHGHG+0A+7sb4DfgOqxNT7stJT42Gf2XbgugGQRZhu4A2kmpoarAycbbJHYhKFuLRpWig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149174; c=relaxed/simple;
	bh=a5INUf0WoL/NKROLBMR1SOz9/grcWDFu2IzCdwlfGLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OpiJzHjUXCAS8lnhaIz+I3OgeE50PZEBjJVX01x2sX3IskBE0mqGghkdF4WY7Ba+Y0qEyLNoGg6KMV4kZOgBsHwwapvYSGviD2DwcYfA8vt26BCzXIZO7lw6G9WN10nybFgaRV4rHpogSuxbz4DNIxhgWgtaqZGYQngpRrHcfJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=E4oOT8cH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7aada2358fso990475166b.0
        for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724149170; x=1724753970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyHB0wSf2QDt8/x1D+5DL9pczbnRG3ThqNLzDrfigCI=;
        b=E4oOT8cH2VE9bMDwrjSW0c4HV5y7ccP2aqP9mgMrT9liBLUneuXfuEUobwz5C634ii
         BLkUFLrG8K6LIzDjw9IG/EcZFaUp0Bewbk9C0rVAZTLtL04shdUmVl9d2pIwbGmed+an
         2k6LaiirGoAO+RgBAzgx9+W12kcCdpCRf6ylDiYThjCZ1GKg5ggBGrOj2lkwUgV8YMRk
         WHeFsb9PNmYKaXkjHMda95b9DbL6x7GXkAYoLYYjJ7+uBEB+5seW04rgwLHfnJD63E7h
         p6qOpBJ6AYQTEQVgOtqZmgQ7/k6eXDTPwybVoT/6dvKKM8atYRaH/Rfwm1W8TQB8gEri
         vhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149170; x=1724753970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyHB0wSf2QDt8/x1D+5DL9pczbnRG3ThqNLzDrfigCI=;
        b=IJOSBMz/xLSpDiUTDQEn0yyuJbKUTXpV7fc0xc66Gl+CZaELpoHzcko5WiDsADEhgo
         B4c9vyBe8PiphgYoiSvliL1wJnze1uQtWBZ5r0dKVQ3u5PikOkpgFIVyZ7N9dJv/xzGo
         IQkhQ3Yl32hGIS+xSZW3zgFhNnwI9i+beohwlr+fF9XaUEmKuRMx9azjhFIx1HxLhFbh
         Hu19bFWnvHxKKZrVswraVSYOEhpGQXr1frPsrtKz7K8F2qXBCVCsat6UPIUG7J03DEQ3
         /Zl/0rfah+y5vJSxHjrIvGy7P9wuzuS26lgBjUhotLeqTpGacOWFfSUQhtb2fCvwHFe3
         VJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCUVblHtaJZfrbE2p3qZ9TGLzOqYfxpWrHnNY3D2j3dS6C0W5yejHy8pPWj7R6e9mMwfw2rPBy03Es4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/T+6SzJzSH0RqyN7jedDEIVWeU9kGJg2pSxffs1cPEN2W1vhG
	p5cXaKLjnndoIYvSz+SYGLAGo1MuVXqzasDT2H6L/pznjQtGVO85pzbaRBSkzIA=
X-Google-Smtp-Source: AGHT+IHlFASHO6vSyycyWaX2KePMdrob9YxEACYFTx17UYEZpx/pbU5dBW+kPG059fuT2py193GrNg==
X-Received: by 2002:a17:907:97d4:b0:a7a:b561:358e with SMTP id a640c23a62f3a-a8643fee8f8mr243658866b.33.1724149170390;
        Tue, 20 Aug 2024 03:19:30 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839464ebsm734550066b.155.2024.08.20.03.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:19:30 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 01/11] i2c: riic: Use temporary variable for struct device
Date: Tue, 20 Aug 2024 13:19:08 +0300
Message-Id: <20240820101918.2384635-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use a temporary variable for the struct device pointers to avoid
dereferencing.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- dropped updates around &riic->adapter.dev introduced in v2; with
  this restored commit description from v1

Changes in v2:
- updated commit description to reflect all the changes done

 drivers/i2c/busses/i2c-riic.c | 49 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index d6f585cdb7e5..bc33762a5d07 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -131,11 +131,12 @@ static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u8 set, u
 static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct riic_dev *riic = i2c_get_adapdata(adap);
+	struct device *dev = adap->dev.parent;
 	unsigned long time_left;
 	int i;
 	u8 start_bit;
 
-	pm_runtime_get_sync(adap->dev.parent);
+	pm_runtime_get_sync(dev);
 
 	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
 		riic->err = -EBUSY;
@@ -168,7 +169,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	}
 
  out:
-	pm_runtime_put(adap->dev.parent);
+	pm_runtime_put(dev);
 
 	return riic->err ?: num;
 }
@@ -303,8 +304,9 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	int ret = 0;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
+	struct device *dev = riic->adapter.dev.parent;
 
-	pm_runtime_get_sync(riic->adapter.dev.parent);
+	pm_runtime_get_sync(dev);
 
 	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
 		dev_err(&riic->adapter.dev,
@@ -396,7 +398,7 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
 out:
-	pm_runtime_put(riic->adapter.dev.parent);
+	pm_runtime_put(dev);
 	return ret;
 }
 
@@ -415,13 +417,14 @@ static void riic_reset_control_assert(void *data)
 
 static int riic_i2c_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct riic_dev *riic;
 	struct i2c_adapter *adap;
 	struct i2c_timings i2c_t;
 	struct reset_control *rstc;
 	int i, ret;
 
-	riic = devm_kzalloc(&pdev->dev, sizeof(*riic), GFP_KERNEL);
+	riic = devm_kzalloc(dev, sizeof(*riic), GFP_KERNEL);
 	if (!riic)
 		return -ENOMEM;
 
@@ -429,22 +432,22 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(riic->base))
 		return PTR_ERR(riic->base);
 
-	riic->clk = devm_clk_get(&pdev->dev, NULL);
+	riic->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(riic->clk)) {
-		dev_err(&pdev->dev, "missing controller clock");
+		dev_err(dev, "missing controller clock");
 		return PTR_ERR(riic->clk);
 	}
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(rstc))
-		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
+		return dev_err_probe(dev, PTR_ERR(rstc),
 				     "Error: missing reset ctrl\n");
 
 	ret = reset_control_deassert(rstc);
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(&pdev->dev, riic_reset_control_assert, rstc);
+	ret = devm_add_action_or_reset(dev, riic_reset_control_assert, rstc);
 	if (ret)
 		return ret;
 
@@ -453,29 +456,29 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		if (ret < 0)
 			return ret;
 
-		ret = devm_request_irq(&pdev->dev, ret, riic_irqs[i].isr,
+		ret = devm_request_irq(dev, ret, riic_irqs[i].isr,
 				       0, riic_irqs[i].name, riic);
 		if (ret) {
-			dev_err(&pdev->dev, "failed to request irq %s\n", riic_irqs[i].name);
+			dev_err(dev, "failed to request irq %s\n", riic_irqs[i].name);
 			return ret;
 		}
 	}
 
-	riic->info = of_device_get_match_data(&pdev->dev);
+	riic->info = of_device_get_match_data(dev);
 
 	adap = &riic->adapter;
 	i2c_set_adapdata(adap, riic);
 	strscpy(adap->name, "Renesas RIIC adapter", sizeof(adap->name));
 	adap->owner = THIS_MODULE;
 	adap->algo = &riic_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->dev.parent = dev;
+	adap->dev.of_node = dev->of_node;
 
 	init_completion(&riic->msg_done);
 
-	i2c_parse_fw_timings(&pdev->dev, &i2c_t, true);
+	i2c_parse_fw_timings(dev, &i2c_t, true);
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	ret = riic_init_hw(riic, &i2c_t);
 	if (ret)
@@ -487,24 +490,24 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, riic);
 
-	dev_info(&pdev->dev, "registered with %dHz bus speed\n",
-		 i2c_t.bus_freq_hz);
+	dev_info(dev, "registered with %dHz bus speed\n", i2c_t.bus_freq_hz);
 	return 0;
 
 out:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
 static void riic_i2c_remove(struct platform_device *pdev)
 {
 	struct riic_dev *riic = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
 
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(dev);
 	riic_writeb(riic, 0, RIIC_ICIER);
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 	i2c_del_adapter(&riic->adapter);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 }
 
 static const struct riic_of_data riic_rz_a_info = {
-- 
2.39.2


