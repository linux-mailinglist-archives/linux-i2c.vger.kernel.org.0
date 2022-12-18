Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA82650573
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 00:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiLRXCR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Dec 2022 18:02:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLRXCQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Dec 2022 18:02:16 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A907B7FC;
        Sun, 18 Dec 2022 15:02:13 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6E12122A65;
        Sun, 18 Dec 2022 23:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1671404531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zBrDkYqFp6p27/TglK5V7Cygf9kzupTGxvWxDhgrlxk=;
        b=xKYCOfNCgoqg4fduOoJAiTsBkEtryAUAl8tbuof5Q3hQLrOPvCZ6y3H6t433FsQalEZbc1
        Du7Gp5Jr4oIsGuj9q/BUTnlen27xJ6uV8mb3N7XSm2U5RbNFyiO5dSsiKD3Xbq/3o6cDNu
        VLM7FHma0VvXKZHqxVIwmfiVetRdraY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1671404531;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zBrDkYqFp6p27/TglK5V7Cygf9kzupTGxvWxDhgrlxk=;
        b=fOCHHfEUmsjznApZj/9WpKi2q8cpd+F+hswSHNEH8mTu8sbW1zFon/Y4MKuU7PhcadpyrF
        5NfalOICgteanqAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 294D1138FD;
        Sun, 18 Dec 2022 23:02:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fxxNCPObn2MFPQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sun, 18 Dec 2022 23:02:11 +0000
Date:   Mon, 19 Dec 2022 00:02:09 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Hector Martin <marcan@marcan.st>
Cc:     Alex Henrie <alexh@vpitech.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Message-ID: <20221219000209.1b8fb6f5@endymion.delvare>
In-Reply-To: <10a724cf-fa2b-a0fb-6737-b456238d0385@marcan.st>
References: <20210626054113.246309-1-marcan@marcan.st>
        <20221215152641.39164ca3@endymion.delvare>
        <10a724cf-fa2b-a0fb-6737-b456238d0385@marcan.st>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 17 Dec 2022 22:28:25 +0900, Hector Martin wrote:
> On 15/12/2022 23.26, Jean Delvare wrote:
> > Question: why do you check that the first action of ACPI AML is to
> > acquire the hardware lock *only* if that action was attempted while the
> > Linux side was performing a transfer? That event is quite unlikely to
> > happen. Can't we perform that test unconditionally the very first time
> > i801_acpi_io_handler() is called? Unless the i2c-i801 driver gets> initialized in the middle of an ACPI-side SMBus transfer [...]  
> 
> I wonder if there's some way to close this race? This doesn't sound all
> that unlikely (consider: ACPI backlight is also a module, device init
> happens in parallel, so we could well end up probing i2c-i801 in the
> middle of an ACPI SMBus transfer more often than you'd expect at boot time).
> 
> How about this: instead of checking for the lock access on the *first*
> call to i801_acpi_io_handler, we add an acpi_must_lock flag. This is
> initially false, but it is set on completion of every Linux-side i2c
> transfer, and cleared once we see ACPI take the lock properly. The ACPI
> handler then checks it and expects a lock access if it is true.
> 
> So as soon as Linux does an i2c transfer, we expect ACPI to be taking
> the lock next time it touches the hardware, and we know to bail on the
> Linux side in the future if it does not.
> 
> * If the i2c driver probes in the middle of a well-behaved ACPI SMBus
> transfer, nothing bad happens, since if we try to do a Linux-side
> transfer it will block on the lock until ACPI is done. Further ACPI
> SMBus transfers after a Linux transfer will pass the locking check.
> * If the driver probes in the middle of a misbehaved ACPI transfer but
> is otherwise idle, nothing happens until the first Linux transfer, then
> the next ACPI access after that will have us bail and disable driver access.
> * If we probe *and* try to make a transfer all in the middle of a
> misbehaved ACPI transfer, then we are going to step on its toes and
> break it, but at least we will notice as soon as the Linux side is done
> (or possibly failed due to the collision) and ACPI tries to touch the
> controller again, so we will get out of its way in the future and
> there's at least a chance it will recover for future accesses.

I see what you want to do and I think it should work.

> Further closing that last edge case to avoid ever conflicting with
> broken ACPI implementations would require some sort of mechanism to know
> whether ACPI AML started running an i2c transfer method before the
> i2c-i801 driver loaded, which might be too intrusive a change to be wrth
> it for such a corner case. Though maybe there's an easy way? If there's
> something like a global AML lock we could just have the probe sequence be:
> 
> 1. Register the ACPI IO handler
> 2. Take the AML lock
> 3. Set acpi_must_lock = true
> 4. Release the AML lock
> 5. Finally register the i2c controller
> 
> That makes sure we serialize on any ongoing ACPI shenanigans at probe
> time and allows us to truly check that the first access from ACPI after
> that is a lock, before Linux has a chance to do anything itself. But I
> don't know off the top of my head whether there is such a lock.

I don't think there is, but that would be a question for the ACPI list.
Anyway, for it to be useful, it would have a to be a high-level lock
(taken before starting an ACPI-side SMBus transfer, released after the
ACPI-side SMBus transfer has been fully processes). If it is taken for
every I/O, or even if it isn't held while waiting for the transfer to
complete, it won't solve the problem. And I suspect that if such a
high-level lock existed, we would have been using it in the first place
to guarantee exclusive access to the SMBus controller.

The most important thing is to get exclusive access to work properly
for well-behaved ACPI implementations. I know that the Linux driver
hasn't been a good citizen with the hardware lock until you partially
fixed that 1.5 year ago, but I hope that other operating systems did
that earlier, which would have encouraged well-behaved ACPI
implementations. So hopefully misbehaving ACPI implementations aren't
many on recent systems.

-- 
Jean Delvare
SUSE L3 Support
