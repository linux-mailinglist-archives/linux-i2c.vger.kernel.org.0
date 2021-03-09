Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48763331C91
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 02:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhCIBmw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 20:42:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:37194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229764AbhCIBmX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 20:42:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A4F8652A8;
        Tue,  9 Mar 2021 01:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615254143;
        bh=u6Wt4ZYzeRBKFqq9tL6mnx/3bHT+JgCkJ7w4UKtIQbc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=fQKV9/XQvwke5T0B9uo45zNWuiZvdnj37A6jyyE6TU69Mvqp8B7EZnQD3kpNz1TeJ
         O1RGlFzSuaL+ZV5Bq2kYVzBCXOg5QtYwobGNfL4o1AYAUnsJZI96/+FjfS81q5ehnM
         5eWsLpw6IafAl+jrDuPZzKkzJufkGEYde/s0Qk1G025ZxRWqvV4J/bPdaLLlq4Po17
         BX1vdfTsXSqLtsh2oF4b54Fq+3EO3dHKMp/nGdo2saRL52Kr0jbEk0WBu2UawW3zXg
         mN/Omk4JoldCRBL4o67/I0wEKF2nRXrVldgfL2amrsJAEFdf3OEBZZC7gm3v0/jwSp
         p8TEIdO3OVoHg==
Date:   Mon, 8 Mar 2021 19:42:21 -0600
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
Message-ID: <20210309014221.GA1831206@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEZ4IitUa+I9HM5F@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 08, 2021 at 09:16:50PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 08, 2021 at 12:52:12PM -0600, Bjorn Helgaas wrote:
> > On Mon, Mar 08, 2021 at 02:20:16PM +0200, Andy Shevchenko wrote:
> > > From: Jonathan Yong <jonathan.yong@intel.com>
> > > 
> > > There is already one and at least one more user is coming which
> > > requires an access to Primary to Sideband bridge (P2SB) in order to
> > > get IO or MMIO bar hidden by BIOS. Create a library to access P2SB
> > > for x86 devices.
> > 
> > Can you include a spec reference?
> 
> I'm not sure I have a public link to the spec. It's the 100 Series PCH [1].
> The document number to look for is 546955 [2] and there actually a bit of
> information about this.

This link, found by googling for "p2sb bridge", looks like it might
have relevant public links:

https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/

I'd prefer if you could dig out the relevant sections because I really
don't know how to identify them.

> > I'm trying to figure out why this
> > belongs in drivers/pci/.  It looks very device-specific.
> 
> Because it's all about access to PCI configuration spaces of the (hidden)
> devices.

The PCI core generally doesn't deal with device-specific config
registers.

> [1]: https://ark.intel.com/content/www/us/en/ark/products/series/98456/intel-100-series-desktop-chipsets.html
> [2]: https://medium.com/@jacksonchen_43335/bios-gpio-p2sb-70e9b829b403
> 
> ...
> 
> > > +config PCI_P2SB
> > > +	bool "Primary to Sideband (P2SB) bridge access support"
> > > +	depends on PCI && X86
> > > +	help
> > > +	  The Primary to Sideband bridge is an interface to some PCI
> > > +	  devices connected through it. In particular, SPI NOR
> > > +	  controller in Intel Apollo Lake SoC is one of such devices.
> > 
> > This doesn't sound like a "bridge".  If it's a bridge, what's on the
> > primary (upstream) side?  What's on the secondary side?  What
> > resources are passed through the bridge, i.e., what transactions does
> > it transfer from one side to the other?
> 
> It's a confusion terminology here. It's a Bridge according to the spec, but
> it is *not* a PCI Bridge as you may had a first impression.

The code suggests that a register on this device controls whether a
different device is visible in config space.  I think it will be
better if we can describe what's happening.

> ...
> 
> > > +	/* Unhide the P2SB device */
> > > +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, 0);
> > > +
> > > +	/* Read the first BAR of the device in question */
> > > +	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem, PCI_BASE_ADDRESS_0, true);
> > 
> > I don't get this.  Apparently this normally hidden device is consuming
> > PCI address space.  The PCI core needs to know about this.  If it
> > doesn't, the PCI core may assign this space to another device.
> 
> Right, it returns all 1:s to any request so PCI core *thinks* it's
> plugged off (like D3cold or so).

I'm asking about the MMIO address space.  The BAR is a register in
config space.  AFAICT, clearing P2SBC_HIDE_BYTE makes that BAR
visible.  The BAR describes a region of PCI address space.  It looks
like setting P2SBC_HIDE_BIT makes the BAR disappear from config space,
but it sounds like the PCI address space *described* by the BAR is
still claimed by the device.  If the device didn't respond to that
MMIO space, you would have no reason to read the BAR at all.

So what keeps the PCI core from assigning that MMIO space to another
device?

This all sounds quite irregular from the point of view of the PCI
core.  If a device responds to address space that is not described by
a standard PCI BAR, or by an EA capability, or by one of the legacy
VGA or IDE exceptions, we have a problem.  That space must be
described *somehow* in a generic way, e.g., ACPI or similar.

What happens if CONFIG_PCI_P2SB is unset?  The device doesn't know
that, and if it is still consuming MMIO address space that we don't
know about, that's a problem.

> > > +	/* Hide the P2SB device */
> > > +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, P2SBC_HIDE_BIT);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
