Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 749786511B7
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiLSSXC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiLSSXB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:23:01 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82B912759
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:22:59 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id tz12so23579637ejc.9
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PaSmqAatSCj4anXV7b20JkZxNTXxGyvaUfheL/BGHUo=;
        b=En+P0V6sqroL81T+eyjKw/zEMCukm02Dg8vdjObZDIybDT+1TV3bTev1ByWcpCRi1e
         9QjQlz1uElRrKneVCFsAHj+jjgeNccKa9VoEgwGYx+axifofr6aKthZbHS7/O8fqTFgC
         wib/aPa6we3BYbt5FRAuVfURKDnpv16YqR5nMqA9SVAhWA6ZvQdxcs7/uI9i8pm+GRPn
         jx0krOTsInWCBxb6Ek10XnRTDKdC4sCdCsDx7JAy5Eedpf9lc0lm4HcBMIQPb+RXp6DO
         RipcmtIdvDzBME70sInqnSXaYSLJcOvcjSzFBqSvtiyUTiEP2C6zVY0NGOMYDr0XTJSe
         OdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PaSmqAatSCj4anXV7b20JkZxNTXxGyvaUfheL/BGHUo=;
        b=LGahOhgSb0v6/zZ87Qp5Zc58RUhr53N5r6axvU4NuLD7LBKQ8nikWJbp54kDlEiExs
         guyjrHtzhWddBNLRjjhULux61CO8ltSjScg0xyaI6FSDWn9MI9Yey++bZEXexbU17S7N
         0TAV3J6U+ylfn0L2CSO+YQ5qAJK4GGH6H3XC0RQpL093WeBWseNh5DVLfQG/DTyOXOiD
         danPFNtAXVEokiCWmI3EIid9LVfKe/AuygOtH4rtFmbQ91RmOedLE4VOBzOyGUfDBJFO
         TJX7RBFQQYz2NNNpnBhFSQA73BBQ48vSiIK8aa3dObghlcy+BxhQ/Kc9mEtxsgAukxHi
         tBtw==
X-Gm-Message-State: AFqh2kryBqpccx1i/HE7TZY5nrT91eUmgnBe+5u8DJ7WbtvJZz98tens
        /RuFiBQbrCp6Dmfedtd/EMuyqb/FdVw=
X-Google-Smtp-Source: AMrXdXswsymM+Uwzx4UXyP1SzqItpIpHNUzFykp3DxUzmfO2pfKEccTYV3PSiO77OX+lGqPT29pORg==
X-Received: by 2002:a17:906:9f26:b0:7cd:dbe8:e4f7 with SMTP id fy38-20020a1709069f2600b007cddbe8e4f7mr19190136ejc.77.1671474178232;
        Mon, 19 Dec 2022 10:22:58 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id sy26-20020a1709076f1a00b007c0b530f3cfsm4673233ejc.72.2022.12.19.10.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:22:57 -0800 (PST)
Message-ID: <042ba587-7428-5b44-56b3-061be22fd958@gmail.com>
Date:   Mon, 19 Dec 2022 19:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 04/10] i2c: i801: add helper i801_set_hstadd()
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

Factor out setting SMBHSTADD to a helper. The current code makes the
assumption that constant I2C_SMBUS_READ has bit 0 set, that's not ideal.
Therefore let the new helper explicitly check for I2C_SMBUS_READ.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- change expressions for generating less binary code
---
 drivers/i2c/busses/i2c-i801.c | 36 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 2e9c5856a..882cf5135 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -727,6 +727,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 	return i801_check_post(priv, status);
 }
 
+static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
+{
+	outb_p((addr << 1) | (read_write & 0x01), SMBHSTADD(priv));
+}
+
 /* Block transaction function */
 static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
 				  char read_write, int command)
@@ -797,28 +802,24 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 
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
@@ -827,7 +828,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		xact = I801_WORD_DATA;
 		break;
 	case I2C_SMBUS_PROC_CALL:
-		outb_p((addr & 0x7f) << 1, SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
 		outb_p(command, SMBHSTCMD(priv));
 		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
 		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
@@ -835,8 +836,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		read_write = I2C_SMBUS_READ;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
-		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
-		       SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr, read_write);
 		outb_p(command, SMBHSTCMD(priv));
 		block = 1;
 		break;
@@ -847,10 +847,9 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		 * However if SPD Write Disable is set (Lynx Point and later),
 		 * the read will fail if we don't set the R/#W bit.
 		 */
-		outb_p(((addr & 0x7f) << 1) |
-		       ((priv->original_hstcfg & SMBHSTCFG_SPD_WD) ?
-			(read_write & 0x01) : 0),
-		       SMBHSTADD(priv));
+		i801_set_hstadd(priv, addr,
+				priv->original_hstcfg & SMBHSTCFG_SPD_WD ?
+				read_write : I2C_SMBUS_WRITE);
 		if (read_write == I2C_SMBUS_READ) {
 			/* NB: page 240 of ICH5 datasheet also shows
 			 * that DATA1 is the cmd field when reading */
@@ -860,11 +859,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
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
2.39.0


