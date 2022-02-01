Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FAC4A6445
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 19:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbiBASxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 13:53:31 -0500
Received: from mga05.intel.com ([192.55.52.43]:6832 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229881AbiBASxa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Feb 2022 13:53:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643741610; x=1675277610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L5s7qXF8ZnJhH7lDBIzCGnJ7UK6joH+p4ghvw+Jnw64=;
  b=HqBfNQbi0e/9Ca/l1Jw4C4DUiLGfIdizzs+0EQl+Jx5MlYZI5g+6krGF
   hXkhln3ApPBJMMjWFTnPLJVkCMxEKw5sDTDHXrdpSO14mlgV0NkgjWM1h
   r2LeOoful8MjvMjCc92pO2cm3oKouW8Op4dFLT9PRuPE2d3OOh8y0Ffrt
   p0EFhvDTRSriwQiH2Bqmho/0jwVOQK96IdZC/9Y3JJvOLYu5vtzINo3LC
   vHBzIKCfOwXPES+zPU6O+tQqkNu7w7/35w7XgvIdoPRaYF2CcJKAI7jdI
   L6uJMXA7I1jrqvj2xZrhHuAsQ9suWXSgvS6kI8H+6qpTdbA2SamNPUusz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="334119745"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="334119745"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 10:53:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="534612213"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 10:53:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nEyGM-00HR0W-Bi;
        Tue, 01 Feb 2022 20:52:22 +0200
Date:   Tue, 1 Feb 2022 20:52:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <YfmBZvQ28y/Mh60J@smile.fi.intel.com>
References: <YfQ2PGzOyiBfCppd@smile.fi.intel.com>
 <20220201181401.GA292815@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201181401.GA292815@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 01, 2022 at 12:14:01PM -0600, Bjorn Helgaas wrote:
> On Fri, Jan 28, 2022 at 08:30:20PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 07, 2022 at 11:11:08AM -0600, Bjorn Helgaas wrote:
> > > On Fri, Jan 07, 2022 at 04:56:42PM +0200, Andy Shevchenko wrote:
> > 
> > ...
> > 
> > > > The unhide/hide back has been tested and we have already users
> > > > in the kernel (they have other issues though with the PCI rescan
> > > > lock, but it doesn't mean it wasn't ever tested).
> > > 
> > > Does the firmware team that hid this device sign off on the OS
> > > unhiding and using it?  How do we know that BIOS is not using the
> > > device?
> > 
> > BIOS might use the device via OperationRegion() in ACPI, but that
> > means that _CRS needs to have that region available. It seems not
> > the case.
> > 
> > And as far I as see in the internal documentation the hide / unhide
> > approach is not forbidden for OS side.
> 
> Unhiding is device-specific behavior, so generic PCI enumeration
> cannot use it.  We have to know there's a P2SB device at some address
> before we can safely do a config write to it.  PCI enumeration would
> learn there's a P2SB device at an address by reading a Vendor/Device
> ID.
> 
> > > My point is that the unhide is architecturally messed up.  The OS
> > > runs on the platform as described by ACPI.  Devices that cannot be
> > > enumerated are described in the ACPI namespace.
> > 
> > This device may or may not be _partially_ or _fully_ (due to being
> > multifunctional) described in ACPI. I agree, that ideally the
> > devices in question it has behind should be represented properly by
> > firmware.  However, the firmwares in the wild for selected products
> > / devices don't do that. We need to solve (work around) it in the
> > software.
> > 
> > This is already done for a few devices. This series consolidates
> > that and enables it for very known GPIO IPs.
> 
> Consolidating the code to unhide the device and size the BAR is fine.
> 
> I would prefer the PCI core to be involved as little as possible
> because we're violating some key assumptions and we could trip over
> those later.  We're assuming the existence of P2SB based on the fact
> that we found some *other* device, we're assuming firmware isn't using
> P2SB (may be true now, but impossible to verify), we're assuming the
> P2SB BAR contains a valid address that's not used elsewhere but also
> won't be assigned to anything.
> 
> > PCI core just provides a code that is very similar to what we need
> > here. Are you specifically suggesting that we have to copy'n'paste
> > that rather long function and maintain in parallel with PCI?
> 
> I think we're talking about __pci_read_base(), which is currently an
> internal PCI interface.  This series adds pci_bus_info/warn/etc(),

The patch that adds those macros is good on its own, if you think so...
I tried to submit it separately, but it was no response, so I don't know.

> reworks __pci_read_base() to operate on a struct pci_bus *, exports
> it, and uses it via #include <../../../pci/pci.h>.

Yes, which allows at least to have the same code, doing same things to be
in one copy in one place.

> __pci_read_base() is fairly long, but you apparently don't need all
> the functionality there because the core of the patch is this:
> 
>   -   pci_bus_read_config_dword(bus, spi, PCI_BASE_ADDRESS_0,
>   -                             &spi_base);
>   -   if (spi_base != ~0) {
>   -           res->start = spi_base & 0xfffffff0;
>   -           res->end = res->start + SPIBASE_APL_SZ - 1;
>   -   }
>   +   __pci_bus_read_base(bus, devfn, pci_bar_unknown, mem, PCI_BASE_ADDRESS_0, true)

You probably took the least pleasant (to me) example, because it's buggy in a
few ways:

- it misses 64-bit handling code
- it misses PCI rescan lock (in case PCI code decides to change addresses,
  previously ones will be invalid, while other drivers may still use that
  MMIO space
- it doesn't check if (for a new version Hans suggested me to add this check as
  it's done in one out of 3 cases)

It also useful to have some messages to be printed just in cases of errors
or success in a standard (PCI core provided) way.

> I don't think it's worth all the __pci_read_base() changes to do that.
> What if you made a library function that looks like this?
> 
>   int p2sb_bar(...)
>   {
>     pci_bus_write_config_byte(bus, devfn_p2sb, P2SBC_HIDE_BYTE, 0);
>     pci_bus_read_config_dword(bus, devfn, PCI_BASE_ADDRESS_0, &orig);
>     if (orig) {
>       pci_bus_write_config_dword(bus, devfn, PCI_BASE_ADDRESS_0, ~0);
>       pci_bus_read_config_dword(bus, devfn, PCI_BASE_ADDRESS_0, &val);
>       pci_bus_write_config_dword(bus, devfn, PCI_BASE_ADDRESS_0, orig);
>       res->start = orig;
>       res->end = res->start + (~val + 1);
>     }
>     pci_bus_write_config_byte(bus, devfn, P2SBC_HIDE_BYTE, P2SBC_HIDE_BIT);
>   }

It seems simple, but with the above mentioned adjustments, it will become
closer to the size of the original __pci_read_base().

-- 
With Best Regards,
Andy Shevchenko


