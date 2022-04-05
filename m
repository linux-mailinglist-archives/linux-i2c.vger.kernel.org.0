Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49FE4F42B0
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 23:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbiDEOI5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 10:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345632AbiDENFW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 09:05:22 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2558F72E27
        for <linux-i2c@vger.kernel.org>; Tue,  5 Apr 2022 05:06:36 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id k124-20020a1ca182000000b0038c9cf6e2a6so1524413wme.0
        for <linux-i2c@vger.kernel.org>; Tue, 05 Apr 2022 05:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CentrNXKSQFtoskGJlxUqU8zX0zrZiDPIjJai3Ha6oE=;
        b=JmMomELaLQFDRItpcNtWH4QI1Qx1ZxwUSJLdZaS7o5PZzEfGUekaCpJog3I6Pf7x68
         u1ttd3GXCmjQvb58QxZs3mzVCW278ksuVf0JyetGiL34x6FWoBGPtJpWXVgADop9TImV
         x4IWpSoFQU1Htkiswy51NyZz7U0ysrWeLVpl4sGhgIURBoUH0WAE6hy9L2ZydY5U4Wqw
         WmDel6vDij5ahXrhPZ5PqCM96GvIqBQHUnxReC2Rjf7w3CwY/ceih+4Lj+VTYZ3GpISm
         x4iPt88wo8To81qjCfKZ+Nc1KITCgI1JNig/8p6WE/M+21Mum4GEu2fMKtsm40cyvh5M
         GE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CentrNXKSQFtoskGJlxUqU8zX0zrZiDPIjJai3Ha6oE=;
        b=6A6f9Vnp2QND1nrWwwzWCwqq7t4Ynr0PW086VzKSp8p371LxOLYTZzbhEv3IRYW5by
         ndp6ACO3zehamJNWU047JWBgQ7k6FrSkqvue6qzUCce90UkDCitNq2FCv2JQ+24veO+U
         NoUVqgLgPulMSaeR0J8IJ5y5tmMN0h8byfZnwlhNBp9eQGdcQQNS8b512iqRb3m8fgch
         NCLcHl8f5d65paIlR4JJ62YYN/RJ8JQZbK2n65rxKNfH1KuarltJOh4pmoezS/bSxTts
         165QiGdsgpzl+jihzOfsi6R5M60S3q7U+pjf/W1zCStQQuy1PKLeBP4KIS1ZXOM6A7fm
         Dhvw==
X-Gm-Message-State: AOAM531z2w9dSIIOH13WNXwjnDc94zrYDCTKx9axDS6of4ZxbODg421w
        BJ7/Mq2ZpR57EaEofA3m4r0DkA==
X-Google-Smtp-Source: ABdhPJx2k1D7CsQNKEUVWDyrt4BFPfX//w90p69nAAXHPbmb5DKwSS7nBMnD3/+TZifT+S4HANNBEA==
X-Received: by 2002:a05:600c:3ba5:b0:38c:b19e:253c with SMTP id n37-20020a05600c3ba500b0038cb19e253cmr2839990wms.35.1649160394659;
        Tue, 05 Apr 2022 05:06:34 -0700 (PDT)
Received: from fedora.lab.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id r16-20020a7bc090000000b0038e73023334sm1994323wmh.2.2022.04.05.05.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 05:06:34 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v7 3/3] i2c: muxes: pca954x: Add regulator support
Date:   Tue,  5 Apr 2022 14:05:51 +0200
Message-Id: <20220405120552.433415-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405120552.433415-1-patrick.rudolph@9elements.com>
References: <20220405120552.433415-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a vdd regulator and enable it for boards that have the
mux powered off by default.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Peter Rosin <peda@axentia.se>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 34 ++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 122b7a28fc60..6c43d420e349 100644
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
@@ -513,15 +518,32 @@ static int pca954x_probe(struct i2c_client *client,
 			     pca954x_select_chan, pca954x_deselect_mux);
 	if (!muxc)
 		return -ENOMEM;
+
 	data = i2c_mux_priv(muxc);
 
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(data->supply)) {
+		ret = PTR_ERR(data->supply);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(data->supply);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulator: %d\n", ret);
+		return ret;
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
@@ -538,7 +560,7 @@ static int pca954x_probe(struct i2c_client *client,
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -546,7 +568,8 @@ static int pca954x_probe(struct i2c_client *client,
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -565,7 +588,8 @@ static int pca954x_probe(struct i2c_client *client,
 	ret = pca954x_init(client, data);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto fail_cleanup;
 	}
 
 	ret = pca954x_irq_setup(muxc);
-- 
2.35.1

