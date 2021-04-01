Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFD2351854
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 19:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234620AbhDARpl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 13:45:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234559AbhDARiA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Apr 2021 13:38:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B76F161386;
        Thu,  1 Apr 2021 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617295378;
        bh=i04niHeXuQvwIy5MixftZzotTP0TGOM+jM0OxbF9CXw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=V0A1RN+DPE2xtWYyDCDoxSGkMsS1QrILEzosJPbis4ibuJoVVIl4ZdF3i89mvsOY6
         +fH7WX9Ps2Jlw9/cbCJBJ5mE48dsmK6NXkCaZyPpEvUSmKuddYv4gHqDBUra6f0Ov4
         nsJ3lsAcFsxMUwflSoK41pwCfsEUJjmbZyP54B0FA4EbtF5Lil1xT4B5yteUg0cR6O
         44aRc52oTCBzFrJ/QDenCd7I7SjQU+BqxUMTOsg65DGdcFl/pJDm9X3KNf6oNC+8bX
         O+nOlYUmtOKeZLZEjVUn4oBVUMvm5rzm9B0e6Vr7a4PrWk6PM1tA3AKtNmQXJt5Kd5
         bVuJrTDgpDRZg==
Date:   Thu, 1 Apr 2021 11:42:56 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com
Subject: Re: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge
 support library
Message-ID: <20210401164256.GA1516177@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGXqfvBv37eLL28Z@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 01, 2021 at 06:45:02PM +0300, Andy Shevchenko wrote:
> On Tue, Mar 09, 2021 at 09:42:52AM +0100, Henning Schild wrote:
> > Am Mon, 8 Mar 2021 19:42:21 -0600
> > schrieb Bjorn Helgaas <helgaas@kernel.org>:
> > > On Mon, Mar 08, 2021 at 09:16:50PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 08, 2021 at 12:52:12PM -0600, Bjorn Helgaas wrote:  
> > > > > On Mon, Mar 08, 2021 at 02:20:16PM +0200, Andy Shevchenko wrote:  
> 
> ...
> 
> > > > > > +	/* Read the first BAR of the device in question */
> > > > > > +	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem,
> > > > > > PCI_BASE_ADDRESS_0, true);  
> > > > > 
> > > > > I don't get this.  Apparently this normally hidden device is
> > > > > consuming PCI address space.  The PCI core needs to know
> > > > > about this.  If it doesn't, the PCI core may assign this
> > > > > space to another device.  
> > > > 
> > > > Right, it returns all 1:s to any request so PCI core *thinks*
> > > > it's plugged off (like D3cold or so).  
> > > 
> > > I'm asking about the MMIO address space.  The BAR is a register
> > > in config space.  AFAICT, clearing P2SBC_HIDE_BYTE makes that
> > > BAR visible.  The BAR describes a region of PCI address space.
> > > It looks like setting P2SBC_HIDE_BIT makes the BAR disappear
> > > from config space, but it sounds like the PCI address space
> > > *described* by the BAR is still claimed by the device.  If the
> > > device didn't respond to that MMIO space, you would have no
> > > reason to read the BAR at all.
> > > 
> > > So what keeps the PCI core from assigning that MMIO space to
> > > another device?
> > 
> > The device will respond to MMIO while being hidden. I am afraid
> > nothing stops a collision, except for the assumption that the BIOS
> > is always right and PCI devices never get remapped. But just
> > guessing here.
> > 
> > I have seen devices with coreboot having the P2SB visible, and
> > most likely relocatable. Making it visible in Linux and not hiding
> > it again might work, but probably only as long as Linux will not
> > relocate it.  Which i am afraid might seriously upset the BIOS,
> > depending on what a device does with those GPIOs and which parts
> > are implemented in the BIOS.
> 
> So the question is, do we have knobs in PCI core to mark device
> fixes in terms of BARs, no relocation must be applied, no other
> devices must have the region?

I think the closest thing is the IORESOURCE_PCI_FIXED bit that we use
for things that must not be moved.  Generally PCI resources are
associated with a pci_dev, and we set IORESOURCE_PCI_FIXED for BARs,
e.g., dev->resource[n].  We do that for IDE legacy regions (see
LEGACY_IO_RESOURCE), Langwell devices (pci_fixed_bar_fixup()),
"enhanced allocation" (pci_ea_flags()), and some quirks (quirk_io()).

In your case, the device is hidden so it doesn't respond to config
accesses, so there is no pci_dev for it.

Maybe you could do some sort of quirk that allocates its own struct
resource, fills it in, sets IORESOURCE_PCI_FIXED, and does something
similar to pci_claim_resource()?

Bjorn
