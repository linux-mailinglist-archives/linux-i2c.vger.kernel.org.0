Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A0516A3BF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 11:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgBXKSE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 05:18:04 -0500
Received: from mga11.intel.com ([192.55.52.93]:56440 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgBXKSE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 05:18:04 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 02:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,479,1574150400"; 
   d="scan'208";a="349891776"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 24 Feb 2020 02:18:00 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 24 Feb 2020 12:18:00 +0200
Date:   Mon, 24 Feb 2020 12:18:00 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [regression] nct6775 does not load in 5.4 and 5.5, bisected to
 b84398d6d7f90080
Message-ID: <20200224101800.GJ2667@lahna.fi.intel.com>
References: <CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com>
 <1bdbac08-86f8-2a57-2b0d-8cd2beb2a1c0@roeck-us.net>
 <CAM1AHpSKFk9ZosQf=k-Rm2=EFqco7y4Lpfb7m07r=j_uJd4T0A@mail.gmail.com>
 <85356d1a-f90d-e94d-16eb-1071d4e94753@roeck-us.net>
 <CAM1AHpSpEFshpUGxKdhLV3XuThQg_XVaPgOWzvrTv6YtzHyO+A@mail.gmail.com>
 <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec1f81c-09a8-ba48-c6c4-5d9b340f7c0b@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Andy and Jarkko

On Sat, Feb 22, 2020 at 01:26:48PM -0800, Guenter Roeck wrote:
> On 2/22/20 12:49 PM, Martin Volf wrote:
> > Hello,
> > 
> > On Sat, Feb 22, 2020 at 8:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > On 2/22/20 9:55 AM, Martin Volf wrote:
> > > > On Sat, Feb 22, 2020 at 4:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > On 2/22/20 3:13 AM, Martin Volf wrote:
> > > > > > hardware monitoring sensors NCT6796D on my Asus PRIME Z390M-PLUS
> > > > > > motherboard with Intel i7-9700 CPU don't work with 5.4 and newer linux
> > > > > > kernels, the driver nct6775 does not load.
> > > > > > 
> > > > > > It is working OK in version 5.3. I have used almost all released stable
> > > > > > versions from 5.3.8 to 5.3.16; I didn't try older kernels.
> > > > ...
> > > > > My wild guess would be that the i801 driver is a bit aggressive with
> > > > > reserving memory spaces, but I don't immediately see what it does
> > > > > differently in that regard after the offending patch. Does it work
> > > > > if you unload the i2c_i801 driver first ?
> > > > 
> > > > Yes, after unloading i2c_i801, the nct6775 works.
> > ...
> > > > This is diff of /proc/ioports in 5.3.18 with loaded nct6775 and in
> > > > 5.4.21 without:
> > > > 
> > > > --- ioports-5.3.18
> > > > +++ ioports-5.4.21
> > > > @@ -2,6 +2,7 @@
> > > >      0000-001f : dma1
> > > >      0020-0021 : pic1
> > > >      002e-0031 : iTCO_wdt
> > > > +    002e-0031 : iTCO_wdt
> > > >      0040-0043 : timer0
> > > >      0050-0053 : timer1
> > ...
> > > > So 0x2e is the resource the two drivers are fighting for.
> > ...
> > > Yes, and it should not do that, since the range can be used to access
> > > different segments of the same chip from multiple drivers. This region
> > > should only be reserved temporarily, using request_muxed_region() when
> > > needed and release_region() after the access is complete. Either case,
> > > I don't immediately see why that region would be interesting for the
> > > iTCO watchdog driver.
> > > 
> > > Can you add some debugging into the i801 driver to see what memory regions
> > > it reserves, and how it gets to reserve 0x2e..0x31 ? That range really
> > > doesn't make any sense to me.
> > 
> > in the function i801_add_tco() in drivers/i2c/busses/i2c-i801.c
> > (line 1601 in 5.4.21), there is this code:
> > 
> >          /*
> >           * Power Management registers.
> >           */
> >          devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
> >          pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
> > 
> >          res = &tco_res[ICH_RES_IO_SMI];
> >          res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
> >          res->end = res->start + 3;
> >          res->flags = IORESOURCE_IO;
> > 
> > base_addr is 0xffffffff after pci_bus_read_config_dword() call.
> > ACPIBASE_SMI_OFF is 0x030, therefore res->start is 0x2e.
> > Not that I understand even a bit of this...
> > 
> 
> Outch. This means that the code is broken. ACPIBASE is not configured,
> or disabled, or the code reads from the wrong PCI configuration register.
> What I don't understand is why this works with v5.3 kernels; the code
> looks just as bad there for me. I must be missing something. Either case,
> the only thing you can really do at this point is to blacklist the
> iTCO_wdt driver.

Indeed it looks like the code reads from a register that is not there
anymore in this generation hardware, or something like that. It tries to
read the PMC (1f.2) register add address 0x40 which is supposed to be
base of ACPI PM registers but that does not seem to exist any more in
newer chipset.

We'll look into this more and return back.
