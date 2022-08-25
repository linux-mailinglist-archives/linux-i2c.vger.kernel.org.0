Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDFF5A114F
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 15:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbiHYNBr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 09:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241725AbiHYNBq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 09:01:46 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4952D559D
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 06:01:45 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id DDEDB343C3;
        Thu, 25 Aug 2022 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1661432503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zqbc25/Uwm9pn+HrQOUvvAFsD0tA0TSsxUGE+iUZcj4=;
        b=N06cnGJUn2j+RH3oC9EVtGZQBFVmEK9xdupcqW+IdkVvXqsjGq2JhVqHLOXtXIQRW/S35q
        zV01GahQbojO4i7Yxs4vDPx4XyhU2/jGQgt9ZQGQdBLLSK1EonVI2weDczwbC0lltFIpcE
        GPf3hafAuXJpA+n4lRZRnQOrXHqMBL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1661432503;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zqbc25/Uwm9pn+HrQOUvvAFsD0tA0TSsxUGE+iUZcj4=;
        b=tUnJy+c4otikDfUSJw0euxBRSegM7Rfpp66RvdPh3IdrdaHhvNv/Q0EgzGhAaSCyQdp4o4
        VjeIz5xzkUI8UBBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9ADCE13A8E;
        Thu, 25 Aug 2022 13:01:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id eUz7I7dyB2OTJQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 25 Aug 2022 13:01:43 +0000
Date:   Thu, 25 Aug 2022 15:01:41 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Bruce Duncan <bwduncan@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        trivial@kernel.org
Subject: [PATCH v2] docs: i2c: piix4: Fix typos, add markup, drop link
Message-ID: <20220825150141.1f5558c6@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bruce Duncan <bwduncan@gmail.com>

[JD: Update the subject
     One more typo fixed
     Drop the link to lm-sensors' README, it's irrelevant]

Signed-off-by: Bruce Duncan <bwduncan@gmail.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 Documentation/i2c/busses/i2c-piix4.rst |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

--- linux-5.19.orig/Documentation/i2c/busses/i2c-piix4.rst	2022-07-31 23:03:01.000000000 +0200
+++ linux-5.19/Documentation/i2c/busses/i2c-piix4.rst	2022-08-25 14:58:36.733243769 +0200
@@ -64,7 +64,7 @@ try to enable it. THIS IS VERY DANGEROUS
 crashes, data corruption, etc.). Try this only as a last resort (try BIOS
 updates first, for example), and backup first! An even more dangerous
 option is 'force_addr=<IOPORT>'. This will not only enable the PIIX4 like
-'force' foes, but it will also set a new base I/O port address. The SMBus
+'force' does, but it will also set a new base I/O port address. The SMBus
 parts of the PIIX4 needs a range of 8 of these addresses to function
 correctly. If these addresses are already reserved by some other device,
 you will get into big trouble! DON'T USE THIS IF YOU ARE NOT VERY SURE
@@ -86,15 +86,15 @@ If you own Force CPCI735 motherboard or
 to change the SMBus Interrupt Select register so the SMBus controller uses
 the SMI mode.
 
-1) Use lspci command and locate the PCI device with the SMBus controller:
+1) Use ``lspci`` command and locate the PCI device with the SMBus controller:
    00:0f.0 ISA bridge: ServerWorks OSB4 South Bridge (rev 4f)
    The line may vary for different chipsets. Please consult the driver source
-   for all possible PCI ids (and lspci -n to match them). Lets assume the
+   for all possible PCI ids (and ``lspci -n`` to match them). Let's assume the
    device is located at 00:0f.0.
 2) Now you just need to change the value in 0xD2 register. Get it first with
-   command: lspci -xxx -s 00:0f.0
+   command: ``lspci -xxx -s 00:0f.0``
    If the value is 0x3 then you need to change it to 0x1:
-   setpci  -s 00:0f.0 d2.b=1
+   ``setpci  -s 00:0f.0 d2.b=1``
 
 Please note that you don't need to do that in all cases, just when the SMBus is
 not working properly.
@@ -109,6 +109,3 @@ which can easily get corrupted due to a
 Thinkpad laptops, but desktop systems may also be affected. We have no list
 of all affected systems, so the only safe solution was to prevent access to
 the SMBus on all IBM systems (detected using DMI data.)
-
-For additional information, read:
-http://www.lm-sensors.org/browser/lm-sensors/trunk/README


-- 
Jean Delvare
SUSE L3 Support
