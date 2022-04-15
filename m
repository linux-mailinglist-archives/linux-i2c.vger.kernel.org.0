Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B65B7502E19
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 19:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356051AbiDORCr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 13:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356046AbiDORCq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 13:02:46 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7BE54187
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:16 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g20so10509440edw.6
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=mSA7WCyLrRzQfIX93yIDBxzW5BL3jtV81phFmpM45Dk=;
        b=W5E/n88p+LJggtggfX2UhlsUV9p3mYQEDd0a7gznULM6bgtw3HbmmZDk1T0Ah37T3I
         6GgO9hK+0d28eQzh4c/ZgcpdnKNjBfapQLoYTv4nhxA/4s5UvcOeyob/wFs9sj7wmE4M
         zuulKpleZpKgvQSG17ZHwdA5PE3hI0KTpIpujjRyWNIQBUXS2oEqbNy/f3GnRI+V/QKt
         MrNpZlaDBHJ/RCSqz+a9KXrhmAdcvG+HViqurst+1OFbGF3gvgHCZCksSUHNco3eO4Lm
         ef65aNzrIbMmkNfardsdxC1d43L5nlj9nNhLkiGBxNnoCAfeedxoieI7cdpsVJjpKmxF
         lW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=mSA7WCyLrRzQfIX93yIDBxzW5BL3jtV81phFmpM45Dk=;
        b=H7ckSO9OuJc3EgiJk94h7XrPvGoA1FQlLlYq9JQ/iLJSYvv0RVb/lyNIItxo7r+bAO
         9xN3EqIJNp58trm9lbKICmkjXQ69EZMOpDCbxdrWd9umU2DRCqz2A5bnmWs7VGfqDKRi
         moQqWMTZb23UM0nUbqNw843lN7w9D6j2zWIZwzol1ppNdJS0aUHDW7Gvg+wOmE2fe8gD
         rBmX5uGSwaPCBASOAm8rda9oG/jla0a40mSM3VuaMqKVfe6yj7h3gEpDFrVF8q5fdPnv
         delT2n/p1eA+zcDD8JhTFNNxNrl+6LXninw9jDUVAKVQmrPT+dzEuu1yVTpIH12rk3oi
         VDVw==
X-Gm-Message-State: AOAM533HoBODQaSJS4unmcbHbHdTXh4cHvLNOnjcRYSSJZ+5WMY7ZhiF
        nbZkLW8sVvnPPuvwlq97e78=
X-Google-Smtp-Source: ABdhPJwlvfQdhJC6owOVuY84kOO0/u65bca23UI6Bi/tCYWgY9aOS/NcCKzS2mtzS/vwDePCcTLj+A==
X-Received: by 2002:a05:6402:2709:b0:422:adc9:bc39 with SMTP id y9-20020a056402270900b00422adc9bc39mr155962edd.111.1650042014643;
        Fri, 15 Apr 2022 10:00:14 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id i12-20020a05640200cc00b00421058b175esm2659969edu.53.2022.04.15.10.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 10:00:14 -0700 (PDT)
Message-ID: <261bddb8-1a1e-13e9-8557-e4ad1c7f9826@gmail.com>
Date:   Fri, 15 Apr 2022 18:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 7/8] i2c: i801: call i801_check_pre() from i801_access()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
In-Reply-To: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This avoids code duplication, in a next step we'll call
i801_check_post() from i801_access() as well.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 8c2245f38..9061333f2 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -460,10 +460,6 @@ static int i801_transaction(struct i801_priv *priv, int xact)
 	unsigned long result;
 	const struct i2c_adapter *adap = &priv->adapter;
 
-	status = i801_check_pre(priv);
-	if (status < 0)
-		return status;
-
 	if (priv->features & FEATURE_IRQ) {
 		reinit_completion(&priv->done);
 		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
@@ -647,10 +643,6 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
 		return -EOPNOTSUPP;
 
-	status = i801_check_pre(priv);
-	if (status < 0)
-		return status;
-
 	len = data->block[0];
 
 	if (read_write == I2C_SMBUS_WRITE) {
@@ -851,6 +843,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 
 	pm_runtime_get_sync(&priv->pci_dev->dev);
 
+	ret = i801_check_pre(priv);
+	if (ret)
+		goto out;
+
 	hwpec = (priv->features & FEATURE_SMBUS_PEC) && (flags & I2C_CLIENT_PEC)
 		&& size != I2C_SMBUS_QUICK
 		&& size != I2C_SMBUS_I2C_BLOCK_DATA;
-- 
2.35.3


