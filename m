Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102754ADF00
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 18:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244646AbiBHRLT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 12:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352487AbiBHRLT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 12:11:19 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A39C061578;
        Tue,  8 Feb 2022 09:11:17 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 71B8C1F387;
        Tue,  8 Feb 2022 17:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644340276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QPUuODZvfHfbK4I1HD8yNzMlq3DUr01lnj3/cFWOZHw=;
        b=Krwlre5TT8cG8uuQV/wBgo6cO8s9TpmtsxTUXQpR2EtFNfxij9q9L0JOyVnZtgXj41Dza+
        HFy9AGBfHmVIE3svdunsjgzQp8HEEqouzj8HCfHhpj9J9mIWzGwkwE4oWoKXR0+JTmXOY6
        TJ+pFJykNI3dqb9yzPdZmHHWp3DAYP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644340276;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QPUuODZvfHfbK4I1HD8yNzMlq3DUr01lnj3/cFWOZHw=;
        b=AW7zgCjMqw1DHvST6TyjtFvQuKtXsRlQFUQXQ1bP8UTTnMosj6litlO8SxK7aUvF6p7suM
        iJOcMI8TTsGUetDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E074213A1A;
        Tue,  8 Feb 2022 17:11:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id cXGkNDOkAmIXXAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 08 Feb 2022 17:11:15 +0000
Date:   Tue, 8 Feb 2022 18:11:14 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <terry.bowman@amd.com>
Cc:     <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <wsa@kernel.org>,
        <andy.shevchenko@gmail.com>, <rafael.j.wysocki@intel.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <rrichter@amd.com>, <thomas.lendacky@amd.com>,
        <sudheesh.mavila@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Basavaraj.Natikar@amd.com>, <Shyam-sundar.S-k@amd.com>,
        <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v4 0/9] i2c: piix4: Replace cd6h/cd7h port I/O accesses
 with MMIO accesses
Message-ID: <20220208181114.180a99ba@endymion.delvare>
In-Reply-To: <20220130184130.176646-1-terry.bowman@amd.com>
References: <20220130184130.176646-1-terry.bowman@amd.com>
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

Hi Terry,

On Sun, 30 Jan 2022 12:41:21 -0600, Terry Bowman wrote:
> This series changes the piix4_smbus driver's cd6h/cd7h port I/O accesses
> to use MMIO instead. This is necessary because cd6h/cd7h port I/O may be
> disabled on later AMD processors.
> 
> This series includes patches with MMIO accesses to register
> FCH::PM::DECODEEN. The same register is also accessed by the sp5100_tco
> driver.[1] Synchronization to the MMIO register is required in both
> drivers.
> 
> The first patch creates a macro to request MMIO region using the 'muxed'
> retry logic. This is used in patch 6 to synchronize accesses to EFCH MMIO.
> 
> The second patch replaces a hardcoded region size with a #define. This is
> to improve maintainability and was requested from v2 review.
> 
> The third patch moves duplicated region request/release code into
> functions. This locates related code into functions and reduces code line
> count. This will also make adding MMIO support in patch 6 easier.
> 
> The fourth patch moves SMBus controller address detection into a function. 
> This is in preparation for adding MMIO region support.
> 
> The fifth patch moves EFCH port selection into a function. This is in
> preparation for adding MMIO region support.
> 
> The sixth patch adds MMIO support for region requesting/releasing and
> mapping. This is necessary for using MMIO to detect SMBus controller
> address, enable SMBbus controller region, and control the port select.
> 
> The seventh patch updates the SMBus controller address detection to support
> using MMIO. This is necessary because the driver accesses register
> FCH::PM::DECODEEN during initialization and only available using MMIO on
> later AMD processors.
> 
> The eighth patch updates the SMBus port selection to support MMIO. This is
> required because port selection control resides in the
> FCH::PM::DECODEEN[smbus0sel] and is only accessible using MMIO on later AMD
> processors.
> 
> The ninth patch enables the EFCH MMIO functionality added earlier in this
> series. The SMBus controller's PCI revision ID is used to check if EFCH
> MMIO is supported by HW and should be enabled in the driver.

Thank you for splitting the changes into small chunks for easier
review. Maybe it was even a bit too much in the end, as most patches
don't serve a purpose on their own. But well, that's still much better
than a monolithic patch.

> Based on v5.16.
> 
> Testing:
>   Tested on family 19h using:
>     i2cdetect -y 0
>     i2cdetect -y 2
> 
>   - Results using v5.16 and this pachset applied. Below
>     shows the devices detected on the busses:
>     
>     # i2cdetect -y 0 
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         -- -- -- -- -- -- -- -- 
>     10: 10 11 -- -- -- -- -- -- 18 -- -- -- -- -- -- -- 
>     20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>     30: 30 -- -- -- -- 35 36 -- -- -- -- -- -- -- -- -- 
>     40: -- -- -- -- -- -- -- -- -- -- 4a -- -- -- -- -- 
>     50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>     70: -- -- -- 73 -- -- -- --                         
>     # i2cdetect -y 2
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         -- -- -- -- -- -- -- -- 
>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>     20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>     30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
>     40: -- -- -- -- -- -- -- -- -- -- -- -- 4c -- -- -- 
>     50: -- 51 -- -- 54 -- -- -- -- -- -- -- -- -- -- -- 
>     60: 60 -- -- 63 -- -- 66 -- -- -- -- 6b -- -- 6e -- 
>     70: 70 71 72 73 74 75 -- 77

Unfortunately I'm not really able to test this series. While I do have
an AMD-based laptop which uses the i2c-piix4 driver, the SMBus has
never been usable on it. The driver creates 3 i2c buses (port 0 at
0b00, port 2 at 0b00 and port 1 at 0b20). The first 2 do not seem to
have any device on them (i2cdetect returns empty). The last one must
have some devices on it, I see address 0x1c answers the ping,
unfortunately as soon as probing reaches address 0x2c, all later pings
return success, regardless of the address. It seems that some I2C
device (probably the one at 0x2c, but I don't know what it is) is
holding SDA low forever, therefore preventing any use of the whole
SMBus port until the next reboot.

> (...)
> Changes in v4:
> (...)
>  - Removed iowrite32(ioread32(...), ...). Unnecessary because MMIO is
>    already enabled. (Terry Bowman)

I'm curious, how can you be sure of that actually?

> (...)
> Terry Bowman (9):
>   kernel/resource: Introduce request_mem_region_muxed()
>   i2c: piix4: Replace hardcoded memory map size with a #define
>   i2c: piix4: Move port I/O region request/release code into functions
>   i2c: piix4: Move SMBus controller base address detect into function
>   i2c: piix4: Move SMBus port selection into function
>   i2c: piix4: Add EFCH MMIO support to region request and release
>   i2c: piix4: Add EFCH MMIO support to SMBus base address detect
>   i2c: piix4: Add EFCH MMIO support for SMBus port select
>   i2c: piix4: Enable EFCH MMIO for Family 17h+
> 
>  drivers/i2c/busses/i2c-piix4.c | 207 ++++++++++++++++++++++++++-------
>  include/linux/ioport.h         |   2 +
>  2 files changed, 164 insertions(+), 45 deletions(-)

I'm done with my review, looks good overall, I made a few comments here
and there but no major issue. I'll leave it up to you (and Wolfram) to
either send a new series with (some of) my suggestions addressed or
just go with v4. In both cases you can add:

Reviewed-by: Jean Delvare <jdelvare@suse.de>

to all patches.

Thank you very much for your work, and sorry for my late review.

-- 
Jean Delvare
SUSE L3 Support
