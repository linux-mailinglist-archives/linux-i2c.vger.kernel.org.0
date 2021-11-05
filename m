Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460064466AE
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Nov 2021 17:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhKEQIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Nov 2021 12:08:37 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45186 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbhKEQId (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Nov 2021 12:08:33 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 52F022171F;
        Fri,  5 Nov 2021 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636128353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4rnXTfL1Je/pQtE2hkC3jKFM7qmnf3mmib4Clu3p9R4=;
        b=Ign6XLWhBNkSuNQrvL/bXCjr2qg+Tv7uq9Wi7JxcH8TGpl2smca3qHXh4e4ftOM1/wT0KC
        jFWyll1JJgUBAbL4UHCQHFxnZ/fUXIjZp8XKbuqlk+vh+HP7q4empigRUhc4WQDIspU2ld
        CmyU25Cf0pdjamzBSs0Rr/RmRm3MJjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636128353;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4rnXTfL1Je/pQtE2hkC3jKFM7qmnf3mmib4Clu3p9R4=;
        b=slOL+0lXwJu1qTIp7Pp8Idui+3rw5x+gXYrYZAlHwBhdmdJNYvV8yzgsztq8hSMR4AKGSG
        uqoQZMRcwfKAZNAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC53E1400B;
        Fri,  5 Nov 2021 16:05:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wF4oN2BWhWGxOgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 05 Nov 2021 16:05:52 +0000
Date:   Fri, 5 Nov 2021 17:05:50 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Terry Bowman <Terry.Bowman@amd.com>
Cc:     linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
        linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <20211105170550.746443b9@endymion>
In-Reply-To: <20210907183720.6e0be6b6@endymion>
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
        <20210907183720.6e0be6b6@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 7 Sep 2021 18:37:20 +0200, Jean Delvare wrote:
> More generally, I am worried about the overall design. The driver
> originally used per-access I/O port requesting because keeping the I/O
> ports busy all the time would prevent other drivers from working. Do we
> still need to do the same with the new code? If it is possible and safe
> to have a permanent mapping to the memory ports, that would be a lot
> faster.
> 
> On the other hand, the read-modify-write cycle in
> piix4_setup_sb800_smba() is unsafe if 2 drivers can actually call
> request_mem_region() on the same memory area successfully.
> 
> I'm not opposed to taking your patch with minimal changes (as long as
> the code is safe) and working on performance improvements later.

I looked some more at the code. I was thinking that maybe if the
registers accessed by the two drivers (i2c-piix4 and sp5100_tco) were
disjoint, then each driver could simply request subsets of the mapped
memory.

Unfortunately, while most registers are indeed exclusively used by one
of the drivers, there's one register (0x00 = IsaDecode) which is used
by both. So this simple approach isn't possible.

That being said, the register in question is only accessed at device
initialization time (on the sp5100_tco side, that's in function
sp5100_tco_setupdevice) and only for some devices (Embedded FCH). So
one approach which may work is to let the i2c-piix4 driver instantiate
the watchdog platform device in that case, instead of having sp5100_tco
instantiate its own device as is currently the case. That way, the
i2c-piix4 driver would request the "shared" memory area, perform the
initialization steps for both functions (SMBus and watchdog) and then
instantiate the watchdog device so that sp5100_tco gets loaded and goes
on with the runtime management of the watchdog device.

If I'm not mistaken, this is what the i2c-i801 driver is already doing
for the watchdog device in all recent Intel chipsets. So maybe the same
approach can work for the i2c-piix4 driver for the AMD chipsets.
However I must confess that I did not try to do it nor am I familiar
with the sp5100_tco driver details, so maybe it's not possible for some
reason.

If it's not possible then the only safe approach would be to migrate
i2c-piix4 and sp5100_tco to a true MFD setup with 3 separate drivers:
one new MFD PCI driver binding to the PCI device, providing access to
the registers with proper locking, and instantiating the platform
device, one driver for SMBus (basically i2c-piix4 converted to a
platform driver and relying on the MFD driver for register access) and
one driver for the watchdog (basically sp5100_tco converted to a
platform driver and relying on the MFD driver for register access).
That's a much larger change though, so I suppose we'd try avoid it if
at all possible.

-- 
Jean Delvare
SUSE L3 Support
