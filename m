Return-Path: <linux-i2c+bounces-15289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21ED3C3F8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 10:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 618E15249C7
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F51C3D525F;
	Tue, 20 Jan 2026 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ls33aKIc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E33D5223;
	Tue, 20 Jan 2026 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901587; cv=none; b=rIjWSqQZcjrzwFdx3xly+zP+f8wC9sveOsptFitrNiO8S5hAA4u5wNffCoyZyOCpnP/wHcdLMs1C56sZhF05oEwyNiM8GF8wVdzt4N0j0oYvGlpWJypztBJBPXyGhp5EH2EynG4SLwi0YPutmF8NfP9qReEQae2/YzqkML/q6Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901587; c=relaxed/simple;
	bh=qsJ+9HSE/FVfk7sc+DoEC7vqHjHmibKBwHR30pNYUes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4koG2JeaVAvlxOMC3HDovBriVxASZk3KnObh26y8TG/7knpHqdz16ChYMr//VLduiHQx0IxotGCZk4k0rDIFJJgwXQO/m5pVV/9xw42+6NZTXSvPJaDCMW2jgb0CsmvwACiWFm36sKg0ryxeENywRtWiVO4xv/dlj7iH6gq+YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ls33aKIc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768901585; x=1800437585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qsJ+9HSE/FVfk7sc+DoEC7vqHjHmibKBwHR30pNYUes=;
  b=Ls33aKIc66q1biKSVbeq7yBaHt0rRDloUyuFjPmaasJIculS4CnBF7zK
   z/6cR+6FRYcT+fnorVAcUZh7VeRzqMhVAS4FK7wF3cm3JlLwC/dlQfE+D
   9LkWRZ3DjNU7/rMMScho9GwDy4TQjDgo+32E2Q8fBd6GYrya0w/WLhr4r
   Iv3PgHd03QfNWAeoP5vsDuD72dVClLafZxHulyNL9GnpPNSzWWTbix97S
   3jGqtUnPtwtr+u+27J3oWEDDpDLE31Pc0jBbsjOcoABs2FOT+za7BZwK3
   pS+xA1GrkRjQWMVaLDWJeMzo0UjeVRTSXkOg432pr79QJemGk3XCKMA3f
   Q==;
X-CSE-ConnectionGUID: 0xoB101/QSmo8ZFw+fH7NA==
X-CSE-MsgGUID: YqocQeVEQqOCrf2Kfgv39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81214703"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="81214703"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:33:04 -0800
X-CSE-ConnectionGUID: nSFDWnAmTJ2CkibDoXdUYg==
X-CSE-MsgGUID: XL23t75OQrW6P15MHNJRhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="205325840"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:33:03 -0800
Date: Tue, 20 Jan 2026 11:33:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: correctmost <cmlists@sent.com>
Cc: dmaengine@vger.kernel.org, regressions@lists.linux.dev,
	vkoul@kernel.org, linux-i2c@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work
 when idma64 is present in initramfs
Message-ID: <aW9LzBIOIePu59zV@smile.fi.intel.com>
References: <51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com>
 <aWUGmfcjWpFJs3-X@smile.fi.intel.com>
 <69f5dea3-17b0-4d3a-9de7-eb54f8f0f5cd@app.fastmail.com>
 <aWoM3JibLSBdGHeH@smile.fi.intel.com>
 <aWoUc_GJuZ8SuYCM@smile.fi.intel.com>
 <e5ee42bd-0d17-44e7-a306-61d19f1d24b2@app.fastmail.com>
 <aW4J6bmHn2dLuOxo@smile.fi.intel.com>
 <aW4MUisgI6d2Efbr@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW4MUisgI6d2Efbr@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 19, 2026 at 12:49:59PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 19, 2026 at 12:39:41PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 16, 2026 at 07:25:54PM -0500, correctmost wrote:
> > > On Fri, Jan 16, 2026, at 5:35 AM, Andy Shevchenko wrote:
> > > > On Fri, Jan 16, 2026 at 12:03:12PM +0200, Andy Shevchenko wrote:
> > > >> On Thu, Jan 15, 2026 at 05:50:36PM -0500, correctmost wrote:
> > > >> > On Mon, Jan 12, 2026, at 9:35 AM, Andy Shevchenko wrote:
> > > >> > > On Tue, Dec 16, 2025 at 12:57:10PM -0500, correctmost wrote:
> > > >> > >
> > > >> > >> The following commit
> > > >> > >
> > > >> > > No, it's false positive. The reality is that something else is going on
> > > >> > > there on this and other similar laptops.
> > > >> > >
> > > >> > >> causes my Lenovo IdeaPad touchpad not to work when
> > > >> > >> kernel/drivers/dma/idma64.ko.zst is present in the initramfs image:
> > > >> > >> 
> > > >> > >> #regzbot introduced: 9140ce47872bfd89fca888c2f992faa51d20c2bc
> > > >> > >> 
> > > >> > >> "idma64: Don't try to serve interrupts when device is powered off"
> > > >> > >
> > > >> > > So, the touchpad is an I²C device, which is connected to an Intel SoC.
> > > >> > > The I²C host controller is Synopsys DesignWare. On Intel SoCs the above
> > > >> > > mentioned IP is generated with private DMA engine, that's called Intel
> > > >> > > iDMA 64-bit. Basically it's two devices under a single PCI hood.
> > > >> > > The problem here is that when PCI device is in D3, both devices are
> > > >> > > powered off, but something sends an interrupt and it's not recognized
> > > >> > > being the one, send by a device (touchpad).
> > > >> > >
> > > >> > > There is one of the following potential issues (or their combinations):
> > > >> > >
> > > >> > > - the I²C host controller hardware got off too early
> > > >> > > - the line is shared with something else that generates interrupt storm
> > > >> > > - the BIOS does weird (wrong) things at a boot time, like not properly
> > > >> > >   shutting down and disabling interrupt sources; also may have wrong
> > > >> > >   pin control settings
> > > >> > > - the touchpad is operating on higher frequency like 400kHz (because
> > > >> > >   BIOS told to use that one instead of 100kHz) than the HW is designed
> > > >> > >   for and hence unreliable with all possible side effects
> > > >> > > - the touchpad firmware behaves wrongly on some sequences (see also
> > > >> > >   note about the bus speed above), try to upgrade touchpad FW
> > > >> > >
> > > >> > > With my experience with the case of the above mentioned commit that it
> > > >> > > may be BIOS thingy. Also consider the bus speed, there are quirks in
> > > >> > > the kernel for that.
> > > >> > 
> > > >> > Thank you for the detailed notes.  I will see if I can update my BIOS and
> > > >> > experiment with different quirks values, though I won't be able to do that
> > > >> > until late next week.
> > > >> 
> > > >> You're welcome!
> > > >> 
> > > >> > >> Here are the related logs:
> > > >> > >> 
> > > >> > >> ---
> > > >> > >> 
> > > >> > >> irq 27: nobody cared (try booting with the "irqpoll" option)
> > > >> > >
> > > >> > > Almost all below is not so interesting.
> > > >> > >
> > > >> > > ...
> > > >> > >
> > > >> > >> handlers:
> > > >> > >> [<00000000104a7621>] idma64_irq [idma64]
> > > >> > >> [<00000000bd8d08e9>] i2c_dw_isr
> > > >> > >> Disabling IRQ #27
> > > >> > >
> > > >> > > Yes, this line at least shared between those two and might be more.
> > > >> > >
> > > >> > > ...
> > > >> > >
> > > >> > >> i2c_designware i2c_designware.0: controller timed out
> > > >> > >> hid (null): reading report descriptor failed
> > > >> > >> i2c_hid_acpi i2c-ELAN06FA:00: can't add hid device: -110
> > > >> > >> i2c_hid_acpi i2c-ELAN06FA:00: probe with driver i2c_hid_acpi failed with error -110
> > > >> > >
> > > >> > > Yes, sounds familiar with the speed settings. Try to down it to 100kHz in case
> > > >> > > it's confirmed to be 400kHz.
> > > >> > >
> > > >> > >> ---
> > > >> > >
> > > >> > > Any pointers to that thread, please?
> > > >> > 
> > > >> > The following threads have users who were able to restore touchpad
> > > >> > functionality by undoing the idma64 change in initramfs:
> > > >> 
> > > >> Yes, = "they have hidden the existing problem". No value in that, sorry.
> > > >> What is the exact link that refer to the thread you previously mentioned?
> > > >> 
> > > >> ...
> > > >> 
> > > >> > Lastly, I saw another bug report that mentions the "probe with driver
> > > >> > i2c_hid_acpi failed with error -110" error.  It seems to state that the error
> > > >> > only occurs when a power cable is connected during boot:
> > > >> > 
> > > >> > - https://bugzilla.altlinux.org/57094
> > > >> >   - Huawei Matebook D15 BOD-WXX9-PCB-B4
> > > >> >   - i2c-GXTP7863:00
> > > >> > 
> > > >> > >> so I don't think this is a hardware issue with my individual laptop.
> > > >> > >
> > > >> > > I don't know how this conclusion is came here. You mean HW as laptop model?
> > > >> > > But are the involved components the same (I²C host controller + touchpad)?
> > > >> > 
> > > >> > Sorry for the confusion.  I meant the individual machine in my possession and
> > > >> > not the laptop model as a whole.
> > > >> 
> > > >> Yeah, something here is common and I can't say for sure this all about Synaptic
> > > >> touchpads...
> > > >
> > > > So, what I think I need to understand this more is the following
> > > > (all information should be gathered under root user) for working
> > > > and non-working cases:
> > > >
> > > > - `cat /proc/interrupts`
> > > > - `dmesg`
> > > >    # with `initcall_debug ignore_loglevel` added to the kernel command line
> > > > - `cat /sys/kernel/debug/pinctrl/.../pins`
> > > >    # ... should be something like INTC1234:00
> > > >
> > > > And just once these:
> > > > - `acpidump -o tables.dat` # the tables.dat file
> > > > - `grep -H 15 /sys/bus/acpi/devices/*/status`
> > > > - `lspci -nk -vv`
> > > 
> > > The tables.dat file and the dmesg logs seemed too big to post inline, so I
> > > ended up zipping all of the files (attached).
> > 
> > Thanks for the files. The same suspicion as in the original report
> > https://lore.kernel.org/all/e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com/
> > 
> > Have you read it in full?
> > 
> > My understanding that the pin 3 on GPIO might be wrongly configured
> > by BIOS.  The difference with the original case is that your GPIO device
> > is locked against modifications and until you unlock it (usually
> > it's done in BIOS in some debug menu) it may not be fixable without OEM
> > fixing the issue themselves. In any case you can try the workaround
> > (see https://lore.kernel.org/all/ZftTcSA5dn13eAmr@smile.fi.intel.com/).
> > But I am skeptical about it.
> 
> Just in case, this https://hansdegoede.dreamwidth.org/25589.html might be
> also useful.

FWIW, seems familiar:
https://bugzilla.kernel.org/show_bug.cgi?id=219799

Have you tried similar steps described there? (Id est turning PM off and
see if it affects the case. In your case it might be needed to comment out
the dev_pm_ops assignment in the LPSS driver drivers/mfd/intel-lpss*.c and
recompile the kernel / modules).

-- 
With Best Regards,
Andy Shevchenko



