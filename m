Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE536511BD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbiLSSXJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbiLSSXF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:23:05 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15C1614D
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:02 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id d20so14207332edn.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SS8F1eybluXikfga57LpXk9XR7mh2jagKkWcoJ9oiAc=;
        b=TKM+/gw99y1/S2Z9/idq5l0mDuLtKJe47xObG4PEiFzu/OnEo3XvDVqqDeXnTeb5SB
         /Eb9OQIN4OaAp9He6CmZuHIGELR2L/AcwNLox0Bdlapmq1uhyYgG8yHkt62wOA5Yj1qp
         3EopDC7xDleNmv/aoYDWky52dAV+1K16iih9VnrH+g1Xgh8mQAdOjw1qYKQjObeov6ab
         yh1kgluXHQ2/fhE8QJKAvC5UMPTCbzDjXeP/9swJg/gKS+ZHXYZMhuDGh6B+s/j8f82r
         99/Pw1TKcFI36+QM6ZUB+qhHHYK+5IyMXCXn4ZFfeS5+9gfKJ9WRFajhYb/CPa61MzDn
         9u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SS8F1eybluXikfga57LpXk9XR7mh2jagKkWcoJ9oiAc=;
        b=gDzDWEdXFHBJC7tEbTTSqr8n9n5T62vT5lQASJpe7NVwdDvnmJGlVHPC8KIf3ILgCc
         b49+loMjG9TAJhEUH1kxZUmWnZw/0Vqx/uYjd59829SAFNFXgouGAP9A9vDPRgMlDlq7
         v9uVu3kFR/0AKdeC0J/a8yddYsiAMnqMnwM76hVOLHXjT0mUSGK8GbsgQZ+AWN+sryYP
         p5KcLOfiSuqunpWryFpRn9nMQYjtsdhazWmKDWABeB6/YAA8Vo9/SvTeCdLLX71QxeWu
         b9dQBbMZe+5Ji+QfzVClz/P2FWY6SMQmkh0VKU5DVGs6nfJWVjbIu5xTqUD1ggDqD4rX
         87Gw==
X-Gm-Message-State: ANoB5pkEsp9ccsBf818FSxseQcBP6mPz88ytAeqpV6liYcFsRHyJv328
        VeCpg8qsJ12wMoqNXbTicXdBLq7GxPY=
X-Google-Smtp-Source: AA0mqf7R7JY3viUROQbCyPcI6cHrFgKRK4QBLpIs7XVxNKQKkHqNhZCv6SfDwOm+ptaIoOwn8IBAmA==
X-Received: by 2002:a05:6402:2b8b:b0:468:58d4:a0f2 with SMTP id fj11-20020a0564022b8b00b0046858d4a0f2mr32835779edb.23.1671474181221;
        Mon, 19 Dec 2022 10:23:01 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id f4-20020a17090631c400b007adf2e4c6f7sm4674920ejf.195.2022.12.19.10.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:23:00 -0800 (PST)
Message-ID: <83fd2bd5-1f49-4943-ca67-e774f98905cb@gmail.com>
Date:   Mon, 19 Dec 2022 19:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 08/10] i2c: i801: centralize configuring block commands in
 i801_block_transaction
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

Similar to the patch for non-block commands, centralize block command
register settings in i801_block_transaction().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 85 +++++++++++++++--------------------
 1 file changed, 36 insertions(+), 49 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 0d49e9587..78663d8df 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -803,7 +803,7 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
 
 /* Block transaction function */
 static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
-				  char read_write, int command)
+				  u8 addr, u8 hstcmd, char read_write, int command)
 {
 	int result = 0;
 	unsigned char hostc;
@@ -813,7 +813,29 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
 		return -EPROTO;
 
-	if (command == I2C_SMBUS_I2C_BLOCK_DATA) {
+	switch (command) {
+	case I2C_SMBUS_BLOCK_DATA:
+		i801_set_hstadd(priv, addr, read_write);
+		outb_p(hstcmd, SMBHSTCMD(priv));
+		break;
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		/*
+		 * NB: page 240 of ICH5 datasheet shows that the R/#W
+		 * bit should be cleared here, even when reading.
+		 * However if SPD Write Disable is set (Lynx Point and later),
+		 * the read will fail if we don't set the R/#W bit.
+		 */
+		i801_set_hstadd(priv, addr,
+				priv->original_hstcfg & SMBHSTCFG_SPD_WD ?
+				read_write : I2C_SMBUS_WRITE);
+		if (read_write == I2C_SMBUS_READ) {
+			/* NB: page 240 of ICH5 datasheet also shows
+			 * that DATA1 is the cmd field when reading
+			 */
+			outb_p(hstcmd, SMBHSTDAT1(priv));
+		} else
+			outb_p(hstcmd, SMBHSTCMD(priv));
+
 		if (read_write == I2C_SMBUS_WRITE) {
 			/* set I2C_EN bit in configuration register */
 			pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
@@ -824,6 +846,13 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
 				"I2C block read is unsupported!\n");
 			return -EOPNOTSUPP;
 		}
+
+		break;
+	case I2C_SMBUS_BLOCK_PROC_CALL:
+		/* Needs to be flagged as write transaction */
+		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
+		outb_p(hstcmd, SMBHSTCMD(priv));
+		break;
 	}
 
 	/* Experience has shown that the block buffer can only be used for
@@ -852,7 +881,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		       unsigned short flags, char read_write, u8 command,
 		       int size, union i2c_smbus_data *data)
 {
-	int hwpec, ret, block = 0;
+	int hwpec, ret;
 	struct i801_priv *priv = i2c_get_adapdata(adap);
 
 	mutex_lock(&priv->acpi_lock);
@@ -867,57 +896,16 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		&& size != I2C_SMBUS_QUICK
 		&& size != I2C_SMBUS_I2C_BLOCK_DATA;
 
-	switch (size) {
-	case I2C_SMBUS_QUICK:
-	case I2C_SMBUS_BYTE:
-	case I2C_SMBUS_BYTE_DATA:
-	case I2C_SMBUS_WORD_DATA:
-	case I2C_SMBUS_PROC_CALL:
-		break;
-	case I2C_SMBUS_BLOCK_DATA:
-		i801_set_hstadd(priv, addr, read_write);
-		outb_p(command, SMBHSTCMD(priv));
-		block = 1;
-		break;
-	case I2C_SMBUS_I2C_BLOCK_DATA:
-		/*
-		 * NB: page 240 of ICH5 datasheet shows that the R/#W
-		 * bit should be cleared here, even when reading.
-		 * However if SPD Write Disable is set (Lynx Point and later),
-		 * the read will fail if we don't set the R/#W bit.
-		 */
-		i801_set_hstadd(priv, addr,
-				priv->original_hstcfg & SMBHSTCFG_SPD_WD ?
-				read_write : I2C_SMBUS_WRITE);
-		if (read_write == I2C_SMBUS_READ) {
-			/* NB: page 240 of ICH5 datasheet also shows
-			 * that DATA1 is the cmd field when reading */
-			outb_p(command, SMBHSTDAT1(priv));
-		} else
-			outb_p(command, SMBHSTCMD(priv));
-		block = 1;
-		break;
-	case I2C_SMBUS_BLOCK_PROC_CALL:
-		/* Needs to be flagged as write transaction */
-		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
-		outb_p(command, SMBHSTCMD(priv));
-		block = 1;
-		break;
-	default:
-		dev_err(&priv->pci_dev->dev, "Unsupported transaction %d\n",
-			size);
-		ret = -EOPNOTSUPP;
-		goto out;
-	}
-
 	if (hwpec)	/* enable/disable hardware PEC */
 		outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_CRC, SMBAUXCTL(priv));
 	else
 		outb_p(inb_p(SMBAUXCTL(priv)) & (~SMBAUXCTL_CRC),
 		       SMBAUXCTL(priv));
 
-	if (block)
-		ret = i801_block_transaction(priv, data, read_write, size);
+	if (size == I2C_SMBUS_BLOCK_DATA ||
+	    size == I2C_SMBUS_I2C_BLOCK_DATA ||
+	    size == I2C_SMBUS_BLOCK_PROC_CALL)
+		ret = i801_block_transaction(priv, data, addr, command, read_write, size);
 	else
 		ret = i801_simple_transaction(priv, data, addr, command, read_write, size);
 
@@ -926,7 +914,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	 */
 	if (hwpec)
 		outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_CRC, SMBAUXCTL(priv));
-out:
 	/*
 	 * Unlock the SMBus device for use by BIOS/ACPI,
 	 * and clear status flags if not done already.
-- 
2.39.0


