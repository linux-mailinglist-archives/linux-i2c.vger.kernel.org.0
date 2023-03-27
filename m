Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84DDF6CA6A0
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 15:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbjC0N6j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 09:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbjC0N6a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 09:58:30 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4133C00;
        Mon, 27 Mar 2023 06:58:29 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id x33so6384153uaf.12;
        Mon, 27 Mar 2023 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679925508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4y7RHA98qLuFsz3JDJ246X3y2mp8vITzNXl8/trhahM=;
        b=ZU3Q7yqm3khuYericsbX/ZLFoa+VkYN7jJ/hd2K7a/tsHtQL1wXdWXB5G1SOHvQz0p
         mLYVkYLSyXIS8rDGZXYxwJLGkOx2FWwpCmfltprEw+BJVa41VN1tx0/6uS3j2CehmlV9
         /YNhEnEYC+ZyKk615/kc30FXLTu3gS92Lo+uhGTp6so65W4RPVwiURnGi1N4UO3DzMim
         pof11WsEPbsYXCYDPvvNDMRzC4dY3KZIzyNIXAbaESxPVkOajthID//wzFIYzTJG8B9h
         6ayWKuZZCF5FgBMumEFXiUkHM/UJ8VZCWL9dDeUp8WN2GbzOS/9++HPj628UJKsxLvr7
         1iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679925508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4y7RHA98qLuFsz3JDJ246X3y2mp8vITzNXl8/trhahM=;
        b=RNtCWPROywZgDxpoQDnRowet/qrA/omuhd7VXbfHOmVW4V5cdx2v9ZnzMF2jK7IOpP
         XBJIghsqS5JhjySooViXDrEr32BGhd9pZMuAKTYQeMLaKZUN9v9ObQFTMFEcJ2xiFfnY
         ofC8DhcOiOmHHYRa5V6iJrI4RN7djp3t/KDODgG10xLCMQFzC3ET0vRX6anXb8MWfEfZ
         YkYAnEzyoSMSdVgBoR2V1oFbb0kasqxpXOrVYOA+NAzrfO0dTfLNqwc2SawJG6orMv+J
         FPJrgy9HsuBHya3ejkHDwVCfbuRXLkR3riVUy5seBME8CyHSQOyg9PRyIATbjhsj1S//
         9DHg==
X-Gm-Message-State: AAQBX9fA+NdCLZhPfOg8SzBcYXf5Ks7ZFL8oGo26R0p0PY6vYbonlDTJ
        y8PnNiOEKt+KH04wUu/bCQQ=
X-Google-Smtp-Source: AKy350bTpCZeZBYIJUxgULlpNIJsD9bEqu5L8bcdmiT8ZlfFx9c6w5QGgXyMp057jz2959mDdlOxhA==
X-Received: by 2002:a05:6122:13b0:b0:435:e8a8:29e0 with SMTP id n16-20020a05612213b000b00435e8a829e0mr4364596vkp.6.1679925508575;
        Mon, 27 Mar 2023 06:58:28 -0700 (PDT)
Received: from [127.0.1.1] ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id 135-20020a1f198d000000b004367f3393b8sm2731072vkz.28.2023.03.27.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:58:28 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
Date:   Mon, 27 Mar 2023 15:57:45 +0200
Subject: [PATCH v3 3/4] mfd: tps6586x: use devm-based power off handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-tegra-pmic-reboot-v3-3-3c0ee3567e14@skidata.com>
References: <20230327-tegra-pmic-reboot-v3-0-3c0ee3567e14@skidata.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v3-0-3c0ee3567e14@skidata.com>
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee@kernel.org>,
        rafael.j.wysocki@intel.com
Cc:     dmitry.osipenko@collabora.com, jonathanh@nvidia.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Benjamin Bara <benjamin.bara@skidata.com>

Convert the power off handler to a devm-based power off handler.

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

