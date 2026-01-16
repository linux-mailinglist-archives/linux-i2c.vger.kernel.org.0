Return-Path: <linux-i2c+bounces-15224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C360D2FA3E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BE4D3029D2D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A13C35C181;
	Fri, 16 Jan 2026 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ib2Shv4r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3153195E8;
	Fri, 16 Jan 2026 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768559739; cv=none; b=liuGV5ZOq5eskoFeOeciXgdbYHkp9obOhlwYkfm+alN61cGNFAy1Rji1wQsSWXNIPb2IY+djOw/XqqyoCujmCBcxLDqyyzC1Q15QNtmiDXSwtMb/MrqrO98J5V3LJmLzhtSe162mPY/oJb+eZTmyteLcXY8sTlJoJIrgKGQxqA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768559739; c=relaxed/simple;
	bh=aiIGlsJXL0tDmzaEhpskji5W6TU6kJO+JTTWJog4LWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NG1X2HMU4UJOL9xwVwOqB9nnnoKREQvbmVwYvAa4c+NhSoPb4Sg53DU+OR0IlRLkyqnk8U6XRRQ90WiQNiThTIBPWJyNdcj3+BMO38/98b1s16/NG5qw2TmJxrK/mdGWo1grS6ExjwSDv5DNMWg6jsrd+GAo86fcHkqv2E4akqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ib2Shv4r; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768559737; x=1800095737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aiIGlsJXL0tDmzaEhpskji5W6TU6kJO+JTTWJog4LWk=;
  b=ib2Shv4rNu9pyPvQB0e6gxAysxLTiUFt7WU2y2362xVFOWQThjynAapl
   mNXsF5eKB3I88UzHczn1OnG82sg7s2jv2M0MqJggw41sJF/60GoXcfGNN
   CCQJePFnNsXT1ZOAvN3QfSMZM+WRCR2uuKJ2hhLJeawd+B2uowg3DevJl
   WtPrTtjVfPCZiarmpxSt+SAVeYl+p7slha6rvKPWU29kqErPGfL4TTrCf
   j1JWzA6qtQ6KlAmpotqLRlEirY0HRdAuqT8IJrOoYB/DFRw3I0JhP1sG0
   rlpEcTEDJySuizlzaJMul5xqHZNnsqVtZmzwIHABBsETP+2y6CPl+BR8S
   A==;
X-CSE-ConnectionGUID: qAjVUn6+QGSYtq01PONLtA==
X-CSE-MsgGUID: 6k2Q3mFWTIymC7PhNL/0IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69776855"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69776855"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:35:36 -0800
X-CSE-ConnectionGUID: qNkMSGQDR+WVpxKlQ4UVrg==
X-CSE-MsgGUID: l3ELfngdSqy6wtCjo2smzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="235901137"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:35:34 -0800
Date: Fri, 16 Jan 2026 12:35:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: correctmost <cmlists@sent.com>
Cc: dmaengine@vger.kernel.org, regressions@lists.linux.dev,
	vkoul@kernel.org, linux-i2c@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work
 when idma64 is present in initramfs
Message-ID: <aWoUc_GJuZ8SuYCM@smile.fi.intel.com>
References: <51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com>
 <aWUGmfcjWpFJs3-X@smile.fi.intel.com>
 <69f5dea3-17b0-4d3a-9de7-eb54f8f0f5cd@app.fastmail.com>
 <aWoM3JibLSBdGHeH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWoM3JibLSBdGHeH@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 16, 2026 at 12:03:12PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 15, 2026 at 05:50:36PM -0500, correctmost wrote:
> > On Mon, Jan 12, 2026, at 9:35 AM, Andy Shevchenko wrote:
> > > On Tue, Dec 16, 2025 at 12:57:10PM -0500, correctmost wrote:
> > >
> > >> The following commit
> > >
> > > No, it's false positive. The reality is that something else is going on
> > > there on this and other similar laptops.
> > >
> > >> causes my Lenovo IdeaPad touchpad not to work when
> > >> kernel/drivers/dma/idma64.ko.zst is present in the initramfs image:
> > >> 
> > >> #regzbot introduced: 9140ce47872bfd89fca888c2f992faa51d20c2bc
> > >> 
> > >> "idma64: Don't try to serve interrupts when device is powered off"
> > >
> > > So, the touchpad is an I²C device, which is connected to an Intel SoC.
> > > The I²C host controller is Synopsys DesignWare. On Intel SoCs the above
> > > mentioned IP is generated with private DMA engine, that's called Intel
> > > iDMA 64-bit. Basically it's two devices under a single PCI hood.
> > > The problem here is that when PCI device is in D3, both devices are
> > > powered off, but something sends an interrupt and it's not recognized
> > > being the one, send by a device (touchpad).
> > >
> > > There is one of the following potential issues (or their combinations):
> > >
> > > - the I²C host controller hardware got off too early
> > > - the line is shared with something else that generates interrupt storm
> > > - the BIOS does weird (wrong) things at a boot time, like not properly
> > >   shutting down and disabling interrupt sources; also may have wrong
> > >   pin control settings
> > > - the touchpad is operating on higher frequency like 400kHz (because
> > >   BIOS told to use that one instead of 100kHz) than the HW is designed
> > >   for and hence unreliable with all possible side effects
> > > - the touchpad firmware behaves wrongly on some sequences (see also
> > >   note about the bus speed above), try to upgrade touchpad FW
> > >
> > > With my experience with the case of the above mentioned commit that it
> > > may be BIOS thingy. Also consider the bus speed, there are quirks in
> > > the kernel for that.
> > 
> > Thank you for the detailed notes.  I will see if I can update my BIOS and
> > experiment with different quirks values, though I won't be able to do that
> > until late next week.
> 
> You're welcome!
> 
> > >> Here are the related logs:
> > >> 
> > >> ---
> > >> 
> > >> irq 27: nobody cared (try booting with the "irqpoll" option)
> > >
> > > Almost all below is not so interesting.
> > >
> > > ...
> > >
> > >> handlers:
> > >> [<00000000104a7621>] idma64_irq [idma64]
> > >> [<00000000bd8d08e9>] i2c_dw_isr
> > >> Disabling IRQ #27
> > >
> > > Yes, this line at least shared between those two and might be more.
> > >
> > > ...
> > >
> > >> i2c_designware i2c_designware.0: controller timed out
> > >> hid (null): reading report descriptor failed
> > >> i2c_hid_acpi i2c-ELAN06FA:00: can't add hid device: -110
> > >> i2c_hid_acpi i2c-ELAN06FA:00: probe with driver i2c_hid_acpi failed with error -110
> > >
> > > Yes, sounds familiar with the speed settings. Try to down it to 100kHz in case
> > > it's confirmed to be 400kHz.
> > >
> > >> ---
> > >
> > > Any pointers to that thread, please?
> > 
> > The following threads have users who were able to restore touchpad
> > functionality by undoing the idma64 change in initramfs:
> 
> Yes, = "they have hidden the existing problem". No value in that, sorry.
> What is the exact link that refer to the thread you previously mentioned?
> 
> ...
> 
> > Lastly, I saw another bug report that mentions the "probe with driver
> > i2c_hid_acpi failed with error -110" error.  It seems to state that the error
> > only occurs when a power cable is connected during boot:
> > 
> > - https://bugzilla.altlinux.org/57094
> >   - Huawei Matebook D15 BOD-WXX9-PCB-B4
> >   - i2c-GXTP7863:00
> > 
> > >> so I don't think this is a hardware issue with my individual laptop.
> > >
> > > I don't know how this conclusion is came here. You mean HW as laptop model?
> > > But are the involved components the same (I²C host controller + touchpad)?
> > 
> > Sorry for the confusion.  I meant the individual machine in my possession and
> > not the laptop model as a whole.
> 
> Yeah, something here is common and I can't say for sure this all about Synaptic
> touchpads...

So, what I think I need to understand this more is the following
(all information should be gathered under root user) for working
and non-working cases:

- `cat /proc/interrupts`
- `dmesg`
   # with `initcall_debug ignore_loglevel` added to the kernel command line
- `cat /sys/kernel/debug/pinctrl/.../pins`
   # ... should be something like INTC1234:00

And just once these:
- `acpidump -o tables.dat` # the tables.dat file
- `grep -H 15 /sys/bus/acpi/devices/*/status`
- `lspci -nk -vv`

-- 
With Best Regards,
Andy Shevchenko



