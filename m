Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6872E494DB7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 13:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbiATMOr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 07:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbiATMOe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 07:14:34 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12ED2C06174E
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 04:14:27 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c2so11691844wml.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 04:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esc1uJ/1b1Bl5sIRdBGqAaIciPpRZPZmuwi/GvPIASI=;
        b=HTONie7dMdtGsPLTyvbZfSGUG6+xqdnKWgOaR+qCVxHQRkzxY+vMBxXGXg/5BpxV+b
         IsDXlYTyi+qXSq+o2cF6MB4vfE+NibpgVZTErgz7kRO3NbuFwIHHojyWk+NGNIO9UnnA
         QOgrlhvgK9+7zJCfkdZu1+NdcAJ5BJC0d6F9tqWwopjxTY93nBMXwovpVIAtO1PSZys2
         +xRTK4eY62C1fAimw/6q6j6jT0brcpFfNvdDkVT1WB8+d/jFM/UAWtE9vklfOYwBTxAB
         6lGJnLsH7bcwADr01qo5DiEENNOMYSuZWWjf+DKi97Se3DRIZhayFeeO2V1ARqdAX5/c
         9cnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esc1uJ/1b1Bl5sIRdBGqAaIciPpRZPZmuwi/GvPIASI=;
        b=Lo56I8I63hjNkoDzfK+6fRRK1mBkXtu5uYzY4TCT5w9aqAADGp3GyLYp1GM1zieQRr
         xfEdGl3LLHATftnwpaCQ+PRl6/qtVDtuhMeM4z7iVyxXelPhtyEG9zitfHTatooUQMLd
         25zdxUDWTu6kwIHoz/9xSmbEYzfrXGMqtzRVJ/RsvcCzXjG+uWIhkfXoCdFD1hpPQV2A
         NtB731mYz0rEfJgZuR5Ck+IxesWFF/WKAWH5c1HjeBv9dVcVrC/Rne3CrwJUBMUFIR+I
         +AV4Mmrg+ot9UDuzMBepkGEIUZlW2EEmOSLC0Ge27Ohl6gL8FnzUfdOxdPB7biMm1pRX
         mndA==
X-Gm-Message-State: AOAM53125q0NO5jz4v1XSvKGfwAt2aLekubJQNjR/pko5rUgIM0XKbEg
        A9UxrllUD6tVpy/qjnDA02qPh4p2P4GW4Q==
X-Google-Smtp-Source: ABdhPJzyrsxABb5+2MQcEebguHu+jFibhrZ6TUJ8eIM4jhWsekHkOasUh0vYuPh5kGAaTeCWgnT/RA==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr33145701wrv.12.1642680865670;
        Thu, 20 Jan 2022 04:14:25 -0800 (PST)
Received: from fedora.sec.9e.network (ip-088-153-139-166.um27.pools.vodafone-ip.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id x4sm2853863wrp.13.2022.01.20.04.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 04:14:25 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v3 3/3] i2c: muxes: pca954x: Add regulator support
Date:   Thu, 20 Jan 2022 13:13:13 +0100
Message-Id: <20220120121314.463944-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120121314.463944-1-patrick.rudolph@9elements.com>
References: <20220120121314.463944-1-patrick.rudolph@9elements.com>
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
2.34.1

