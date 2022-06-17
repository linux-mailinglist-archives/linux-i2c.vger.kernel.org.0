Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E9954F20F
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jun 2022 09:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380597AbiFQHiY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jun 2022 03:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380451AbiFQHiV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jun 2022 03:38:21 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258AB47AFE
        for <linux-i2c@vger.kernel.org>; Fri, 17 Jun 2022 00:38:21 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D3B901FD6A;
        Fri, 17 Jun 2022 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655451499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aeTU+kefu0QrLFTlEIEaeeeebOPKJWFmMjcrPoZJDec=;
        b=rlFyZZWNxIPfmArorCpaK2uq2qneccYQCBFQKuOwdzqnyVshq9DO7YQavljk+/h0Q31lP2
        oWVvDPjRKDbYevioczMqnk8xcMq1dZFJVa93ymOZZJzI0ojs1ocjwyBBscvNsYmSn2OVgh
        YE4SMALb1SfBhw/L0AIfYqtCA+4qOzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655451499;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aeTU+kefu0QrLFTlEIEaeeeebOPKJWFmMjcrPoZJDec=;
        b=DrDXp635bcQvBMlbGTKD0nIsebWGPVPbpsW7nd03C4E0Tq7ISlCMR+dFejJMxn8v5okBAy
        UfjHtTeTasrVh1Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B32921348E;
        Fri, 17 Jun 2022 07:38:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id bbwAKmsvrGKvfgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 17 Jun 2022 07:38:19 +0000
Date:   Fri, 17 Jun 2022 09:38:18 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Yi Zhang <yi.zhang@redhat.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [bug report] kmemleak from driver i2c_piix4
Message-ID: <20220617093818.37a721a3@endymion.delvare>
In-Reply-To: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
References: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
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

On Sat, 11 Jun 2022 17:08:20 +0800, Yi Zhang wrote:
> I found this kmemleak from dmesg, pls help check it, thanks.
> 
> unreferenced object 0xffff8882be7fa500 (size 64):
>   comm "systemd-udevd", pid 851, jiffies 4294724190 (age 1880.031s)
>   hex dump (first 32 bytes):
>     00 03 d8 fe 00 00 00 00 07 03 d8 fe 00 00 00 00  ................
>     20 95 85 c0 ff ff ff ff 00 02 40 80 00 00 00 00   .........@.....
>   backtrace:
>     [<00000000ee7a7c0d>] __request_region+0x4f/0xc0
>     [<000000000a0d9a20>] piix4_sb800_region_request+0x69/0x150 [i2c_piix4]
>     [<00000000bbbc5f63>] piix4_setup_sb800.constprop.0+0xfd/0x4a0 [i2c_piix4]
>     [<0000000060da9710>] piix4_probe+0x111/0x780 [i2c_piix4]
>     [<0000000061a2fccd>] local_pci_probe+0xdf/0x170
>     [<00000000f879d262>] pci_call_probe+0x15f/0x4b0
>     [<00000000b1b4235f>] pci_device_probe+0xee/0x230
>     [<000000007b0612f3>] really_probe+0x3d7/0xa10
>     [<0000000016a94cde>] __driver_probe_device+0x2ab/0x460
>     [<00000000fc08f31f>] driver_probe_device+0x49/0x120
>     [<00000000c7600ea6>] __driver_attach+0x1c1/0x420
>     [<00000000d075fad5>] bus_for_each_dev+0x121/0x1a0
>     [<000000003a0c2b72>] bus_add_driver+0x39f/0x570
>     [<00000000389c6619>] driver_register+0x20f/0x390
>     [<00000000e1871c0e>] do_one_initcall+0xfc/0x560
>     [<00000000899e6968>] do_init_module+0x190/0x620

Thanks for reporting.

Which kernel version are you running? Are there patches applied to the
i2c-piix4 driver?

Which line of the source code does
piix4_sb800_region_request+0x69/0x150 resolve to?

Which PCI device does the driver bind to? "lspci -nn | grep" SMBus
should tell.

Which messages are printed to the kernel log when you load and unload
the i2c-piix4 driver?

-- 
Jean Delvare
SUSE L3 Support
