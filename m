Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB1B351EAA
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 20:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbhDASpO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 14:45:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:21588 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239257AbhDASfj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Apr 2021 14:35:39 -0400
IronPort-SDR: tXO/dxmlE5sqd1abhq/7nn/2XptM3h5IpMnQ6tsBCsPJRlAOfWs3a87FqDV+pmd6RLyHt4oF/i
 jaEYdmYFPIJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="172302385"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="172302385"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2021 08:45:09 -0700
IronPort-SDR: 9JIoGX7euufyX4xQWwr0Nz8ALNgrGaxn0Oao/n8CFrYiEl1uSjPYxQOBJdkMAJKtCd5w6N1DlZ
 2Mm0sBPNEIiQ==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="377743107"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2021 08:45:05 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRzVG-000IET-2U; Thu, 01 Apr 2021 18:45:02 +0300
Date:   Thu, 1 Apr 2021 18:45:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
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
Message-ID: <YGXqfvBv37eLL28Z@smile.fi.intel.com>
References: <YEZ4IitUa+I9HM5F@smile.fi.intel.com>
 <20210309014221.GA1831206@bjorn-Precision-5520>
 <20210309094252.396b7f2d@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309094252.396b7f2d@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 09, 2021 at 09:42:52AM +0100, Henning Schild wrote:
> Am Mon, 8 Mar 2021 19:42:21 -0600
> schrieb Bjorn Helgaas <helgaas@kernel.org>:
> > On Mon, Mar 08, 2021 at 09:16:50PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 08, 2021 at 12:52:12PM -0600, Bjorn Helgaas wrote:  
> > > > On Mon, Mar 08, 2021 at 02:20:16PM +0200, Andy Shevchenko wrote:  

...

> > > > > +	/* Read the first BAR of the device in question */
> > > > > +	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem,
> > > > > PCI_BASE_ADDRESS_0, true);  
> > > > 
> > > > I don't get this.  Apparently this normally hidden device is
> > > > consuming PCI address space.  The PCI core needs to know about
> > > > this.  If it doesn't, the PCI core may assign this space to
> > > > another device.  
> > > 
> > > Right, it returns all 1:s to any request so PCI core *thinks* it's
> > > plugged off (like D3cold or so).  
> > 
> > I'm asking about the MMIO address space.  The BAR is a register in
> > config space.  AFAICT, clearing P2SBC_HIDE_BYTE makes that BAR
> > visible.  The BAR describes a region of PCI address space.  It looks
> > like setting P2SBC_HIDE_BIT makes the BAR disappear from config space,
> > but it sounds like the PCI address space *described* by the BAR is
> > still claimed by the device.  If the device didn't respond to that
> > MMIO space, you would have no reason to read the BAR at all.
> > 
> > So what keeps the PCI core from assigning that MMIO space to another
> > device?
> 
> The device will respond to MMIO while being hidden. I am afraid nothing
> stops a collision, except for the assumption that the BIOS is always
> right and PCI devices never get remapped. But just guessing here.
> 
> I have seen devices with coreboot having the P2SB visible, and most
> likely relocatable. Making it visible in Linux and not hiding it again
> might work, but probably only as long as Linux will not relocate it.
> Which i am afraid might seriously upset the BIOS, depending on what a
> device does with those GPIOs and which parts are implemented in the
> BIOS.

So the question is, do we have knobs in PCI core to mark device fixes in terms
of BARs, no relocation must be applied, no other devices must have the region?

-- 
With Best Regards,
Andy Shevchenko


