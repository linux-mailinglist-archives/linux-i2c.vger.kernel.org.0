Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C0B754759
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jul 2023 09:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjGOHxr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Jul 2023 03:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjGOHxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Jul 2023 03:53:45 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC18D358E;
        Sat, 15 Jul 2023 00:53:44 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so2814267f8f.1;
        Sat, 15 Jul 2023 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689407623; x=1691999623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXdgGZmClIw2y5+yLCGfpXc796bXl4kQ7ee+T64K4uo=;
        b=PwVsFYtmxvMSiAQEHcjIruM/oKJvm+GZdX+v3EQVMIjtyg9G/ze9ZJQrmxv4NCw2pg
         MZgq2fvxZPW3dB59NBhXebmxWXn5rI60bAB7Ft7GCdITE98aby6YFcITPaB29924RAsQ
         qIefRk5vX7D7yyTWk4g036C3P7ViAFHRXO0bTUms6xHfeQracKlxOTSoV5ueSyVXzfc9
         LWF764WuYYIgh8+h13z+jRQuaCsi0w7pb8ZPLvxji8nUx922MEjxSgS0DgIV12rjr6+5
         R+zvz5KiL3PEoN5AMQChw95XLCrRj/fRinaV2R+SczBRtcFr4lgSUz7ZMCGddPok5VJG
         PKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689407623; x=1691999623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXdgGZmClIw2y5+yLCGfpXc796bXl4kQ7ee+T64K4uo=;
        b=FRvs+Jdoi9OSVgQcSJGwPDxDemKRXLYV2Q6bketS22YzHwO7UjzqYTLgJ0e+sCUE59
         jYwnbzFePqYYmrjvFOk9zMaG8qBvbuN4t279C6Z/AqOMM2zbOjrXJkbBccmvCUjft4Q3
         ioVViu+hHG/MRlunEptWcehZbA0PHQmgK4Y2RQwJyyK/j/ZwLTKNyoFRH/LEFfLY/ilw
         i+JRsA1pSpz+I2OgW6zNFREZ5v8JCHfEgblXLiW050eGF7nSUAYqy8VcxSqTWTldarQO
         JA03lsblMeLrpfEQKIpPpzOX4Wq64dck1vBqqA0xrzXLZMuTRxVW00+mR+arOpVSCa2Z
         KnHg==
X-Gm-Message-State: ABy/qLZ+HlZWd7bUZ2gGxVuH4wue/F/T4RpsrI5SOV+6jmnwDYkQSEc3
        l/Dd3tTZhlPkbotuby0GSXSXz1ix+Epecxk4
X-Google-Smtp-Source: APBJJlEjboW0Mw0GJEMKk4o267Y0opjo4z5gbY5NMkdzMHWR0B1D43okIC5wkBrr8J5rn9EsemQdbQ==
X-Received: by 2002:a5d:44ca:0:b0:314:1582:6eb4 with SMTP id z10-20020a5d44ca000000b0031415826eb4mr6133679wrr.46.1689407623357;
        Sat, 15 Jul 2023 00:53:43 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b003142eb75724sm13001271wro.24.2023.07.15.00.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 00:53:43 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Sat, 15 Jul 2023 09:53:26 +0200
Subject: [PATCH v7 4/5] mfd: tps6586x: use devm-based power off handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v7-4-18699d5dcd76@skidata.com>
References: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v7-0-18699d5dcd76@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Benjamin Bara <benjamin.bara@skidata.com>

Convert the power off handler to a devm-based power off handler.

Acked-for-MFD-by: Lee Jones <lee@kernel.org>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/mfd/tps6586x.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 2d947f3f606a..b12c9e18970a 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -22,6 +22,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
 
@@ -457,13 +458,21 @@ static const struct regmap_config tps6586x_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static struct device *tps6586x_dev;
-static void tps6586x_power_off(void)
+static int tps6586x_power_off_handler(struct sys_off_data *data)
 {
-	if (tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT))
-		return;
+	int ret;
+
+	/* Put the PMIC into sleep state. This takes at least 20ms. */
+	ret = tps6586x_clr_bits(data->dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT);
+	if (ret)
+		return notifier_from_errno(ret);
+
+	ret = tps6586x_set_bits(data->dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
+	if (ret)
+		return notifier_from_errno(ret);
 
-	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
+	mdelay(50);
+	return notifier_from_errno(-ETIME);
 }
 
 static void tps6586x_print_version(struct i2c_client *client, int version)
@@ -559,9 +568,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
 		goto err_add_devs;
 	}
 
-	if (pdata->pm_off && !pm_power_off) {
-		tps6586x_dev = &client->dev;
-		pm_power_off = tps6586x_power_off;
+	if (pdata->pm_off) {
+		ret = devm_register_power_off_handler(&client->dev, &tps6586x_power_off_handler,
+						      NULL);
+		if (ret) {
+			dev_err(&client->dev, "register power off handler failed: %d\n", ret);
+			goto err_add_devs;
+		}
 	}
 
 	return 0;

-- 
2.34.1

