Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6602D51ECCC
	for <lists+linux-i2c@lfdr.de>; Sun,  8 May 2022 12:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiEHKKW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 May 2022 06:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiEHKKV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 May 2022 06:10:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D853AA1AA;
        Sun,  8 May 2022 03:06:30 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id y21so13195988edo.2;
        Sun, 08 May 2022 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CJCMU02/6bkg4d7JphHAcBzRb/bkuK7u7BhP44FNWvE=;
        b=Jkw82c7Y/yZxxe/Z5NTLbnF5ZqRTCFuZUj7WiXDI2g/K9JLxICJkJHfydelh5YyijD
         BTyVvGr7I+m1FoZH+/hrmP9KGJfQTpbL4jbBPYSZroe3Evffw5o0AXqldIZcU6kjPTva
         b/IQ2rlvsVu0FVPGYPqaQfaGnLKHh1zwgWshWLSypWH021AyuwSxQ9vr6gvRl3o3qaM/
         pgkxEfg/CDCMpKhUFQl55UyeWEdiHVDcAKVvZM1RajXzTO12Gh9hN7XT2w4aXnuILcgy
         6g5w8dbbGLmddPHuSP4peZYfsmFjket95mGBDB+86CyFgOneSv5EYB312c/goZj/BH3p
         kI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CJCMU02/6bkg4d7JphHAcBzRb/bkuK7u7BhP44FNWvE=;
        b=zEK6nUOB2zI9RndkjwtiPF4XDMvOFzvNPy4odJHla3eTZy9ZTwB4tQchKMRRq8z0h4
         KbOfpXj2+tGiAKQZLAwk6QIPEsd6go6m1mUjdb3CMSKexsqSrjRNfvE6IQ5lkABU/vha
         iDA0dxuxIp9n+MeK86Md5GooqQOLhZJ9FNgorAyk9JbHsaEKaLh4oXEpb1O6LluUo7Nz
         A5mz2Yg8VWCiNLzeCnWS8+ZUEUI4tp2IurW/RLJpVABdHEJynF+bHuBoIhl9T/LBPHLk
         KhuNQp5YOs0Xs3TDhC6lhllXmPD+7dRLJusU0FECjXkRgILF2Mo1D2oZpiQOr6XjLzH0
         N/1Q==
X-Gm-Message-State: AOAM5302VmDAvTito7f43ZAQpcwLbFUyiyhG/cvd6BPc7ds2iQFYGrEj
        hIH1N26hebRloaLYpbCJN7KhagZTnbpUfM9gSQ0=
X-Google-Smtp-Source: ABdhPJxsQFuzeWPpKEla7buOqqGN0k6Sk77/4mYUyxdxhvlvvkuOJVxXcAi3sMsHEU8wfz8F51WohXsswklCAIN18xM=
X-Received: by 2002:a05:6402:1d4c:b0:427:d1f5:3a41 with SMTP id
 dz12-20020a0564021d4c00b00427d1f53a41mr11871564edb.218.1652004389382; Sun, 08
 May 2022 03:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-2-andriy.shevchenko@linux.intel.com>
 <20220505145503.GA25423@wunner.de> <CAHp75VdQqQj0fS6t5nYj+7rJ1tuSt7+5GT78eN06PShWnrDZgA@mail.gmail.com>
 <20220508071308.GA27815@wunner.de>
In-Reply-To: <20220508071308.GA27815@wunner.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 8 May 2022 12:05:53 +0200
Message-ID: <CAHp75Vfy3Z0+YmPucL=xbP9tiSL6jM34mJ5-fK=og91eEzq5hw@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] platform/x86/intel: Add Primary to Sideband (P2SB)
 bridge support
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, May 8, 2022 at 9:13 AM Lukas Wunner <lukas@wunner.de> wrote:
> On Thu, May 05, 2022 at 07:54:49PM +0200, Andy Shevchenko wrote:
> > On Thu, May 5, 2022 at 4:55 PM Lukas Wunner <lukas@wunner.de> wrote:
> > > On Mon, Jan 31, 2022 at 05:13:39PM +0200, Andy Shevchenko wrote:

...

> > > > Background information
> > > > ======================
> > >
> > > The wealth of information in the commit message obscures what the
> > > actual problem is, which is actually quite simple:  SoC features
> > > such as GPIO are accessed via a reserved MMIO area, we don't know
> > > its address but can obtain it from the BAR of the P2SB device,
> > > that device is normally hidden so we have to temporarily unhide it.
> >
> > Right, but this long commit message was a result of the previous
> > discussions with Bjorn. If we're ever going to handle something like
> > this in the PCI core, perhaps he won't be happy if I remove it. Maybe
> > we can simply state what you wrote as a problem statement and move
> > this chapter at the end?
>
> Yes, feel free to copy-paste the synopsis from my e-mail above
> and rephrase as you see fit.

Will do.

...

> > > > On top of that in some cases P2SB is represented by function 0 on PCI
> > > > slot (in terms of B:D.F) and according to the PCI specification any
> > > > other function can't be seen until function 0 is present and visible.
> > >
> > > I find that paragraph confusing:  Do multi-function P2SB devices exist?
> > > What are the other functions?  Are they visible but merely not enumerated
> > > because function 0 is not visible?
> >
> > The case I see is when we want to read the BAR from another slot of a
> > PCI device, 0 function of which is P2SB. Since P2SB is hidden, the
> > other device is hidden as well. Any idea how to reformulate this? And
> > yes, we have this in the existing SoCs.
>
> The spec you linked to in the commit message (for the 100 series chipset)
> says that P2SB is located at Device 31 Function 1.
>
> In those chipsets where P2SB is function 0, what kind of devices are
> at functions 1 and higher?

In the Intel Broxton and Apollo Lake cases the P2SB is the function 0
and we want to have a BAR of SPI NOR, which is function 2.

...

> > > Do you really need all the complicated logic in __pci_bus_read_base()?
> > > For comparison, simatic_ipc_get_membase0() in simatic-ipc.c merely does:
> > >
> > >         pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
> > >
> > > If that's sufficient for simatic-ipc.c, why is the more complicated code
> > > necessary in p2sb.c?
> >
> > Since it's a PCI device I want to follow what PCI core does with it.
> > As I explained somewhere that the current code (actually it's a
> > simplified version of what is done in PCI core) follows what spec
> > requires. I would like to be in alignment with the spec, while it
> > still may work with less code. Besides that, it's theoretically
> > possible that the base address may be 64-bit in new SoCs, I won't
> > rewrite code again just because we abused the spec.
>
> So as an alternative to copy-pasting __pci_bus_read_base(),
> you could just call pci_scan_single_device().  This will create
> a proper pci_dev that you can work with.  Note that no driver will
> be bound to the device because of:
>
>   pci_scan_single_device()
>     pci_device_add()
>       dev->match_driver = false
>
> After you've read the BAR, get rid of the pci_dev with pci_destroy_dev().

This is pretty nice, if it flies! I definitely try this ASAP (during
working hours).
Thanks for the hint.

...

> > > > +     /*
> > > > +      * I don't know how l can have all bits set.  Copied from old code.
> > > > +      * Maybe it fixes a bug on some ancient platform.
> > > > +      */
> > > > +     if (PCI_POSSIBLE_ERROR(l))
> > > > +             l = 0;
> > >
> > > l can have all bits set if the device was hot-removed.  That can't happen
> > > with a built-in device such as P2SB.
> >
> > Can be dropped, indeed. But that chicken bit emulates that :-) Anyway,
> > we unhide the device before looking into it, so we shouldn't have the
> > surprise "removals".
>
> pci_lock_rescan_remove() prevents concurrent unhiding as well as
> removal via sysfs.

Yep, that's good. In any case this piece of code will be gone if your
above suggestion works, have I got it right?

-- 
With Best Regards,
Andy Shevchenko
