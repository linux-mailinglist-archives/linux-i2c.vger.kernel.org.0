Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5337669997E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 17:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBPQKi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 11:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBPQKh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 11:10:37 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2284D601
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 08:10:32 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id AC4321FE8F;
        Thu, 16 Feb 2023 16:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676563831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bnsZWRMjdtcfPMn2OyTwg4I/IRDp0qm9jw6JNW2mSn8=;
        b=izmQpo3yKoHvWKokWS3BRTcJz0QmTU9jnKvKOYAJvr2nJcsoWVVcQo3wPEs3O/En5HmbdP
        WD9kVaZPp3+5jMndANoN+xZ0jSV9AKH3XHvEXCAQy6fE77WNXA0Ljn5Mfjmmd+wHTb8T5t
        x4zH9crjZDKIyX0PVWRFVGVVinKocUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676563831;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bnsZWRMjdtcfPMn2OyTwg4I/IRDp0qm9jw6JNW2mSn8=;
        b=B0xqdXL/Ug3HmwGXV+W9mfQjDnfcph5BrRToreAszou2wzXHr24lfOx34H1yrrBmNuAPfM
        kV3tyvP1oMYDfEBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FC46131FD;
        Thu, 16 Feb 2023 16:10:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id JaWYIXdV7mOZJQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 16 Feb 2023 16:10:31 +0000
Date:   Thu, 16 Feb 2023 17:10:30 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 1/6] i2c: i801: Add i801_simple_transaction(),
 complementing i801_block_transaction()
Message-ID: <20230216171030.176905a0@endymion.delvare>
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

Factor out non-block pre/post processing to a new function
i801_simple_transaction(), complementing existing function
i801_block_transaction(). This makes i801_access() better readable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-i801.c |   92 +++++++++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 37 deletions(-)

--- linux-6.1.orig/drivers/i2c/busses/i2c-i801.c
+++ linux-6.1/drivers/i2c/busses/i2c-i801.c
@@ -732,6 +732,59 @@ static void i801_set_hstadd(struct i801_
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
@@ -783,9 +836,7 @@ static s32 i801_access(struct i2c_adapte
 		       unsigned short flags, char read_write, u8 command,
 		       int size, union i2c_smbus_data *data)
 {
-	int hwpec;
-	int block = 0;
-	int ret, xact;
+	int hwpec, ret, block = 0;
 	struct i801_priv *priv = i2c_get_adapdata(adap);
 
 	mutex_lock(&priv->acpi_lock);
@@ -803,36 +854,23 @@ static s32 i801_access(struct i2c_adapte
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
@@ -880,7 +918,7 @@ static s32 i801_access(struct i2c_adapte
 	if (block)
 		ret = i801_block_transaction(priv, data, read_write, size);
 	else
-		ret = i801_transaction(priv, xact);
+		ret = i801_simple_transaction(priv, data, read_write, size);
 
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
 	   time, so we forcibly disable it after every transaction. Turn off
@@ -888,26 +926,6 @@ static s32 i801_access(struct i2c_adapte
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
Jean Delvare
SUSE L3 Support
