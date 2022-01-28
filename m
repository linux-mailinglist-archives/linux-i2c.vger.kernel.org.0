Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA574A0020
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 19:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240433AbiA1Sbh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 13:31:37 -0500
Received: from mga06.intel.com ([134.134.136.31]:21875 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229827AbiA1Sbd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 13:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643394693; x=1674930693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VY3aZdeFzyu6Va/UkaJ2MHdYDdTIzl5209jkDxWmEc4=;
  b=gNL88JAhyKeb30oQaaWuOrk0BgUfnCtxHXTmAja8YyaKkjk3m9Q80DOL
   Q6EFuw+CMMwenEYcAGvrMotEF7jvIK6XDNQgdFSFWCAOor9l39Nbw9CIk
   zIzHnDnzRQph+5GaPYcr+QifJ5AlG8Y+HMI18iIQZ418rxaaPiMfxKzwI
   VuTdl2Oo71p2WBvkEqc+Y74j4GxCy8Zb67YG1aqJLJTjs5h0KqS2cW9ej
   hfsS4yW6T2/SzbaCpsd6PNaGZzjS4xrAL8dzE3qV4DMaBvOQBTHgmUNcp
   5EajkI4ZGIszHdcHDbcsq+1LsulssNHq6VloRKy7FUQ1gIVAaakDSKX/H
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="307903943"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="307903943"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 10:31:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="598286304"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 10:31:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nDW0q-00FWNa-S2;
        Fri, 28 Jan 2022 20:30:20 +0200
Date:   Fri, 28 Jan 2022 20:30:20 +0200
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
Message-ID: <YfQ2PGzOyiBfCppd@smile.fi.intel.com>
References: <YdhUqhflS/0YsRWJ@smile.fi.intel.com>
 <20220107171108.GA381493@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107171108.GA381493@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 07, 2022 at 11:11:08AM -0600, Bjorn Helgaas wrote:
> On Fri, Jan 07, 2022 at 04:56:42PM +0200, Andy Shevchenko wrote:
> > On Thu, Jan 06, 2022 at 07:03:05PM -0600, Bjorn Helgaas wrote:
> > > On Tue, Dec 21, 2021 at 08:15:21PM +0200, Andy Shevchenko wrote:

...

> > The unhide/hide back has been tested and we have
> > already users in the kernel (they have other issues though with the
> > PCI rescan lock, but it doesn't mean it wasn't ever tested).
> 
> Does the firmware team that hid this device sign off on the OS
> unhiding and using it?  How do we know that BIOS is not using the
> device?

BIOS might use the device via OperationRegion() in ACPI, but that means
that _CRS needs to have that region available. It seems not the case.

And as far I as see in the internal documentation the hide / unhide
approach is not forbidden for OS side.

Moreover, we have already this approach in the 3 device drivers on different
platforms. If you not agree with it, probably you can send a removal to that
drivers. In the terms of use this code doesn't change the status quo. What
it does is the concentration of the p2sb code in one place as a library on
obvious (?) purposes, e.g. maintenance.

> > > And the fact that they went to all this trouble to hide it means
> > > the BIOS is likely using it for its own purposes and the OS may
> > > cause conflicts if it also uses it.
> > 
> > What purposes do you have in mind?
> 
> The functionality implemented in the P2SB MMIO space is not specified,
> so I have no idea what it does or whether BIOS could be using it.

It's specified based on how MMIO address is encoded.

The third byte (bits [23:16]) representing the port ID on IOSF that
belongs to the certain IPs, such as GPIO.

> But here's a hypothetical example: some platform firmware logs errors
> to NVRAM.  That NVRAM could exist on a device like the P2SB, where the
> firmware assigns the MMIO address and hides the device from the OS.
> The firmware legitimately assumes it has exclusive control of the
> device and the OS will never touch it.  If the OS unhides the device
> and also uses that NVRAM, the platform error logging no longer works.
> 
> My point is that the unhide is architecturally messed up.  The OS runs
> on the platform as described by ACPI.  Devices that cannot be
> enumerated are described in the ACPI namespace.

This device may or may not be _partially_ or _fully_ (due to being
multifunctional) described in ACPI. I agree, that ideally the devices
in question it has behind should be represented properly by firmware.
However, the firmwares in the wild for selected products / devices
don't do that. We need to solve (work around) it in the software.

This is already done for a few devices. This series consolidates that
and enables it for very known GPIO IPs.

> If the OS goes outside that ACPI-described platform and pokes at
> things it "knows" should be there, the architectural model falls
> apart.  The OS relies on things the firmware didn't guarantee, and
> the firmware can't rely on non-interference from the OS.
> 
> If you want to go outside the ACPI model, that's up to you, but I
> don't think we should tweak the PCI core to work with things that
> the BIOS has explicitly arranged to *not* be PCI devices.

PCI core just provides a code that is very similar to what we need
here. Are you specifically suggesting that we have to copy'n'paste
that rather long function and maintain in parallel with PCI?

> > > The way the BIOS has this set up, P2SB is logically not a PCI
> > > device.  It is not enumerable.  The MMIO space it uses is not in
> > > the _CRS of a PCI host bridge.  That means it's now a platform
> > > device.
> > 
> > I do not follow what you are implying here.
> 
> On an ACPI system, the way we enumerate PCI devices is to find all the
> PCI host bridges (ACPI PNP0A03 devices), and scan config space to find
> the PCI devices below them.  That doesn't find P2SB, so from a
> software point of view, it is not a PCI device.

It's a PCI device that has a PCI programming interface but it has some
tricks behind. Do you mean that those tricks automatically make it non-PCI
(software speaking) compatible?

> Platform devices are by definition non-enumerable, and they have to be
> described via ACPI, DT, or some kind of platform-specific code.  P2SB
> is not enumerable, so I think a platform device is the most natural
> way to handle it.

How does it fit the proposed library model? Are you suggesting to create a
hundreds of LOCs in order just to have some platform device which does what?

I do not follow here the design you are proposing, sorry.

> > As you see the code, it's not a driver, it's a library that reuses
> > PCI functions because the hardware is represented by an IP inside
> > PCI hierarchy and with PCI programming interface.
> 
> Yes, it's a PCI programming interface at the hardware level, but at
> the software level, it's not part of PCI.

Why?

> This series does quite a lot of work in the PCI core to read that one
> register in a device the PCI core doesn't know about.  I think it will
> be simpler overall if instead of wedging this into PCI, we make p2sb.c
> start with the ECAM base, ioremap() it, compute the register address,
> readl() the MMIO address, and be done with it.  No need to deal with
> pci_find_bus(), pci_lock_rescan_remove(), change the core's BAR sizing
> code, etc.

So, you are suggesting to write a (simplified) PCI core for the certain device,
did I get you right? Would it have good long-term maintenance perspective?

> > > The correct way to use this would be as an ACPI device so the OS
> > > can enumerate it and the firmware can mediate access to it.  Going
> > > behind the back of the firmware does not sound advisable to me.
> > 
> > Are you going to fix all firmwares and devices on the market?  We
> > have it's done like this and unfortunately we can't fix what's is
> > done due to users who won't update their firmwares by one or another
> > reason.
> 
> I just mean that from a platform design standpoint, an ACPI device
> would be the right way to do this.  Obviously it's not practical to
> add that to systems in the field.  You could create a platform_device
> manually now, and if there ever is an ACPI device, ACPI can create a
> platform_device for you.

Why do I need that device? What for? I really don't see a point here.

> > > If you want to hack something in, I think it might be easier to
> > > treat this purely as a platform device instead of a PCI device.
> > > You can hack up the config accesses you need, discover the MMIO
> > > address, plug that in as a resource of the platform device, and go
> > > wild.  I don't think the PCI core needs to be involved at all.
> > 
> > Sorry, I do not follow you. The device is PCI, but it's taken out of
> > PCI subsystem control by this hardware trick.
> 
> The electrical connection might be PCI, but from the software point of
> view, it's only a PCI device if it can be enumerated by the mechanism
> specified by the spec, namely, reading the Vendor ID of each potential
> device.
> 
> Yes, doing it as a platform device would involve some code in p2sb.c
> that looks sort of like code in the PCI core.  But I don't think it's
> actually very much, and I think it would be less confusing than trying
> to pretend that this device sometimes behaves like a PCI device and
> sometimes not.

So, duplicating code is good, right? Why do we have libraries in the code?

> > There are document numbers that make sense.
> > I believe that
> > 
> > [2]: https://cdrdv2.intel.com/v1/dl/getContent/332690?wapkw=332690
> > [3]: https://cdrdv2.intel.com/v1/dl/getContent/332691?wapkw=332691
> > 
> > work for you. Tell me if not (Meanwhile I have changed locally)
> 
> Great, thanks.  The links work for me (currently).  I think a proper
> citation would also include the document title and document number,
> since I doubt Intel guarantees those URLs will work forever.

-- 
With Best Regards,
Andy Shevchenko


