Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 513EA51C698
	for <lists+linux-i2c@lfdr.de>; Thu,  5 May 2022 19:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382652AbiEER7J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 May 2022 13:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243661AbiEER7I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 May 2022 13:59:08 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2828DF99;
        Thu,  5 May 2022 10:55:26 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id be20so6054651edb.12;
        Thu, 05 May 2022 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DvqKRUHs9g2uMuNp+FYuMLs3aayOXPdFyQG23kdHRqY=;
        b=DudUevCNc+oLtc3nwxIX8NTRuFKeSX4Skv8zt6HvMxThAXhx1bsTUBXh72T+2VOpxM
         lHsJO2uJ3Lm93RBRHblNfPFzlPJOHEGmngDm7m8xZhdEmiMaEdOezLzzX1iherq621RY
         cbPxMkAfqRJi7+WsRpqLjzDQ0lBh7qQRjFh/KYmqeurkb7eEwbF2tSY/IDkHLwJoECIJ
         UGEkJMaEGOuxnvUsHoCFBcfazJzIK9QxxenBQI5WlR1EGOt7bDXJL+X7+8R3c9lDLXAM
         077xC/xZ2bO9qNfIW2Y7zOGCVfttl9giSXnJxXUSrKVx7b1TAF2N+ileb8bjFSFOnC3m
         +P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DvqKRUHs9g2uMuNp+FYuMLs3aayOXPdFyQG23kdHRqY=;
        b=5EDeiR0CoFDxUjK0N2oNlBN1Wp0GOvxaXAFotnjqpYVa88EoNSyoCzqeKtkqGxsfQf
         sXO2quytNQV+wQk+pZq/g8QwuUo5NerJlSfgexuZWW/egdwBwWHAbbzCNRVaS/COMVZl
         UXvO0dXX3IvvovNd+GmiGh9EkWnK73D/a0H1ZNFL8chk4pCWVfzBrPpyOmxWgW2daxKZ
         6GTlQH4camRfJi6EAXy4ytkeMoOlTC1UJN+ycPt9GPuPwibB3Lg0sqT2UncVhYpSVmGV
         2bh7Lf0bKuordPfat8J00JaLs29A8v41ICNZuksc/A4VW8EqmyT3Q2DeQUP0NQjkyr2T
         ttsQ==
X-Gm-Message-State: AOAM531uZvl9edutvRUa53svb1rysygm1JYECL68YaS4HUaNICteWb3G
        Y/28F+LtZNGMyljqn4QiShSCo74Qlf9W0eAVUXs=
X-Google-Smtp-Source: ABdhPJx+PJdrC/QFKjg1stJhB5uHqCtHeuJGq7Swfe7eYlgzS96gSmdkooTZ4WcoP7wYrnuhe8haCnjr6MuewXz/Xrk=
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id
 z22-20020a50e696000000b00419998d5febmr31971651edm.122.1651773325203; Thu, 05
 May 2022 10:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-2-andriy.shevchenko@linux.intel.com> <20220505145503.GA25423@wunner.de>
In-Reply-To: <20220505145503.GA25423@wunner.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 May 2022 19:54:49 +0200
Message-ID: <CAHp75VdQqQj0fS6t5nYj+7rJ1tuSt7+5GT78eN06PShWnrDZgA@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] platform/x86/intel: Add Primary to Sideband (P2SB)
 bridge support
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
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
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
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

On Thu, May 5, 2022 at 4:55 PM Lukas Wunner <lukas@wunner.de> wrote:
> On Mon, Jan 31, 2022 at 05:13:39PM +0200, Andy Shevchenko wrote:

Thanks for your review, Lukas! My answers below.

...

> > Background information
> > ======================
>
> The wealth of information in the commit message obscures what the
> actual problem is, which is actually quite simple:  SoC features
> such as GPIO are accessed via a reserved MMIO area, we don't know
> its address but can obtain it from the BAR of the P2SB device,
> that device is normally hidden so we have to temporarily unhide it.

Right, but this long commit message was a result of the previous
discussions with Bjorn. If we're ever going to handle something like
this in the PCI core, perhaps he won't be happy if I remove it. Maybe
we can simply state what you wrote as a problem statement and move
this chapter at the end?

> > On top of that in some cases P2SB is represented by function 0 on PCI
> > slot (in terms of B:D.F) and according to the PCI specification any
> > other function can't be seen until function 0 is present and visible.
>
> I find that paragraph confusing:  Do multi-function P2SB devices exist?
> What are the other functions?  Are they visible but merely not enumerated
> because function 0 is not visible?

The case I see is when we want to read the BAR from another slot of a
PCI device, 0 function of which is P2SB. Since P2SB is hidden, the
other device is hidden as well. Any idea how to reformulate this? And
yes, we have this in the existing SoCs.

...

> > P2SB unconditional unhiding awareness
> > =====================================
> > Technically it's possible to unhide the P2SB device and devices on
> > the same PCI slot and access them at any time as needed. But there are
> > several potential issues with that:
> >
> >  - the systems were never tested against such configuration and hence
> >    nobody knows what kind of bugs it may bring, especially when we talk
> >    about SPI NOR case which contains Intel FirmWare Image (IFWI) code
> >    (including BIOS) and already known to be problematic in the past for
> >    end users
> >
> >  - the PCI by its nature is a hotpluggable bus and in case somebody
> >    attaches a driver to the functions of a P2SB slot device(s) the
> >    end user experience and system behaviour can be unpredictable
> >
> >  - the kernel code would need some ugly hacks (or code looking as an
> >    ugly hack) under arch/x86/pci in order to enable these devices on
> >    only selected platforms (which may include CPU ID table followed by
> >    a potentially growing number of DMI strings
>
> Honestly I would have taken the step to always expose the device,
> identify breakages and then fix those.

Taking into account the history of the different issues on Intel Atom
SoCs I would like to be on the safer side, that's why we don't want to
expose it and keep the status quo for now. IIRC Hans and Mika are on
the same page with me on this.

> We had a similar issue with HD audio controllers on Nvidia GPUs
> which were only visible when an HDMI cable was plugged in.
> We always expose them since b516ea586d71 and I recall we merely
> had a few cases that an audio device was exposed in cases when
> the card had no HDMI connectors at all.  So there was a useless
> HD audio card visible to the user but no real harm.

...

> > +     pci_unlock_rescan_remove();
>
> Please add a code comment why you're calling pci_lock_rescan_remove(),

Sure!

> such as:
>
>         /*
>          * Prevent concurrent PCI bus scan from seeing the P2SB device
>          * while it is temporarily exposed.
>          */
>
> Otherwise it looks like you're abusing that lock to prevent multiple
> simultaneous RMW operations of the P2SBC_HIDE bit.
>
>
> I think the first if-clause above can be simplified to
>
>         if (value & P2SBC_HIDE)
>
> I don't understand why one of the two if-clauses adds "== P2SBC_HIDE".

Agree.

...

> Do you really need all the complicated logic in __pci_bus_read_base()?
> For comparison, simatic_ipc_get_membase0() in simatic-ipc.c merely does:
>
>         pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
>
> If that's sufficient for simatic-ipc.c, why is the more complicated code
> necessary in p2sb.c?

Since it's a PCI device I want to follow what PCI core does with it.
As I explained somewhere that the current code (actually it's a
simplified version of what is done in PCI core) follows what spec
requires. I would like to be in alignment with the spec, while it
still may work with less code. Besides that, it's theoretically
possible that the base address may be 64-bit in new SoCs, I won't
rewrite code again just because we abused the spec.

> I'm wondering, since you're only retrieving the base address (and thus
> temporarily expose the P2SB device) when it's actually needed by a driver,
> would there be any harm in keeping the P2SB device exposed indefinitely
> from the moment a driver first requests the base address?  I.e., unhide it
> but don't hide it again.  That would allow you to call pci_scan_slot() and
> pci_bus_add_devices(), thus instantiating a proper pci_dev which you can
> access without the __pci_bus_read_base() kludge.

Same as above about permanent unhide awareness.
Don't forget that on the same SoCs but with different BIOSes the GPIO,
for example, may or may not be exposed via ACPI, which means that we
need to take precautions with the possible conflicts in device
enumeration (we obviously prefer the ACPI enumeration over P2SB). If
P2SB is always exposed it's theoretically possible and maybe even
practically that base address is changed (by unbinding/binding cycle),
while GPIO is enumerated via P2SB and hence we may end up with the
completely wrong addresses in GPIO.

...

> > +     /*
> > +      * I don't know how l can have all bits set.  Copied from old code.
> > +      * Maybe it fixes a bug on some ancient platform.
> > +      */
> > +     if (PCI_POSSIBLE_ERROR(l))
> > +             l = 0;
>
> l can have all bits set if the device was hot-removed.  That can't happen
> with a built-in device such as P2SB.

Can be dropped, indeed. But that chicken bit emulates that :-) Anyway,
we unhide the device before looking into it, so we shouldn't have the
surprise "removals".

-- 
With Best Regards,
Andy Shevchenko
