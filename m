Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29FA6F2FD0
	for <lists+linux-i2c@lfdr.de>; Mon,  1 May 2023 11:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbjEAJQM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 May 2023 05:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbjEAJQE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 May 2023 05:16:04 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B035619D
        for <linux-i2c@vger.kernel.org>; Mon,  1 May 2023 02:16:01 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94eff00bcdaso465865766b.1
        for <linux-i2c@vger.kernel.org>; Mon, 01 May 2023 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1682932560; x=1685524560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deLhqHNlkRGaOVPkjyoMd684bHUV64uU06CP2w8Rkjc=;
        b=gj0WDZrvDo6kdPGp5lFtedx5wR7mFPU8FR0fdP8cVEhniVnsLG1KeCwwwnzFaUILX0
         Caa1boWYSK1UkDkNcEXV0Pc9oOEvhyrWlWtdpazA65ypqCGKOEGgDVbYW9zt6w/uscZ9
         yiolFislJzxwOdEH2pXWnabryAs8MJhTu1XTkMqe7OjGXxIhYJXgWVocGoPv1VfJHb1w
         V7RDc2/LQOjrHEpUAD4LShHCLdq2Jzr2BNUy8ldShYiUQ4I5rajthijHF0DJYtJXVTfX
         ZU7C/FCiyJo7d8YuIUjM2+i5eIq1Dg5oOO/VS5eBdofjNK+o4h4W+761L9A8EH5GxYEh
         zHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682932560; x=1685524560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deLhqHNlkRGaOVPkjyoMd684bHUV64uU06CP2w8Rkjc=;
        b=H7FZ8AchySEMlhJ3+7YNMlgK43q8ouMtvYDhmx6k0NZ61KXQifmKxDf7DGhphpSDhP
         HtQh8T46B2s079cwfk4x3GZDFWtJR1xe4NjPlYfcDhJg8hLi9uSMWgLFg5OocgbIIYIp
         m+gylM2/bt4Zfc4SdQcOQbU24LOVdsI3GYq4HsTTkvsMjkl2RdZx7FACDqi3L1qAT2hq
         /P/JDpBco84WIpXavKwkqH/NoxKTXuef1AXUgW8lW46j3RNJWvUI2H72plA1YE4k+5Eu
         TcxaRVRhrLHFbzOVWXzgreHem+eto4FeVYXfKcfmu9/HwQMPyfkJZkZ+xcQ75fs9MM+0
         Ay8w==
X-Gm-Message-State: AC+VfDwLx4L+/04xVryz63drV6VRmoIb2JCGDtA+sB/dNszAXLSkuGgK
        6o3sJZsaaj7/sgu37awWUuH5Qw==
X-Google-Smtp-Source: ACHHUZ4Y4cbO7jqnHQ+V0Unb725qqsrtAckf2/0TSgsaBOt3rZZjTc6hfx4mrxGzT5lGMzWBvvT1uA==
X-Received: by 2002:a17:907:728d:b0:95f:2046:d20d with SMTP id dt13-20020a170907728d00b0095f2046d20dmr12568044ejc.2.1682932560217;
        Mon, 01 May 2023 02:16:00 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id xa3-20020a170907b9c300b0094e954fd015sm14714266ejc.175.2023.05.01.02.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 02:15:59 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v14 4/4] i2c: muxes: pca954x: Add regulator support
Date:   Mon,  1 May 2023 11:15:51 +0200
Message-Id: <20230501091552.847240-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501091552.847240-1-patrick.rudolph@9elements.com>
References: <20230501091552.847240-1-patrick.rudolph@9elements.com>
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
2.39.2

