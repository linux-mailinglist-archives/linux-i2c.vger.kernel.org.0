Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 321B0169117
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2020 18:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgBVR4F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Feb 2020 12:56:05 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:34181 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgBVR4F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Feb 2020 12:56:05 -0500
Received: by mail-io1-f68.google.com with SMTP id 13so5420474iou.1;
        Sat, 22 Feb 2020 09:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xymqa3kDE8gsaAhoOOgg+/Rq6GUtmyGf3OS1Gk1puFM=;
        b=TA/E0+brZKY8GIL4XfyNmXkGX+sVKWKhBFZ5kfx7Jjin9KONKQcwt0S6LNE20Mo4+V
         fKuAnbY844dDzct+NO/c+3R+RydMxmtZtTpneVKt2O7QSMNopiNsJyKwnUeOJG6oXkxR
         t3jYMT3xi9yO9Ubinp/3UvLyHUKkbvMO7WBmlCd/n20OIAvWS6+JDybmPd5qIvGP9RpA
         AzgZwxZcW8jqywzZV7Immrzvui8R9t1Re0TnmKRByM/FHHKZOGKFV8NquT5vMuViZQwC
         gL2o/49NTgQZHUQml11shU5Zbh/jIF7hZ3c53C2vQdheyQav9vSjFEpzMQw4TE2IQO+u
         WZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xymqa3kDE8gsaAhoOOgg+/Rq6GUtmyGf3OS1Gk1puFM=;
        b=gzgo90WjEW+33zJzsQ+UwW+/FDAO50VW1BFqrItMz+cCP+Na3G0dl4th8S6gXjFRpT
         Pv7A9FXj6LjHp18yJJQ8LiIxyNHZCpAkht281GgaoEAxsfOV/ziX8UOb2ikk8JDwfq/7
         U3hlzxe+RB37JAEOr7Z4GK9jsWGqNPbbF2U/qOEuoACoFMadExqktnSss+SQOkLykstF
         PWy6UeCnqmRtXztx79k8qNZg6cikr6WiArY984kFbIFRNxohPM96RhtoZO7wX8e+vm7J
         GdiYL9gGEmW31egNKOldXTifwIQ1jB/HSgBP5LezEW9+cg64B8A1f62PBh0BHdYfhQIM
         V7/Q==
X-Gm-Message-State: APjAAAU8tM4uTGKzz7PrQSUaTCM9/kiwi9BXeqsjuoZNNCYTiA0P9Xqv
        GTiZKzHrKEPyoDOZf6Sp0auobNS6KjTqNFTh4rE=
X-Google-Smtp-Source: APXvYqxP8SJjkdO5uQ+lfPYwWS8j0dNtJ89xe1yYIwsTYsnwmryLmwlLhtjzdEEfvStYfb0Zlsxrhbk9BKd4UE5ex8c=
X-Received: by 2002:a6b:5902:: with SMTP id n2mr38049416iob.298.1582394164673;
 Sat, 22 Feb 2020 09:56:04 -0800 (PST)
MIME-Version: 1.0
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
In-Reply-To: <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
From:   Martin Volf <martin.volf.42@gmail.com>
Date:   Sat, 22 Feb 2020 18:55:53 +0100
Message-ID: <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
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

On Sat, Feb 22, 2020 at 4:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On 2/22/20 3:13 AM, Martin Volf wrote:
> > hardware monitoring sensors NCT6796D on my Asus PRIME Z390M-PLUS
> > motherboard with Intel i7-9700 CPU don't work with 5.4 and newer linux
> > kernels, the driver nct6775 does not load.
> >
> > It is working OK in version 5.3. I have used almost all released stable
> > versions from 5.3.8 to 5.3.16; I didn't try older kernels.
...
> My wild guess would be that the i801 driver is a bit aggressive with
> reserving memory spaces, but I don't immediately see what it does
> differently in that regard after the offending patch. Does it work
> if you unload the i2c_i801 driver first ?

Yes, after unloading i2c_i801, the nct6775 works. There is definitely
some sort of race between these two drivers. Mostly i2c_i801 wins, but it
happened twice that nct6775 got automatically loaded just before i2c_i801
and the sensors worked.

> You could also try to compare the output of /proc/ioports with
> the old and the new kernel, and see if the IO address space used
> by nct6775 in v5.3 is assigned to the i801 driver (or some other
> driver, such as the watchdog driver) in v5.4.

This is diff of /proc/ioports in 5.3.18 with loaded nct6775 and in
5.4.21 without:

--- ioports-5.3.18
+++ ioports-5.4.21
@@ -2,6 +2,7 @@
   0000-001f : dma1
   0020-0021 : pic1
   002e-0031 : iTCO_wdt
+    002e-0031 : iTCO_wdt
   0040-0043 : timer0
   0050-0053 : timer1
   0060-0060 : keyboard
@@ -14,11 +15,10 @@
   00f0-00ff : fpu
     00f0-00f0 : PNP0C04:00
   0290-029f : pnp 00:01
-    0295-0296 : nct6775
-      0295-0296 : nct6775
   03c0-03df : vga+
   03f8-03ff : serial
   0400-041f : iTCO_wdt
+    0400-041f : iTCO_wdt
   0680-069f : pnp 00:03
 0cf8-0cff : PCI conf1
 0d00-ffff : PCI Bus 0000:00

> If you are into hacking the kernel, you could also add some
> debug messages into the nct6775 driver to find out where exactly
> it fails. If that helps, maybe we can then add those messages into
> into the driver source to help others if this is observed again.

I have added some pr_info calls, the diff is at the and of this massage.

"bad" dmesg (i.e. i2c_i801 loaded before modprobe nct6775)

[ 1631.975392] nct6775: ### sensors_nct6775_init:
platform_driver_register() -> 0x0
[ 1631.975396] nct6775: ### nct6775_find: superio_enter(0x2e) -> 0xfffffff0
[ 1631.975417] nct6775: ### nct6775_find: superio_enter(0x4e) -> 0x0
[ 1631.975455] nct6775: ### nct6775_find: (val & SIO_ID_MASK) == 0xffff

"good" dmesg (rmmod i2c_i801; modprobe nct6775)

[ 1730.751188] nct6775: ### sensors_nct6775_init:
platform_driver_register() -> 0x0
[ 1730.751213] nct6775: ### nct6775_find: superio_enter(0x2e) -> 0x0
[ 1730.751251] nct6775: ### nct6775_find: (val & SIO_ID_MASK) == 0xd42b
[ 1730.751359] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[ 1730.751367] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM)
(20190816/utaddress-204)
[ 1730.751379] ACPI: This conflict may cause random problems and
system instability
[ 1730.751381] ACPI: If an ACPI driver is available for this device,
you should use it instead of the native driver
[ 1730.751431] nct6775: ### nct6775_probe: platform_get_resource() -> 0xfdac7b00
[ 1730.751434] nct6775: ### nct6775_probe: devm_request_region() -> 0
[ 1730.751554] nct6775 nct6775.656: Invalid temperature source 28 at
index 0, source register 0x100, temp register 0x73
[ 1730.751588] nct6775 nct6775.656: Invalid temperature source 28 at
index 1, source register 0x200, temp register 0x75
[ 1730.751686] nct6775 nct6775.656: Invalid temperature source 28 at
index 4, source register 0x900, temp register 0x7b
[ 1730.751865] nct6775: ### nct6775_probe: superio_enter(0x2e) -> 0x0
[ 1730.753685] nct6775: ### nct6775_find: superio_enter(0x4e) -> 0x0
[ 1730.753722] nct6775: ### nct6775_find: (val & SIO_ID_MASK) == 0xffff

So 0x2e is the resource the two drivers are fighting for.

I have created /etc/modprobe.d/nct6775-before-i2c_i801.conf with
install i2c_i801 /sbin/modprobe nct6775; /sbin/modprobe
--ignore-install i2c_i801

and it is working. I'm OK with this workaround, but I can do more
experiments if you instruct me what to try.

Thanks,

Martin

--8<--
--- nct6775.c.orig
+++ nct6775.c
@@ -3806,10 +3806,13 @@ static int nct6775_probe(struct platform
        int num_attr_groups = 0;

        res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+pr_info("### nct6775_probe: platform_get_resource() -> 0x%x\n", res);
        if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
                                 DRVNAME))
                return -EBUSY;

+pr_info("### nct6775_probe: devm_request_region() -> 0");
+
        data = devm_kzalloc(&pdev->dev, sizeof(struct nct6775_data),
                            GFP_KERNEL);
        if (!data)
@@ -4318,6 +4321,7 @@ static int nct6775_probe(struct platform

                break;
        default:
+pr_info("### nct6775_probe: data->kind == 0x%x\n", data->kind);
                return -ENODEV;
        }
        data->have_in = BIT(data->in_num) - 1;
@@ -4503,6 +4507,7 @@ static int nct6775_probe(struct platform
        nct6775_init_device(data);

        err = superio_enter(sio_data->sioreg);
+pr_info("### nct6775_probe: superio_enter(0x%x) -> 0x%x\n",
sio_data->sioreg, err);
        if (err)
                return err;

@@ -4729,6 +4734,7 @@ static int __init nct6775_find(int sioad
        int addr;

        err = superio_enter(sioaddr);
+pr_info("### nct6775_find: superio_enter(0x%x) -> 0x%x\n", sioaddr, err);
        if (err)
                return err;

@@ -4737,6 +4743,7 @@ static int __init nct6775_find(int sioad
        if (force_id && val != 0xffff)
                val = force_id;

+pr_info("### nct6775_find: (val & SIO_ID_MASK) == 0x%04x\n", val);
        switch (val & SIO_ID_MASK) {
        case SIO_NCT6106_ID:
                sio_data->kind = nct6106;
@@ -4831,6 +4838,7 @@ static int __init sensors_nct6775_init(v
        int sioaddr[2] = { 0x2e, 0x4e };

        err = platform_driver_register(&nct6775_driver);
+pr_info("### sensors_nct6775_init: platform_driver_register() -> 0x%x\n", err);
        if (err)
                return err;
