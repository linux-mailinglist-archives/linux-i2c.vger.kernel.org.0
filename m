Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58ED4627C2
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 00:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236894AbhK2XJ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 18:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237337AbhK2XJO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 18:09:14 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89E1C0F74C4;
        Mon, 29 Nov 2021 13:07:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D6E43CE16B4;
        Mon, 29 Nov 2021 21:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8D1C53FC7;
        Mon, 29 Nov 2021 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638220027;
        bh=YYsrWpsjHtYy14bPA9IeK6DYB6TTLcgfXcuOF1CfI00=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=CV5bVkbPH6U6AOHjBPA2DrM1eZ1WCNEEr2V6Ogj8edwXiqOAEFU3aEpj2j0ppognm
         2KxVMZtL166u/kJuNPXut4yC2aMuRaFHvW4XWbPWR+cGNYLFYZMRqgJ5oUK9naNO45
         gAy81Zl4ifg7GW82DuwY9xzyOk+X832OV12I7Rv0qLGaUJO8i0iLBxlKB0BRV1jRux
         GsDpx057WgYTWJdD+dY1CXtjSmcSeJ13NIyxl3ovhAI9xO8V4yw5Inwyh9J/UMQMpr
         joNxkB3DRW1TAUbGjKGgBeIKTzWJ4doP6PiUwAkwpHCtW6g8EAMalLhhhJPO8EyR+/
         IVsq1x4BmP61A==
Date:   Mon, 29 Nov 2021 15:07:05 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com,
        henning.schild@siemens.com
Subject: Re: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge
 support library
Message-ID: <20211129210705.GA2689680@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaD/hspdA/j0tL5h@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 26, 2021 at 05:38:46PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 08, 2021 at 07:42:21PM -0600, Bjorn Helgaas wrote:
> > On Mon, Mar 08, 2021 at 09:16:50PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 08, 2021 at 12:52:12PM -0600, Bjorn Helgaas wrote:
> > > > On Mon, Mar 08, 2021 at 02:20:16PM +0200, Andy Shevchenko wrote:
> > > > > From: Jonathan Yong <jonathan.yong@intel.com>
> > > > > 
> > > > > There is already one and at least one more user is coming which
> > > > > requires an access to Primary to Sideband bridge (P2SB) in order to
> > > > > get IO or MMIO bar hidden by BIOS. Create a library to access P2SB
> > > > > for x86 devices.
> > > > 
> > > > Can you include a spec reference?
> > > 
> > > I'm not sure I have a public link to the spec. It's the 100 Series PCH [1].
> > > The document number to look for is 546955 [2] and there actually a bit of
> > > information about this.
> > 
> > This link, found by googling for "p2sb bridge", looks like it might
> > have relevant public links:
> > 
> > https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/
> > 
> > I'd prefer if you could dig out the relevant sections because I really
> > don't know how to identify them.
> 
> I'm not sure I understand what you would like to see. The
> information about P2SB here has confidential tag. I probably can use
> the document number and cite couple of paragraphs from it. Would it
> be sufficient?

This patch proposes to add drivers/pci/pci-p2sb.c.  Things in
drivers/pci/ should generally be documented via PCI-SIG specs to make
them maintainable.  pci-p2sb.c is clearly x86- and Intel-specific.
Maybe arch/x86/pci/ would be a better place for it?

If I were to maintain it under drivers/pci/, I would want some
description about P2SBC_HIDE_BYTE, which device's config space it is
in (apparently 0d.0 of some CPU), and which device it hides/unhides
(apparently some device X other than the CPU).

> > The code suggests that a register on this device controls whether a
> > different device is visible in config space.  I think it will be
> > better if we can describe what's happening.
> 
> Actually it seems incorrect assumption (while it works by some reason).
> I have to double test this.
> 
> From the doc:
> 
> "The P2SB is enumerated as a normal PCI device. ...
> Writing a 1 to the P2SBC.HIDE field in the P2SB PCI Configuration space
> hides the device; writing a 0 to this field, unhides the device."
> 
> It clearly states the P2SB PCI configuration space.

It clearly says P2SBC.HIDE is in P2SB config space.  But I think it's
talking about hiding/unhiding a device other than P2SB.

This patch suggests the P2SB device is at PCI_DEVFN(13, 0), and the
lpc_ich_init_spi() patch suggests there's a SPI controller at
PCI_DEVFN(13, 2).  And apparently P2SBC_HIDE_BIT in PCI_DEVFN(13, 0)
determines whether PCI_DEVFN(13, 2) appears in config space.

So it sounds like P2SB is always visible in config space and is not
itself a "bridge".  The SPI controller, which *is* a bridge from PCI
to SPI, appears at PCI_DEVFN(13, 2) in config space when
P2SBC_HIDE_BIT is cleared.

> > This all sounds quite irregular from the point of view of the PCI
> > core.  If a device responds to address space that is not described by
> > a standard PCI BAR, or by an EA capability, or by one of the legacy
> > VGA or IDE exceptions, we have a problem.  That space must be
> > described *somehow* in a generic way, e.g., ACPI or similar.
> > 
> > What happens if CONFIG_PCI_P2SB is unset?  The device doesn't know
> > that, and if it is still consuming MMIO address space that we don't
> > know about, that's a problem.
> 
> Yeah, Henning already answered on this and I believe that nothing
> prevents OS to try that addresses for other PCI devices, except the
> memory region reservation (by ACPI and / or e820 meaning). It means
> that we rely on firmware to do the right thing if it hides the P2SB
> bar.
> 
> And at the same time P2SB bar is used as a part of telling OS where
> the *fixed* 16Mb region of MMIO is located.

If the SPI controller consumes PCI address space, that space must be
discoverable by standard PCI enumeration and BAR sizing.

If the BIOS hides the device, I assume that means it does not respond
in config space and does not consume MMIO space.  That's fine.

If the BIOS hides the device and the OS unhides it, the unhide should
happen before PCI device enumeration, so the PCI core will find the
device and learn about the MMIO space it consumes.

Bjorn
