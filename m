Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2682D6FCE39
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 21:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbjEITEC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 15:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234995AbjEITDq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 15:03:46 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640E13A89;
        Tue,  9 May 2023 12:03:41 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9661a1ff1e9so585041566b.1;
        Tue, 09 May 2023 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683659019; x=1686251019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41onpHzQLEVrljVFMSZhqOmakDjAgDTWqK5CRbhigA0=;
        b=dW3Hcc1ywetN6Ic23ffj31/3v55J7Qvz5V/p3r3jo9eAN/rWaoB+0MDU8nYYGR71p/
         1Yycr1V2zHueNQCrplRox1+o6yIBrlLezAC9qGD9Umn9Aw05z3QkHfa5GnvScSBxjAv9
         TjwtwX78JFSAkgEvaIuHL7FwTfFOC1RkNmu/WBtF7h/mkQo4UgdoWb/AYmM+7rl9X3M+
         skqpXUEavyOKgJ1b7/SsMeVQH8E0l4P3UF0I0LQXMhR3EVV6mEYbhhzKnotkgq3IW3XY
         WEBjlcepf8KUQo6CdTTljBZnANAgb0vxqKb3tJIwIKifRqufqVo155ubm76zSoUDsNJ0
         q00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683659019; x=1686251019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41onpHzQLEVrljVFMSZhqOmakDjAgDTWqK5CRbhigA0=;
        b=Memoc0Zgrg3/3zGWmxT8udalh6e372t4/Wqv2Mij+WU8fH7a7s62lWZq6a+MS3IaCp
         S0PhdoOm898XdzHSBu7Hc0zw8QGkKnjTSfTNTOvtoq/me6cZ+0gQrlGMnXa7MXQG+M/x
         3+KJ6vc4KciFnU+2TddJtnsf3RtJ3czb2cZkUKd+BP66ZwdQeMjhPseHIW2fFCxMFR3h
         nM/ldH0m0otFUnnum80dxAxfeSRmOx9mdZFfXWXlISD7m37dzIXcTJyy5DZqnthCXPwy
         IQ7ngY9CzvmDM+d/Mx3WPwpJQ4E6sYwt/B9wji4r2tZlOWK9LQmmeuU2KSzGE17wBDVv
         whjQ==
X-Gm-Message-State: AC+VfDzqv2IxW2eCusYMf/0ATBTfieH366KCA8ZR4ZXUbpMF5HhwbEMJ
        GCba+weeLIjdg4Cv4oBACtKjAMgKzVlg7Gp1
X-Google-Smtp-Source: ACHHUZ5FBMnnDtwDDNO2/H6qZ9X1kDVfqKsjE0ZHjszI7WNAp5BgKlqdRDobHjdJxpqnG0KRdB/+Hg==
X-Received: by 2002:a17:907:9454:b0:94e:54ec:1a10 with SMTP id dl20-20020a170907945400b0094e54ec1a10mr12516223ejc.29.1683659019239;
        Tue, 09 May 2023 12:03:39 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906c00200b009697aa5acfcsm1640232ejz.122.2023.05.09.12.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 12:03:39 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Tue, 09 May 2023 21:03:02 +0200
Subject: [PATCH v6 4/5] mfd: tps6586x: use devm-based power off handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v6-4-af44a4cd82e9@skidata.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
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

