Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503654AB79B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 10:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbiBGJhz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 04:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351414AbiBGJ3J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 04:29:09 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25422C043185
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 01:29:08 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id cn6so5955533edb.5
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esc1uJ/1b1Bl5sIRdBGqAaIciPpRZPZmuwi/GvPIASI=;
        b=Kq7bxOK0EXnru4hWpt1BGbQD5x4elFR7kZIzwLbqjeBN3yWqt4iBQOeArytKJZQpf9
         E4N7dJ0mOWMz9kp2XDwsxS/1K2k7ZpoqR+3BH/1md8ux2ayeH0kt4WHInqwdSbfJfSY5
         6JWSfLb99OPJZyawEm11RCO/iLITTvYRylyRwd8ELCXeDnMf749ux5AvqPvofnRaI0eQ
         3Ca13gb8SNaecWc+CHEgW4BwLibXanZR5CgtdLC6hnTipxW3Hy61ZJ9fTjhZ4Tn1wrPo
         oCy+FzSPRhxKqYKPrxO8pY7moA2slRp3//1BpaZUfgqSBpgwUClZlXEToOK2mdznQBtp
         q46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esc1uJ/1b1Bl5sIRdBGqAaIciPpRZPZmuwi/GvPIASI=;
        b=Xz7SUk5QyHU/tY332Z6eITq8IZgQJ3z6Ab4YjVwpZbRukZYEKwonftk45ogmBOA5CQ
         wwajD00jWob2VIi1q8v+mKE7ycNVCXw4f/ZzhkUxT+HrkI9W1qHqTXfiCwVmsDuKpION
         UhhNoXDfYDWH9EryP/uNW4oaoiDzOJAHaWrVHrDJgFSg9nYq5pVgB62dfknQW7ZXD+16
         O8sUmDoy3Q7D/XH9/ZxNNKDXNH+Oa6dkDWdxZZZ/Dr1P3nhI6L9AjcBtkNvJ/ms6VVFF
         h96PKNlVkoj1x5SElXwu3g1ovId7vTpRxpbndAN9tpRasHArBXu+3JopofNaZ0+uxwzg
         nVKg==
X-Gm-Message-State: AOAM5308WFrRhQ8lhofgsKY6VqqzYDuxRMHOn3+9hBPjFWul7ZqI0pOG
        sLuRXyrrT6gWfvA+rjrmZy4vm5cm5ZPmDg==
X-Google-Smtp-Source: ABdhPJz6ga72M9Fh/6kWosxb2MY91mI/eDTayZjisNyDXZdtus2V/AVbaeSGGoDuxA4tsjwqhiy16g==
X-Received: by 2002:a50:ee16:: with SMTP id g22mr5850857eds.434.1644226146737;
        Mon, 07 Feb 2022 01:29:06 -0800 (PST)
Received: from fedora.. (ip-088-153-139-166.um27.pools.vodafone-ip.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id g9sm3487059ejm.152.2022.02.07.01.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 01:29:06 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v4 3/3] i2c: muxes: pca954x: Add regulator support
Date:   Mon,  7 Feb 2022 10:28:26 +0100
Message-Id: <20220207092827.104978-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207092827.104978-1-patrick.rudolph@9elements.com>
References: <20220207092827.104978-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
2.34.1

