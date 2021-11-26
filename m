Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0307E45F0EF
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 16:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378241AbhKZPqM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 10:46:12 -0500
Received: from mga12.intel.com ([192.55.52.136]:41356 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377982AbhKZPoL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 10:44:11 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="215703206"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="215703206"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 07:38:53 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="599034554"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 07:38:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mqdJH-00ApBO-5f;
        Fri, 26 Nov 2021 17:38:47 +0200
Date:   Fri, 26 Nov 2021 17:38:46 +0200
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
Message-ID: <YaD/hspdA/j0tL5h@smile.fi.intel.com>
References: <YEZ4IitUa+I9HM5F@smile.fi.intel.com>
 <20210309014221.GA1831206@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309014221.GA1831206@bjorn-Precision-5520>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 08, 2021 at 07:42:21PM -0600, Bjorn Helgaas wrote:
> On Mon, Mar 08, 2021 at 09:16:50PM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 08, 2021 at 12:52:12PM -0600, Bjorn Helgaas wrote:
> > > On Mon, Mar 08, 2021 at 02:20:16PM +0200, Andy Shevchenko wrote:
> > > > From: Jonathan Yong <jonathan.yong@intel.com>
> > > > 
> > > > There is already one and at least one more user is coming which
> > > > requires an access to Primary to Sideband bridge (P2SB) in order to
> > > > get IO or MMIO bar hidden by BIOS. Create a library to access P2SB
> > > > for x86 devices.
> > > 
> > > Can you include a spec reference?
> > 
> > I'm not sure I have a public link to the spec. It's the 100 Series PCH [1].
> > The document number to look for is 546955 [2] and there actually a bit of
> > information about this.
> 
> This link, found by googling for "p2sb bridge", looks like it might
> have relevant public links:
> 
> https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/
> 
> I'd prefer if you could dig out the relevant sections because I really
> don't know how to identify them.

I'm not sure I understand what you would like to see. The information about
P2SB here has confidential tag. I probably can use the document number and cite
couple of paragraphs from it. Would it be sufficient?

> > > I'm trying to figure out why this
> > > belongs in drivers/pci/.  It looks very device-specific.
> > 
> > Because it's all about access to PCI configuration spaces of the (hidden)
> > devices.
> 
> The PCI core generally doesn't deal with device-specific config
> registers.

The location is purely based on practical reason, after the fact that P2SB
is a PCI device, of deduplicating BAR decoding code. I can easily move this
outside of PCI subsystem, but I will need to export this function instead.
Would it work for you?

> > [1]: https://ark.intel.com/content/www/us/en/ark/products/series/98456/intel-100-series-desktop-chipsets.html
> > [2]: https://medium.com/@jacksonchen_43335/bios-gpio-p2sb-70e9b829b403

...

> The code suggests that a register on this device controls whether a
> different device is visible in config space.  I think it will be
> better if we can describe what's happening.

Actually it seems incorrect assumption (while it works by some reason).
I have to double test this.

From the doc:

"The P2SB is enumerated as a normal PCI device. ...
Writing a 1 to the P2SBC.HIDE field in the P2SB PCI Configuration space
hides the device; writing a 0 to this field, unhides the device."

It clearly states the P2SB PCI configuration space.

Also it looks like Henning pointed out to this by asking why we need too many
parameters to the function.

...

> > > > +	/* Unhide the P2SB device */
> > > > +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, 0);
> > > > +
> > > > +	/* Read the first BAR of the device in question */
> > > > +	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem, PCI_BASE_ADDRESS_0, true);
> > > 
> > > I don't get this.  Apparently this normally hidden device is consuming
> > > PCI address space.  The PCI core needs to know about this.  If it
> > > doesn't, the PCI core may assign this space to another device.
> > 
> > Right, it returns all 1:s to any request so PCI core *thinks* it's
> > plugged off (like D3cold or so).
> 
> I'm asking about the MMIO address space.

> The BAR is a register in
> config space.  AFAICT, clearing P2SBC_HIDE_BYTE makes that BAR
> visible.  The BAR describes a region of PCI address space.  It looks
> like setting P2SBC_HIDE_BIT makes the BAR disappear from config space,
> but it sounds like the PCI address space *described* by the BAR is
> still claimed by the device.  If the device didn't respond to that
> MMIO space, you would have no reason to read the BAR at all.
> 
> So what keeps the PCI core from assigning that MMIO space to another
> device?
> 
> This all sounds quite irregular from the point of view of the PCI
> core.  If a device responds to address space that is not described by
> a standard PCI BAR, or by an EA capability, or by one of the legacy
> VGA or IDE exceptions, we have a problem.  That space must be
> described *somehow* in a generic way, e.g., ACPI or similar.
> 
> What happens if CONFIG_PCI_P2SB is unset?  The device doesn't know
> that, and if it is still consuming MMIO address space that we don't
> know about, that's a problem.

Yeah, Henning already answered on this and I believe that nothing prevents OS
to try that addresses for other PCI devices, except the memory region
reservation (by ACPI and / or e820 meaning). It means that we rely on firmware
to do the right thing if it hides the P2SB bar.

And at the same time P2SB bar is used as a part of telling OS where the *fixed*
16Mb region of MMIO is located.

> > > > +	/* Hide the P2SB device */
> > > > +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, P2SBC_HIDE_BIT);

-- 
With Best Regards,
Andy Shevchenko


