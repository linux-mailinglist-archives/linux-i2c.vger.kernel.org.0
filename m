Return-Path: <linux-i2c+bounces-6-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81717E7EF8
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71AA6B21D3A
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 17:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70433C09A;
	Fri, 10 Nov 2023 17:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="rbBog5py"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5AD3B798
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 17:46:49 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E53824483
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 01:30:44 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso5937759a12.1
        for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 01:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1699608643; x=1700213443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkNN8+PjnJ5Ef46R2X9sE8qx4x4isQxNOv4iGhlDVRw=;
        b=rbBog5pyOhfxKqUSCaXySxYXppt/708RL5o04jGpslRlgL29BffDpBY9NdUKaUwWQa
         6/UIaHyqTANUBIrPS2941NyPSR9yGSjpG5gTGkXrCQc1PyXZvGbEkMu1taNzFKjvGstD
         7dLjbDkIPJlngs7QngDgpoCdqv8G/1jwgOePijeRlIHSlmVRUSpvJJMIUAqcW6VO7Cf0
         CJASVo+FgiYO+FMEPotP8ETAdyNNg0cNE+HC23bT94lkS+8Ayr6lxCG7ACoHueXNIocM
         xPAE3aTFIgudUEmg3gxdf+fThe0Zt1UOSenCgEmu84hlltecjdbCVdXOt2bBmvoU+MmM
         j7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699608643; x=1700213443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkNN8+PjnJ5Ef46R2X9sE8qx4x4isQxNOv4iGhlDVRw=;
        b=fiXuLvQgAEF7Fo5pxwxOREiSRd1HsRnGdDHVmq6y/+F4XIzY2TEwn1IfTUnaUmJWFv
         wAYJPRDewUfI+OfzYZPDAV/nk89l/Rcr5RpPUc4VUh4/buvB5M3ip/pVdxILtsB/JKDf
         P5HAUp3ZJZYlqmNTpRiSIIH4sBfdZmRi6lfeFF4b2RvRfkn2wA+E3S8mA1UFWocGvIDX
         qw3sPKmwz/zWNtmFBGfvSMysQOgY7Tlfw30zRp6mj1J5N6szkHjmCLYrlRkAYvjbgHB+
         1vjyVAuIVSD8n4REX9Crh+v1APXcChzSij1AtsLesMIjzCXerxOGjzggB5QJytjEfXAH
         MadA==
X-Gm-Message-State: AOJu0Yy+rEJd/4CqYVtDbclkcjv5kvB0uBuZFHauR87ZoJTM62Vr24sw
	11npimpJnb/zHuU8KLF35L1QGg==
X-Google-Smtp-Source: AGHT+IGrq9EMu2rzFwR4CptNlJT8qkAN1l9yBCm3T0SUuvlgbNK0GYonHNm+aPvGsjAH9Vh9pfdabg==
X-Received: by 2002:a17:906:3bcb:b0:9ae:5513:e475 with SMTP id v11-20020a1709063bcb00b009ae5513e475mr1885957ejf.9.1699608642876;
        Fri, 10 Nov 2023 01:30:42 -0800 (PST)
Received: from fedora.. (cpezg-94-253-128-32-cbl.xnet.hr. [94.253.128.32])
        by smtp.googlemail.com with ESMTPSA id dt14-20020a170907728e00b009e5d30422ebsm917829ejc.101.2023.11.10.01.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 01:30:42 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	linus.walleij@linaro.org,
	wsa@kernel.org,
	codrin.ciubotariu@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "i2c: pxa: move to generic GPIO recovery"
Date: Fri, 10 Nov 2023 10:30:11 +0100
Message-ID: <20231110093039.190076-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 0b01392c18b9993a584f36ace1d61118772ad0ca.

Conversion of PXA to generic I2C recovery, makes the I2C bus completely
lock up if recovery pinctrl is present in the DT and I2C recovery is
enabled.

So, until the generic I2C recovery can also work with PXA lets revert
to have working I2C and I2C recovery again.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: stable@vger.kernel.org # 5.11+
---
 drivers/i2c/busses/i2c-pxa.c | 76 ++++++++++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 1d7648242749..76f79b68cef8 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -265,6 +265,9 @@ struct pxa_i2c {
 	u32			hs_mask;
 
 	struct i2c_bus_recovery_info recovery;
+	struct pinctrl		*pinctrl;
+	struct pinctrl_state	*pinctrl_default;
+	struct pinctrl_state	*pinctrl_recovery;
 };
 
 #define _IBMR(i2c)	((i2c)->reg_ibmr)
@@ -1299,12 +1302,13 @@ static void i2c_pxa_prepare_recovery(struct i2c_adapter *adap)
 	 */
 	gpiod_set_value(i2c->recovery.scl_gpiod, ibmr & IBMR_SCLS);
 	gpiod_set_value(i2c->recovery.sda_gpiod, ibmr & IBMR_SDAS);
+
+	WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery));
 }
 
 static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
 {
 	struct pxa_i2c *i2c = adap->algo_data;
-	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
 	u32 isr;
 
 	/*
@@ -1318,7 +1322,7 @@ static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
 		i2c_pxa_do_reset(i2c);
 	}
 
-	WARN_ON(pinctrl_select_state(bri->pinctrl, bri->pins_default));
+	WARN_ON(pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default));
 
 	dev_dbg(&i2c->adap.dev, "recovery: IBMR 0x%08x ISR 0x%08x\n",
 	        readl(_IBMR(i2c)), readl(_ISR(i2c)));
@@ -1340,20 +1344,76 @@ static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
 	if (IS_ENABLED(CONFIG_I2C_PXA_SLAVE))
 		return 0;
 
-	bri->pinctrl = devm_pinctrl_get(dev);
-	if (PTR_ERR(bri->pinctrl) == -ENODEV) {
-		bri->pinctrl = NULL;
+	i2c->pinctrl = devm_pinctrl_get(dev);
+	if (PTR_ERR(i2c->pinctrl) == -ENODEV)
+		i2c->pinctrl = NULL;
+	if (IS_ERR(i2c->pinctrl))
+		return PTR_ERR(i2c->pinctrl);
+
+	if (!i2c->pinctrl)
+		return 0;
+
+	i2c->pinctrl_default = pinctrl_lookup_state(i2c->pinctrl,
+						    PINCTRL_STATE_DEFAULT);
+	i2c->pinctrl_recovery = pinctrl_lookup_state(i2c->pinctrl, "recovery");
+
+	if (IS_ERR(i2c->pinctrl_default) || IS_ERR(i2c->pinctrl_recovery)) {
+		dev_info(dev, "missing pinmux recovery information: %ld %ld\n",
+			 PTR_ERR(i2c->pinctrl_default),
+			 PTR_ERR(i2c->pinctrl_recovery));
+		return 0;
+	}
+
+	/*
+	 * Claiming GPIOs can influence the pinmux state, and may glitch the
+	 * I2C bus. Do this carefully.
+	 */
+	bri->scl_gpiod = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
+	if (bri->scl_gpiod == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+	if (IS_ERR(bri->scl_gpiod)) {
+		dev_info(dev, "missing scl gpio recovery information: %pe\n",
+			 bri->scl_gpiod);
+		return 0;
+	}
+
+	/*
+	 * We have SCL. Pull SCL low and wait a bit so that SDA glitches
+	 * have no effect.
+	 */
+	gpiod_direction_output(bri->scl_gpiod, 0);
+	udelay(10);
+	bri->sda_gpiod = devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_OPEN_DRAIN);
+
+	/* Wait a bit in case of a SDA glitch, and then release SCL. */
+	udelay(10);
+	gpiod_direction_output(bri->scl_gpiod, 1);
+
+	if (bri->sda_gpiod == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+
+	if (IS_ERR(bri->sda_gpiod)) {
+		dev_info(dev, "missing sda gpio recovery information: %pe\n",
+			 bri->sda_gpiod);
 		return 0;
 	}
-	if (IS_ERR(bri->pinctrl))
-		return PTR_ERR(bri->pinctrl);
 
 	bri->prepare_recovery = i2c_pxa_prepare_recovery;
 	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
+	bri->recover_bus = i2c_generic_scl_recovery;
 
 	i2c->adap.bus_recovery_info = bri;
 
-	return 0;
+	/*
+	 * Claiming GPIOs can change the pinmux state, which confuses the
+	 * pinctrl since pinctrl's idea of the current setting is unaffected
+	 * by the pinmux change caused by claiming the GPIO. Work around that
+	 * by switching pinctrl to the GPIO state here. We do it this way to
+	 * avoid glitching the I2C bus.
+	 */
+	pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
+
+	return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);
 }
 
 static int i2c_pxa_probe(struct platform_device *dev)
-- 
2.41.0


