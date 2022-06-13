Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC02549CFF
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jun 2022 21:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348473AbiFMTKt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jun 2022 15:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351557AbiFMTKJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jun 2022 15:10:09 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A699C95B4
        for <linux-i2c@vger.kernel.org>; Mon, 13 Jun 2022 10:08:45 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 677271F8FA;
        Mon, 13 Jun 2022 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1655140124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SfZX2FHGKi9VSNT0iKL2Q5zQqSswNSWEESfWx2oGllQ=;
        b=Cug00id4eAwOFvwDhHzgQxID9X+3ACBlpT2Q8zZEH69itK63b8asltJeequJSHNnDmpNYa
        EG9ZjgCq5ZiXw5Kr9Qz2P1Yk3ZiXDT2bK3Z2KRUqngxzpvEAHNAgO2GsdMcGik+MYSgmCR
        SDsa7slL3W2Ld/xeUoCl0jzgI1eDCP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1655140124;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SfZX2FHGKi9VSNT0iKL2Q5zQqSswNSWEESfWx2oGllQ=;
        b=SeABXjvYEBxG+PW7tEewvfGqafsdFbXYhc74gX+v537cmIMGFMsciZKN7xxZCiMncsHFZt
        QD+ezZ/NR1ivMWBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44EA413443;
        Mon, 13 Jun 2022 17:08:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6K/sDhxvp2LmAgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Mon, 13 Jun 2022 17:08:44 +0000
Date:   Mon, 13 Jun 2022 19:08:41 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/8] i2c: i801: enable FEATURE_IRQ and
 FEATURE_I2C_BLOCK_READ on all chip versions
Message-ID: <20220613190841.653709e7@endymion.delvare>
In-Reply-To: <20220607162442.7b618cca@endymion.delvare>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <1f81a126-11b4-aa22-1e2c-9824e0ad730c@gmail.com>
        <20220607162442.7b618cca@endymion.delvare>
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

Hi Heiner,

I was able to resurrect my Sony Vaio GR214EP laptop to test this patch
on an Intel 82801CAM (ICH3-M) chipset. And as I suspected, it does not
work. I get the following error in the kernel log:

[13563.411101] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[13565.434712] irq 9: nobody cared (try booting with the "irqpoll" option)
[13565.434728] Pid: 321, comm: udevd Tainted: G           O 3.4.63-2.44-default #1
[13565.434734] Call Trace:
[13565.434773]  [<c0205349>] try_stack_unwind+0x199/0x1b0
[13565.434793]  [<c02041c7>] dump_trace+0x47/0xf0
[13565.434808]  [<c02053ab>] show_trace_log_lvl+0x4b/0x60
[13565.434820]  [<c02053d8>] show_trace+0x18/0x20
[13565.434837]  [<c0682e81>] dump_stack+0x6d/0x72
[13565.434855]  [<c02adad1>] __report_bad_irq+0x21/0xc0
[13565.434870]  [<c02adef1>] note_interrupt+0x181/0x1d0
[13565.434887]  [<c02abe9e>] handle_irq_event_percpu+0x9e/0x1d0
[13565.434901]  [<c02abffe>] handle_irq_event+0x2e/0x50
[13565.434915]  [<c02ae3e6>] handle_level_irq+0x56/0x90
[13565.434928]  [<c0204168>] handle_irq+0x88/0xa0
[13565.434939] handlers:
[13565.434949] [<c04bbf6c>] acpi_irq
[13565.435027] [<e0baad00>] usb_hcd_irq
[13565.435054] [<e0baad00>] usb_hcd_irq
[13565.435079] [<e0baad00>] usb_hcd_irq
[13565.435193] [<e0d6fb80>] radeon_driver_irq_handler_kms
[13565.435206] [<e0af5c60>] yenta_interrupt
[13565.435214] [<e0af5c60>] yenta_interrupt
[13565.435227] [<e0b514c0>] irq_handler
[13565.435238] [<e0aeec90>] snd_intel8x0m_interrupt
[13565.435251] [<e0c514a0>] snd_intel8x0_interrupt
[13565.435264] [<e0ab4060>] e100_intr
[13565.435278] [<e09465d0>] i801_isr
[13565.435283] Disabling IRQ #9
[13565.437114] i801_smbus 0000:00:1f.3: Transaction timeout
[13565.437125] i801_smbus 0000:00:1f.3: Terminating the current operation
[13565.439189] i801_smbus 0000:00:1f.3: Failed terminating the transaction

If it matters, and as seen in the list of handlers above, IRQ9 is
heavily shared on this laptop (ACPI, USB, graphics, PCMCIA, sound,
network and SMBus).


-- 
Jean Delvare
SUSE L3 Support
