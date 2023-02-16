Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEAE69999A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 17:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjBPQOz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 11:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBPQOy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 11:14:54 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637902106
        for <linux-i2c@vger.kernel.org>; Thu, 16 Feb 2023 08:14:53 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1E5881FE90;
        Thu, 16 Feb 2023 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676564092; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ctA1sXaFI3PeliJZK0wM4LSiUGjiwSPHGyvaUEiZpkA=;
        b=K1SEaAAt4Jtv1j89PclfCyxOuZ4+lYCDMVRMoxnDH4+8gsKFVvFBl8Iwl/VeICsvcei2CG
        ohDLo9FwKri9Do1Tu/HfvyT1vGESFpljMXHQcOQH+ntQ5XWtaDJkT4uD/LNbacaB+qS+7o
        PvKr1m+vVsL6Eu/mZEwtF4Qoeuw1G9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676564092;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ctA1sXaFI3PeliJZK0wM4LSiUGjiwSPHGyvaUEiZpkA=;
        b=E1HUu7wTSD/s5k9+NkJE+tdvuY5DDG397Sozwi0wP1i7F23Mz+csQW08O9txgjrAOdjcRE
        U9Uidh9cIq0wM4Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3322131FD;
        Thu, 16 Feb 2023 16:14:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5xDCOXtW7mNXJwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 16 Feb 2023 16:14:51 +0000
Date:   Thu, 16 Feb 2023 17:14:51 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 5/6] i2c: i801: Call i801_check_pre() from i801_access()
Message-ID: <20230216171451.2e87b061@endymion.delvare>
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

This avoids code duplication, in a next step we'll call
i801_check_post() from i801_transaction() as well.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-i801.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

--- linux-6.1.orig/drivers/i2c/busses/i2c-i801.c
+++ linux-6.1/drivers/i2c/busses/i2c-i801.c
@@ -462,10 +462,6 @@ static int i801_transaction(struct i801_
 	unsigned long result;
 	const struct i2c_adapter *adap = &priv->adapter;
 
-	status = i801_check_pre(priv);
-	if (status < 0)
-		return status;
-
 	if (priv->features & FEATURE_IRQ) {
 		reinit_completion(&priv->done);
 		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
@@ -653,10 +649,6 @@ static int i801_block_transaction_byte_b
 	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
 		return -EOPNOTSUPP;
 
-	status = i801_check_pre(priv);
-	if (status < 0)
-		return status;
-
 	len = data->block[0];
 
 	if (read_write == I2C_SMBUS_WRITE) {
@@ -891,6 +883,10 @@ static s32 i801_access(struct i2c_adapte
 
 	pm_runtime_get_sync(&priv->pci_dev->dev);
 
+	ret = i801_check_pre(priv);
+	if (ret)
+		goto out;
+
 	hwpec = (priv->features & FEATURE_SMBUS_PEC) && (flags & I2C_CLIENT_PEC)
 		&& size != I2C_SMBUS_QUICK
 		&& size != I2C_SMBUS_I2C_BLOCK_DATA;
@@ -913,6 +909,7 @@ static s32 i801_access(struct i2c_adapte
 	 */
 	if (hwpec)
 		outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_CRC, SMBAUXCTL(priv));
+out:
 	/*
 	 * Unlock the SMBus device for use by BIOS/ACPI,
 	 * and clear status flags if not done already.

-- 
Jean Delvare
SUSE L3 Support
