Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FE2331714
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 20:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCHTRG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 14:17:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:7497 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229701AbhCHTQ6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 14:16:58 -0500
IronPort-SDR: 5AZ4rRs3TrWafxpM/u/BgdhIL8TIp1a6FDAbZOEzFlTWaA8OoZXNwX6/ZhGXS9N9lApSXxj2Ba
 iDZE99IrCD9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175704374"
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="175704374"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 11:16:57 -0800
IronPort-SDR: xCEhKGvn12MnWivwFnLJwGcSstpYUBabTQLIVR+SWBzzbKV+opX+SgcBGE/inQcgN8s8i3qkGz
 h2+dCiGfnQSg==
X-IronPort-AV: E=Sophos;i="5.81,233,1610438400"; 
   d="scan'208";a="437595267"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 11:16:53 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJLN4-00AtQQ-HD; Mon, 08 Mar 2021 21:16:50 +0200
Date:   Mon, 8 Mar 2021 21:16:50 +0200
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
Message-ID: <YEZ4IitUa+I9HM5F@smile.fi.intel.com>
References: <20210308122020.57071-4-andriy.shevchenko@linux.intel.com>
 <20210308185212.GA1790506@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308185212.GA1790506@bjorn-Precision-5520>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 08, 2021 at 12:52:12PM -0600, Bjorn Helgaas wrote:
> On Mon, Mar 08, 2021 at 02:20:16PM +0200, Andy Shevchenko wrote:
> > From: Jonathan Yong <jonathan.yong@intel.com>
> > 
> > There is already one and at least one more user is coming which
> > requires an access to Primary to Sideband bridge (P2SB) in order to
> > get IO or MMIO bar hidden by BIOS. Create a library to access P2SB
> > for x86 devices.
> 
> Can you include a spec reference?

I'm not sure I have a public link to the spec. It's the 100 Series PCH [1].
The document number to look for is 546955 [2] and there actually a bit of
information about this.

> I'm trying to figure out why this
> belongs in drivers/pci/.  It looks very device-specific.

Because it's all about access to PCI configuration spaces of the (hidden)
devices.

[1]: https://ark.intel.com/content/www/us/en/ark/products/series/98456/intel-100-series-desktop-chipsets.html
[2]: https://medium.com/@jacksonchen_43335/bios-gpio-p2sb-70e9b829b403

...

> > +config PCI_P2SB
> > +	bool "Primary to Sideband (P2SB) bridge access support"
> > +	depends on PCI && X86
> > +	help
> > +	  The Primary to Sideband bridge is an interface to some PCI
> > +	  devices connected through it. In particular, SPI NOR
> > +	  controller in Intel Apollo Lake SoC is one of such devices.
> 
> This doesn't sound like a "bridge".  If it's a bridge, what's on the
> primary (upstream) side?  What's on the secondary side?  What
> resources are passed through the bridge, i.e., what transactions does
> it transfer from one side to the other?

It's a confusion terminology here. It's a Bridge according to the spec, but
it is *not* a PCI Bridge as you may had a first impression.

...

> > +	/* Unhide the P2SB device */
> > +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, 0);
> > +
> > +	/* Read the first BAR of the device in question */
> > +	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem, PCI_BASE_ADDRESS_0, true);
> 
> I don't get this.  Apparently this normally hidden device is consuming
> PCI address space.  The PCI core needs to know about this.  If it
> doesn't, the PCI core may assign this space to another device.

Right, it returns all 1:s to any request so PCI core *thinks* it's plugged off
(like D3cold or so).

> > +	/* Hide the P2SB device */
> > +	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, P2SBC_HIDE_BIT);

-- 
With Best Regards,
Andy Shevchenko


