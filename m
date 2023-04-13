Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E486E0822
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 09:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjDMHrO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 03:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjDMHrM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 03:47:12 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A62D9014;
        Thu, 13 Apr 2023 00:47:07 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id si1so5005899ejb.10;
        Thu, 13 Apr 2023 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681372025; x=1683964025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioXGAt8o8PuPvrOurTdEUEqeCkOKi03aaJ3rgZH9M80=;
        b=Rqa5To0WIIjF/pWxoOXNzA5fatbZDAp8wifSZNVfu9O3Eg3efRAI4MVKg9rI9pqvft
         iCmOsEQQwVqLAYTUPN1qz0ShF+A436Fl4Dq4Uee8lq3su8PFwj1U61G7GFH6MYFoIsF0
         yuQbfSX7bAtVCEH1KtTmSt8p/Co2EXsm86sQA0xSd02DipV3B95ymswmMOIOYji6wxoF
         borzJrHYS8cDZCAlnUYrbCZGfiJ4XacnLfAQ7u6fcv1UE1ahG+EK+5reFOWcR3DqVtC0
         aahjfbf4U7i2plcvjecjF187S34n87gDa3MDtN81AqfVA78kCa/RTM+HBOae51AVrx0l
         xOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681372025; x=1683964025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioXGAt8o8PuPvrOurTdEUEqeCkOKi03aaJ3rgZH9M80=;
        b=j1AI0OP0jegaseYew3aFY+InUO/bx3j+ss+tXq6mm3oRSyg+fghS3C2cLuVvscjykM
         mwVtm9cz+V/gjP1I2Oy7fwrUdeRBqDCoJ9W/xm8/8HHT/vFVSshE2V+hnNgUjDNXQtdu
         JScyIjtXs/XvNlV76wzMJrOoNauvSW9Y9g0KG0I/nXHG4/3MVFzoozWk1jdIbhKGCeh1
         6DB3mv5LWrxrR4cNUxqTYhLOYpN6IBtmfP+pInU6vSJROjRMkMMEj2Yyfk390bltwf2l
         JbQkEjJVN34IpBGyc0GK7UZzTTp/M+ESRZ5tpvoEhFzDXi1gdZQVJl5yUxfYvl4tCClN
         8l2g==
X-Gm-Message-State: AAQBX9fXsil6RQV2B3aiCXHP8pCqNj0TolAW0Dal1PRp9i7+IDr5wJLN
        OlDoHbrUKFh8XYXYaKUNxaW4Bth5gWCRRg==
X-Google-Smtp-Source: AKy350bBqhP12eo9aZledBj/TC4whF0rO3C1tH4lWs0go4Z4d9cIhzFu8tRWr5BpSMsl7jXQ31sO6w==
X-Received: by 2002:a17:906:a1ca:b0:933:1702:a12b with SMTP id bx10-20020a170906a1ca00b009331702a12bmr2131835ejb.17.1681372025185;
        Thu, 13 Apr 2023 00:47:05 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id q16-20020a1709060f9000b0094e954fd015sm565620ejj.175.2023.04.13.00.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 00:47:04 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Thu, 13 Apr 2023 09:46:41 +0200
Subject: [PATCH v4 3/4] mfd: tps6586x: use devm-based power off handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v4-3-b24af219fb47@skidata.com>
References: <20230327-tegra-pmic-reboot-v4-0-b24af219fb47@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v4-0-b24af219fb47@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Benjamin Bara <benjamin.bara@skidata.com>

Convert the power off handler to a devm-based power off handler.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/mfd/tps6586x.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 2d947f3f606a..93f1bf440191 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -22,6 +22,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
 
@@ -457,13 +458,16 @@ static const struct regmap_config tps6586x_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static struct device *tps6586x_dev;
-static void tps6586x_power_off(void)
+static int tps6586x_power_off_handler(struct sys_off_data *data)
 {
-	if (tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT))
-		return;
+	struct device *tps6586x_dev = data->cb_data;
+	int ret;
+
+	ret = tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT);
+	if (ret)
+		return ret;
 
-	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
+	return tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
 }
 
 static void tps6586x_print_version(struct i2c_client *client, int version)
@@ -559,9 +563,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
 		goto err_add_devs;
 	}
 
-	if (pdata->pm_off && !pm_power_off) {
-		tps6586x_dev = &client->dev;
-		pm_power_off = tps6586x_power_off;
+	if (pdata->pm_off) {
+		ret = devm_register_power_off_handler(&client->dev, &tps6586x_power_off_handler,
+						      &client->dev);
+		if (ret) {
+			dev_err(&client->dev, "register power off handler failed: %d\n", ret);
+			goto err_add_devs;
+		}
 	}
 
 	return 0;

-- 
2.34.1

