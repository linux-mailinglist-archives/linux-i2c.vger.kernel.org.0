Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610D1699999
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 17:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjBPQOY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 11:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjBPQOU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 11:14:20 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA7044BB
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 08:14:19 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0BB251FE98;
        Thu, 16 Feb 2023 16:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676564058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QwAMZ0CEcxwewyInCrTK9FoYdY78uoQT98vXB+sxmxQ=;
        b=OQ4qrMVC9kCq0G6LZTQDiIT1me21TC0T/E9GoREsvtaaLTaHDevbEe00rXPGkjFopzx++n
        wBptu8FgaVda1viA7vu+RL0/BeUxZP+bbnjkbvEveAOMB9Andwp9GUUFCz9BHoezjcQj+w
        9AmLKMq/uQQvGC4okTkhmeWofEijxKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676564058;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QwAMZ0CEcxwewyInCrTK9FoYdY78uoQT98vXB+sxmxQ=;
        b=6mlUuWtoIQfinWVtoYTTb5QhiMWv8K8mG1CXC0Tk/9Yk7CZ0Equ5KyxHMjWQdGS0aaO8Yk
        uQ65VLSathYFiDAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E02F6131FD;
        Thu, 16 Feb 2023 16:14:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0ZIeNVlW7mPzJgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 16 Feb 2023 16:14:17 +0000
Date:   Thu, 16 Feb 2023 17:14:16 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 4/6] i2c: i801: Centralize configuring block commands in
 i801_block_transaction
Message-ID: <20230216171416.608045a0@endymion.delvare>
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

Similar to what was done for non-block commands, centralize block
command register settings in i801_block_transaction().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
Changes since v2:
 * Reword description
 * Drop stray blank line

 drivers/i2c/busses/i2c-i801.c |   84 +++++++++++++++++-------------------------
 1 file changed, 35 insertions(+), 49 deletions(-)

--- linux-6.1.orig/drivers/i2c/busses/i2c-i801.c
+++ linux-6.1/drivers/i2c/busses/i2c-i801.c
@@ -803,7 +803,7 @@ static int i801_simple_transaction(struc
 
 /* Block transaction function */
 static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
-				  char read_write, int command)
+				  u8 addr, u8 hstcmd, char read_write, int command)
 {
 	int result = 0;
 	unsigned char hostc;
@@ -813,7 +813,29 @@ static int i801_block_transaction(struct
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
@@ -824,6 +846,12 @@ static int i801_block_transaction(struct
 				"I2C block read is unsupported!\n");
 			return -EOPNOTSUPP;
 		}
+		break;
+	case I2C_SMBUS_BLOCK_PROC_CALL:
+		/* Needs to be flagged as write transaction */
+		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
+		outb_p(hstcmd, SMBHSTCMD(priv));
+		break;
 	}
 
 	/* Experience has shown that the block buffer can only be used for
@@ -852,7 +880,7 @@ static s32 i801_access(struct i2c_adapte
 		       unsigned short flags, char read_write, u8 command,
 		       int size, union i2c_smbus_data *data)
 {
-	int hwpec, ret, block = 0;
+	int hwpec, ret;
 	struct i801_priv *priv = i2c_get_adapdata(adap);
 
 	mutex_lock(&priv->acpi_lock);
@@ -867,57 +895,16 @@ static s32 i801_access(struct i2c_adapte
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
 
@@ -926,7 +913,6 @@ static s32 i801_access(struct i2c_adapte
 	 */
 	if (hwpec)
 		outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_CRC, SMBAUXCTL(priv));
-out:
 	/*
 	 * Unlock the SMBus device for use by BIOS/ACPI,
 	 * and clear status flags if not done already.

-- 
Jean Delvare
SUSE L3 Support
