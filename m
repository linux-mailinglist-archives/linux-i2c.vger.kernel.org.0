Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEB63DCBFF
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhHAOZE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbhHAOZD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:25:03 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98FB7C06175F
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:54 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id k4so7412596wrc.0
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TmnI1DA9qy/cXtkHhmO57MjxX6J0GiS83vJ7Yq4S73s=;
        b=BuE7w4vmksI1OCz8kRN/pAWThkZ2l+bHRvXmyY7z3Zx2hdj+asV2Ytx3HXo+hXbXZG
         jx/20YsOTsp5+hHvZN7kc0f3BFTAgO+tfZ57grp0XrQztLYVFSRUWccbP+YBFxkOnhrO
         o66OkS9H+xgZVg5aGmFD4MBBlQmz0pSAukF237O3O7SWu9TjKxDxgjbdtp3bhhpzabsn
         eQJYFeMu9IJg4djpRhMf1v0eX0Hv/vMKtM+V4emQJ9U8U/c+FPF3J7RKA41iuuaZaa3E
         r4mRO1z/lYJykP0meQMeHLbAsebskQygHgzLHiL8PyVcW4MAEDhaysPYQX2+E/SS3uTD
         lTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TmnI1DA9qy/cXtkHhmO57MjxX6J0GiS83vJ7Yq4S73s=;
        b=KjQTV1tr0EYC17d37TVU7ct+vgC3rGIUCWyPfU3lWBuR8Hjt3nCnDNaivwNSC/LV+n
         ax/Hu6466G4XtbiAdoE/cVA4riW22qqcUPmTf7CM2fyfAdRrkrByzKxV+gf74Qc3aavK
         EIXwyvgduR6y9jeXc8C1mD/+ew6q+3EYvkyIuUVkT2kP2Mvx1AAXePV3CH7sWlUxPswt
         lgh1ZhwLyUpmLEYVftwOJ1fdBt4V6pnD8zUP+pNGoK9KjvM/jV56fv6p217PSqz5atzv
         x6WM1+Z2UY24vo68PKIiKGQev1wKNQviXDMzSOavqRwoac9w2oIJ3OtUQyycPyUGp8bM
         uXJw==
X-Gm-Message-State: AOAM530X7dDM2jWDO8fnCd+YKWW0KKQYHG7fR9W08170JAEWISFrFg/C
        9/Z2aZMlBCKh5Yz17yuYKEzlAPaThfuIYQ==
X-Google-Smtp-Source: ABdhPJx05WiCO4BUyqCnP1ydy6klaSD2flBzJRCOPoPV3fNSnHeGDMoJS4kVU068CxjNx+BP8PGvNg==
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr12813393wrk.381.1627827892976;
        Sun, 01 Aug 2021 07:24:52 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id t8sm8573868wmj.5.2021.08.01.07.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:52 -0700 (PDT)
Subject: [PATCH 08/10] i2c: i801: Improve i801_add_mux
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <12a96946-c857-b6f8-9623-407b1c71d2c5@gmail.com>
Date:   Sun, 1 Aug 2021 16:22:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The return value of i801_add_mux() isn't used, so let's change it to void.
In addition remove the not needed cast to struct gpiod_lookup.
GPIO_LOOKUP() uses GPIO_LOOKUP_IDX() that includes this cast.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 5fa8dc1cb..958b2e14b 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1389,7 +1389,7 @@ static const struct dmi_system_id mux_dmi_table[] = {
 };
 
 /* Setup multiplexing if needed */
-static int i801_add_mux(struct i801_priv *priv)
+static void i801_add_mux(struct i801_priv *priv)
 {
 	struct device *dev = &priv->adapter.dev;
 	const struct i801_mux_config *mux_config;
@@ -1398,7 +1398,7 @@ static int i801_add_mux(struct i801_priv *priv)
 	int i;
 
 	if (!priv->mux_drvdata)
-		return 0;
+		return;
 	mux_config = priv->mux_drvdata;
 
 	/* Prepare the platform data */
@@ -1414,13 +1414,11 @@ static int i801_add_mux(struct i801_priv *priv)
 			      struct_size(lookup, table, mux_config->n_gpios + 1),
 			      GFP_KERNEL);
 	if (!lookup)
-		return -ENOMEM;
+		return;
 	lookup->dev_id = "i2c-mux-gpio";
-	for (i = 0; i < mux_config->n_gpios; i++) {
-		lookup->table[i] = (struct gpiod_lookup)
-			GPIO_LOOKUP(mux_config->gpio_chip,
-				    mux_config->gpios[i], "mux", 0);
-	}
+	for (i = 0; i < mux_config->n_gpios; i++)
+		lookup->table[i] = GPIO_LOOKUP(mux_config->gpio_chip,
+					       mux_config->gpios[i], "mux", 0);
 	gpiod_add_lookup_table(lookup);
 	priv->lookup = lookup;
 
@@ -1438,8 +1436,6 @@ static int i801_add_mux(struct i801_priv *priv)
 		gpiod_remove_lookup_table(lookup);
 		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
 	}
-
-	return PTR_ERR_OR_ZERO(priv->mux_pdev);
 }
 
 static void i801_del_mux(struct i801_priv *priv)
@@ -1469,7 +1465,7 @@ static unsigned int i801_get_adapter_class(struct i801_priv *priv)
 	return class;
 }
 #else
-static inline int i801_add_mux(struct i801_priv *priv) { return 0; }
+static inline void i801_add_mux(struct i801_priv *priv) { }
 static inline void i801_del_mux(struct i801_priv *priv) { }
 
 static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
-- 
2.32.0


