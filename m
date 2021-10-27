Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4CD843CC03
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Oct 2021 16:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242510AbhJ0OZD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Oct 2021 10:25:03 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:37234 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242501AbhJ0OYU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Oct 2021 10:24:20 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D446D212C7;
        Wed, 27 Oct 2021 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635344513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=/XKzBrXxo/ChGicAulz58f5oBH5UGLNQddDr2Jo9oEo=;
        b=e0kRQpZLvrU1GLEPvmQWkk0DJXC63MXM3zPDD4FeAE7vbLbTWn+mLIzi1zxoWkohpZQnW8
        LRT5ro9T1nbSMDkPU3pv3350zFgx5a1HzSQ5eagPLAPDBtSnXmg/aKe26IRVaeOxG1y74N
        AmW+MvkzGXbxJNzbjq3ngpLvM0KgnFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635344513;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=/XKzBrXxo/ChGicAulz58f5oBH5UGLNQddDr2Jo9oEo=;
        b=w4WhsdAmj+9TZs7yKHtgGQ0XWs0Dmg1KME2Ie86qy0h1IA7xyv1RqttD4Az7hPzGNWcXsm
        FUyJr6k5frTvkcAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79B2F13DBD;
        Wed, 27 Oct 2021 14:21:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CuABGoFgeWF3RQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 27 Oct 2021 14:21:53 +0000
Date:   Wed, 27 Oct 2021 16:21:52 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] i2c: i801: Fix resetting of SMBHSTCNT_PEC_EN
Message-ID: <20211027162152.285e75e1@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SMBHSTCNT_PEC_EN does not belong to register SMBHSTCFG, but - as its
name suggests - to register SMBHSTCNT. Therefore resetting this bit
in the former register is wrong and useless. Thankfully this bit is
marked as reserved there so no harm done.

Considering that the value of SMBHSTCNT is overwritten for every
transaction, clearing this bit in advance is actually not needed at
all, so we can simply skip this step.

Fixes: a6b8bb6a813a ("i2c: i801: Fix handling SMBHSTCNT_PEC_EN")
Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-i801.c |    4 ----
 1 file changed, 4 deletions(-)

--- linux-5.14.orig/drivers/i2c/busses/i2c-i801.c	2021-10-27 14:37:05.026069056 +0200
+++ linux-5.14/drivers/i2c/busses/i2c-i801.c	2021-10-27 15:20:12.915065673 +0200
@@ -175,7 +175,6 @@
 #define SMBHSTCNT_KILL		BIT(1)
 #define SMBHSTCNT_LAST_BYTE	BIT(5)
 #define SMBHSTCNT_START		BIT(6)
-#define SMBHSTCNT_PEC_EN	BIT(7)	/* ICH3 and later */
 
 /* I801 Hosts Status register bits */
 #define SMBHSTSTS_BYTE_DONE	BIT(7)
@@ -496,8 +495,6 @@ static int i801_transaction(struct i801_
 		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
 	}
 
-	/* the current contents of SMBHSTCNT can be overwritten, since PEC,
-	 * SMBSCMD are passed in xact */
 	outb_p(xact | SMBHSTCNT_START, SMBHSTCNT(priv));
 
 	status = i801_wait_intr(priv);
@@ -1657,7 +1654,6 @@ static void i801_setup_hstcfg(struct i80
 	unsigned char hstcfg = priv->original_hstcfg;
 
 	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
-	hstcfg &= ~SMBHSTCNT_PEC_EN;	/* Disable software PEC */
 	hstcfg |= SMBHSTCFG_HST_EN;
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
 }


-- 
Jean Delvare
SUSE L3 Support
