Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F42699981
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 17:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjBPQLV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 11:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjBPQLV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 11:11:21 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBA64D609
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 08:11:19 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 93806228CA;
        Thu, 16 Feb 2023 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676563878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=THOn3H8qYKgLlnsk1QaYhIy82EceKIWcCoN2IM9s5hM=;
        b=o5vX++y4c1Fl99OpNtGrAs+GicyOofUk8BuyXJ931564yEQgHOohuJfUrrtABtqCGLJeUN
        MpD9X9GzFJLAaqUZl6bMh0iPSlj7LihISiZhLEB/ihui8e9Nd386YzysCZdcPuXk7Uh6H4
        icNVnTTG17m7x7DZ6XFqVCMKUF1zxrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676563878;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=THOn3H8qYKgLlnsk1QaYhIy82EceKIWcCoN2IM9s5hM=;
        b=jp/7deCtuQB7Ao9heaudpy5gO6Xk7Ao5GdYH9XlqPcVuMvd1V9s3KiwH3tWP93Qamlcx8P
        me+YiLq0D8G71nAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EC33131FD;
        Thu, 16 Feb 2023 16:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id yTSQGaZV7mPmJQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 16 Feb 2023 16:11:18 +0000
Date:   Thu, 16 Feb 2023 17:11:17 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 2/6] i2c: i801: Handle SMBAUXCTL_E32B in
 i801_block_transaction_by_block only
Message-ID: <20230216171117.03d94f66@endymion.delvare>
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

Currently we touch SMBAUXCTL even if not needed. That's the case for block
commands that don't use block buffer mode, either because block buffer
mode isn't available or because it's not supported for the respective
command (e.g. I2C block transfer). Improve this by setting/resetting
SMBAUXCTL_E32B in i801_block_transaction_by_block() only.

Small downside is that we now access SMBAUXCTL twice for transactions
that use PEC and block buffer mode. But this should a rather rare case
and the impact is negligible.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
Changes since v2:
 * Typo fixed in description

 drivers/i2c/busses/i2c-i801.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index d934d410b..d7182f7c8 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -511,19 +511,23 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 
 	status = i801_transaction(priv, xact);
 	if (status)
-		return status;
+		goto out;
 
 	if (read_write == I2C_SMBUS_READ ||
 	    command == I2C_SMBUS_BLOCK_PROC_CALL) {
 		len = inb_p(SMBHSTDAT0(priv));
-		if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
-			return -EPROTO;
+		if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
+			status = -EPROTO;
+			goto out;
+		}
 
 		data->block[0] = len;
 		for (i = 0; i < len; i++)
 			data->block[i + 1] = inb_p(SMBBLKDAT(priv));
 	}
-	return 0;
+out:
+	outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_E32B, SMBAUXCTL(priv));
+	return status;
 }
 
 static void i801_isr_byte_done(struct i801_priv *priv)
@@ -921,11 +925,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		ret = i801_simple_transaction(priv, data, read_write, size);
 
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
-	   time, so we forcibly disable it after every transaction. Turn off
-	   E32B for the same reason. */
-	if (hwpec || block)
-		outb_p(inb_p(SMBAUXCTL(priv)) &
-		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
+	 * time, so we forcibly disable it after every transaction.
+	 */
+	if (hwpec)
+		outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_CRC, SMBAUXCTL(priv));
 out:
 	/*
 	 * Unlock the SMBus device for use by BIOS/ACPI,
-- 
2.39.0



-- 
Jean Delvare
SUSE L3 Support
