Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BE03E30E1
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238429AbhHFVTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238016AbhHFVTj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:39 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84838C0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:23 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id a192-20020a1c7fc90000b0290253b32e8796so7964027wmd.0
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/uxl6b+VYG7MHlLBxanpMmkSEnQ9cUIrMTEMuMrtu9U=;
        b=X38dzJAfx51OR75mv1LoyPP+DnDW9AustP3+shyaQk4qIFfU/Uc7RLiuwPUITJH64m
         AmFuLrSmk8AX1OTs+B87qoYNWfTAc6ixkrNmmk4UnZ/PdQzqkOzHqMHfXz0kkxveJbBF
         D7xuMGcNvMa9P+1kxnezj/daGYrcsqMVxP7hLTLlCXYkgVhXp3MTYfqFn9zv3UV3bz8b
         LKxthfD2Oj2s5DyOwMSA9eP8Fi0xlo2FZiCar3xxY/vc9siISVch9bCJuXBVq0f3pfZ2
         ShDdtLC9Pa5O+6sLaihSas7pVgUFfvEFLRwMtnfFXx4d+OdOJzN4v6Johvl7dQpzSlYM
         EcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/uxl6b+VYG7MHlLBxanpMmkSEnQ9cUIrMTEMuMrtu9U=;
        b=AMvAIVPO9h/rVEPw7xPKSuWUooWuQnyRDYLPuwXSS9h4wCd63TZfmLbXdvHxcJ6OyE
         nBNV9RUdCitwgXva2ybQkjPTqYCLjulD2n7CVZASwgCQsFASVs1PHqzOT3YJgnoaXSfF
         bW81UgIhsF2WDCJ9mQ2Nh3ro5w1upUaql598MKffGY+gRszhlGCIYuyQSg5vexh3JB5o
         AFamvlWdCREXTo5/egq8Ut/GubWrxfFxFcguUT6ZrFITiBUvtt1OmZgxOLZ3dW/MZvEx
         bFV0ACH3d5y7af8IvQtetZq0rXW+ByBOkzVvazXOmAa4aD0Yar9+3gBXtVn67JKZmtJP
         iuEw==
X-Gm-Message-State: AOAM533i6OVRAb159rlDZgEppZ3Rh4e2sWWY8jgOg0miznlNGC9X9Kfj
        GuvaxPg5evDWChkaEvwVujZEcCo7NIuuGA==
X-Google-Smtp-Source: ABdhPJzoDQg26VZSQoZERM0HfCagl6MbagYcC+MDGvAqu+HjkiUCdcizgxt5A79ONmhLmt2yuE3sZQ==
X-Received: by 2002:a05:600c:21d8:: with SMTP id x24mr5097548wmj.59.1628284761949;
        Fri, 06 Aug 2021 14:19:21 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id t1sm9725228wma.28.2021.08.06.14.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:21 -0700 (PDT)
Subject: [PATCH v2 7/9] i2c: i801: Improve i801_add_mux
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <aa447a75-9913-fcd5-476d-e593a5ea4f2d@gmail.com>
Date:   Fri, 6 Aug 2021 23:17:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The return value of i801_add_mux() isn't used, so let's change it to void.
In addition remove the not needed cast to struct gpiod_lookup.
GPIO_LOOKUP() uses GPIO_LOOKUP_IDX() that includes this cast.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index bd1db0f0a..6e9aca81b 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1391,7 +1391,7 @@ static const struct dmi_system_id mux_dmi_table[] = {
 };
 
 /* Setup multiplexing if needed */
-static int i801_add_mux(struct i801_priv *priv)
+static void i801_add_mux(struct i801_priv *priv)
 {
 	struct device *dev = &priv->adapter.dev;
 	const struct i801_mux_config *mux_config;
@@ -1400,7 +1400,7 @@ static int i801_add_mux(struct i801_priv *priv)
 	int i;
 
 	if (!priv->mux_drvdata)
-		return 0;
+		return;
 	mux_config = priv->mux_drvdata;
 
 	/* Prepare the platform data */
@@ -1416,13 +1416,11 @@ static int i801_add_mux(struct i801_priv *priv)
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
 
@@ -1440,8 +1438,6 @@ static int i801_add_mux(struct i801_priv *priv)
 		gpiod_remove_lookup_table(lookup);
 		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
 	}
-
-	return PTR_ERR_OR_ZERO(priv->mux_pdev);
 }
 
 static void i801_del_mux(struct i801_priv *priv)
@@ -1471,7 +1467,7 @@ static unsigned int i801_get_adapter_class(struct i801_priv *priv)
 	return class;
 }
 #else
-static inline int i801_add_mux(struct i801_priv *priv) { return 0; }
+static inline void i801_add_mux(struct i801_priv *priv) { }
 static inline void i801_del_mux(struct i801_priv *priv) { }
 
 static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
-- 
2.32.0


