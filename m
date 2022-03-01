Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B904C9089
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 17:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbiCAQkX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 11:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbiCAQkW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 11:40:22 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3321A816
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 08:39:39 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id AABD41F37E;
        Tue,  1 Mar 2022 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1646152778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uk/g7R9PmEKrG3mZ5dAdIV2arozQx3B1Zj1R0ONFHWU=;
        b=ieYM0YuQxQEPRxqUqv7IdI1NxouY6e/FtsDvzs9lxMKsF6vsmP30oimtA9Vzgh4RqpaS2M
        64qpXUx2aZETwvElY5BdhlszZCPT2vvUJhyI9/6oD+Nx5qayPWkxcqKcHjzyl8o4tXoB6r
        0OYtpYmJWLN1fi0EpsUYyk3Sfz9vJOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1646152778;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uk/g7R9PmEKrG3mZ5dAdIV2arozQx3B1Zj1R0ONFHWU=;
        b=Vs5WVH0jP8hZYOGcEcesML07CG/RnnntdTrANX3klOWQcplEMfFt51nhTCIcPOZTj2HSra
        UFrV+gYUjh7RV5Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8431813B83;
        Tue,  1 Mar 2022 16:39:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wgMWHkpMHmJCJwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 01 Mar 2022 16:39:38 +0000
Date:   Tue, 1 Mar 2022 17:39:37 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/2] i2c: i801: Add support for the Process Call command
Message-ID: <20220301173937.636a21ce@endymion.delvare>
In-Reply-To: <20220301172859.5593309a@endymion.delvare>
References: <20220301172859.5593309a@endymion.delvare>
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

The Process Call command is implemented by the hardware since the very
first Intel 82801 chipset, and trivial to support. Oscar Romero
Matamala from the Georgia Institute of Technology told me it is needed
for an experiment his team is working on at the moment, so let's just
add support for it.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Disclaimer: untested code. I don't have any device at hand which
supports the Process Call command so I just can't test it. If anyone
has a chance, please test. If not, I hope Oscar will be able to test it
soon.

 drivers/i2c/busses/i2c-i801.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

--- linux-5.16.orig/drivers/i2c/busses/i2c-i801.c	2022-03-01 17:06:42.685102412 +0100
+++ linux-5.16/drivers/i2c/busses/i2c-i801.c	2022-03-01 17:35:49.586064557 +0100
@@ -166,7 +166,7 @@
 #define I801_BYTE		0x04
 #define I801_BYTE_DATA		0x08
 #define I801_WORD_DATA		0x0C
-#define I801_PROC_CALL		0x10	/* unimplemented */
+#define I801_PROC_CALL		0x10
 #define I801_BLOCK_DATA		0x14
 #define I801_I2C_BLOCK_DATA	0x18	/* ICH5 and later */
 #define I801_BLOCK_PROC_CALL	0x1C
@@ -838,6 +838,14 @@ static s32 i801_access(struct i2c_adapte
 		}
 		xact = I801_WORD_DATA;
 		break;
+	case I2C_SMBUS_PROC_CALL:
+		outb_p((addr & 0x7f) << 1, SMBHSTADD(priv));
+		outb_p(command, SMBHSTCMD(priv));
+		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
+		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
+		xact = I801_PROC_CALL;
+		read_write = I2C_SMBUS_READ;
+		break;
 	case I2C_SMBUS_BLOCK_DATA:
 		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
 		       SMBHSTADD(priv));
@@ -910,6 +918,7 @@ static s32 i801_access(struct i2c_adapte
 		data->byte = inb_p(SMBHSTDAT0(priv));
 		break;
 	case I801_WORD_DATA:
+	case I801_PROC_CALL:
 		data->word = inb_p(SMBHSTDAT0(priv)) +
 			     (inb_p(SMBHSTDAT1(priv)) << 8);
 		break;
@@ -935,6 +944,7 @@ static u32 i801_func(struct i2c_adapter
 
 	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
 	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+	       I2C_FUNC_SMBUS_PROC_CALL |
 	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
 	       ((priv->features & FEATURE_SMBUS_PEC) ? I2C_FUNC_SMBUS_PEC : 0) |
 	       ((priv->features & FEATURE_BLOCK_PROC) ?

-- 
Jean Delvare
SUSE L3 Support
