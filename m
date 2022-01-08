Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEF1488579
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 19:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234963AbiAHS7Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 13:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbiAHS7O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 13:59:14 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3BEC061401
        for <linux-i2c@vger.kernel.org>; Sat,  8 Jan 2022 10:59:13 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id l25so7215111wrb.13
        for <linux-i2c@vger.kernel.org>; Sat, 08 Jan 2022 10:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wVci9hDIUum1CaWFskqxuebySsxpSvZQ92hsaUOsz8M=;
        b=ZgNccUywDjeJ4PolBeKQ/wkVAkXxywpmj5GN8ru0s0xVzh1ZhLASEzTRVvu/Al1yQp
         M/rWDusqKtGboxTQP78JNXDgp8WU5Ep0HpFSSkCxwVjvvYsvPwc46LTSOUC+orsuTB1e
         uzt4oDyEUAlu70CV99Du4+42LLgcsJbWN9/Xpi6GN7cO1966ewDejNeSUVnyjlhQ83mI
         d+VPIwpLA5xT+Wgi/ZrVLiB3Jt+ABbJ/Icu+kqv7eSBBXDmO/7VrMLqC1GPApy9xo26s
         j6kWN8GmzhmABs7EVb6S+iSlAE7Z2Yozko303Y622v+8saUVqZ2L5mIsztes2ZSU+p3c
         1JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wVci9hDIUum1CaWFskqxuebySsxpSvZQ92hsaUOsz8M=;
        b=a7yu+A7N9bD3CgS4EPIiF5o7q+O7iD9wsLVw0ywoSJ/SyqQANHDzFFou/fX/L6F2zj
         7+ygTOofl+I7ZN/1I7SoMEfyepP/LIkukGxCDOvhiv9xhNoCHzU8Xnn37y8/J4fk+GxI
         N0a1Dg48WpGebpXSn0RZDPbZoQS7qPMVpAAEMaCmUi7L1Zp3CxX49FVY/Od3b0I9FbGr
         JqBye4k1BRVH9poV1FSxIGm9CYDnc3gJYbbI3Idbs/bPQDk1rLqOs9F6SoIW4pV5YbjG
         MlYpgB1K+cCcBaiZ09hVxBzpeVNyqHcin16TPQ6q3Qqh+VOO4kvZEUPevzZSgfwCRKBA
         ERaQ==
X-Gm-Message-State: AOAM532LhPExcgJsX1/9SQtqkb+Iw2p6FWtSHin+AOtMLJe+MtCDhnVm
        nGHvcabBcpR8bw8hHDJgdYIWAg==
X-Google-Smtp-Source: ABdhPJyxsfk3LCvBXW1V6tGZuo65QQDfAf8eKtuEJb9UO3umDfjmrzntmjHlRpV2TjSABKlCRwolWQ==
X-Received: by 2002:adf:db0c:: with SMTP id s12mr27402866wri.429.1641668351948;
        Sat, 08 Jan 2022 10:59:11 -0800 (PST)
Received: from fedora.sec.9e.network (ip-88-153-139-166.hsi04.unitymediagroup.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id bg12sm2886209wmb.5.2022.01.08.10.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 10:59:11 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] i2c: muxes: pca954x: Add regulator support
Date:   Sat,  8 Jan 2022 19:57:58 +0100
Message-Id: <20220108185759.2086347-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
References: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add an optional vdd regulator and enable it when found for devices
that are powered off by default.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 32 ++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 33b9a6a1fffa..086647193ea9 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -49,6 +49,7 @@
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/mux/mux.h>
@@ -119,6 +120,7 @@ struct pca954x {
 	struct irq_domain *irq;
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
+	struct regulator *supply;
 };
 
 /* Provide specs for the PCA954x and MAX735x types we know about */
@@ -459,6 +461,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	if (!IS_ERR_OR_NULL(data->supply))
+		regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -513,15 +518,30 @@ static int pca954x_probe(struct i2c_client *client,
 			     pca954x_select_chan, pca954x_deselect_mux);
 	if (!muxc)
 		return -ENOMEM;
+
 	data = i2c_mux_priv(muxc);
 
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get_optional(dev, "vdd");
+	if (IS_ERR(data->supply)) {
+		if ((PTR_ERR(data->supply) == -EPROBE_DEFER))
+			return -EPROBE_DEFER;
+	} else {
+		ret = regulator_enable(data->supply);
+		if (ret) {
+			dev_err(dev, "Failed to enable regulator vdd: %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* Reset the mux if a reset GPIO is specified. */
 	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return PTR_ERR(gpio);
+	if (IS_ERR(gpio)) {
+		ret = PTR_ERR(gpio);
+		goto fail_cleanup;
+	}
 	if (gpio) {
 		udelay(1);
 		gpiod_set_value_cansleep(gpio, 0);
@@ -538,7 +558,7 @@ static int pca954x_probe(struct i2c_client *client,
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -546,7 +566,8 @@ static int pca954x_probe(struct i2c_client *client,
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -565,7 +586,8 @@ static int pca954x_probe(struct i2c_client *client,
 	ret = pca954x_init(client, data);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto fail_cleanup;
 	}
 
 	ret = pca954x_irq_setup(muxc);
-- 
2.33.1

