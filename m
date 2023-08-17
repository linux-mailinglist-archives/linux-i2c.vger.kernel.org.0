Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3203777F0FA
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 09:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348367AbjHQHLZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 03:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348371AbjHQHLH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 03:11:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FD0272B
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 00:11:05 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bf91956cdso912609966b.3
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692256264; x=1692861064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89F7HPVQyXXTql6NKond4APoTNtrcoR3WWVsZWeYnGU=;
        b=TgbZ/CJaNT5E0pj5GYvONqmkY9clXaDgZ3GzFBalCaFrSv0lcMDrWxA3FIoESnHuSp
         lnk0quVRulaA0xNXQla3opRrVW/yUkYgRBw1YuZGCTjUZUuLlG0h2Gy76KtnaFzf6rdN
         fuaLqDkWKWKRW1nl0+bTR79RrqVDD9PTC2I616oUPhzdZ4ezByFHnsgMykFe6LJvrgki
         OltaoZoZNQ4du8HJ6noqzMhYIH5l4atz6wH0itLVjrErfLSVdYoykRusEiZczIahSAfH
         YyqTPGvgS/vk+xoJMefOpL46tdlGdQZ20gKiKYAv2U6cCrlgLpKeQwnjVinrvshnIYdq
         mWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256264; x=1692861064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89F7HPVQyXXTql6NKond4APoTNtrcoR3WWVsZWeYnGU=;
        b=Zups61LaNT+R2WAIsddgmo6l7SJNJsTf4nAMPCuVSZ9GBIU8JM1SjIEK/R2X7WFPXM
         Uv5cWtRn4+sl6Ns3HG7B54Kyj7e7P6BAKzYdH8A+L1dVRA5mGv2vZOSv61gi4qYwb6Z2
         tIxKPXckchjUid5JFIMF7Yd2mGrrHhbfVxKQl+bafhThDOjk2od4EaZ3P60s+oG667ad
         l+IaCo9TmNNYTkbEKg6Yvyx3iN3jyXTQkLye2Sn7uVlgXeiAUvPKpBcJjjO2TZcJjP+G
         nDOCJSWdtAi+fZVTZLDd+3X+RIei3dd4UwOz8Htkxa8sKZVAjohCgWJwXe/cb3SPvRq6
         pJ+g==
X-Gm-Message-State: AOJu0Yx2eD4bI8GhuitnUgB4zt8XtGaYtHcLTwn/seBo2Y3t/WbSnP8/
        jE/b8x+4RjXfpKOpp+/eePSaCA==
X-Google-Smtp-Source: AGHT+IFtJOLkzjgVmHbLgbpjFzK/zm5xo4iX82t+PikH5g9nEQtQqq+sKdZl/RoN5YPHQQgLU97h+A==
X-Received: by 2002:a17:907:a078:b0:993:d617:bdc8 with SMTP id ia24-20020a170907a07800b00993d617bdc8mr3293049ejc.7.1692256264435;
        Thu, 17 Aug 2023 00:11:04 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id qn17-20020a170907211100b00992b510089asm9674361ejb.84.2023.08.17.00.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 00:11:04 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     naresh.solanki@9elements.com,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v15 4/4] i2c: muxes: pca954x: Add regulator support
Date:   Thu, 17 Aug 2023 09:10:53 +0200
Message-ID: <20230817071056.2125679-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a vdd regulator and enable it for boards that have the
mux powered off by default.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 968111442625..b863f7b18190 100644
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
@@ -101,6 +102,7 @@ struct pca954x {
 	struct irq_domain *irq;
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
+	struct regulator *supply;
 };
 
 /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
@@ -444,6 +446,8 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -496,10 +500,22 @@ static int pca954x_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(data->supply))
+		return dev_err_probe(dev, PTR_ERR(data->supply),
+				"Failed to request regulator\n");
+
+	ret = regulator_enable(data->supply);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable vdd supply\n");
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
@@ -516,7 +532,7 @@ static int pca954x_probe(struct i2c_client *client)
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -524,7 +540,8 @@ static int pca954x_probe(struct i2c_client *client)
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -543,7 +560,8 @@ static int pca954x_probe(struct i2c_client *client)
 	ret = pca954x_init(client, data);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto fail_cleanup;
 	}
 
 	ret = pca954x_irq_setup(muxc);
-- 
2.41.0

