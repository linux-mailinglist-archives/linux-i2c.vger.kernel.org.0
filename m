Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CA146DA89
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 18:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236249AbhLHR6o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 12:58:44 -0500
Received: from mga11.intel.com ([192.55.52.93]:37856 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233975AbhLHR6o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Dec 2021 12:58:44 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235403580"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="235403580"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 09:52:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="564204731"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 09:52:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mv16T-003n1U-Aj;
        Wed, 08 Dec 2021 19:51:41 +0200
Date:   Wed, 8 Dec 2021 19:51:41 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <YbDwrfXeXKle2ziR@smile.fi.intel.com>
References: <YaD/hspdA/j0tL5h@smile.fi.intel.com>
 <20211129210705.GA2689680@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129210705.GA2689680@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 29, 2021 at 03:07:05PM -0600, Bjorn Helgaas wrote:
> On Fri, Nov 26, 2021 at 05:38:46PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 08, 2021 at 07:42:21PM -0600, Bjorn Helgaas wrote:
> > > On Mon, Mar 08, 2021 at 09:16:50PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Mar 08, 2021 at 12:52:12PM -0600, Bjorn Helgaas wrote:
> > > > > On Mon, Mar 08, 2021 at 02:20:16PM +0200, Andy Shevchenko wrote:
> > > > > > From: Jonathan Yong <jonathan.yong@intel.com>
> > > > > > 
> > > > > > There is already one and at least one more user is coming which
> > > > > > requires an access to Primary to Sideband bridge (P2SB) in order to
> > > > > > get IO or MMIO bar hidden by BIOS. Create a library to access P2SB
> > > > > > for x86 devices.
> > > > > 
> > > > > Can you include a spec reference?
> > > > 
> > > > I'm not sure I have a public link to the spec. It's the 100 Series PCH [1].
> > > > The document number to look for is 546955 [2] and there actually a bit of
> > > > information about this.
> > > 
> > > This link, found by googling for "p2sb bridge", looks like it might
> > > have relevant public links:
> > > 
> > > https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/
> > > 
> > > I'd prefer if you could dig out the relevant sections because I really
> > > don't know how to identify them.
> > 
> > I'm not sure I understand what you would like to see. The
> > information about P2SB here has confidential tag. I probably can use
> > the document number and cite couple of paragraphs from it. Would it
> > be sufficient?
> 
> This patch proposes to add drivers/pci/pci-p2sb.c.  Things in
> drivers/pci/ should generally be documented via PCI-SIG specs to make
> them maintainable.  pci-p2sb.c is clearly x86- and Intel-specific.
> Maybe arch/x86/pci/ would be a better place for it?

It's not CPU core, so x86 maintainers for sure be happy to reject this.
The only fit I see for that is PDx86.

> If I were to maintain it under drivers/pci/, I would want some
> description about P2SBC_HIDE_BYTE, which device's config space it is
> in (apparently 0d.0 of some CPU), and which device it hides/unhides
> (apparently some device X other than the CPU).

Since there is publicly (leaked?) available descriptions of it, it's good
to add documentation to the series wherever it will land to.

> > > The code suggests that a register on this device controls whether a
> > > different device is visible in config space.  I think it will be
> > > better if we can describe what's happening.
> > 
> > Actually it seems incorrect assumption (while it works by some reason).
> > I have to double test this.
> > 
> > From the doc:
> > 
> > "The P2SB is enumerated as a normal PCI device. ...
> > Writing a 1 to the P2SBC.HIDE field in the P2SB PCI Configuration space
> > hides the device; writing a 0 to this field, unhides the device."
> > 
> > It clearly states the P2SB PCI configuration space.
> 
> It clearly says P2SBC.HIDE is in P2SB config space.  But I think it's
> talking about hiding/unhiding a device other than P2SB.

> This patch suggests the P2SB device is at PCI_DEVFN(13, 0), and the
> lpc_ich_init_spi() patch suggests there's a SPI controller at
> PCI_DEVFN(13, 2).  And apparently P2SBC_HIDE_BIT in PCI_DEVFN(13, 0)
> determines whether PCI_DEVFN(13, 2) appears in config space.

Ha, now I can answer to this. P2SB is function 0 of the device, which means
that when it's absent the whole device functions are absent. When you enable
function 0, it enables all devices behind it (which is according to the PCI
requirements).

> So it sounds like P2SB is always visible in config space

Determine "visible" here. In terms of PCI software protocol communication it's
not ("hidden").  In terms of hardware access, the writes to this device are
filtered based on this "hidden"-"unhidden" policy, which declares that one bit
in one register is always available, that's it.

> and is not
> itself a "bridge".

It's not.

> The SPI controller, which *is* a bridge from PCI
> to SPI, appears at PCI_DEVFN(13, 2) in config space when
> P2SBC_HIDE_BIT is cleared.

Yes, as PCI talks about. No function can be available (enabled) until function
0 is enabled. It's a side effect here.

> > > This all sounds quite irregular from the point of view of the PCI
> > > core.  If a device responds to address space that is not described by
> > > a standard PCI BAR, or by an EA capability, or by one of the legacy
> > > VGA or IDE exceptions, we have a problem.  That space must be
> > > described *somehow* in a generic way, e.g., ACPI or similar.
> > > 
> > > What happens if CONFIG_PCI_P2SB is unset?  The device doesn't know
> > > that, and if it is still consuming MMIO address space that we don't
> > > know about, that's a problem.
> > 
> > Yeah, Henning already answered on this and I believe that nothing
> > prevents OS to try that addresses for other PCI devices, except the
> > memory region reservation (by ACPI and / or e820 meaning). It means
> > that we rely on firmware to do the right thing if it hides the P2SB
> > bar.
> > 
> > And at the same time P2SB bar is used as a part of telling OS where
> > the *fixed* 16Mb region of MMIO is located.
> 
> If the SPI controller consumes PCI address space, that space must be
> discoverable by standard PCI enumeration and BAR sizing.

I have checked that memory is even supplied as reserved even without device
being visible. Yes, agree on this.

> If the BIOS hides the device, I assume that means it does not respond
> in config space and does not consume MMIO space.  That's fine.

Not really. That MMIO space (behind P2SB, I'm not talking about this
SPI special case) is kinda hard coded to the devices. I haven't clarified
yet if the high part of the BAR can be relocated.

> If the BIOS hides the device and the OS unhides it, the unhide should
> happen before PCI device enumeration, so the PCI core will find the
> device and learn about the MMIO space it consumes.

Yep.

-- 
With Best Regards,
Andy Shevchenko


