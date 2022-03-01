Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76DC34C904D
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 17:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbiCAQ3o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 11:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236119AbiCAQ3o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 11:29:44 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E31119C25
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 08:29:02 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 075182199B;
        Tue,  1 Mar 2022 16:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1646152141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=xgurX+Qdi/BztmyLZZtvR7Fa9fKdHl/VfnHY3j/j13M=;
        b=hzwg+PuD2mJl6FoRlk/svwbldd+1mub5oIN8PR34q93qfG2sE79rFSgbFWW59c5npzWhYb
        C/DQDXH8vZl9hl97iMS7MYzRxHGHzc7XaQIoSvwZ4nkz9gEFhh1kSEysRT560OtqQSyX24
        UowbCWP26nbwWyZa2P0XoijCCdVd+MA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1646152141;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=xgurX+Qdi/BztmyLZZtvR7Fa9fKdHl/VfnHY3j/j13M=;
        b=m2aYUo2xPIsS+bz4xaxq/k7m7fgViHUKOZfgZE9lGYpXWm6Xsfs5Huwnh9KRu6qedCJC52
        PSuXk39bAX4TENDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D463313B83;
        Tue,  1 Mar 2022 16:29:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FDKvMcxJHmKaIgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 01 Mar 2022 16:29:00 +0000
Date:   Tue, 1 Mar 2022 17:28:59 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/2] i2c: i801: Drop useless masking in i801_access
Message-ID: <20220301172859.5593309a@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I went all the way back to kernel 2.6.12 and that masking was never
needed. I suppose it was there in anticipation of software PEC
support, but that was never added to the driver (and never will be,
as this is made obsolete by hardware PEC).

I'm also removing initialization to 0, which is not needed either,
and would prevent the compiler from reporting an actual usage of
uninitialized variables.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-i801.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-5.16.orig/drivers/i2c/busses/i2c-i801.c	2022-03-01 10:41:26.946201705 +0100
+++ linux-5.16/drivers/i2c/busses/i2c-i801.c	2022-03-01 10:52:45.376001496 +0100
@@ -792,7 +792,7 @@ static s32 i801_access(struct i2c_adapte
 {
 	int hwpec;
 	int block = 0;
-	int ret = 0, xact = 0;
+	int ret, xact;
 	struct i801_priv *priv = i2c_get_adapdata(adap);
 
 	mutex_lock(&priv->acpi_lock);
@@ -904,7 +904,7 @@ static s32 i801_access(struct i2c_adapte
 	if ((read_write == I2C_SMBUS_WRITE) || (xact == I801_QUICK))
 		goto out;
 
-	switch (xact & 0x7f) {
+	switch (xact) {
 	case I801_BYTE:	/* Result put in SMBHSTDAT0 */
 	case I801_BYTE_DATA:
 		data->byte = inb_p(SMBHSTDAT0(priv));


-- 
Jean Delvare
SUSE L3 Support
