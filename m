Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94FD64AE3ED
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 23:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386877AbiBHWYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 17:24:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387023AbiBHVq6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 16:46:58 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8318BC0612B8;
        Tue,  8 Feb 2022 13:46:57 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1E1601F383;
        Tue,  8 Feb 2022 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644356816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Y4cqlpGJFVeRUEbBtoO3aZV+LJk6nsh0uPbojI7rXM=;
        b=VOLE94XELXtFUqsCfzwaLtl1ioehxDM+6T4zC+XmXO4afpyMVrzOcCjW+iNddp9RxmjsNc
        lRKVM8C8Jk95OCWPmEsya5u/aJm+rGzNS4U8mvXllVyXTOh3ac/dqK/oR7Vu0AV9GuL2EG
        0cJmF5YbTZ7WGLqx1WdRA7mmqB8+Ov8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644356816;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6Y4cqlpGJFVeRUEbBtoO3aZV+LJk6nsh0uPbojI7rXM=;
        b=XpMJKhki4kVnEkQE/U0fzVHvjwBQ/bzO72KOv2BltNkEEcRvmid1ZsP0fAD4K83kULjP6C
        9zR4plpxRx5op5AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AED6139C1;
        Tue,  8 Feb 2022 21:46:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id G0GPH8/kAmLCRQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 21:46:55 +0000
Date:   Tue, 8 Feb 2022 22:46:53 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Message-ID: <20220208224653.6a62ba22@endymion.delvare>
In-Reply-To: <4ae57999-0f23-7578-008d-2009bc36d46b@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
        <20220208181114.180a99ba@endymion.delvare>
        <4ae57999-0f23-7578-008d-2009bc36d46b@amd.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 8 Feb 2022 13:36:55 -0600, Terry Bowman wrote:
> On 2/8/22 11:11, Jean Delvare wrote:
> > Unfortunately I'm not really able to test this series. While I do have
> > an AMD-based laptop which uses the i2c-piix4 driver, the SMBus has
> > never been usable on it. The driver creates 3 i2c buses (port 0 at
> > 0b00, port 2 at 0b00 and port 1 at 0b20). The first 2 do not seem to
> > have any device on them (i2cdetect returns empty). The last one must
> > have some devices on it, I see address 0x1c answers the ping,
> > unfortunately as soon as probing reaches address 0x2c, all later pings
> > return success, regardless of the address. It seems that some I2C
> > device (probably the one at 0x2c, but I don't know what it is) is
> > holding SDA low forever, therefore preventing any use of the whole
> > SMBus port until the next reboot.
> 
> My understanding is the OEM may have different i2c devices because it
> is mainboard specific.

Yes, the devices on the SMBus could be anything Lenovo decided to use.
Tomorrow I'll try to scan the SMBus but skipping the problematic
address, to see if it works around the problem.

> >> (...)
> >> Changes in v4:
> >> (...)
> >>  - Removed iowrite32(ioread32(...), ...). Unnecessary because MMIO is
> >>    already enabled. (Terry Bowman)  
> > 
> > I'm curious, how can you be sure of that actually?
> 
> The removed code was using a MMIO region to write 1 to 'mmioen'. This was 
> using the MMIO region to enable same MMIO region.

Ah ah, I get it now. Nice chicken or the egg situation :-)

> Programmer's manual shows FCH::PM::ISACONTROL[mmioen] has a '1' reset value.
> Per programmer's manual, FCH::PM::ISACONTROL[mmioen] enables MMIO mapping 
> at FED8_0000h..FED8_1FFFh. The FCH::PM::ISACONTROL register is MMIO 
> mapped at FED8_0304h. 'mmioen' was intended to be set using port I/O to 
> enable MMIO but, port I/O access to these registers is now disabled.

Is my understanding correct that there is some overlapping of the
access methods and there are certain chipsets where both legacy I/O and
MMIO access is possible?

If so, while there's indeed nothing to be done for the most recent
systems where only MMIO access is possible, you may still need to
enable MMIO access through legacy I/O if you try to use MMIO on
chipsets where both are possible. I'm not sure what exactly where you
set the limit. In the last patch you say that 0x51 is the first
revision of the family 17h CPUs, but is family 17h the first where MMIO
is available, or the first where legacy I/O isn't?

-- 
Jean Delvare
SUSE L3 Support
