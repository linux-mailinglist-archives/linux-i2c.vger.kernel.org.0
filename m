Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBAF76E5F73
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 13:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbjDRLK7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 07:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjDRLKv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 07:10:51 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53051900B;
        Tue, 18 Apr 2023 04:10:30 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a5so15608361ejb.6;
        Tue, 18 Apr 2023 04:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681816228; x=1684408228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtS1ygcE2PjsdNhXBk8/87DjMxp+o7uwRjOEEP3Mvzg=;
        b=EGyHKN4tkpwCWGxolzyBJYMI1qiKu9MJqhR4HMS9CtxNfzyvVgXTZgTbMTne2rP+TI
         f+Or0zNlj6x+eRX0mhSEQpAlrkzK9QQhib/QbNWQ89/+tKQhFZkgOJB5AOaJm4uNyFp6
         9SCyGdxXpgDR8aCyg/KbQcLgZ+3LnIsfAY2ZpqRPjfjRuGphucmqEt99P1nEWHRDQ6SM
         /c9r9/g3N9VWdyLN/VT6iprYz2ZQyv/4wrjj2Llym40Tkac5CD5IU4bu7Sf3s0RnIDeD
         KAeIERFoF0Vc/QwSbLTyrUZ+EhJtbs5a0hLqFMtU+Hl+N1+CIW0u7CFIKVWRIB4YRrY0
         0Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681816228; x=1684408228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtS1ygcE2PjsdNhXBk8/87DjMxp+o7uwRjOEEP3Mvzg=;
        b=ODhJ/2zAOLPc+GR8CudrX6PxBwf48nWVKOxraJh6JI7NLUIwkEweGVrB1V4glY904v
         TobFNmGyZje8D11bo9MRmKHLkeaNqeep4K4Oite2m/Zsi2ykByIa3s2WyEABbv153uJu
         sB+qhATm3zGYzDv3pB4dx7S208lSlmxXwGuAiIvG4bveLAKE2cJA+i3HGu4pYg4hjYtV
         qoWWJSBwnwoR15BlORXtMu6puaPXbPy0b+Gu6/J+M+0eICaDSOKGjvTsKcf8GU8CYiNW
         YCQiYRh4mF2AJNJkHAnqE/qwoWYutrI4CnjW2C+ZAt3nf5tFyq+2a+61YvFFHK1eKteB
         /hRw==
X-Gm-Message-State: AAQBX9cE/Hij0RzAEFshuGRINEEcuuXtsZT5O/2FAYSxPvkcbMS1jUUx
        qD8JwY0qNPY+sCq1/iCFqOmpnLyOX1HxRNF8
X-Google-Smtp-Source: AKy350aiSYTxmVZXM26WUlSVE3chRj7TlJhSs8yk84VKvLGeniNoQajvh5tAJWas8/8PdWWiS+1MiQ==
X-Received: by 2002:a17:906:240f:b0:94f:1a11:e08b with SMTP id z15-20020a170906240f00b0094f1a11e08bmr9336918eja.20.1681816228437;
        Tue, 18 Apr 2023 04:10:28 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906379a00b0094eef800850sm5954554ejc.204.2023.04.18.04.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 04:10:28 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 18 Apr 2023 13:10:04 +0200
Subject: [PATCH v5 5/6] mfd: tps6586x: use devm-based power off handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v5-5-ab090e03284d@skidata.com>
References: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Benjamin Bara <benjamin.bara@skidata.com>

Convert the power off handler to a devm-based power off handler.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/mfd/tps6586x.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 2d947f3f606a..226e856e34e0 100644
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
+	/* bring pmic into SLEEP state. this takes at least 10ms. */
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

