Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A2F69999D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 17:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjBPQPi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 11:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBPQPh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 11:15:37 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B0F189
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 08:15:36 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 039981FE90;
        Thu, 16 Feb 2023 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676564135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dhriakqBv8JJvphKU4zXckN+JXNpwN/ifVs3dqbE7Ns=;
        b=p2S6VvIOybjvofjEJavjv5zfGs5SCqMqS28RKukgpaVoDQkqu9FeepE792sSEgbgR+AIGG
        JpMp+dXBHPXc7YYQLYRdpKyBZPC7oNJ4Jc6zrxym//lPE75FbBJibUTCuLvhKHK7eGcOh7
        ljHuNLxQ0uzSyO4e0MhE0v6clpgKot0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676564135;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dhriakqBv8JJvphKU4zXckN+JXNpwN/ifVs3dqbE7Ns=;
        b=9/Ks9+X3K4FPnLmP/jKnwml82j1m6Wau0ytzJ/a2zW1SdYsW3xrNYBUlFvGEWYUJ5rnxPM
        mIYQZ4ep1OE5obCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D854A131FD;
        Thu, 16 Feb 2023 16:15:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 7f40M6ZW7mOxJwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 16 Feb 2023 16:15:34 +0000
Date:   Thu, 16 Feb 2023 17:15:33 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 6/6] i2c: i801: Call i801_check_post() from i801_access()
Message-ID: <20230216171533.350188d7@endymion.delvare>
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

Avoid code duplication by calling i801_check_post() from i801_access().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-i801.c |   20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

--- linux-6.1.orig/drivers/i2c/busses/i2c-i801.c
+++ linux-6.1/drivers/i2c/busses/i2c-i801.c
@@ -434,7 +434,7 @@ static int i801_wait_intr(struct i801_pr
 		busy = status & SMBHSTSTS_HOST_BUSY;
 		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 		if (!busy && status)
-			return status;
+			return status & STATUS_ERROR_FLAGS;
 	} while (time_is_after_eq_jiffies(timeout));
 
 	return -ETIMEDOUT;
@@ -458,7 +458,6 @@ static int i801_wait_byte_done(struct i8
 
 static int i801_transaction(struct i801_priv *priv, int xact)
 {
-	int status;
 	unsigned long result;
 	const struct i2c_adapter *adap = &priv->adapter;
 
@@ -467,13 +466,12 @@ static int i801_transaction(struct i801_
 		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
 		       SMBHSTCNT(priv));
 		result = wait_for_completion_timeout(&priv->done, adap->timeout);
-		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
+		return result ? priv->status : -ETIMEDOUT;
 	}
 
 	outb_p(xact | SMBHSTCNT_START, SMBHSTCNT(priv));
 
-	status = i801_wait_intr(priv);
-	return i801_check_post(priv, status);
+	return i801_wait_intr(priv);
 }
 
 static int i801_block_transaction_by_block(struct i801_priv *priv,
@@ -624,7 +622,7 @@ static irqreturn_t i801_isr(int irq, voi
 
 	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 	if (status) {
-		priv->status = status;
+		priv->status = status & STATUS_ERROR_FLAGS;
 		complete(&priv->done);
 	}
 
@@ -674,7 +672,7 @@ static int i801_block_transaction_byte_b
 		reinit_completion(&priv->done);
 		outb_p(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
 		result = wait_for_completion_timeout(&priv->done, adap->timeout);
-		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
+		return result ? priv->status : -ETIMEDOUT;
 	}
 
 	for (i = 1; i <= len; i++) {
@@ -688,7 +686,7 @@ static int i801_block_transaction_byte_b
 
 		status = i801_wait_byte_done(priv);
 		if (status)
-			goto exit;
+			return status;
 
 		if (i == 1 && read_write == I2C_SMBUS_READ
 		 && command != I2C_SMBUS_I2C_BLOCK_DATA) {
@@ -718,9 +716,7 @@ static int i801_block_transaction_byte_b
 		outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
 	}
 
-	status = i801_wait_intr(priv);
-exit:
-	return i801_check_post(priv, status);
+	return i801_wait_intr(priv);
 }
 
 static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
@@ -904,6 +900,8 @@ static s32 i801_access(struct i2c_adapte
 	else
 		ret = i801_simple_transaction(priv, data, addr, command, read_write, size);
 
+	ret = i801_check_post(priv, ret);
+
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
 	 * time, so we forcibly disable it after every transaction.
 	 */

-- 
Jean Delvare
SUSE L3 Support
