Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6579116A406
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 11:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgBXKhd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 05:37:33 -0500
Received: from mga18.intel.com ([134.134.136.126]:33499 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgBXKhd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 05:37:33 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 02:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; 
   d="scan'208";a="231091385"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 02:37:29 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1j6B7D-004McT-Se; Mon, 24 Feb 2020 12:37:31 +0200
Date:   Mon, 24 Feb 2020 12:37:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Martin Volf <martin.volf.42@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
Message-ID: <20200224103731.GA10400@smile.fi.intel.com>
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
 <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
 <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
 <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
 <20200224101800.GJ2667@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224101800.GJ2667@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 at 12:18:00PM +0200, Mika Westerberg wrote:
> On Sat, Feb 22, 2020 at 01:26:48PM -0800, Guenter Roeck wrote:
> > On 2/22/20 12:49 PM, Martin Volf wrote:
> > > On Sat, Feb 22, 2020 at 8:05 PM Guenter Roeck <linux@roeck-us.net> wrote:

...

> > >          devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);

I'm wondering if

		pci_dev_is_present(...);

returns false here.

> > >          pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
> > > 
> > >          res = &tco_res[ICH_RES_IO_SMI];
> > >          res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
> > >          res->end = res->start + 3;
> > >          res->flags = IORESOURCE_IO;
> > > 
> > > base_addr is 0xffffffff after pci_bus_read_config_dword() call.
> > > ACPIBASE_SMI_OFF is 0x030, therefore res->start is 0x2e.
> > > Not that I understand even a bit of this...
> > > 
> > 
> > Outch. This means that the code is broken. ACPIBASE is not configured,
> > or disabled, or the code reads from the wrong PCI configuration register.
> > What I don't understand is why this works with v5.3 kernels; the code
> > looks just as bad there for me. I must be missing something. Either case,
> > the only thing you can really do at this point is to blacklist the
> > iTCO_wdt driver.
> 
> Indeed it looks like the code reads from a register that is not there
> anymore in this generation hardware, or something like that. It tries to
> read the PMC (1f.2) register add address 0x40 which is supposed to be
> base of ACPI PM registers but that does not seem to exist any more in
> newer chipset.
> 
> We'll look into this more and return back.

-- 
With Best Regards,
Andy Shevchenko


