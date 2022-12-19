Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09BA6511BA
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbiLSSXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiLSSXE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:23:04 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72803C2C
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:00 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b69so14120450edf.6
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6MqbZ7zxisw40O+aWNampSBdXjbwB1sxUwh2dkiU38Q=;
        b=BhT1c/qsGSiJL/wzdLe0NrIkVmpfbz06VCVTX4ObsT33nS2K42EfPGTTUiQfPH2q1X
         3VnwVeiCf3Nn7z9ATFJiRg3cCc6vEI9yKVoTWXgdvJuYs7roo5fXDE5aOUos1H0VGjU8
         pT5zdmWYNDS6O5WZnFQVNbDF1XN8Ripu6Cx6iyZRawSZo+WeA1M8VeoMzrTekO7agTnO
         RonPozVVL87QeprBAR2B7hjdw3McNrF9K4UxeLzuRJa2C67UFlHWWHivlNY44WyS+Sqb
         u9AK03hRQQzUvHA9HGotQaQNsYmbTCt7aZmTbIQqTHfA0bXkjf6n839uQyJkmsdj4V2H
         XmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MqbZ7zxisw40O+aWNampSBdXjbwB1sxUwh2dkiU38Q=;
        b=g9BuIjf+N/U/UHLXjTsUZtogRgYbdpmnzZWB0fOKNIBzKxyHQrVwJmMrt1RD8UC4+G
         wqPrNZZU+lkCcB2BMAuPJYJxogxDCDufp/zjXHAFFQw3EpoKDpO1ToaY4QVosJ/IoIXp
         lNxjNIw+B0gra2EzBuiuapGaJ2a6yb76FOFs1r1N1iv78v8JF5jGccL0S4zaPFa/zm9R
         n4fCnXOZ64Op8zmAmjIUDE1AiTR/jXO/hKVH22nEP/9KttnSiN5TW3lxohTgCDsxTlPe
         ru92z+4wEMFOB2VvR0rx/U1Aj6uMbKcH9mPUN95LjAQMwWW9qWlz9Jvo0FzKji7a0ru3
         /ocQ==
X-Gm-Message-State: ANoB5pnu0VGtIoluysARWFJzgPIdGJ4zwnkYhHZgjcvvHAO40QezU3dp
        cy1gDhbNy14joCZjJxnnNkApOodaYMI=
X-Google-Smtp-Source: AA0mqf6KCwj0VeKN3jPWspJZRg+OF12KRqkKdEP6nXEp73NXd52KE8R+JnKYnzb4xBjfXPgjI78Msw==
X-Received: by 2002:aa7:cb54:0:b0:46a:96b3:22bf with SMTP id w20-20020aa7cb54000000b0046a96b322bfmr38244355edt.17.1671474179013;
        Mon, 19 Dec 2022 10:22:59 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id e2-20020a50ec82000000b0045723aa48ccsm4627715edr.93.2022.12.19.10.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:22:58 -0800 (PST)
Message-ID: <be365c4b-b625-e59d-86c6-46bd5aa91ca1@gmail.com>
Date:   Mon, 19 Dec 2022 19:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 05/10] i2c: i801: add i801_simple_transaction(),
 complementing i801_block_transaction()
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

This patch factors out non-block pre/post processing to a new function
i801_simple_transaction(), complementing existing function
i801_block_transaction(). This makes i801_access() better readable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rename new function to i801_simple_transaction
- code style fixes
---
 drivers/i2c/busses/i2c-i801.c | 92 +++++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 882cf5135..d934d410b 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -732,6 +732,59 @@ static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
 	outb_p((addr << 1) | (read_write & 0x01), SMBHSTADD(priv));
 }
 
+/* Single value transaction function */
+static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
+				   char read_write, int command)
+{
+	int xact, ret;
+
+	switch (command) {
+	case I2C_SMBUS_QUICK:
+		xact = I801_QUICK;
+		break;
+	case I2C_SMBUS_BYTE:
+		xact = I801_BYTE;
+		break;
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
+	}
+
+	return 0;
+}
+
 /* Block transaction function */
 static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
 				  char read_write, int command)
@@ -783,9 +836,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		       unsigned short flags, char read_write, u8 command,
 		       int size, union i2c_smbus_data *data)
 {
-	int hwpec;
-	int block = 0;
-	int ret, xact;
+	int hwpec, ret, block = 0;
 	struct i801_priv *priv = i2c_get_adapdata(adap);
 
 	mutex_lock(&priv->acpi_lock);
@@ -803,36 +854,23 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
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
@@ -880,7 +918,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	if (block)
 		ret = i801_block_transaction(priv, data, read_write, size);
 	else
-		ret = i801_transaction(priv, xact);
+		ret = i801_simple_transaction(priv, data, read_write, size);
 
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
 	   time, so we forcibly disable it after every transaction. Turn off
@@ -888,26 +926,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
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
2.39.0


