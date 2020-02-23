Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7328169683
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2020 08:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgBWHG1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Feb 2020 02:06:27 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:40706 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgBWHG1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Feb 2020 02:06:27 -0500
Received: by mail-io1-f65.google.com with SMTP id x1so6975763iop.7;
        Sat, 22 Feb 2020 23:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ej2mA0aDKKMopxuXumf3+CUyzIgPFsAEreKMxIqqyk8=;
        b=KRrPqLU78N2bWryhv/jIJ/92+ZqvL2WCSVHcjggg0hfVhIpHc99Pxit1jmBsXaMgqh
         Ajd1aBpY4R+DlmPmbOh/KVpWUjD5/ZmOrnALTkqIXsEzK/jUPsxGJmhHetq5yciMjKHl
         4rD47fM2ylyGHITRXBy1eyvuQFskqma9wQsm0+sr9MryYkXdW7Mh4gRInDvp+k6n0Cau
         33LpovCTKwNddLTTt991Irboh2uv3khhxKSAxFRicovQSNv/Qon4dsX1oxQd5AK1RQ6N
         M3wgcHZGbWPNGgIXd6Bx2eoz7YJGGLjm7CNcornJRvRpLd1LuwIuSQyDuxViIWDWmT3H
         5KXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ej2mA0aDKKMopxuXumf3+CUyzIgPFsAEreKMxIqqyk8=;
        b=SB0NZthSj3zf7JajgE6J6ysk3iKblXi9tz/Ho72b3eA4DjO9mbVzqCLeqqmFeG4Zk0
         J4tU6Yn5F6nKfbZSUNCcVZImGACKhxFkRPUkMFmPPbK5YpHHtfyKkz9k6O/6uMInO2r1
         6pDeG4InRavi4NwAp6c/4DPsQpDzmpDxHg+pB4UjlKh9lqlvxNKZ5z9KbLpn0B66oDSC
         9QSi8sbo3JOiMe/TPGMkVJ0SMz2WouqxWgLuTSpjb5oQrdVPr+kzYjh9j9u3daZns/MO
         6+EbKFSHZiOTnDnuE/MONpMlUrb4DXonzpZPHhaY1QPSDF9CWYg/w0XBCuUg+U3H2Lxk
         zCVg==
X-Gm-Message-State: APjAAAVjkqFvjMLB+w65gfAha31tEPmGRqDLCAZa2Gb2GvQr227kMiZc
        yzDdjztE3ncOjJipB1OHKW/Q3MO3kaEKz+RXgf0=
X-Google-Smtp-Source: APXvYqynOzzUPnpBQ4F0DxJW2lzksPOdeiSDSSQ7QIbu26JL2WCyvDxWPToF2QD4mlQsuDd+KOZ+ahsp8TTG18k9l+Y=
X-Received: by 2002:a05:6638:3:: with SMTP id z3mr42973455jao.65.1582441586495;
 Sat, 22 Feb 2020 23:06:26 -0800 (PST)
MIME-Version: 1.0
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net> <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net> <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
 <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
In-Reply-To: <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
From:   Martin Volf <martin.volf.42@gmail.com>
Date:   Sun, 23 Feb 2020 08:06:15 +0100
Message-ID: <CAM1AHpT6T1PSxXyHB3hPv8Xvtg_mV8LY1phvKOFz-eLpF+d52Q@mail.gmail.com>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to b84398d6d7f90080
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

On Sat, Feb 22, 2020 at 10:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 2/22/20 12:49 PM, Martin Volf wrote:
> > On Sat, Feb 22, 2020 at 8:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On 2/22/20 9:55 AM, Martin Volf wrote:
> >>> On Sat, Feb 22, 2020 at 4:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>> On 2/22/20 3:13 AM, Martin Volf wrote:
> >>>>> hardware monitoring sensors NCT6796D on my Asus PRIME Z390M-PLUS
> >>>>> motherboard with Intel i7-9700 CPU don't work with 5.4 and newer linux
> >>>>> kernels, the driver nct6775 does not load.
> >>>>>
> >>>>> It is working OK in version 5.3. I have used almost all released stable
> >>>>> versions from 5.3.8 to 5.3.16; I didn't try older kernels.
> >>> ...
> >>>> My wild guess would be that the i801 driver is a bit aggressive with
> >>>> reserving memory spaces, but I don't immediately see what it does
> >>>> differently in that regard after the offending patch. Does it work
> >>>> if you unload the i2c_i801 driver first ?
> >>>
> >>> Yes, after unloading i2c_i801, the nct6775 works.
> > ...
> >>> This is diff of /proc/ioports in 5.3.18 with loaded nct6775 and in
> >>> 5.4.21 without:
> >>>
> >>> --- ioports-5.3.18
> >>> +++ ioports-5.4.21
> >>> @@ -2,6 +2,7 @@
> >>>      0000-001f : dma1
> >>>      0020-0021 : pic1
> >>>      002e-0031 : iTCO_wdt
> >>> +    002e-0031 : iTCO_wdt
> >>>      0040-0043 : timer0
> >>>      0050-0053 : timer1
> > ...
> >>> So 0x2e is the resource the two drivers are fighting for.
> > ...
> >> Yes, and it should not do that, since the range can be used to access
> >> different segments of the same chip from multiple drivers. This region
> >> should only be reserved temporarily, using request_muxed_region() when
> >> needed and release_region() after the access is complete. Either case,
> >> I don't immediately see why that region would be interesting for the
> >> iTCO watchdog driver.
> >>
> >> Can you add some debugging into the i801 driver to see what memory regions
> >> it reserves, and how it gets to reserve 0x2e..0x31 ? That range really
> >> doesn't make any sense to me.
> >
> > in the function i801_add_tco() in drivers/i2c/busses/i2c-i801.c
> > (line 1601 in 5.4.21), there is this code:
> >
> >          /*
> >           * Power Management registers.
> >           */
> >          devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
> >          pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
> >
> >          res = &tco_res[ICH_RES_IO_SMI];
> >          res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
> >          res->end = res->start + 3;
> >          res->flags = IORESOURCE_IO;
> >
> > base_addr is 0xffffffff after pci_bus_read_config_dword() call.
> > ACPIBASE_SMI_OFF is 0x030, therefore res->start is 0x2e.
> > Not that I understand even a bit of this...
> >
>
> Outch. This means that the code is broken. ACPIBASE is not configured,
> or disabled, or the code reads from the wrong PCI configuration register.
> What I don't understand is why this works with v5.3 kernels; the code
> looks just as bad there for me. I must be missing something. Either case,
> the only thing you can really do at this point is to blacklist the
> iTCO_wdt driver.
>
> Other than that, we can only hope that someone who understands above
> code can provide a fix. Maybe Wolfram has an idea.

I have disabled the watchdog subsystem in kernel config (v5.5.5)
and the modprobe.d workaround and sensors are working.

Thanks a lot for your support!

Martin
