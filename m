Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BF84A6359
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 19:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbiBASQJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 13:16:09 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:50408 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241882AbiBASOH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 13:14:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 52684CE1A61;
        Tue,  1 Feb 2022 18:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40663C340EB;
        Tue,  1 Feb 2022 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643739243;
        bh=bxpVdfDdN3+UOWDkMYjlazAW65+tG2rMIn+BtzcTIVE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=Fak/9rZF2WDudfg33f+bIG1o27y3QQ7HL2Jt81416ejXlgqiP+NgHL2GY7UGDfFvt
         9SShAfbTgkO2k+tq9CpAK3HRsS5IKH3fYW6HwGQyUUXEeX54qNDoj4oXqi8lfCxigh
         sIh2vevbOTulvDGkKpio7jzGx/aolNScbPs6+UJUYEdAGDaEt4CKGs7lw9C4Ua38Lw
         JwJjz3chAJBRS9aWk0g58r9MoSw3bIiUN+XFLD2Sapho8gulJHdlFGxGvBYZxrYj+S
         I1O881iaJAx2rePRb/uJAuQ47vGd+30jIFpXZkkOuQW11b8qIMBhboTZJphlqBztZ0
         Jrp8Wu3mTEpUw==
Date:   Tue, 1 Feb 2022 12:14:01 -0600
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
Message-ID: <20220201181401.GA292815@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfQ2PGzOyiBfCppd@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 28, 2022 at 08:30:20PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 07, 2022 at 11:11:08AM -0600, Bjorn Helgaas wrote:
> > On Fri, Jan 07, 2022 at 04:56:42PM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > The unhide/hide back has been tested and we have already users
> > > in the kernel (they have other issues though with the PCI rescan
> > > lock, but it doesn't mean it wasn't ever tested).
> > 
> > Does the firmware team that hid this device sign off on the OS
> > unhiding and using it?  How do we know that BIOS is not using the
> > device?
> 
> BIOS might use the device via OperationRegion() in ACPI, but that
> means that _CRS needs to have that region available. It seems not
> the case.
> 
> And as far I as see in the internal documentation the hide / unhide
> approach is not forbidden for OS side.

Unhiding is device-specific behavior, so generic PCI enumeration
cannot use it.  We have to know there's a P2SB device at some address
before we can safely do a config write to it.  PCI enumeration would
learn there's a P2SB device at an address by reading a Vendor/Device
ID.

> > My point is that the unhide is architecturally messed up.  The OS
> > runs on the platform as described by ACPI.  Devices that cannot be
> > enumerated are described in the ACPI namespace.
> 
> This device may or may not be _partially_ or _fully_ (due to being
> multifunctional) described in ACPI. I agree, that ideally the
> devices in question it has behind should be represented properly by
> firmware.  However, the firmwares in the wild for selected products
> / devices don't do that. We need to solve (work around) it in the
> software.
> 
> This is already done for a few devices. This series consolidates
> that and enables it for very known GPIO IPs.

Consolidating the code to unhide the device and size the BAR is fine.

I would prefer the PCI core to be involved as little as possible
because we're violating some key assumptions and we could trip over
those later.  We're assuming the existence of P2SB based on the fact
that we found some *other* device, we're assuming firmware isn't using
P2SB (may be true now, but impossible to verify), we're assuming the
P2SB BAR contains a valid address that's not used elsewhere but also
won't be assigned to anything.

> PCI core just provides a code that is very similar to what we need
> here. Are you specifically suggesting that we have to copy'n'paste
> that rather long function and maintain in parallel with PCI?

I think we're talking about __pci_read_base(), which is currently an
internal PCI interface.  This series adds pci_bus_info/warn/etc(),
reworks __pci_read_base() to operate on a struct pci_bus *, exports
it, and uses it via #include <../../../pci/pci.h>.

__pci_read_base() is fairly long, but you apparently don't need all
the functionality there because the core of the patch is this:

  -   pci_bus_read_config_dword(bus, spi, PCI_BASE_ADDRESS_0,
  -                             &spi_base);
  -   if (spi_base != ~0) {
  -           res->start = spi_base & 0xfffffff0;
  -           res->end = res->start + SPIBASE_APL_SZ - 1;
  -   }
  +   __pci_bus_read_base(bus, devfn, pci_bar_unknown, mem, PCI_BASE_ADDRESS_0, true)

I don't think it's worth all the __pci_read_base() changes to do that.
What if you made a library function that looks like this?

  int p2sb_bar(...)
  {
    pci_bus_write_config_byte(bus, devfn_p2sb, P2SBC_HIDE_BYTE, 0);
    pci_bus_read_config_dword(bus, devfn, PCI_BASE_ADDRESS_0, &orig);
    if (orig) {
      pci_bus_write_config_dword(bus, devfn, PCI_BASE_ADDRESS_0, ~0);
      pci_bus_read_config_dword(bus, devfn, PCI_BASE_ADDRESS_0, &val);
      pci_bus_write_config_dword(bus, devfn, PCI_BASE_ADDRESS_0, orig);
      res->start = orig;
      res->end = res->start + (~val + 1);
    }
    pci_bus_write_config_byte(bus, devfn, P2SBC_HIDE_BYTE, P2SBC_HIDE_BIT);
  }
