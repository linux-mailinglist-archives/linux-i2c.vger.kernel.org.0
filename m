Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83ED9553273
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 14:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349608AbiFUMsh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 08:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350283AbiFUMs0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 08:48:26 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090D51401C
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jun 2022 05:48:25 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id BD33F1FA2F;
        Tue, 21 Jun 2022 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655815703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+0KsDghowgHj89HZlhRuDX7TwQdMFs5OiVLurCU6rdI=;
        b=flFDjE8KkVXEistbOa1DfI4zAv39faLI54kOmf85gfkGw4vT8ci1yVi4tx2McyCGT/KLfR
        Ge1Qt55xz4sTjEVOW+irZtf4UaL7jbRMzOs0hWB6orkaQ9WtQJ06Zeohp3LkVouenisfY+
        8+q94ZVAwD48dBlxvOLLpfzh4QtgPTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655815703;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+0KsDghowgHj89HZlhRuDX7TwQdMFs5OiVLurCU6rdI=;
        b=xOws2vt9v5TQyY2AiIQY9vcQxbayVM2QBmss5Bxap6YaFrxFAMKABOHHLx0k2GJhY3rASo
        nesAbWGloii5ktAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90A1F13A88;
        Tue, 21 Jun 2022 12:48:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id vja0IRe+sWIMFwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 21 Jun 2022 12:48:23 +0000
Date:   Tue, 21 Jun 2022 14:48:22 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Yi Zhang <yi.zhang@redhat.com>
Cc:     linux-i2c@vger.kernel.org, Terry Bowman <terry.bowman@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [bug report] kmemleak from driver i2c_piix4
Message-ID: <20220621144822.1d9228de@endymion.delvare>
In-Reply-To: <CAHj4cs9d+j-Dc+wKK-gat3E0McZ5+2DqQhESYitSrS8Wr4s2YA@mail.gmail.com>
References: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
        <20220617093818.37a721a3@endymion.delvare>
        <CAHj4cs9d+j-Dc+wKK-gat3E0McZ5+2DqQhESYitSrS8Wr4s2YA@mail.gmail.com>
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

Hi Yi Zhang,

On Fri, 17 Jun 2022 21:33:16 +0800, Yi Zhang wrote:
> On Fri, Jun 17, 2022 at 3:48 PM Jean Delvare <jdelvare@suse.de> wrote:
> > On Sat, 11 Jun 2022 17:08:20 +0800, Yi Zhang wrote:  
> > > I found this kmemleak from dmesg, pls help check it, thanks.
> > >
> > > unreferenced object 0xffff8882be7fa500 (size 64):
> > >   comm "systemd-udevd", pid 851, jiffies 4294724190 (age 1880.031s)
> > >   hex dump (first 32 bytes):
> > >     00 03 d8 fe 00 00 00 00 07 03 d8 fe 00 00 00 00  ................
> > >     20 95 85 c0 ff ff ff ff 00 02 40 80 00 00 00 00   .........@.....
> > >   backtrace:
> > >     [<00000000ee7a7c0d>] __request_region+0x4f/0xc0
> > >     [<000000000a0d9a20>] piix4_sb800_region_request+0x69/0x150 [i2c_piix4]
> > >     [<00000000bbbc5f63>] piix4_setup_sb800.constprop.0+0xfd/0x4a0 [i2c_piix4]
> > >     [<0000000060da9710>] piix4_probe+0x111/0x780 [i2c_piix4]
> > >     [<0000000061a2fccd>] local_pci_probe+0xdf/0x170
> > >     [<00000000f879d262>] pci_call_probe+0x15f/0x4b0
> > >     [<00000000b1b4235f>] pci_device_probe+0xee/0x230
> > >     [<000000007b0612f3>] really_probe+0x3d7/0xa10
> > >     [<0000000016a94cde>] __driver_probe_device+0x2ab/0x460
> > >     [<00000000fc08f31f>] driver_probe_device+0x49/0x120
> > >     [<00000000c7600ea6>] __driver_attach+0x1c1/0x420
> > >     [<00000000d075fad5>] bus_for_each_dev+0x121/0x1a0
> > >     [<000000003a0c2b72>] bus_add_driver+0x39f/0x570
> > >     [<00000000389c6619>] driver_register+0x20f/0x390
> > >     [<00000000e1871c0e>] do_one_initcall+0xfc/0x560
> > >     [<00000000899e6968>] do_init_module+0x190/0x620  
> >
> > Thanks for reporting.
> >
> > Which kernel version are you running? Are there patches applied to the
> > i2c-piix4 driver?  
> The latest linux tree
> 
> > Which line of the source code does
> > piix4_sb800_region_request+0x69/0x150 resolve to?  
> 
> (gdb) l *(piix4_sb800_region_request+0x69)
> 0x2b9 is in piix4_sb800_region_request (drivers/i2c/busses/i2c-piix4.c:185).
> 180 {
> 181 if (mmio_cfg->use_mmio) {
> 182 struct resource *res;
> 183 void __iomem *addr;
> 184
> 185 res = request_mem_region_muxed(SB800_PIIX4_FCH_PM_ADDR,
> 186        SB800_PIIX4_FCH_PM_SIZE,
> 187        "sb800_piix4_smb");
> 188 if (!res) {
> 189 dev_err(dev,

OK, I think I see what's going on here. There is an asymmetry between
the legacy path and the MMIO path. The legacy path is OK but the MMIO
path indeed has a memory leak, caused by the direct call to
release_resource() in the cleanup-path, when the legacy path calls
release_region() instead.

Adding Terry Bowman to Cc as he wrote the code.

Here's a candidate fix:

From: Jean Delvare <jdelvare@suse.de>
Subject: i2c: piix4: Fix a memory leak in the EFCH MMIO support

The recently added support for EFCH MMIO regions introduced a memory
leak in that code path. The leak is caused by the fact that
release_resource() merely removes the resource from the tree but does
not free its memory. We need to call release_mem_region() instead,
which does free the memory. As a nice side effect, this brings back
some symmetry between the legacy and MMIO paths.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: 7c148722d074 ("i2c: piix4: Add EFCH MMIO support to region request and release")
Cc: Terry Bowman <terry.bowman@amd.com>
---
 drivers/i2c/busses/i2c-piix4.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-5.18.orig/drivers/i2c/busses/i2c-piix4.c	2022-05-22 21:52:31.000000000 +0200
+++ linux-5.18/drivers/i2c/busses/i2c-piix4.c	2022-06-21 13:45:14.745708589 +0200
@@ -161,7 +161,6 @@ static const char *piix4_aux_port_name_s
 
 struct sb800_mmio_cfg {
 	void __iomem *addr;
-	struct resource *res;
 	bool use_mmio;
 };
 
@@ -195,12 +194,12 @@ static int piix4_sb800_region_request(st
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
@@ -222,7 +221,8 @@ static void piix4_sb800_region_release(s
 {
 	if (mmio_cfg->use_mmio) {
 		iounmap(mmio_cfg->addr);
-		release_resource(mmio_cfg->res);
+		release_mem_region(SB800_PIIX4_FCH_PM_ADDR,
+				   SB800_PIIX4_FCH_PM_SIZE);
 		return;
 	}
 
Yi Zhang, can you please test this patch and confirm that it solves the
memory leak?

Terry, please review/comment.

If my analysis is correct then the sp5100_wdt and thinkpad_acpi drivers
suffer from a similar leak and need to be fixed the same way.

-- 
Jean Delvare
SUSE L3 Support
