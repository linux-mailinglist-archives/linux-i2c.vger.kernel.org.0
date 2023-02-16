Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30EDF699989
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 17:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjBPQMQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 11:12:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjBPQMP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 11:12:15 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DAF4E5F4
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 08:12:14 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 644F4225E4;
        Thu, 16 Feb 2023 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676563933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w6tzIpDWz8qkgUV6HzZNltoG6JpfJBywBNzNTpQWztw=;
        b=sjK009iEmC8aqAT9qTLf2yuHhEZcbEiB7kMFPS9xD3qd4o+OJhPjpUTQ7T9Nra4AByEQ2a
        dTQ96jToA4HdmvTKx2dn7Nuu3bYi6eCIG0PMyVdCA5rEMX24wacrHCZix57il6ASJoZI1U
        xe2duiFL8DH05yKdz/lLjalVMUIpjwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676563933;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w6tzIpDWz8qkgUV6HzZNltoG6JpfJBywBNzNTpQWztw=;
        b=NQz8PLmw7EkWl5kOjzD4ZBvBEMIN4/WpMUV5ReUu0FjdFioeoWzfatBFh1J0tk0TyCo69Z
        jZPwNQx78SgoFjCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44DA8131FD;
        Thu, 16 Feb 2023 16:12:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id O7ElD91V7mMwJgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 16 Feb 2023 16:12:13 +0000
Date:   Thu, 16 Feb 2023 17:12:12 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 3/6] i2c: i801: Centralize configuring non-block commands
 in i801_simple_transaction
Message-ID: <20230216171212.77c74d39@endymion.delvare>
In-Reply-To: <20230216170830.206f0bb9@endymion.delvare>
References: <20230216170830.206f0bb9@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>

Currently configuring command register settings is distributed over multiple
functions. At first centralize this for non-block commands in
i801_simple_transaction().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
Changes since v2:
 * Typos fixed in description

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



-- 
Jean Delvare
SUSE L3 Support
