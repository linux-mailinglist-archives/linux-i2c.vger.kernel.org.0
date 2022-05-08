Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B6D51EC0E
	for <lists+linux-i2c@lfdr.de>; Sun,  8 May 2022 09:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiEHHZL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 May 2022 03:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiEHHYN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 May 2022 03:24:13 -0400
X-Greylist: delayed 428 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 08 May 2022 00:20:22 PDT
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB27BF64;
        Sun,  8 May 2022 00:20:21 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 05E3F2800BD8D;
        Sun,  8 May 2022 09:13:09 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id ED86711AF9A; Sun,  8 May 2022 09:13:08 +0200 (CEST)
Date:   Sun, 8 May 2022 09:13:08 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH v4 1/8] platform/x86/intel: Add Primary to Sideband
 (P2SB) bridge support
Message-ID: <20220508071308.GA27815@wunner.de>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-2-andriy.shevchenko@linux.intel.com>
 <20220505145503.GA25423@wunner.de>
 <CAHp75VdQqQj0fS6t5nYj+7rJ1tuSt7+5GT78eN06PShWnrDZgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdQqQj0fS6t5nYj+7rJ1tuSt7+5GT78eN06PShWnrDZgA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 05, 2022 at 07:54:49PM +0200, Andy Shevchenko wrote:
> On Thu, May 5, 2022 at 4:55 PM Lukas Wunner <lukas@wunner.de> wrote:
> > On Mon, Jan 31, 2022 at 05:13:39PM +0200, Andy Shevchenko wrote:
> > > Background information
> > > ======================
> >
> > The wealth of information in the commit message obscures what the
> > actual problem is, which is actually quite simple:  SoC features
> > such as GPIO are accessed via a reserved MMIO area, we don't know
> > its address but can obtain it from the BAR of the P2SB device,
> > that device is normally hidden so we have to temporarily unhide it.
> 
> Right, but this long commit message was a result of the previous
> discussions with Bjorn. If we're ever going to handle something like
> this in the PCI core, perhaps he won't be happy if I remove it. Maybe
> we can simply state what you wrote as a problem statement and move
> this chapter at the end?

Yes, feel free to copy-paste the synopsis from my e-mail above
and rephrase as you see fit.


> > > On top of that in some cases P2SB is represented by function 0 on PCI
> > > slot (in terms of B:D.F) and according to the PCI specification any
> > > other function can't be seen until function 0 is present and visible.
> >
> > I find that paragraph confusing:  Do multi-function P2SB devices exist?
> > What are the other functions?  Are they visible but merely not enumerated
> > because function 0 is not visible?
> 
> The case I see is when we want to read the BAR from another slot of a
> PCI device, 0 function of which is P2SB. Since P2SB is hidden, the
> other device is hidden as well. Any idea how to reformulate this? And
> yes, we have this in the existing SoCs.

The spec you linked to in the commit message (for the 100 series chipset)
says that P2SB is located at Device 31 Function 1.

In those chipsets where P2SB is function 0, what kind of devices are
at functions 1 and higher?


> > Do you really need all the complicated logic in __pci_bus_read_base()?
> > For comparison, simatic_ipc_get_membase0() in simatic-ipc.c merely does:
> >
> >         pci_bus_read_config_dword(bus, p2sb, PCI_BASE_ADDRESS_0, &bar0);
> >
> > If that's sufficient for simatic-ipc.c, why is the more complicated code
> > necessary in p2sb.c?
> 
> Since it's a PCI device I want to follow what PCI core does with it.
> As I explained somewhere that the current code (actually it's a
> simplified version of what is done in PCI core) follows what spec
> requires. I would like to be in alignment with the spec, while it
> still may work with less code. Besides that, it's theoretically
> possible that the base address may be 64-bit in new SoCs, I won't
> rewrite code again just because we abused the spec.

So as an alternative to copy-pasting __pci_bus_read_base(),
you could just call pci_scan_single_device().  This will create
a proper pci_dev that you can work with.  Note that no driver will
be bound to the device because of:

  pci_scan_single_device()
    pci_device_add()
      dev->match_driver = false

After you've read the BAR, get rid of the pci_dev with pci_destroy_dev().


> > > +     /*
> > > +      * I don't know how l can have all bits set.  Copied from old code.
> > > +      * Maybe it fixes a bug on some ancient platform.
> > > +      */
> > > +     if (PCI_POSSIBLE_ERROR(l))
> > > +             l = 0;
> >
> > l can have all bits set if the device was hot-removed.  That can't happen
> > with a built-in device such as P2SB.
> 
> Can be dropped, indeed. But that chicken bit emulates that :-) Anyway,
> we unhide the device before looking into it, so we shouldn't have the
> surprise "removals".

pci_lock_rescan_remove() prevents concurrent unhiding as well as
removal via sysfs.

Thanks,

Lukas
