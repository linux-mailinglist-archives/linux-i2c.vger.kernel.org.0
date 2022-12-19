Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF576511BB
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiLSSXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiLSSXF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:23:05 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F3513D74
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:03 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id r26so14091464edc.10
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLFbHxD8YKH/9Oz6exMSfQ6VVx7Z2wXPdU8AOvF1u/Q=;
        b=pvXna3RxNpn25KSSOpXXEsLcWXZArFBsgDj9SCkGuRCCjXXpGKxQJh+tE7upmjzhqT
         1mLnzpZwpduhlwNS1OQ0fc+QKpxxkC8xHvoLQQgSvsdpGTIZB4mZKEaBV3LfUDy5T0hF
         VGyj6ZIb3FlWW9xD+fVZkGQmOOBufwZmTQ15Y51LAaJCbe3xSyUKewTJO0/AHbpRKt0z
         J60yQ0QZQJs7tl3BDDrQOfKkYrXfwaumYHvP3Rr8sZcjScfiPiQUeWSYc+s4jMzaTeZu
         EHFdJ/h+i1xMaIMim8Ee8pzC6kWsZcP5WyNl0aWucLMI902/5XaiaChBNGGK+sHd21oU
         QTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLFbHxD8YKH/9Oz6exMSfQ6VVx7Z2wXPdU8AOvF1u/Q=;
        b=Po/Hmgn4WEpirsdEnYdAEactC8sO8tGVM1k6kUZ2Pw0g7Yn2jVrdosZ6GS65nzbHMg
         gL0K4/+3Pb7iZXGmlxxKzxivUZ7B3pIhICRHAfjGyfginatqpVcslngZ72DiOGE4hd6V
         Tp22J6c2Kq6dR0W+wfYv+MGoaexFbM1O/n1SoUBZKt/8Z7CKNiaUoRDafCjx+3jNhRF6
         GI5gpmCzVL6jvPYOVlVHAe/DPtZ6OjiNekcWUMkBCKZ7WVM4xYGAkeHCRktAmZa/7oNk
         ZDvy+fKZvtv2d/4RpD1gxa+P1qvNUXj5yu8afl6BfHFy2IJaO1AQWRnJt6BGurxuPQb9
         KRKA==
X-Gm-Message-State: AFqh2kr7NBrPEZJAhPEE0WupaA3tGwuxCrJf3ylHDoo3JbT0jl3/YMR1
        Owr+IFAdRVOiFUgbmKC5icW+U0nNn8s=
X-Google-Smtp-Source: AMrXdXuGB/fUdGcP2CZYyxA3VD8vE3S1NBv852LebOlwYrD/hk+ljLK2k8vh7kJRnr2mc8M4H9Pzqg==
X-Received: by 2002:a05:6402:1944:b0:475:7dbf:7040 with SMTP id f4-20020a056402194400b004757dbf7040mr13771135edz.42.1671474181926;
        Mon, 19 Dec 2022 10:23:01 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id j21-20020aa7ca55000000b0045c47b2a800sm4609723edt.67.2022.12.19.10.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:23:01 -0800 (PST)
Message-ID: <6ce494a1-6d7e-4a87-f6ed-ffee176c163c@gmail.com>
Date:   Mon, 19 Dec 2022 19:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 09/10] i2c: i801: call i801_check_pre() from i801_access()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
In-Reply-To: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
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

This avoids code duplication, in a next step we'll call
i801_check_post() from i801_transaction() as well.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 78663d8df..4b5fb2c61 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -462,10 +462,6 @@ static int i801_transaction(struct i801_priv *priv, int xact)
 	unsigned long result;
 	const struct i2c_adapter *adap = &priv->adapter;
 
-	status = i801_check_pre(priv);
-	if (status < 0)
-		return status;
-
 	if (priv->features & FEATURE_IRQ) {
 		reinit_completion(&priv->done);
 		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
@@ -653,10 +649,6 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
 		return -EOPNOTSUPP;
 
-	status = i801_check_pre(priv);
-	if (status < 0)
-		return status;
-
 	len = data->block[0];
 
 	if (read_write == I2C_SMBUS_WRITE) {
@@ -892,6 +884,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 
 	pm_runtime_get_sync(&priv->pci_dev->dev);
 
+	ret = i801_check_pre(priv);
+	if (ret)
+		goto out;
+
 	hwpec = (priv->features & FEATURE_SMBUS_PEC) && (flags & I2C_CLIENT_PEC)
 		&& size != I2C_SMBUS_QUICK
 		&& size != I2C_SMBUS_I2C_BLOCK_DATA;
@@ -914,6 +910,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	 */
 	if (hwpec)
 		outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_CRC, SMBAUXCTL(priv));
+out:
 	/*
 	 * Unlock the SMBus device for use by BIOS/ACPI,
 	 * and clear status flags if not done already.
-- 
2.39.0


