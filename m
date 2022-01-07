Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304F8487B14
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jan 2022 18:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348492AbiAGRLO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jan 2022 12:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240526AbiAGRLN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jan 2022 12:11:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00D3C061574;
        Fri,  7 Jan 2022 09:11:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3CB8FB82683;
        Fri,  7 Jan 2022 17:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F72C36AE0;
        Fri,  7 Jan 2022 17:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641575470;
        bh=8pdjkK9yk5bBrBIZ78fRTTJbntr0HxUaqMtcapdm0uo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=G2shAwl+WbSW6rLWsVQVik6pd1tNj5ltwX9UO6VnpkaVEnW+PtwfJbhc0OyyO7vzC
         ErtsGcIDi2klE8yD23PT8i3xhR/Ko+ov0JC+Jih3TncNy1rkm9QAIGekvYSgQUf2ZG
         XAfnXCaEWVbScjlGAsk2Uzm83EJY2FH+VC8B9IlBOgyva1AmUmkl9sF8qf0J7g6gQZ
         nYzsuuw2i8R7XGiIZ0q/VAO4NmyDsBpYwmSc39wc8+ru4r9I6z/xSloPpPrpwttXak
         i6KP5AGqm65Rd/A+yvlGTLuqn2SE2mhb6utdqcE26iX79QSVk4aewyEiU3bZsXzzIF
         UVTvsXIDcoLaA==
Date:   Fri, 7 Jan 2022 11:11:08 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v3 3/8] platform/x86/intel: Add Primary to Sideband
 (P2SB) bridge support
Message-ID: <20220107171108.GA381493@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdhUqhflS/0YsRWJ@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 07, 2022 at 04:56:42PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 06, 2022 at 07:03:05PM -0600, Bjorn Helgaas wrote:
> > On Tue, Dec 21, 2021 at 08:15:21PM +0200, Andy Shevchenko wrote:

> > And, of course, if the OS cannot enumerate a PCI device, obviously
> > it cannot reassign any BARs on this device it doesn't know about.
> 
> Exactly. And I believe this explains why the region is excluded from
> _CRS and why we mustn't reallocate it. It probably will work (again,
> no-one have broadly tested this), but it will consume resources
> which can be used by others (like Thunderbolt).

Firmware excluded it from _CRS because it knows the region is in use.
If it *were* in _CRS, the OS would see that no device uses it, so it
could assign it to some PCI device, and an MMIO read would get two
responses.

If you manually reassign that BAR to some unused address space
elsewhere, we have no idea what would happen.  Since the device is not
described anywhere, we have no idea what address space even *reaches*
the device.  And if firmware is using the device, changing the BAR
will likely break whatever firmware is doing.

> > The hardware and BIOS went to some trouble to hide this MMIO space
> > from the OS, but now the OS wants to use it.  I'm pretty sure the
> > systems were never tested against *that* configuration either :)
> 
> What do you mean? The unhide/hide back has been tested and we have
> already users in the kernel (they have other issues though with the
> PCI rescan lock, but it doesn't mean it wasn't ever tested).

Does the firmware team that hid this device sign off on the OS
unhiding and using it?  How do we know that BIOS is not using the
device?

> > And the fact that they went to all this trouble to hide it means
> > the BIOS is likely using it for its own purposes and the OS may
> > cause conflicts if it also uses it.
> 
> What purposes do you have in mind?

The functionality implemented in the P2SB MMIO space is not specified,
so I have no idea what it does or whether BIOS could be using it.

But here's a hypothetical example: some platform firmware logs errors
to NVRAM.  That NVRAM could exist on a device like the P2SB, where the
firmware assigns the MMIO address and hides the device from the OS.
The firmware legitimately assumes it has exclusive control of the
device and the OS will never touch it.  If the OS unhides the device
and also uses that NVRAM, the platform error logging no longer works.

My point is that the unhide is architecturally messed up.  The OS runs
on the platform as described by ACPI.  Devices that cannot be
enumerated are described in the ACPI namespace.

If the OS goes outside that ACPI-described platform and pokes at
things it "knows" should be there, the architectural model falls
apart.  The OS relies on things the firmware didn't guarantee, and
the firmware can't rely on non-interference from the OS.

If you want to go outside the ACPI model, that's up to you, but I
don't think we should tweak the PCI core to work with things that
the BIOS has explicitly arranged to *not* be PCI devices.

> > The way the BIOS has this set up, P2SB is logically not a PCI
> > device.  It is not enumerable.  The MMIO space it uses is not in
> > the _CRS of a PCI host bridge.  That means it's now a platform
> > device.
> 
> I do not follow what you are implying here.

On an ACPI system, the way we enumerate PCI devices is to find all the
PCI host bridges (ACPI PNP0A03 devices), and scan config space to find
the PCI devices below them.  That doesn't find P2SB, so from a
software point of view, it is not a PCI device.

Platform devices are by definition non-enumerable, and they have to be
described via ACPI, DT, or some kind of platform-specific code.  P2SB
is not enumerable, so I think a platform device is the most natural
way to handle it.

> As you see the code, it's not a driver, it's a library that reuses
> PCI functions because the hardware is represented by an IP inside
> PCI hierarchy and with PCI programming interface.

Yes, it's a PCI programming interface at the hardware level, but at
the software level, it's not part of PCI.

This series does quite a lot of work in the PCI core to read that one
register in a device the PCI core doesn't know about.  I think it will
be simpler overall if instead of wedging this into PCI, we make p2sb.c
start with the ECAM base, ioremap() it, compute the register address,
readl() the MMIO address, and be done with it.  No need to deal with
pci_find_bus(), pci_lock_rescan_remove(), change the core's BAR sizing
code, etc.

> > The correct way to use this would be as an ACPI device so the OS
> > can enumerate it and the firmware can mediate access to it.  Going
> > behind the back of the firmware does not sound advisable to me.
> 
> Are you going to fix all firmwares and devices on the market?  We
> have it's done like this and unfortunately we can't fix what's is
> done due to users who won't update their firmwares by one or another
> reason.

I just mean that from a platform design standpoint, an ACPI device
would be the right way to do this.  Obviously it's not practical to
add that to systems in the field.  You could create a platform_device
manually now, and if there ever is an ACPI device, ACPI can create a
platform_device for you.

> > If you want to hack something in, I think it might be easier to
> > treat this purely as a platform device instead of a PCI device.
> > You can hack up the config accesses you need, discover the MMIO
> > address, plug that in as a resource of the platform device, and go
> > wild.  I don't think the PCI core needs to be involved at all.
> 
> Sorry, I do not follow you. The device is PCI, but it's taken out of
> PCI subsystem control by this hardware trick.

The electrical connection might be PCI, but from the software point of
view, it's only a PCI device if it can be enumerated by the mechanism
specified by the spec, namely, reading the Vendor ID of each potential
device.

Yes, doing it as a platform device would involve some code in p2sb.c
that looks sort of like code in the PCI core.  But I don't think it's
actually very much, and I think it would be less confusing than trying
to pretend that this device sometimes behaves like a PCI device and
sometimes not.

> There are document numbers that make sense.
> I believe that
> 
> [2]: https://cdrdv2.intel.com/v1/dl/getContent/332690?wapkw=332690
> [3]: https://cdrdv2.intel.com/v1/dl/getContent/332691?wapkw=332691
> 
> work for you. Tell me if not (Meanwhile I have changed locally)

Great, thanks.  The links work for me (currently).  I think a proper
citation would also include the document title and document number,
since I doubt Intel guarantees those URLs will work forever.

Bjorn
