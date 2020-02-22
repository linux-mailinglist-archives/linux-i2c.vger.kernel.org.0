Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4C031691CF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 21:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgBVUtV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 15:49:21 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:45071 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgBVUtV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Feb 2020 15:49:21 -0500
Received: by mail-io1-f65.google.com with SMTP id i11so6193712ioi.12;
        Sat, 22 Feb 2020 12:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tyttl7wAFzUY9uhKyioctY+cw2c/9OPGZ4FJT7jjtXU=;
        b=dT5BMyzCTyJJp+nvhdoFwyoGOluAnmLzaeCodeI+VdJln29TcnaayygUaf+h0pkBl7
         JZfFCRFxzH7ApVzgz1n/a2cIDwWSvkSVoLq+HhQt2+eSxm4xatSiGflSKVFGaXyXBGH8
         XtIUyiHgAZXfAJnN3OPIAEhPD4sRNoS7/3Kg+75q7KjLSQMZUz2jUuXzd9P1bGNXmg6r
         9k5YKA2OkKx2buLFUqyzwwSYrULTYuZ/N9VSxpb3Kt6Dbj1DHNSvHWI1PlprZUU5p1Uv
         dLJftJv17Yoz0Vdl4PYo/wBIHn07rnGPtr+ZGA0Tl4pcYIpv8Luju0N7ulfYrcwIfHWa
         8VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tyttl7wAFzUY9uhKyioctY+cw2c/9OPGZ4FJT7jjtXU=;
        b=SQ2HovfrsfQnbnbS0+oJ6mvg2HPBjQYGqVJ+uDX9EJpmbRRW/3oeWHVcAftbzuEVsE
         7AlNZJYyCjSggj0s+ROZUUJyxaHwWcE/xMxQRpLHQMRe2q1msVwgmWR6/B12wPJgT994
         hLkR+6Xe1RipfaTl0vcx86wAfeccYjnDv5g/c3gzAVBSu3Amc2Wj6xuN2MeAFiWxnJr4
         KYf6nv/31jJtoVXgmbJHKhzQqmW44EXCTkjENUHULqcr8KY3U0EhxLbE3Q7miLhsZ7l8
         IJpDLv4h6N8vEcs0tqNYFY62hv/4oYPD6FEh36KW5xKi7fbltQbwutDtulZXxbQBbdAp
         vftA==
X-Gm-Message-State: APjAAAVBLqlitTjai47hGp9Y/uhmRhKSUooEkSuJptp3moVykNuMVeaF
        tREa/f4v/Ul6p1m3nHFv1QeeF5g0bkyLez2LMPA=
X-Google-Smtp-Source: APXvYqztJRhXR0FUdnfb7W66f5mv3tPvBbrNQtEroKmjuZm3mu0Roba9eamT1ueHuSiTmo7Rs+8qz2Zy+sEXVtq07Pg=
X-Received: by 2002:a05:6638:1e6:: with SMTP id t6mr40033964jaq.118.1582404560631;
 Sat, 22 Feb 2020 12:49:20 -0800 (PST)
MIME-Version: 1.0
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net> <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
In-Reply-To: <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
From:   Martin Volf <martin.volf.42@gmail.com>
Date:   Sat, 22 Feb 2020 21:49:09 +0100
Message-ID: <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
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

On Sat, Feb 22, 2020 at 8:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 2/22/20 9:55 AM, Martin Volf wrote:
> > On Sat, Feb 22, 2020 at 4:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >> On 2/22/20 3:13 AM, Martin Volf wrote:
> >>> hardware monitoring sensors NCT6796D on my Asus PRIME Z390M-PLUS
> >>> motherboard with Intel i7-9700 CPU don't work with 5.4 and newer linux
> >>> kernels, the driver nct6775 does not load.
> >>>
> >>> It is working OK in version 5.3. I have used almost all released stable
> >>> versions from 5.3.8 to 5.3.16; I didn't try older kernels.
> > ...
> >> My wild guess would be that the i801 driver is a bit aggressive with
> >> reserving memory spaces, but I don't immediately see what it does
> >> differently in that regard after the offending patch. Does it work
> >> if you unload the i2c_i801 driver first ?
> >
> > Yes, after unloading i2c_i801, the nct6775 works.
...
> > This is diff of /proc/ioports in 5.3.18 with loaded nct6775 and in
> > 5.4.21 without:
> >
> > --- ioports-5.3.18
> > +++ ioports-5.4.21
> > @@ -2,6 +2,7 @@
> >     0000-001f : dma1
> >     0020-0021 : pic1
> >     002e-0031 : iTCO_wdt
> > +    002e-0031 : iTCO_wdt
> >     0040-0043 : timer0
> >     0050-0053 : timer1
...
> > So 0x2e is the resource the two drivers are fighting for.
...
> Yes, and it should not do that, since the range can be used to access
> different segments of the same chip from multiple drivers. This region
> should only be reserved temporarily, using request_muxed_region() when
> needed and release_region() after the access is complete. Either case,
> I don't immediately see why that region would be interesting for the
> iTCO watchdog driver.
>
> Can you add some debugging into the i801 driver to see what memory regions
> it reserves, and how it gets to reserve 0x2e..0x31 ? That range really
> doesn't make any sense to me.

in the function i801_add_tco() in drivers/i2c/busses/i2c-i801.c
(line 1601 in 5.4.21), there is this code:

        /*
         * Power Management registers.
         */
        devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
        pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);

        res = &tco_res[ICH_RES_IO_SMI];
        res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
        res->end = res->start + 3;
        res->flags = IORESOURCE_IO;

base_addr is 0xffffffff after pci_bus_read_config_dword() call.
ACPIBASE_SMI_OFF is 0x030, therefore res->start is 0x2e.
Not that I understand even a bit of this...

Martin
