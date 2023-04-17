Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114F26E45A3
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Apr 2023 12:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjDQKua (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 06:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjDQKua (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 06:50:30 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E87C127
        for <linux-i2c@vger.kernel.org>; Mon, 17 Apr 2023 03:49:42 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id q23so53427302ejz.3
        for <linux-i2c@vger.kernel.org>; Mon, 17 Apr 2023 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681728500; x=1684320500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzocyBkoDyqwm37oXkPUZaJ33qZ0oiBEGhDhAvLR+GA=;
        b=ONDVAteznHJNUzK4vdrIQaInV6Rul5h4OlVP5ZHcfS5vGjWMxoTFhClxk8je0WBJlu
         yuJJbpWI85rxFZPec8wuUejziA9OUYTZ/z3VYgpoUxTRp/Wo2nZENQhi3n5cqC/bj4xD
         BtSWUdu4ypZUPNiIGtwCLhslqLr+aKPiGC99iFP3FyYRq2KQorMpMo7gqhXtibyIWLEX
         t1x4C/WEA+eNev2iep/Y+JUslqDtMMzING120brvzi4A6CKkhrYDa9jIJA9qNxZRrXFv
         LfGO3UUA8qmx43kuLO05R81O1On6pZKa4pOUT9sGINVxZ4YyJqnxUv99m82Eg7TOo8Ze
         g4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681728500; x=1684320500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzocyBkoDyqwm37oXkPUZaJ33qZ0oiBEGhDhAvLR+GA=;
        b=MV0/6QPEB74RuWwqLwHFDYPc51bkvvnihSZPfegzz+doHtYm3v39mrPhLMkHjXcRWE
         oiED8szUl9bJsNREqqmQnDtEHUbBCEt7LHY4bt8ppf+fUaBWIRbTHmBEAz15Yd1TZlRk
         WIWveQfazlL/Xvp2ECT4qhT1yy0xCtuicg6MLCXDlG9HPtWh9YLm1dfU2gFCc9aI/JJB
         ix8DFd85OkoyS/K1uxZ51beETHPWZS0e97UcYrjMrtmuHPCXPJRyzLCwAbBGr3SfEHTK
         ZiOC5JHeuCeEtGuTm1Mjdnx4FHHiQervPXJ7zcpEJLO3h36RgQfuWOvZdDz49Je9i0Aj
         0k/Q==
X-Gm-Message-State: AAQBX9caNUpVgo7trmfhxtR/7JcJKZKuEy/gi82SdfpklGfzuIZA+/VN
        PHRc2P/BrtBgTz4pA25VYJoiFg==
X-Google-Smtp-Source: AKy350aCkDn7QGCxsbVjiQOccqdB6SDA08vFOA1fuoFzPAqhVqAsI35s6zpAZzrZSz6EY3hXzVNM2Q==
X-Received: by 2002:a17:906:3ce9:b0:94a:826c:df57 with SMTP id d9-20020a1709063ce900b0094a826cdf57mr8207127ejh.39.1681728499762;
        Mon, 17 Apr 2023 03:48:19 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id j25-20020a1709062a1900b0094f614e43d0sm1953842eje.8.2023.04.17.03.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:48:19 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 4/4] i2c: muxes: pca954x: Add regulator support
Date:   Mon, 17 Apr 2023 12:48:00 +0200
Message-Id: <20230417104801.808972-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417104801.808972-1-patrick.rudolph@9elements.com>
References: <20230417104801.808972-1-patrick.rudolph@9elements.com>
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
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 39f313658b18..42f467dc7995 100644
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
@@ -440,6 +442,8 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -492,10 +496,23 @@ static int pca954x_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(data->supply))
+		return dev_err_probe(dev, PTR_ERR(data->supply),
+				"Failed to request regulator\n");
+
+	ret = regulator_enable(data->supply);
+	if (ret) {
+		dev_err(dev, "Failed to enable vdd supply: %d\n", ret);
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
@@ -512,7 +529,7 @@ static int pca954x_probe(struct i2c_client *client)
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -520,7 +537,8 @@ static int pca954x_probe(struct i2c_client *client)
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -539,7 +557,8 @@ static int pca954x_probe(struct i2c_client *client)
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

