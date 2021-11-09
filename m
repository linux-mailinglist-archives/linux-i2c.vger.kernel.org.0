Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E44044AFFD
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 16:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbhKIPFu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 10:05:50 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:37000 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236189AbhKIPFt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 10:05:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 729801FDBC;
        Tue,  9 Nov 2021 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636470182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=0OglrTh6TNziAspRw6Qda5BSlXH8cVMKP4ZY59NMxNU=;
        b=PQFKqilL0ZfKfR4s116AtNxg4lZ4FLLa1umYrYk9HWhqfGve0iplfZJrneMIHSNE8/kkoN
        rjSC+C5exoqKDMg8EaUCXrtfyRLTaWt4W/qScSBojXbyFctX8lq2qcRa6KpIV6CYAVyW+w
        8MuKlUrWhu7NsI1kFLjZkpSnomyd42Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636470182;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=0OglrTh6TNziAspRw6Qda5BSlXH8cVMKP4ZY59NMxNU=;
        b=dLBwclQZz64jMO7TyXeXE10jxQcgAiJbzRe7L0jzJKmCw0M+5NpU7Klv1EXQ6Yx6DWyDKV
        V9uRHkHGclhAQeAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BF8D13A6A;
        Tue,  9 Nov 2021 15:03:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MdazD6aNimGLCQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 09 Nov 2021 15:03:02 +0000
Date:   Tue, 9 Nov 2021 16:02:57 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Restore INTREN on unload
Message-ID: <20211109160257.4c089eef@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If driver interrupts are enabled, SMBHSTCNT_INTREN will be 1 after
the first transaction, and will stay to that value forever. This
means that interrupts will be generated for both host-initiated
transactions and also SMBus Alert events even after the driver is
unloaded. To be on the safe side, we should restore the initial state
of this bit at suspend and reboot time, as we do for several other
configuration bits already and for the same reason: the BIOS should
be handed the device in the same configuration state in which we
received it. Otherwise interrupts may be generated which nobody
will process.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
This probably doesn't change much on its own in practice, however it
is mandatory to make this change before Jarkko's fix for the SMB_ALERT
interrupt storm gets applied, otherwise the fix will be incomplete.

Jarkko, this is not exactly the patch you tested, I added restoration
to the suspend path as well to be 100% safe.

 drivers/i2c/busses/i2c-i801.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--- linux-5.14.orig/drivers/i2c/busses/i2c-i801.c	2021-11-09 15:51:03.186452787 +0100
+++ linux-5.14/drivers/i2c/busses/i2c-i801.c	2021-11-09 15:56:05.081477077 +0100
@@ -258,6 +258,7 @@ struct i801_priv {
 	struct i2c_adapter adapter;
 	unsigned long smba;
 	unsigned char original_hstcfg;
+	unsigned char original_hstcnt;
 	unsigned char original_slvcmd;
 	struct pci_dev *pci_dev;
 	unsigned int features;
@@ -1799,7 +1800,8 @@ static int i801_probe(struct pci_dev *de
 		outb_p(inb_p(SMBAUXCTL(priv)) &
 		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
 
-	/* Remember original Host Notify setting */
+	/* Remember original Interrupt and Host Notify settings */
+	priv->original_hstcnt = inb_p(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
 	if (priv->features & FEATURE_HOST_NOTIFY)
 		priv->original_slvcmd = inb_p(SMBSLVCMD(priv));
 
@@ -1863,6 +1865,7 @@ static void i801_remove(struct pci_dev *
 {
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
 	i801_del_mux(priv);
 	i2c_del_adapter(&priv->adapter);
@@ -1886,6 +1889,7 @@ static void i801_shutdown(struct pci_dev
 	struct i801_priv *priv = pci_get_drvdata(dev);
 
 	/* Restore config registers to avoid hard hang on some systems */
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	i801_disable_host_notify(priv);
 	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
 }
@@ -1895,6 +1899,7 @@ static int i801_suspend(struct device *d
 {
 	struct i801_priv *priv = dev_get_drvdata(dev);
 
+	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
 	return 0;
 }

-- 
Jean Delvare
SUSE L3 Support
