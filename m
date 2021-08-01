Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951B63DCBFE
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbhHAOZE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbhHAOZD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:25:03 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A844EC0613D5
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:55 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso1025370wms.5
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NycVvCwydv6O/fEy4I0Ls/fG/ySzA4Qeak5oA/a4k3U=;
        b=CYtsONRECWEgjICD6LVWB0MiqJ3YnjPC2YgBq0BGp/hik0+9vlZdWOV0bjZmD6JCO/
         qCn+ClotgMzuzYHWL0Nq5CrdjN+XKdiP+Y3cGPxLRi5WTIfdIJof9Zs1iRuDuQHN4a6W
         x8rRlcsrADmXtq25dl0CyDAzYgnxRuM3uPvHr4WUTOgjVIernbvolyfF9TtmeKbD/HLO
         OLLLdOmdQGfcbmbPBy/Hkp1/F+EJS/p9nz6lJ5yLr8e9yCnO0FOfkeiGAQqdVeyDnaph
         BifFggaNw6lQxIQbYVu+urfz8DjFqO+yySkHyMqEMLPYQt/2xwc6lRBBqbCVaSvBvPRY
         UCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NycVvCwydv6O/fEy4I0Ls/fG/ySzA4Qeak5oA/a4k3U=;
        b=Ifjw/w7pZ4eBlEq28eW1NoQ5sYiA7jy7UcwjfRVDEdJjdAKiLqEuDWpXkLU5dvhzgh
         883P57uzIJISUPlzkA+qLZzks/EOLJg5w5tyiIpx4fp2I9n+3kZjxcffA9QKGlqPzyVm
         z16/0psoNAy98+wl1tRG+uUDOrOG8juJ97Jvr2dkXq8vsVeIWIffXun1bttzuHyyRdC0
         OifQ8uoxzeJl1uQ4kb7MnS41Y4ENOmOyIjFd15aAoloHhTD08Cn2KsmIs7ds2Wyw/KGY
         oxq4kELHeTBizVUTB617eLxSGI7Sm4ykkW47ij/1dYOwmIrf0/8CjW7QEMlvcd40vOYB
         OxzA==
X-Gm-Message-State: AOAM532yAkwcpe+MnwUPiDj7QvWcvrBOLdFbRfdPAdELe1cA8c/s/frq
        ZyU/sqI+QHCqyaAu1k+XNRAOFetChFGutA==
X-Google-Smtp-Source: ABdhPJw3joonMpVYhQaGLnn+KUx6D8mqyTa7HiTskyVJM2R8Q/xW9y1GvjqmWU39EO3O0Y9FdZ0O0g==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr12351291wmj.44.1627827894084;
        Sun, 01 Aug 2021 07:24:54 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id d8sm8594013wrv.20.2021.08.01.07.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:53 -0700 (PDT)
Subject: [PATCH 09/10] i2c: i801: Improve register_dell_lis3lv02d_i2c_device
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <5d8e72e2-085b-32ea-0a86-eeecfe1e94f3@gmail.com>
Date:   Sun, 1 Aug 2021 16:23:34 +0200
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

- Use an initializer for struct i2c_board_info info
- Use dmi_match()
- Simplify loop logic

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 958b2e14b..1ca92a1e0 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1245,28 +1245,18 @@ static const struct {
 
 static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
 {
-	struct i2c_board_info info;
-	const char *dmi_product_name;
+	struct i2c_board_info info = { .type = "lis3lv02d" };
 	int i;
 
-	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
-	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
-		if (strcmp(dmi_product_name,
-			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
-		dev_warn(&priv->pci_dev->dev,
-			 "Accelerometer lis3lv02d is present on SMBus but its"
-			 " address is unknown, skipping registration\n");
-		return;
-	}
+	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i)
+		if (dmi_match(DMI_PRODUCT_NAME, dell_lis3lv02d_devices[i].dmi_product_name)) {
+			info.addr = dell_lis3lv02d_devices[i].i2c_addr;
+			i2c_new_client_device(&priv->adapter, &info);
+			return;
+		}
 
-	memset(&info, 0, sizeof(struct i2c_board_info));
-	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
-	strlcpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
-	i2c_new_client_device(&priv->adapter, &info);
+	pci_warn(priv->pci_dev,
+		 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
 }
 
 /* Register optional slaves */
-- 
2.32.0


