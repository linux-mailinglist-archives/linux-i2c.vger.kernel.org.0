Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3B07ABA34
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 21:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjIVTms (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 15:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbjIVTmr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 15:42:47 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F86AF
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 12:42:41 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405361bb94eso24393245e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 12:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695411759; x=1696016559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lWafzEIfMrQEGeQs2J6Vt2FOFxo0Tc0vzGxskDyqNtg=;
        b=QD3CV51Uka80sX/U9dQpHsLVIJ0IXDQKGyRJcQrXaCgtOief+/ATxA6AXbgvT5Avw9
         xccDTAvunP0mCyUv01jd6HnRs5FethOH6o2dzn9SBmmvYUKpAgmZCP7LgKmlpLgUUrcF
         kd1CagPag7LxC/z7+9sOOOK/+TYRnqyVBC98Ol/NBfOzGAIYjgo53vkIwcw3k29pRxKk
         yqNXSKpAs+r1ZIrgEcmvyQWq3fTtzFzP3xf2DPb2a7O3MJME9nsVSC84uGRxzEHHNQLi
         /aXFzCFDHXut9THnmvDW8mFSk0BZYscEslVFXMTj09bEtIHhYgHrOMDOZXB4drktjJWG
         DiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695411759; x=1696016559;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWafzEIfMrQEGeQs2J6Vt2FOFxo0Tc0vzGxskDyqNtg=;
        b=Nvgv5PIKtcA4frbAOuHI9uJn8byHfjPXwMCZSMZwSKT39Epoi9iJvtaDQnQPoL1BLf
         Yitx9yEOzu6gWhnat95OCxYcrbQijuR7e0zn8O6+WCfn4upM7XW4LYBEtbo9szBRMGit
         7yQyXucKAHaUjL+Secli5e8LjtumiE08a8TwTcPMNDady3V9qJbWf+pY8nvPjiHrKNNw
         A7vyomPBK0tkPCcnYB2jlRsNV7p8FCOzj8zTcTeMOym1VIdZ7ySLcZzNRZxTawc841tw
         avDo/o16EE1HHZ3I7REyaM8zsF1I4wTApq+odw/c+Rmae5ULjEB5io9lkLBVrkiy9QHw
         yH8Q==
X-Gm-Message-State: AOJu0YwWxETQmvNRc+kRIcoLe21tnpbcnwaBNRPZ39rd1kr8u2eUoqFi
        2KC9HXALvP6LZIZ9hVaBXQQCWmZ3iTQ=
X-Google-Smtp-Source: AGHT+IFg86TAzaTuY+md0PkChoQno+hdXagBXXB0xGfP3MEg7vkVRIM6v3akZNzYpw206vvYW2Gaiw==
X-Received: by 2002:a05:600c:216:b0:3f7:f2d0:b904 with SMTP id 22-20020a05600c021600b003f7f2d0b904mr278957wmi.8.1695411759381;
        Fri, 22 Sep 2023 12:42:39 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9589:7c00:3475:142c:c3cb:ba32? (dynamic-2a02-3100-9589-7c00-3475-142c-c3cb-ba32.310.pool.telefonica.de. [2a02:3100:9589:7c00:3475:142c:c3cb:ba32])
        by smtp.googlemail.com with ESMTPSA id t16-20020a5d49d0000000b0031c5b380291sm5174077wrs.110.2023.09.22.12.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 12:42:38 -0700 (PDT)
Message-ID: <a5920bf7-91ef-4cf3-b6c5-0979e9325d7a@gmail.com>
Date:   Fri, 22 Sep 2023 21:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/8] i2c: i801: Split i801_block_transaction
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c and smbus block transaction handling have little in common,
therefore split this function to improve code readability.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 112 +++++++++++++++-------------------
 1 file changed, 50 insertions(+), 62 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 915dd07e1..a9d3dfd9e 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -801,77 +801,65 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
 	return 0;
 }
 
-/* Block transaction function */
-static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
-				  u8 addr, u8 hstcmd, char read_write, int command)
+static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
+					u8 addr, u8 hstcmd, char read_write, int command)
 {
-	int result = 0;
-	unsigned char hostc;
-
 	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
 		data->block[0] = I2C_SMBUS_BLOCK_MAX;
 	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
 		return -EPROTO;
 
-	switch (command) {
-	case I2C_SMBUS_BLOCK_DATA:
-		i801_set_hstadd(priv, addr, read_write);
-		outb_p(hstcmd, SMBHSTCMD(priv));
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
-			 * that DATA1 is the cmd field when reading
-			 */
-			outb_p(hstcmd, SMBHSTDAT1(priv));
-		} else
-			outb_p(hstcmd, SMBHSTCMD(priv));
-
-		if (read_write == I2C_SMBUS_WRITE) {
-			/* set I2C_EN bit in configuration register */
-			pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
-			pci_write_config_byte(priv->pci_dev, SMBHSTCFG,
-					      hostc | SMBHSTCFG_I2C_EN);
-		} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
-			dev_err(&priv->pci_dev->dev,
-				"I2C block read is unsupported!\n");
-			return -EOPNOTSUPP;
-		}
-		break;
-	case I2C_SMBUS_BLOCK_PROC_CALL:
+	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
 		/* Needs to be flagged as write transaction */
 		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
+	else
+		i801_set_hstadd(priv, addr, read_write);
+	outb_p(hstcmd, SMBHSTCMD(priv));
+
+	if (priv->features & FEATURE_BLOCK_BUFFER)
+		return i801_block_transaction_by_block(priv, data, read_write, command);
+	else
+		return i801_block_transaction_byte_by_byte(priv, data, read_write, command);
+}
+
+static int i801_i2c_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
+				      u8 addr, u8 hstcmd, char read_write, int command)
+{
+	int result;
+	u8 hostc;
+
+	if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+		return -EPROTO;
+	/*
+	 * NB: page 240 of ICH5 datasheet shows that the R/#W bit should be cleared here,
+	 * even when reading. However if SPD Write Disable is set (Lynx Point and later),
+	 * the read will fail if we don't set the R/#W bit.
+	 */
+	i801_set_hstadd(priv, addr,
+			priv->original_hstcfg & SMBHSTCFG_SPD_WD ? read_write : I2C_SMBUS_WRITE);
+
+	/* NB: page 240 of ICH5 datasheet shows that DATA1 is the cmd field when reading */
+	if (read_write == I2C_SMBUS_READ)
+		outb_p(hstcmd, SMBHSTDAT1(priv));
+	else
 		outb_p(hstcmd, SMBHSTCMD(priv));
-		break;
+
+	if (read_write == I2C_SMBUS_WRITE) {
+		/* set I2C_EN bit in configuration register */
+		pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
+		pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hostc | SMBHSTCFG_I2C_EN);
+	} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
+		pci_err(priv->pci_dev, "I2C block read is unsupported!\n");
+		return -EOPNOTSUPP;
 	}
 
-	/* Experience has shown that the block buffer can only be used for
-	   SMBus (not I2C) block transactions, even though the datasheet
-	   doesn't mention this limitation. */
-	if ((priv->features & FEATURE_BLOCK_BUFFER) &&
-	    command != I2C_SMBUS_I2C_BLOCK_DATA)
-		result = i801_block_transaction_by_block(priv, data,
-							 read_write,
-							 command);
-	else
-		result = i801_block_transaction_byte_by_byte(priv, data,
-							     read_write,
-							     command);
+	/* Block buffer isn't supported for I2C block transactions */
+	result = i801_block_transaction_byte_by_byte(priv, data, read_write, command);
 
-	if (command == I2C_SMBUS_I2C_BLOCK_DATA
-	 && read_write == I2C_SMBUS_WRITE) {
-		/* restore saved configuration register value */
+	/* restore saved configuration register value */
+	if (read_write == I2C_SMBUS_WRITE)
 		pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hostc);
-	}
+
 	return result;
 }
 
@@ -902,10 +890,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		outb_p(inb_p(SMBAUXCTL(priv)) & (~SMBAUXCTL_CRC),
 		       SMBAUXCTL(priv));
 
-	if (size == I2C_SMBUS_BLOCK_DATA ||
-	    size == I2C_SMBUS_I2C_BLOCK_DATA ||
-	    size == I2C_SMBUS_BLOCK_PROC_CALL)
-		ret = i801_block_transaction(priv, data, addr, command, read_write, size);
+	if (size == I2C_SMBUS_BLOCK_DATA || size == I2C_SMBUS_BLOCK_PROC_CALL)
+		ret = i801_smbus_block_transaction(priv, data, addr, command, read_write, size);
+	else if (size == I2C_SMBUS_I2C_BLOCK_DATA)
+		ret = i801_i2c_block_transaction(priv, data, addr, command, read_write, size);
 	else
 		ret = i801_simple_transaction(priv, data, addr, command, read_write, size);
 
-- 
2.42.0


