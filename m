Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB35502E17
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 19:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356040AbiDORCn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 13:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356037AbiDORCm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 13:02:42 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C17453E31
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:13 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id v15so10483255edb.12
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=0reQG7gMKan1Kr0GhCO377AwhypphpJo7jZUqRk4820=;
        b=bqxJaz4rQm7b6Tl2G5HjpBrKUxfuC25aRj24NY0CsPmk01+XMPXKGcWeqWe4jk7VCG
         rqMLEFisI62KfRZ7b5h6lsMFmdHkR8ngdMgoUWiQ03bu01/JnDbLGRMLTjG9QXbwdDh2
         ZlyOETPvqsgqbxVkoAcDn5iImal6LH3/kBDKrasB4cibQF0o4K/963M33VEXIyoI8POq
         816arSTrgEywI8hivMiHvBhpqlJXdYv13/LmLUvCuhHG78d6VBfozM3dnJLVuTs3SQte
         9sM8p+O4WxcsxiwOHRQu4n5DBgGrxTIlsAGI11mtTzwxc1xlcTnLojVp+cgS8Z8SBxCJ
         kOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=0reQG7gMKan1Kr0GhCO377AwhypphpJo7jZUqRk4820=;
        b=N+Ei3acWhMdsMGiU7pAm2cF8Mn0mjPBiqqqWaQjnKq+0f1htDrXC0MEWlefhA5lzL7
         km4k685fap5P8dF1KUFywzu3oZ4X4+TBYrWF4aIfM5vLQ0IetiVenjGmC3WA1YAFu+BP
         2YlL1fvVF1dYpAVvdugxd9+7NqRxVcCvuy0c0chHDHUtJIkHgSCurVTRKQbkuDOv1vYR
         qQFT4fXQT2RD/NtjxrLhBLnNHdI3ag9fAeRbP7kQ9K0S85TqWpcv8LGojQliaR/nsqU2
         tcC2VUYZI4BtIGOU3P85xtHHVknB6ISmZuH+3fd8/3mFzyJHDr4ppnZ4TQ0DzUfKZd2G
         3u0g==
X-Gm-Message-State: AOAM532Oa/hF6D1GS6Zd4Bk5SNJIdjnJDTCZcDMESf/ENmuXKWQv5gX6
        3mii+8GvaR96huU7UN9/n+7HsiuFI3Q=
X-Google-Smtp-Source: ABdhPJwTeypJW8YmLM4zWF3GY9pt59E1lm/oQBusdlHlB+VYR/OWY7OGvblg/l61+81n9g2R1PZdbw==
X-Received: by 2002:a05:6402:22b5:b0:41d:7637:98b8 with SMTP id cx21-20020a05640222b500b0041d763798b8mr158808edb.69.1650042002962;
        Fri, 15 Apr 2022 10:00:02 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id e9-20020a17090618e900b006e8669f3941sm1827069ejf.209.2022.04.15.10.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 10:00:02 -0700 (PDT)
Message-ID: <e07379b5-609c-fd2b-3e66-f79c984c3a55@gmail.com>
Date:   Fri, 15 Apr 2022 18:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 5/8] i2c: i801: add helper i801_set_hstadd()
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

Factor out setting SMBHSTADD to a helper. The current code makes the
assumption that constant I2C_SMBUS_READ has bit 0 set, that's not ideal.
Therefore let the new helper explicitly check for I2C_SMBUS_READ.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 41 ++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a9737f14d..bf77f8640 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -771,6 +771,14 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 	return result;
 }
 
+static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
+{
+	addr <<= 1;
+	if (read_write == I2C_SMBUS_READ)
+		addr |= 0x01;
+	outb_p(addr, SMBHSTADD(priv));
+}
+
 /* Return negative errno on error. */
 static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		       unsigned short flags, char read_write, u8 command,
@@ -795,28 +803,24 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 
 	switch (size) {
 	case I2C_SMBUS_QUICK:
-		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
-		       SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr, read_write);
 		xact = I801_QUICK;
 		break;
 	case I2C_SMBUS_BYTE:
-		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
-		       SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr, read_write);
 		if (read_write == I2C_SMBUS_WRITE)
 			outb_p(command, SMBHSTCMD(priv));
 		xact = I801_BYTE;
 		break;
 	case I2C_SMBUS_BYTE_DATA:
-		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
-		       SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr, read_write);
 		outb_p(command, SMBHSTCMD(priv));
 		if (read_write == I2C_SMBUS_WRITE)
 			outb_p(data->byte, SMBHSTDAT0(priv));
 		xact = I801_BYTE_DATA;
 		break;
 	case I2C_SMBUS_WORD_DATA:
-		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
-		       SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr, read_write);
 		outb_p(command, SMBHSTCMD(priv));
 		if (read_write == I2C_SMBUS_WRITE) {
 			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
@@ -825,7 +829,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		xact = I801_WORD_DATA;
 		break;
 	case I2C_SMBUS_PROC_CALL:
-		outb_p((addr & 0x7f) << 1, SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
 		outb_p(command, SMBHSTCMD(priv));
 		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
 		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
@@ -833,8 +837,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		read_write = I2C_SMBUS_READ;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
-		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
-		       SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr, read_write);
 		outb_p(command, SMBHSTCMD(priv));
 		block = 1;
 		break;
@@ -845,10 +848,11 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		 * However if SPD Write Disable is set (Lynx Point and later),
 		 * the read will fail if we don't set the R/#W bit.
 		 */
-		outb_p(((addr & 0x7f) << 1) |
-		       ((priv->original_hstcfg & SMBHSTCFG_SPD_WD) ?
-			(read_write & 0x01) : 0),
-		       SMBHSTADD(priv));
+		if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
+			i801_set_hstadd(priv, addr, read_write);
+		else
+			i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
+
 		if (read_write == I2C_SMBUS_READ) {
 			/* NB: page 240 of ICH5 datasheet also shows
 			 * that DATA1 is the cmd field when reading */
@@ -858,11 +862,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		block = 1;
 		break;
 	case I2C_SMBUS_BLOCK_PROC_CALL:
-		/*
-		 * Bit 0 of the slave address register always indicate a write
-		 * command.
-		 */
-		outb_p((addr & 0x7f) << 1, SMBHSTADD(priv));
+		/* Needs to be flagged as write transaction */
+		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
 		outb_p(command, SMBHSTCMD(priv));
 		block = 1;
 		break;
-- 
2.35.3


