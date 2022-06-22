Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71197554321
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 09:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiFVGht (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 02:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbiFVGhs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 02:37:48 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF543344D3
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jun 2022 23:37:46 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8092E1F9F9;
        Wed, 22 Jun 2022 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655879865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2jDTYWr/ba0UCXFvvaAUfDl5dERZkhDGSZsTfmQcBjo=;
        b=EP8tCtSk5fUOhwqLVYialWmXAoSQglep8vO9nFZFaFCoW182GZ/Bz8itDSzlnznDQ9VNNL
        dfspb4gNAO0aCjdjBWHW7oxXFeSZ8favNUqXgp8NYJa5ST8LpQLaRbhgNPiUGgdA2HBll9
        eYkp56aLexs1GMgZf4Lcezdat3BzmBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655879865;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2jDTYWr/ba0UCXFvvaAUfDl5dERZkhDGSZsTfmQcBjo=;
        b=wQFLZk1+9sGl4aXFUiH/SkKJ5vQwacp5sOqaMaYHKG+rPwQcsc/8QgjalZ+FCrePyXllg4
        TaopKBuv7ZcsjgCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50ECE134A9;
        Wed, 22 Jun 2022 06:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +h8zEbm4smINUAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 22 Jun 2022 06:37:45 +0000
Date:   Wed, 22 Jun 2022 08:37:43 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Yi Zhang <yi.zhang@redhat.com>,
        Terry Bowman <terry.bowman@amd.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2] i2c: piix4: Fix a memory leak in the EFCH MMIO support
Message-ID: <20220622083743.65e057dd@endymion.delvare>
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

The recently added support for EFCH MMIO regions introduced a memory
leak in that code path. The leak is caused by the fact that
release_resource() merely removes the resource from the tree but does
not free its memory. We need to call release_mem_region() instead,
which does free the memory. As a nice side effect, this brings back
some symmetry between the legacy and MMIO paths.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reported-by: Yi Zhang <yi.zhang@redhat.com>
Tested-by: Yi Zhang <yi.zhang@redhat.com>
Fixes: 7c148722d074 ("i2c: piix4: Add EFCH MMIO support to region request and release")
Cc: Terry Bowman <terry.bowman@amd.com>
---
Changes since v1:
 * Added Reported-by and Tested-by tags for Yi Zhang
 * Removed local variable res as it is not needed

Technically this isn't the patch Yi Zhang tested, but I verified that
the generated binary code is the same, so it is safe to keep the
Tested-by tag.

 drivers/i2c/busses/i2c-piix4.c |   16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

--- linux-5.18.orig/drivers/i2c/busses/i2c-piix4.c	2022-06-21 16:17:35.040806444 +0200
+++ linux-5.18/drivers/i2c/busses/i2c-piix4.c	2022-06-21 23:07:52.605179908 +0200
@@ -161,7 +161,6 @@ static const char *piix4_aux_port_name_s
 
 struct sb800_mmio_cfg {
 	void __iomem *addr;
-	struct resource *res;
 	bool use_mmio;
 };
 
@@ -179,13 +178,11 @@ static int piix4_sb800_region_request(st
 				      struct sb800_mmio_cfg *mmio_cfg)
 {
 	if (mmio_cfg->use_mmio) {
-		struct resource *res;
 		void __iomem *addr;
 
-		res = request_mem_region_muxed(SB800_PIIX4_FCH_PM_ADDR,
-					       SB800_PIIX4_FCH_PM_SIZE,
-					       "sb800_piix4_smb");
-		if (!res) {
+		if (!request_mem_region_muxed(SB800_PIIX4_FCH_PM_ADDR,
+					      SB800_PIIX4_FCH_PM_SIZE,
+					      "sb800_piix4_smb")) {
 			dev_err(dev,
 				"SMBus base address memory region 0x%x already in use.\n",
 				SB800_PIIX4_FCH_PM_ADDR);
@@ -195,12 +192,12 @@ static int piix4_sb800_region_request(st
 		addr = ioremap(SB800_PIIX4_FCH_PM_ADDR,
 			       SB800_PIIX4_FCH_PM_SIZE);
 		if (!addr) {
-			release_resource(res);
+			release_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+					   SB800_PIIX4_FCH_PM_SIZE);
 			dev_err(dev, "SMBus base address mapping failed.\n");
 			return -ENOMEM;
 		}
 
-		mmio_cfg->res = res;
 		mmio_cfg->addr = addr;
 
 		return 0;
@@ -222,7 +219,8 @@ static void piix4_sb800_region_release(s
 {
 	if (mmio_cfg->use_mmio) {
 		iounmap(mmio_cfg->addr);
-		release_resource(mmio_cfg->res);
+		release_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+				   SB800_PIIX4_FCH_PM_SIZE);
 		return;
 	}
 


-- 
Jean Delvare
SUSE L3 Support
