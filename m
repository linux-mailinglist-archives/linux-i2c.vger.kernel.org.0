Return-Path: <linux-i2c+bounces-15261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EBDD3A53E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 11:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BF693043556
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 10:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B3C2DB79F;
	Mon, 19 Jan 2026 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0XJUS3N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543630B50C;
	Mon, 19 Jan 2026 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819183; cv=none; b=FIAA1xg0yyyryeBX/BwAAYfXk1AmdjOI0NKafX3fkmmMHJm0xKS+LzZ223OZSyvccz4Kf3KiEH9fqaXmebFJebSOuJpgxF6bj/T8LdQu7jEW2BKUSLfHh+OwTZfgg/6jUKQ/KTCpuNhJL5+xxo/slJVWQmW6kDo+i9XAvct1byw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819183; c=relaxed/simple;
	bh=eprWXNXC246ylcHLZ5eehw/miq4yVhNE3reMGcwwzhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlEjNn6t5L0HvQPrFAqfmefHGXJXxtnq7meq/50ckMB7T+TxLMPKnkfZrMiUAqIgTn2JCweJHSaSc2jeChIgfPxT4vZNFxJ5NMFF7Awt5OQMLX5Yb1XhpIpPdn1iGCwL8Gexnrv7owmsFqr0p8fSHvp8z6LsRUH0cS/JzdhEUj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0XJUS3N; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768819182; x=1800355182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eprWXNXC246ylcHLZ5eehw/miq4yVhNE3reMGcwwzhk=;
  b=J0XJUS3ND0s+uZzHYQkWpA37Hb9EYuxQ/31fD6AuIm6HCllTnmSMKg0s
   yz81h6Q4T95wKdTbtQ3vnekYNg2EHsUgiPk2TJnTuF5GzC1UMlgB9y6lM
   +lP/9J2PMz05O+UZelybzevDahrZRBapaL4hpd6ScoqiQEzM+PwaQQnHz
   Pje+TAE/bc/V2kyyZkTJwELo8ezMBqH2lPQ7EPDoaLPi69MuSRuOjVbbg
   CRhClOCfedznFHi5xasx6TnDW4M0ZMjDjP6EXazz6MBbqlP55dgOWcAYC
   Vw6P8nzocgmJAJcXc8i9tDJ1hRFnfT49VrjxK68Jj+aMz2Re17Tw+PKMz
   Q==;
X-CSE-ConnectionGUID: lYPPvk0+QgWF6A6cmvng6g==
X-CSE-MsgGUID: RJIKmZ37Rum+3T0IbILi3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70076608"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70076608"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:39:41 -0800
X-CSE-ConnectionGUID: 5OxLWRJOQCGEpMfw20JcCQ==
X-CSE-MsgGUID: 2ubpp6Q7TvCYgRtKJyd+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="236515698"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.37])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:39:39 -0800
Date: Mon, 19 Jan 2026 12:39:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: correctmost <cmlists@sent.com>
Cc: dmaengine@vger.kernel.org, regressions@lists.linux.dev,
	vkoul@kernel.org, linux-i2c@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work
 when idma64 is present in initramfs
Message-ID: <aW4J6bmHn2dLuOxo@smile.fi.intel.com>
References: <51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com>
 <aWUGmfcjWpFJs3-X@smile.fi.intel.com>
 <69f5dea3-17b0-4d3a-9de7-eb54f8f0f5cd@app.fastmail.com>
 <aWoM3JibLSBdGHeH@smile.fi.intel.com>
 <aWoUc_GJuZ8SuYCM@smile.fi.intel.com>
 <e5ee42bd-0d17-44e7-a306-61d19f1d24b2@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5ee42bd-0d17-44e7-a306-61d19f1d24b2@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 16, 2026 at 07:25:54PM -0500, correctmost wrote:
> On Fri, Jan 16, 2026, at 5:35 AM, Andy Shevchenko wrote:
> > On Fri, Jan 16, 2026 at 12:03:12PM +0200, Andy Shevchenko wrote:
> >> On Thu, Jan 15, 2026 at 05:50:36PM -0500, correctmost wrote:
> >> > On Mon, Jan 12, 2026, at 9:35 AM, Andy Shevchenko wrote:
> >> > > On Tue, Dec 16, 2025 at 12:57:10PM -0500, correctmost wrote:
> >> > >
> >> > >> The following commit
> >> > >
> >> > > No, it's false positive. The reality is that something else is going on
> >> > > there on this and other similar laptops.
> >> > >
> >> > >> causes my Lenovo IdeaPad touchpad not to work when
> >> > >> kernel/drivers/dma/idma64.ko.zst is present in the initramfs image:
> >> > >> 
> >> > >> #regzbot introduced: 9140ce47872bfd89fca888c2f992faa51d20c2bc
> >> > >> 
> >> > >> "idma64: Don't try to serve interrupts when device is powered off"
> >> > >
> >> > > So, the touchpad is an I²C device, which is connected to an Intel SoC.
> >> > > The I²C host controller is Synopsys DesignWare. On Intel SoCs the above
> >> > > mentioned IP is generated with private DMA engine, that's called Intel
> >> > > iDMA 64-bit. Basically it's two devices under a single PCI hood.
> >> > > The problem here is that when PCI device is in D3, both devices are
> >> > > powered off, but something sends an interrupt and it's not recognized
> >> > > being the one, send by a device (touchpad).
> >> > >
> >> > > There is one of the following potential issues (or their combinations):
> >> > >
> >> > > - the I²C host controller hardware got off too early
> >> > > - the line is shared with something else that generates interrupt storm
> >> > > - the BIOS does weird (wrong) things at a boot time, like not properly
> >> > >   shutting down and disabling interrupt sources; also may have wrong
> >> > >   pin control settings
> >> > > - the touchpad is operating on higher frequency like 400kHz (because
> >> > >   BIOS told to use that one instead of 100kHz) than the HW is designed
> >> > >   for and hence unreliable with all possible side effects
> >> > > - the touchpad firmware behaves wrongly on some sequences (see also
> >> > >   note about the bus speed above), try to upgrade touchpad FW
> >> > >
> >> > > With my experience with the case of the above mentioned commit that it
> >> > > may be BIOS thingy. Also consider the bus speed, there are quirks in
> >> > > the kernel for that.
> >> > 
> >> > Thank you for the detailed notes.  I will see if I can update my BIOS and
> >> > experiment with different quirks values, though I won't be able to do that
> >> > until late next week.
> >> 
> >> You're welcome!
> >> 
> >> > >> Here are the related logs:
> >> > >> 
> >> > >> ---
> >> > >> 
> >> > >> irq 27: nobody cared (try booting with the "irqpoll" option)
> >> > >
> >> > > Almost all below is not so interesting.
> >> > >
> >> > > ...
> >> > >
> >> > >> handlers:
> >> > >> [<00000000104a7621>] idma64_irq [idma64]
> >> > >> [<00000000bd8d08e9>] i2c_dw_isr
> >> > >> Disabling IRQ #27
> >> > >
> >> > > Yes, this line at least shared between those two and might be more.
> >> > >
> >> > > ...
> >> > >
> >> > >> i2c_designware i2c_designware.0: controller timed out
> >> > >> hid (null): reading report descriptor failed
> >> > >> i2c_hid_acpi i2c-ELAN06FA:00: can't add hid device: -110
> >> > >> i2c_hid_acpi i2c-ELAN06FA:00: probe with driver i2c_hid_acpi failed with error -110
> >> > >
> >> > > Yes, sounds familiar with the speed settings. Try to down it to 100kHz in case
> >> > > it's confirmed to be 400kHz.
> >> > >
> >> > >> ---
> >> > >
> >> > > Any pointers to that thread, please?
> >> > 
> >> > The following threads have users who were able to restore touchpad
> >> > functionality by undoing the idma64 change in initramfs:
> >> 
> >> Yes, = "they have hidden the existing problem". No value in that, sorry.
> >> What is the exact link that refer to the thread you previously mentioned?
> >> 
> >> ...
> >> 
> >> > Lastly, I saw another bug report that mentions the "probe with driver
> >> > i2c_hid_acpi failed with error -110" error.  It seems to state that the error
> >> > only occurs when a power cable is connected during boot:
> >> > 
> >> > - https://bugzilla.altlinux.org/57094
> >> >   - Huawei Matebook D15 BOD-WXX9-PCB-B4
> >> >   - i2c-GXTP7863:00
> >> > 
> >> > >> so I don't think this is a hardware issue with my individual laptop.
> >> > >
> >> > > I don't know how this conclusion is came here. You mean HW as laptop model?
> >> > > But are the involved components the same (I²C host controller + touchpad)?
> >> > 
> >> > Sorry for the confusion.  I meant the individual machine in my possession and
> >> > not the laptop model as a whole.
> >> 
> >> Yeah, something here is common and I can't say for sure this all about Synaptic
> >> touchpads...
> >
> > So, what I think I need to understand this more is the following
> > (all information should be gathered under root user) for working
> > and non-working cases:
> >
> > - `cat /proc/interrupts`
> > - `dmesg`
> >    # with `initcall_debug ignore_loglevel` added to the kernel command line
> > - `cat /sys/kernel/debug/pinctrl/.../pins`
> >    # ... should be something like INTC1234:00
> >
> > And just once these:
> > - `acpidump -o tables.dat` # the tables.dat file
> > - `grep -H 15 /sys/bus/acpi/devices/*/status`
> > - `lspci -nk -vv`
> 
> The tables.dat file and the dmesg logs seemed too big to post inline, so I
> ended up zipping all of the files (attached).

Thanks for the files. The same suspicion as in the original report
https://lore.kernel.org/all/e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com/

Have you read it in full?

My understanding that the pin 3 on GPIO might be wrongly configured
by BIOS.  The difference with the original case is that your GPIO device
is locked against modifications and until you unlock it (usually
it's done in BIOS in some debug menu) it may not be fixable without OEM
fixing the issue themselves. In any case you can try the workaround
(see https://lore.kernel.org/all/ZftTcSA5dn13eAmr@smile.fi.intel.com/).
But I am skeptical about it.

-- 
With Best Regards,
Andy Shevchenko



