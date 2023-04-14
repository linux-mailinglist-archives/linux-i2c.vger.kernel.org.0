Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC1626E2197
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 13:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbjDNLC4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 07:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjDNLCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 07:02:44 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC66D902A
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 04:02:18 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e7so7003259wrc.12
        for <linux-i2c@vger.kernel.org>; Fri, 14 Apr 2023 04:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681470123; x=1684062123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4blsxAZpdoUWbpFQCwKHQYeO2Jom3a1nDy34TkxPJY=;
        b=RUMiIqO51luv31Pf+SMERM1YQXwS6m+dBjoFg84xtTTkr+leiDHwNepUnCld05Nt9J
         fdS8LQO2caDx52BYX3gdE/dLQD56PZtDqql0TlJn00p7BDSi+u0tOhVl9QciArPGPe5B
         47i2+iuGFuLx4/c/7HtO40N4ecGp/vajwEFzCDmNU3qzlBBdJJCs1xvKzYc5NXRxFuzM
         lfjrlzPoegQRbee/EOhwwFDvNnonMC5cU+uoSIo4ykqMAgR3qzp91KC0jVx3gheTDzTj
         Om02gQa2Zj0EUHHuZAp0I2/NzluFOeynoqkMlNdhX21uBFyLyunWZOMUGVL258ZOLoem
         KVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681470123; x=1684062123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4blsxAZpdoUWbpFQCwKHQYeO2Jom3a1nDy34TkxPJY=;
        b=XX6qPFGmSXWJJruCKHsd8Woz4+/McpK8EjqHk2MyHaC5z8fH4i4Sh8ylrf1fjOHSZl
         MMTIKybCCNSOUzg8Xz6qjWbXikqnKqjrMpAixjCbPWBmSHLrbIDPwVUrTFlrBakQin0+
         j/dHyWKivHNBrtFivPGG+BiGCBi/xGD5/pS+3RtdKIKGEoDR8LGw3nmD3P//Dot0WZlG
         egwyqIqCl3yWlHF95TaprTol4efTD1JDS7TBRkullvCUS2EB5eBeg+wY+j+NwUNvPczC
         pqskLdFiBoYkt295QStObc+zqJUkUWPTYTBkDNkvV/PxePqU8xHVzW1vUyU8nN49wRCx
         sLBw==
X-Gm-Message-State: AAQBX9fYM30H/rbpEwye0hXw4GCrw+efo7BeWl6UWsXmS6HgNTEKwFYu
        r+tELg4V/Zi+RanUrts1cejHFA==
X-Google-Smtp-Source: AKy350YtepuC2DyQXRxc5xFBeoLbM6TIDUECwmMC+aW7pL80dtWoz1e2CWsomzNdehJukPB+H6pcqg==
X-Received: by 2002:adf:dd10:0:b0:2ef:bada:2f25 with SMTP id a16-20020adfdd10000000b002efbada2f25mr3622037wrm.67.1681470123345;
        Fri, 14 Apr 2023 04:02:03 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id u6-20020a5d6ac6000000b002f2789d1bcfsm3328830wrw.21.2023.04.14.04.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:02:02 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/3] i2c: muxes: pca954x: Add regulator support
Date:   Fri, 14 Apr 2023 13:01:36 +0200
Message-Id: <20230414110137.401356-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414110137.401356-1-patrick.rudolph@9elements.com>
References: <20230414110137.401356-1-patrick.rudolph@9elements.com>
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
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 35 ++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 39f313658b18..0d966a55b727 100644
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
@@ -440,6 +442,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	if (data->supply)
+		regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -492,10 +497,28 @@ static int pca954x_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get_optional(dev, "vdd");
+	if (IS_ERR(data->supply)) {
+		ret = PTR_ERR(data->supply);
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+				"Failed to request regulator\n");
+		else
+			data->supply = NULL;
+	} else {
+		ret = regulator_enable(data->supply);
+		if (ret) {
+			dev_err(dev, "Failed to enable regulator: %d\n", ret);
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
@@ -512,7 +535,7 @@ static int pca954x_probe(struct i2c_client *client)
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -520,7 +543,8 @@ static int pca954x_probe(struct i2c_client *client)
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -539,7 +563,8 @@ static int pca954x_probe(struct i2c_client *client)
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

