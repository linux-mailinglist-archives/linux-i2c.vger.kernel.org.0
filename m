Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6166511B9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbiLSSXF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiLSSXF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:23:05 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3BD12759
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:01 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id m18so23614522eji.5
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U8VbXn8XScU5BLKHdRb3w1AK1xB72QQTuKSLXd0r5pY=;
        b=NYcnqH1X7t6/iWfiQUfxu/xemUGAfzFuHxybzpkRisGvBr4Lpvb8gDx4YMuJfsawLF
         fu/Y8WPCVPLWW/7hlW2ZIj2CLgAgs7fxIfkyFGw+7YwwELV/rxLQk6FjFIBWiGF43KiR
         hhoneWUvU5rK1XP5KjlDqjmGpWowmsaCF86O7wtilzrIn/cR9/BMgVDjBbLA0ErGYcB9
         mesb/TMOtYebvv/XZ1CwlZzdR128QOsGa+hH9ct4h5KBQdCszu5VmAVqDYFIXzMZfZUJ
         oSjUdl6bvdc6kNFXi8ECdRwuO4jHdhliiuy41obhnHO0ZXtfF1vsYvUVLmA0D3r2Qx+o
         5aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8VbXn8XScU5BLKHdRb3w1AK1xB72QQTuKSLXd0r5pY=;
        b=br+TADZ0S0fn1ivmQt+OdvVbSB7tdz80fmVZgmqCrGxnubm/n7ryZg2pvbt0tm+85o
         sosVXdH7M5gtk2hHLy6gwe/m8mkmaF4RCnmG7yuckhuNqwUe2jCXvwMKbTE4A6/Ct/jb
         1j5H1gZgXZ0H0k9HulU1+Ys888YRuRixsPab1KCnOwjH97H6JAV3XwALLLcHddRQwbIC
         F3K5vABN9wEvykvdmNdcDXIXjytCcSaqicPRME6zzyYCbILJvhOYd/OVGvXHacBFK4h9
         BdVLFZNnIR3zXTcP02vU+rplw2uzKiDss3DQQPFyW5dyAgPoxNvSgWWyVpiJmzpu0HoK
         0Oag==
X-Gm-Message-State: AFqh2koKMk3cEmSOzpdzHbm2pqg0pijMLQL3PvjY0ZJPKA9kUWe3WXPf
        PCSL8FUZbPj26TAvF73stzoTe9M44RE=
X-Google-Smtp-Source: AMrXdXtsfOZMQrHsku9liuJepvLOfAF3/te2DaN6qSw0xoESiC/MVj0IrAjuPAt3ueEe5cgkeBARvA==
X-Received: by 2002:a17:906:a4d:b0:7f7:a985:1849 with SMTP id x13-20020a1709060a4d00b007f7a9851849mr11805787ejf.24.1671474180448;
        Mon, 19 Dec 2022 10:23:00 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id i7-20020a1709063c4700b007c08439161dsm4680738ejg.50.2022.12.19.10.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:23:00 -0800 (PST)
Message-ID: <2fca168d-9f31-1c50-ebde-3e4023d84423@gmail.com>
Date:   Mon, 19 Dec 2022 19:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 07/10] i2c: i801: centralize configuring non-block commands
 in i801_simple_transaction
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

Currently configuring command register settings is disributed over multiple
functions. At first cetralize this for non-block commands in
i801_simple_transaction().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index d7182f7c8..0d49e9587 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -738,35 +738,47 @@ static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
 
 /* Single value transaction function */
 static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
-				   char read_write, int command)
+				   u8 addr, u8 hstcmd, char read_write, int command)
 {
 	int xact, ret;
 
 	switch (command) {
 	case I2C_SMBUS_QUICK:
+		i801_set_hstadd(priv, addr, read_write);
 		xact = I801_QUICK;
 		break;
 	case I2C_SMBUS_BYTE:
+		i801_set_hstadd(priv, addr, read_write);
+		if (read_write == I2C_SMBUS_WRITE)
+			outb_p(hstcmd, SMBHSTCMD(priv));
 		xact = I801_BYTE;
 		break;
 	case I2C_SMBUS_BYTE_DATA:
+		i801_set_hstadd(priv, addr, read_write);
 		if (read_write == I2C_SMBUS_WRITE)
 			outb_p(data->byte, SMBHSTDAT0(priv));
+		outb_p(hstcmd, SMBHSTCMD(priv));
 		xact = I801_BYTE_DATA;
 		break;
 	case I2C_SMBUS_WORD_DATA:
+		i801_set_hstadd(priv, addr, read_write);
 		if (read_write == I2C_SMBUS_WRITE) {
 			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
 			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
 		}
+		outb_p(hstcmd, SMBHSTCMD(priv));
 		xact = I801_WORD_DATA;
 		break;
 	case I2C_SMBUS_PROC_CALL:
+		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
 		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
 		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
+		outb_p(hstcmd, SMBHSTCMD(priv));
+		read_write = I2C_SMBUS_READ;
 		xact = I801_PROC_CALL;
 		break;
 	default:
+		pci_err(priv->pci_dev, "Unsupported transaction %d\n", command);
 		return -EOPNOTSUPP;
 	}
 
@@ -857,25 +869,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 
 	switch (size) {
 	case I2C_SMBUS_QUICK:
-		i801_set_hstadd(priv, addr, read_write);
-		break;
 	case I2C_SMBUS_BYTE:
-		i801_set_hstadd(priv, addr, read_write);
-		if (read_write == I2C_SMBUS_WRITE)
-			outb_p(command, SMBHSTCMD(priv));
-		break;
 	case I2C_SMBUS_BYTE_DATA:
-		i801_set_hstadd(priv, addr, read_write);
-		outb_p(command, SMBHSTCMD(priv));
-		break;
 	case I2C_SMBUS_WORD_DATA:
-		i801_set_hstadd(priv, addr, read_write);
-		outb_p(command, SMBHSTCMD(priv));
-		break;
 	case I2C_SMBUS_PROC_CALL:
-		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
-		outb_p(command, SMBHSTCMD(priv));
-		read_write = I2C_SMBUS_READ;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
 		i801_set_hstadd(priv, addr, read_write);
@@ -922,7 +919,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	if (block)
 		ret = i801_block_transaction(priv, data, read_write, size);
 	else
-		ret = i801_simple_transaction(priv, data, read_write, size);
+		ret = i801_simple_transaction(priv, data, addr, command, read_write, size);
 
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
 	 * time, so we forcibly disable it after every transaction.
-- 
2.39.0


