Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCED681CA3
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 22:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjA3VYU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Jan 2023 16:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjA3VYT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 16:24:19 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D915B30E9D
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 13:24:18 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id h16so12427427wrz.12
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 13:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVbQVYuTBc+lquR5m9j5CT7tIoPXaHOLWihy/O6lk54=;
        b=d3eIic1jm0LOGqTXwmlvwPR4wHKpdZ/zgimc1k+TCVC3yVfUwBlR5rHpbmNsbI0kZb
         mIHTLqhS9yhWjkjiMOMjzSaMm3iJJ2BEH86LzyS5igvM/sW/1+loAM7JkQfevdbCgeHl
         bmBbQMC9Nr9AbHqxhBnQX3n38M8R6BM/5Qo/mhyv49f5ckJdRTJmopAaoyZ8zDRrPsDG
         4wzbbhZB/Uvp+NVKCHLoImw6T8KDgvbgdhOIQWDMXtyk959Q/oDBY6VKZscIGWD/COBT
         Y8hi5rP1XkcLCFiU05c1iSGZ+A0mE2kK4xTs/zKwYbPHdW8YNCuNXh2zvv8jBx6WTLGX
         UadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVbQVYuTBc+lquR5m9j5CT7tIoPXaHOLWihy/O6lk54=;
        b=ZNGgvLyjamsVUl37i9Ny+UuXkkw4CN+4e1fV06TatoMcdzDIMhsXlpQfDQplRbQ2wt
         Zp3ZWRe5LL73mkQ6jJcWWSnNS8pSZcEzi7bYmRUnYNJWmgyv15zjdGiufEmSeZ/bJn82
         rTUR+eaaxFAIVTLwTYORlGGs0uJCtGuGgU6fKQMQETBGm5bM5s5iyJtObg54FTTDJn73
         IeZddzXbSip8zOZAbe0D8JZJ5BmIwcgbr6UBVWNtk4ADIBx/fZfSABc0voOzSy5NvEqG
         Csk4l1ntaAkTkklCdoE+B5nDt6uNxVi3FG4TRqWaH13NmZE5zPG2yee7AMs3OSn7uJEm
         0cmQ==
X-Gm-Message-State: AFqh2kpxjipvCo6zFD8AO+VlQJvwTIaxyA9drFAZFeP1lxZ+X5Fl27Ho
        8mBoTsfxbvdlDs5IKBmMxE2XZQKJRWI=
X-Google-Smtp-Source: AMrXdXuzii0kIa+ycK3f4Y9/mlsCW5oIJUYwiM9nFTpmXW36DxTSM4Hm2QUfIzsn5d0uMaRRcoZouQ==
X-Received: by 2002:a5d:6202:0:b0:2bd:bb5f:6a9f with SMTP id y2-20020a5d6202000000b002bdbb5f6a9fmr40972902wru.67.1675113857318;
        Mon, 30 Jan 2023 13:24:17 -0800 (PST)
Received: from ?IPV6:2a01:c23:c074:7400:d941:3cb5:fa86:8ec8? (dynamic-2a01-0c23-c074-7400-d941-3cb5-fa86-8ec8.c23.pool.telefonica.de. [2a01:c23:c074:7400:d941:3cb5:fa86:8ec8])
        by smtp.googlemail.com with ESMTPSA id n9-20020a5d67c9000000b00294176c2c01sm12819436wrw.86.2023.01.30.13.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 13:24:16 -0800 (PST)
Message-ID: <c7e39e5e-7c08-a66c-c2fb-b1bed470cf71@gmail.com>
Date:   Mon, 30 Jan 2023 22:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 1/2] i2c: core: add devm_i2c_new_ancillary_device()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <600080c4-a19f-7ab6-394f-c742179da00f@gmail.com>
In-Reply-To: <600080c4-a19f-7ab6-394f-c742179da00f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This adds a device-managed version of i2c_new_ancillary_device().
Create a helper i2c_prepare_ancillary_device() to avoid code duplication.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 43 ++++++++++++++++++++++++++-----------
 include/linux/i2c.h         |  5 +++++
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 4a72b98ac..315ecd960 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1123,6 +1123,24 @@ struct i2c_client *devm_i2c_new_dummy_device(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
 
+static u32 i2c_prepare_ancillary_device(struct i2c_client *client,
+					const char *name, u16 default_addr)
+{
+	struct device_node *np = client->dev.of_node;
+	u32 addr = default_addr;
+	int i;
+
+	if (np) {
+		i = of_property_match_string(np, "reg-names", name);
+		if (i >= 0)
+			of_property_read_u32_index(np, "reg", i, &addr);
+	}
+
+	dev_dbg(&client->adapter->dev, "Address for %s : %#x\n", name, addr);
+
+	return addr;
+}
+
 /**
  * i2c_new_ancillary_device - Helper to get the instantiated secondary address
  * and create the associated device
@@ -1146,24 +1164,25 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
  * i2c_unregister_device(); or an ERR_PTR to describe the error.
  */
 struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
-						const char *name,
-						u16 default_addr)
+					    const char *name,
+					    u16 default_addr)
 {
-	struct device_node *np = client->dev.of_node;
-	u32 addr = default_addr;
-	int i;
-
-	if (np) {
-		i = of_property_match_string(np, "reg-names", name);
-		if (i >= 0)
-			of_property_read_u32_index(np, "reg", i, &addr);
-	}
+	u32 addr = i2c_prepare_ancillary_device(client, name, default_addr);
 
-	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
 	return i2c_new_dummy_device(client->adapter, addr);
 }
 EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
 
+struct i2c_client *devm_i2c_new_ancillary_device(struct i2c_client *client,
+						 const char *name,
+						 u16 default_addr)
+{
+	u32 addr = i2c_prepare_ancillary_device(client, name, default_addr);
+
+	return devm_i2c_new_dummy_device(&client->dev, client->adapter, addr);
+}
+EXPORT_SYMBOL_GPL(devm_i2c_new_ancillary_device);
+
 /* ------------------------------------------------------------------------- */
 
 /* I2C bus adapters -- one roots each I2C or SMBUS segment */
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 500404d85..33710a5ff 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -487,6 +487,11 @@ i2c_new_ancillary_device(struct i2c_client *client,
 			 const char *name,
 			 u16 default_addr);
 
+struct i2c_client *
+devm_i2c_new_ancillary_device(struct i2c_client *client,
+			      const char *name,
+			      u16 default_addr);
+
 void i2c_unregister_device(struct i2c_client *client);
 
 struct i2c_client *i2c_verify_client(struct device *dev);
-- 
2.39.1


