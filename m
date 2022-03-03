Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351B74CC318
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 17:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbiCCQns (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 11:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbiCCQns (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 11:43:48 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B94D65D2B
        for <linux-i2c@vger.kernel.org>; Thu,  3 Mar 2022 08:43:02 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 390B8218E6;
        Thu,  3 Mar 2022 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1646325781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=OAsW6BPrTAIpSEnJuFTY3TFoMJ05AgOt2A8N6azHG7Q=;
        b=0/rbzufir7osfGdHI/hVcAKhlwhZNiw3tJlLlCpWqPFgQVrLfMmet5vaUHdAK2pV2W56Xc
        y+QFhK02xlWOkoijWD0rZuoXpIbyvEbCY/y7XD0OPM7d1Jnd6qVebFBaMzf0YfdkuXY/nM
        GRoVow+jGxW2l0OodeVkVYK1KxHETEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1646325781;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=OAsW6BPrTAIpSEnJuFTY3TFoMJ05AgOt2A8N6azHG7Q=;
        b=L7r14xYXXtIVPbYe16nfVtIcd5F5SXXFOZjLIShHcEWwnSAhD4bha5XZbMMsqsUT6SUjs+
        4dkLRnL2K4jBsIDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E80D13C68;
        Thu,  3 Mar 2022 16:43:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Znf5ARXwIGJ1OgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 03 Mar 2022 16:43:01 +0000
Date:   Thu, 3 Mar 2022 17:42:56 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Drop two outdated comments
Message-ID: <20220303174256.61067165@endymion.delvare>
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

* Timeouts are reported even in interrupt mode since commit
  b3b8df97723d ("i2c: i801: Use wait_event_timeout to wait for
  interrupts") so drop the comment which claims this only happens in
  polled mode.
* xact does not include the PEC bit, as the driver does not support
  software PEC.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Please correct me if I'm wrong.

 drivers/i2c/busses/i2c-i801.c |    5 -----
 1 file changed, 5 deletions(-)

--- linux-5.16.orig/drivers/i2c/busses/i2c-i801.c	2022-03-01 17:35:49.586064557 +0100
+++ linux-5.16/drivers/i2c/busses/i2c-i801.c	2022-03-03 17:27:30.265701684 +0100
@@ -364,9 +364,6 @@ static int i801_check_post(struct i801_p
 
 	/*
 	 * If the SMBus is still busy, we give up
-	 * Note: This timeout condition only happens when using polling
-	 * transactions.  For interrupt operation, NAK/timeout is indicated by
-	 * DEV_ERR.
 	 */
 	if (unlikely(status < 0)) {
 		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
@@ -475,8 +472,6 @@ static int i801_transaction(struct i801_
 		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
 	}
 
-	/* the current contents of SMBHSTCNT can be overwritten, since PEC,
-	 * SMBSCMD are passed in xact */
 	outb_p(xact | SMBHSTCNT_START, SMBHSTCNT(priv));
 
 	status = i801_wait_intr(priv);


-- 
Jean Delvare
SUSE L3 Support
