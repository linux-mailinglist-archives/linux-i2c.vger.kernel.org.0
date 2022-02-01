Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1594A60D0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 16:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238437AbiBAP4t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 10:56:49 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34070 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237158AbiBAP4t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 10:56:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id CA2E3210E7;
        Tue,  1 Feb 2022 15:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643731008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8q3/9JBMaPFOQrJHzRM6oidD0TKjaLhf9Y9deERN/1U=;
        b=0b9xPHXOkqH1OEXMf76xjmXsB4+JGyNZu8hDICt86fg47khHzKsESoQloKuK2BhgY0c96r
        rT9bNuNTOi2Vx+HsR9awJKG2/QeD2lP31vZeUJGFmJakSR0ryuDoB97lFPKMmzfJeVVqQZ
        H5XVuF0Bj7DkPe6SnjRZs5/RrEsXlrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643731008;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8q3/9JBMaPFOQrJHzRM6oidD0TKjaLhf9Y9deERN/1U=;
        b=7/WB26UvDohEuSnPjHWzW8s4PRJuLIsHX5cwAPjMeaS9Nhmw9AlhbGe2mw0BG5SVlUIpeM
        iBLbrAVvjrABANAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8E4113B53;
        Tue,  1 Feb 2022 15:56:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id rDeRJ0BY+WHnQAAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 01 Feb 2022 15:56:48 +0000
Date:   Tue, 1 Feb 2022 16:56:45 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Kim Nilsson <kim@wayoftao.net>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Possible ACPI bug/regression in i2c-i801
Message-ID: <20220201165645.28fa1d02@endymion>
In-Reply-To: <2cd98d51-f868-2bbb-f048-8096a13aa2f7@wayoftao.net>
References: <2cd98d51-f868-2bbb-f048-8096a13aa2f7@wayoftao.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Kim,

On Sun, 30 Jan 2022 22:33:43 +0100, Kim Nilsson wrote:
> I've recently been doing some suspend/resume testing related to an 
> s2idle bug in amdgpu 
> (https://gitlab.freedesktop.org/drm/amd/-/issues/1879) and I've come 
> across some problems with C-states.

Preliminary remark: having read this bug report and the long list of
kernel parameters you need to make it somewhat work, it seems that your
system is having a lot more problems than just i2c-i801 hypothetically
breaking ACPI. Kernel command line parameters are meant as ways to
workaround or debug issues, you shouldn't need them for regular
operation (in most cases). So for each command line parameter you need
to pass, you should report to the respective kernel development list
with enough details to have the problem investigated and fixed. It is
likely that the solution which will make it no longer mandatory to pass
the command line parameter will actually make the situation not the
same, but better than what you have now.

> After resuming from s2idle, Pkg(HW) will no longer enter any state C2 or 
> deeper. Suspending to s3 would not trigger this issue on 5.16.2, but 
> after trying out 5.16.4 I'm facing a similar problem where Pkg(HW) will 
> rarely if ever go deeper than C3. Now, the reason I am contacting you is 
> because I was playing around today and found that unloading i2c-i801 
> seems to fix the issue.

I'm no expert in power management, but to be honest I can't make much
sense from the paragraph above.

1* How do you "resume from s2idle"? My understanding is that s2idle aka
S0 is just the normal power state where the kernel tries to let the
hardware go to low power run-time mode when possible. You would get in
and out of that state all the time when using the laptop. So please
explain what you mean exactly.

Also my understanding is that s2idle is not really related to ACPI.

2* What does "Pkg(HW)" mean?

3* How do you check the C states?

4* Which issue exactly does unloading i2c-i801 fix? The s2idle one, the
S3 one, both?

5* On which kernel did you try unloading the i2c-i801 module with the
results above? Can you reproduce this behavior with other kernel
versions?

6* You claim this is a regression, which implies this has worked at
some point in the past. Which kernel did you test where having the
i2c-i801 module loaded or not made no difference ?

7* Are you actually using the i2c-i801 module for anything?

As a summary, we will need a lot more details in order to be able to
investigate your report. Specifically, we need accurate data about what
you tested and what were the results, and enough data point to actually
draw conclusions. Something along the lines of: "I do <this> on kernel
<x.y.z> with boot parameters <foo> <bar>, and <that> happens. If I do
the same on kernel <x.a.b> with the same parameters, <something else>
happens. Ideally you would narrow it to just one single change (kernel
version, boot parameter, i2c-i801 being loaded or not...) so that we
have somewhere to start investigating.

> # CPU: Intel(R) Core(TM) i7-8665U CPU @ 1.90GHz
> # GPU: Intel Corporation WhiskeyLake-U GT2 [UHD Graphics 620], Advanced 
> Micro Devices, Inc. [AMD/ATI] Lexa XT [Radeon PRO WX 3100]
> # 00:15.0 Serial bus controller: Intel Corporation Cannon Point-LP 
> Serial IO I2C Controller #0 (rev 30)
> # 00:15.1 Serial bus controller: Intel Corporation Cannon Point-LP 
> Serial IO I2C Controller #1 (rev 300:19.0 Serial bus controller: Intel 
> Corporation Cannon Point-LP Serial IO I2C Host Controller (rev 30)

The line above is clearly corrupted.

When reporting PCI device information, please use option -nn of lspci,
so that the device IDs are included. This makes it easier to
investigate.

Either way, none of the devices listed are driven by i2c-i801. The
device you are looking for would be named "Cannon Point-LP SMBus
Controller".

> dmesg output when loading the module after an unload:
> 
> [ 1002.961091] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> [ 1002.961171] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> [ 1002.961321] iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device 
> disabled by hardware/BIOS
> [ 1002.975399] i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is 
> present on SMBus but its address is unknown, skipping registration
> [ 1002.975406] i2c i2c-10: 2/2 memory slots populated (from DMI)
> [ 1002.976713] ee1004 10-0050: 512 byte EE1004-compliant SPD EEPROM, 
> read-only
> [ 1002.976808] i2c i2c-10: Successfully instantiated SPD at 0x50

Is this complete? The last 2 lines should repeat for the second memory
slot. Anyway, none of these message show any ACPI-related problem.

-- 
Jean Delvare
SUSE L3 Support
