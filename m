Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B39473FD4
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 10:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbhLNJvD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 04:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbhLNJvC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Dec 2021 04:51:02 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1530C06173F
        for <linux-i2c@vger.kernel.org>; Tue, 14 Dec 2021 01:51:01 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so15826169wmj.5
        for <linux-i2c@vger.kernel.org>; Tue, 14 Dec 2021 01:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QvL6cSotT6zCDdAPa4uv4YcC9fcfaO0IQCDs+UP7OhA=;
        b=To0gur3eKFHJsX21w7cmkSkqz5iIr5w0YMiedtpEZKoVBK8D+1BQsiVDU7kkOoI3um
         9T+9NrM3t4ZX9nW1MT1b+74RuOVJEv+GFPoWOjzkP+7FT3b+CwoYYR54Ts44X6pdTNtr
         oDVsycxRgFYaw3If3u/E3cAY4Y4F9CPSf7VArxLXMWHyixqJgj1khkD7hQOYjSe6NZKT
         mpemjX1G44qscgbayGdeT2PiMKLYFgINd/tvy4br9ThYNpGD5ZgkUQNJM+3c42xCAWuX
         cv9THpGo/ZJUIuMNZWb81Nl5icftNZuHRibHY1yuePjJj1YPVELDer9UKjQBNd3wrGmA
         yIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QvL6cSotT6zCDdAPa4uv4YcC9fcfaO0IQCDs+UP7OhA=;
        b=QulaNaO370u8dWVivJh9DL+ewU0xW7CFbzfz17KRXwdezkMBWjIOFLZ1q4r7YR6PWC
         G3tD48Fjnop1NgMadlYhz6RP1WtDtr85e8yW9bczIrV0Mvbxpyny/OdmjwKE2dh+nO9B
         SjDF62JppBpUlw+GdZSj2XLgw0Wi/ziP+INCRqzMJFgErsZ0wfOG6cekXINXnpM6tQjc
         49cIJA6X7uOGvB6j40vuKMK+/fS+34DSsLryWUJVXnFwe6YJ/Pi7jKxeF//aCjc/V6Nr
         PL7IiRzhfDL/Y+TyYfW40KWVIaGsvTcglp61OJCvp/qTxxPKAJqVzwHYaIYV88S/Jt2S
         VJ0w==
X-Gm-Message-State: AOAM530MGj1PLQV7JsVUbYhgo5yXi5KQyeUOsn8BG+vVQayn5cr2V/Wr
        hpOc7UDtfJkqu0jpfAZIZy3rmg==
X-Google-Smtp-Source: ABdhPJwb27AiqA1Y3fkM3GDXYWJAC+nARejXPzWcWmTpXuBDmiJ2tkGELxbeHPoqaq3NC7uVSbIDfA==
X-Received: by 2002:a05:600c:6006:: with SMTP id az6mr5954257wmb.5.1639475460298;
        Tue, 14 Dec 2021 01:51:00 -0800 (PST)
Received: from fedora.sec.9e.network (ip-88-153-139-166.hsi04.unitymediagroup.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id s24sm1522757wmj.26.2021.12.14.01.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 01:50:59 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] i2c-mux-pca954x: Add regulator support
Date:   Tue, 14 Dec 2021 10:50:21 +0100
Message-Id: <20211214095021.572799-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214095021.572799-1-patrick.rudolph@9elements.com>
References: <20211214095021.572799-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add an optional vcc regulator and enable it when found for devices
that are powered off by default.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 33 ++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 23e0f24bab04..5fa266cb02c0 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -48,6 +48,7 @@
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
 
 /* Provide specs for the PCA954x and MAX735x types we know about */
@@ -425,6 +427,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	if (!IS_ERR_OR_NULL(data->supply))
+		regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -484,15 +489,31 @@ static int pca954x_probe(struct i2c_client *client,
 			     pca954x_select_chan, pca954x_deselect_mux);
 	if (!muxc)
 		return -ENOMEM;
+
 	data = i2c_mux_priv(muxc);
 
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(data->supply)) {
+		if ((PTR_ERR(data->supply) == -EPROBE_DEFER))
+			return -EPROBE_DEFER;
+		dev_warn(dev, "Failed to get regulator for vcc: %d\n", ret);
+	} else {
+		ret = regulator_enable(data->supply);
+		if (ret) {
+			dev_err(dev, "Failed to enable regulator vcc\n");
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
@@ -509,7 +530,7 @@ static int pca954x_probe(struct i2c_client *client,
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -517,7 +538,8 @@ static int pca954x_probe(struct i2c_client *client,
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -536,7 +558,8 @@ static int pca954x_probe(struct i2c_client *client,
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

