Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5541502E18
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 19:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356041AbiDORCq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 13:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356037AbiDORCo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 13:02:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010AF532DF
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:15 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id k23so16290437ejd.3
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=k29L/Xi7olDMt2fBZ4FbGuDNkL5mRiH9SqZXW9yPuGE=;
        b=Rb0+R5kdvxO2j7Kj6lI0Jmo75FnUCp+8tyoaB/rb4pdAFNcbxPtX39xLxy38FpHrfN
         cgzBbyJz/8tH/zBstFisA6u3WNZBB6UlQ/ZVe5YLDLXQJKKnMWG5S6hcHTDTA9Rm2G2a
         h+yqfLUPzb085yOYRY/mZqTGgIZKvKHihOGUe7Cz9vLzqo0BMA+rZZSPRd4jZEdAPEzd
         ZZI1Du/2seEp6dmMbd9yPzm+R6sCBbmKkeoC2DifHDtfwqHZnfOZs4fAVWkkTuo25xMT
         9UQB/jzM093a2LH1F4Fmo72qCsFQg+ggR2dVEXnSyLw/pyvVNTzLjKLH9XWpxFrosPQm
         Yy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=k29L/Xi7olDMt2fBZ4FbGuDNkL5mRiH9SqZXW9yPuGE=;
        b=5Cn40rOeWohgowzO/srvLYgA2jMqFQ9x5FL0o820W9NIGVjoHhJjoxAw2cL8z6jNrC
         PFeF+jaoJU1cYPnhevtBcF16b2fUSibCc7M8XgyGJHgPgHfivsRj+BfzLzfMTvT5lVRl
         0p31cK0eAF4UtiVRsxJZfbanR8v3LI/rVnuseNLfvlBq7I9JWsb4f2PuyCHhEnEc0Wc8
         FdTgTHbvgYMUwuob7ufP6X20s63gCHh4wHPleNkSUkY1MoYmPp/O7JmXq/5y2QamrZKL
         h/7UEJhX0HByvkTcA7A1Bjc4Sl5wtjB8ebx7hMcb5IvIh9096nW14nz1wuRUS0CMdMdy
         Jxow==
X-Gm-Message-State: AOAM533BlwF7b3KtoJIii1dPpbVH9Nf3axF4sy6cKvzxHLoD9kpih71L
        Mg7BjBGHaWI2W6yWOYm9rSQ6AWjEm64=
X-Google-Smtp-Source: ABdhPJwJtJGSwQRLecyfzhRQBTimQGEQI58I3+WEu4MyYceG+OSgR42i0H/i2VavqiVLhPKPnWhAgA==
X-Received: by 2002:a17:907:724a:b0:6e8:4f12:b6fd with SMTP id ds10-20020a170907724a00b006e84f12b6fdmr70132ejc.198.1650042013451;
        Fri, 15 Apr 2022 10:00:13 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id b12-20020a056402278c00b004195a50759fsm3097849ede.84.2022.04.15.10.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 10:00:12 -0700 (PDT)
Message-ID: <eba39e4d-fb5f-c9d3-0d51-001f8d584d51@gmail.com>
Date:   Fri, 15 Apr 2022 18:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 6/8] i2c: i801: add i801_single_transaction(), complementing
 i801_block_transaction()
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

This patch factors out non-block pre/post processing to a new function
i801_single_transaction(), complementing existing function
i801_block_transaction(). This makes i801_access() better readable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 95 +++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index bf77f8640..8c2245f38 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -771,6 +771,62 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 	return result;
 }
 
+/* Single transaction function */
+static int i801_single_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
+				   char read_write, int command)
+{
+	int xact, ret;
+
+	switch (command) {
+	case I2C_SMBUS_QUICK:
+		xact = I801_QUICK;
+		break;
+	case I2C_SMBUS_BYTE:
+                xact = I801_BYTE;
+                break;
+	case I2C_SMBUS_BYTE_DATA:
+		if (read_write == I2C_SMBUS_WRITE)
+			outb_p(data->byte, SMBHSTDAT0(priv));
+		xact = I801_BYTE_DATA;
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		if (read_write == I2C_SMBUS_WRITE) {
+			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
+			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
+		}
+		xact = I801_WORD_DATA;
+		break;
+	case I2C_SMBUS_PROC_CALL:
+		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
+		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
+		xact = I801_PROC_CALL;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ret = i801_transaction(priv, xact);
+
+	if (ret || read_write == I2C_SMBUS_WRITE)
+		return ret;
+
+	switch (command) {
+	case I2C_SMBUS_BYTE:
+	case I2C_SMBUS_BYTE_DATA:
+		data->byte = inb_p(SMBHSTDAT0(priv));
+		break;
+	case I2C_SMBUS_WORD_DATA:
+	case I2C_SMBUS_PROC_CALL:
+		data->word = inb_p(SMBHSTDAT0(priv)) +
+			     (inb_p(SMBHSTDAT1(priv)) << 8);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
 {
 	addr <<= 1;
@@ -784,9 +840,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		       unsigned short flags, char read_write, u8 command,
 		       int size, union i2c_smbus_data *data)
 {
-	int hwpec;
-	int block = 0;
-	int ret, xact;
+	int hwpec, ret, block = 0;
 	struct i801_priv *priv = i2c_get_adapdata(adap);
 
 	mutex_lock(&priv->acpi_lock);
@@ -804,36 +858,23 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		i801_set_hstadd(priv, addr, read_write);
-		xact = I801_QUICK;
 		break;
 	case I2C_SMBUS_BYTE:
 		i801_set_hstadd(priv, addr, read_write);
 		if (read_write == I2C_SMBUS_WRITE)
 			outb_p(command, SMBHSTCMD(priv));
-		xact = I801_BYTE;
 		break;
 	case I2C_SMBUS_BYTE_DATA:
 		i801_set_hstadd(priv, addr, read_write);
 		outb_p(command, SMBHSTCMD(priv));
-		if (read_write == I2C_SMBUS_WRITE)
-			outb_p(data->byte, SMBHSTDAT0(priv));
-		xact = I801_BYTE_DATA;
 		break;
 	case I2C_SMBUS_WORD_DATA:
 		i801_set_hstadd(priv, addr, read_write);
 		outb_p(command, SMBHSTCMD(priv));
-		if (read_write == I2C_SMBUS_WRITE) {
-			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
-			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
-		}
-		xact = I801_WORD_DATA;
 		break;
 	case I2C_SMBUS_PROC_CALL:
 		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
 		outb_p(command, SMBHSTCMD(priv));
-		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
-		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
-		xact = I801_PROC_CALL;
 		read_write = I2C_SMBUS_READ;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
@@ -883,7 +924,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	if (block)
 		ret = i801_block_transaction(priv, data, read_write, size);
 	else
-		ret = i801_transaction(priv, xact);
+		ret = i801_single_transaction(priv, data, read_write, size);
 
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
 	   time, so we forcibly disable it after every transaction. Turn off
@@ -891,26 +932,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	if (hwpec || block)
 		outb_p(inb_p(SMBAUXCTL(priv)) &
 		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
-
-	if (block)
-		goto out;
-	if (ret)
-		goto out;
-	if ((read_write == I2C_SMBUS_WRITE) || (xact == I801_QUICK))
-		goto out;
-
-	switch (xact) {
-	case I801_BYTE:	/* Result put in SMBHSTDAT0 */
-	case I801_BYTE_DATA:
-		data->byte = inb_p(SMBHSTDAT0(priv));
-		break;
-	case I801_WORD_DATA:
-	case I801_PROC_CALL:
-		data->word = inb_p(SMBHSTDAT0(priv)) +
-			     (inb_p(SMBHSTDAT1(priv)) << 8);
-		break;
-	}
-
 out:
 	/*
 	 * Unlock the SMBus device for use by BIOS/ACPI,
-- 
2.35.3


