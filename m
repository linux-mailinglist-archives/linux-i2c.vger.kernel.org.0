Return-Path: <linux-i2c+bounces-15220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F024D2F369
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 11:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C620302D2F0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D05329E61;
	Fri, 16 Jan 2026 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEJ5bYpp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E469335CBAE;
	Fri, 16 Jan 2026 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557794; cv=none; b=LRzgVFt0/Gh+rWevaB8rUreaBh8BuY8B0l8R2wHRhPsKMv+zK4I6Eok3ASIq/fPo+AEv7s3GM0f18HQXdKWd1QGE5Hw3Lr5QpB7Loiks6UWBkl5VEYnndGVZlWQi7/TZ+Ju8cVaeFmlGjv0cB5nb4jM4DeucCHDS+dqjQv5F7wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557794; c=relaxed/simple;
	bh=HKQ+G/OtILyxPHemQCNJ8D96obrSJJnwDrIhfKpXKPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPPePPLKvJ4mGC5plth6uUzoWZwYzCqmP06oRFYBHCJi6PCY2Y6wUjCo/Z26PfDFzgioZ/YLMkwUITyvySN4YWkkL2cjA8t0VGEa+Jn617U4DX6Tm4WMokogNSGtlPRet5/nKoAf2ANBrB1Nm+Q3nFDIelevZPWfYl8SF5ux3wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEJ5bYpp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768557793; x=1800093793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HKQ+G/OtILyxPHemQCNJ8D96obrSJJnwDrIhfKpXKPM=;
  b=eEJ5bYpphDCu+FPrSYX21DWZFAk/24aA7+aYsASC/vCY3zy1SsOhOEDb
   KFjeC9aRr1InsJdNdKlCvI13eyee8JCUXtLEA72W0A+35t8kapBVwARt9
   HPrbfU2Nm5yQDuVxcCGv6QdX0bmnFCJToSiopcTI6krlKUqiKDjkuXtDD
   ELkLFnHLGaN1wZ2iB9eQ7NdyHXDOswA7bR5SDc5f9z5IqgITXVvNVEzMD
   w5yp2ZNUPt91jdJkFNsNkO6N+x2u62xvj3zyxIMoAWmCk++bJPWp20Oym
   fXPbCRxNHW6pFRuX9fkfaZpDl1wnbN79WYvb8Dtjfqjf85BHgAXokHnrO
   A==;
X-CSE-ConnectionGUID: RMtScywfRayoiXEY5zf+2A==
X-CSE-MsgGUID: VS7jtX0JQXWOrW0ty6EdHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73724620"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73724620"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:03:12 -0800
X-CSE-ConnectionGUID: +rvXRLmHT76sm4dhwDu+FQ==
X-CSE-MsgGUID: CmKGyIoWTaq9ATIzzk9Q0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205101602"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:03:10 -0800
Date: Fri, 16 Jan 2026 12:03:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: correctmost <cmlists@sent.com>
Cc: dmaengine@vger.kernel.org, regressions@lists.linux.dev,
	vkoul@kernel.org, linux-i2c@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work
 when idma64 is present in initramfs
Message-ID: <aWoM3JibLSBdGHeH@smile.fi.intel.com>
References: <51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com>
 <aWUGmfcjWpFJs3-X@smile.fi.intel.com>
 <69f5dea3-17b0-4d3a-9de7-eb54f8f0f5cd@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69f5dea3-17b0-4d3a-9de7-eb54f8f0f5cd@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 05:50:36PM -0500, correctmost wrote:
> On Mon, Jan 12, 2026, at 9:35 AM, Andy Shevchenko wrote:
> > On Tue, Dec 16, 2025 at 12:57:10PM -0500, correctmost wrote:
> >
> >> The following commit
> >
> > No, it's false positive. The reality is that something else is going on
> > there on this and other similar laptops.
> >
> >> causes my Lenovo IdeaPad touchpad not to work when
> >> kernel/drivers/dma/idma64.ko.zst is present in the initramfs image:
> >> 
> >> #regzbot introduced: 9140ce47872bfd89fca888c2f992faa51d20c2bc
> >> 
> >> "idma64: Don't try to serve interrupts when device is powered off"
> >
> > So, the touchpad is an I²C device, which is connected to an Intel SoC.
> > The I²C host controller is Synopsys DesignWare. On Intel SoCs the above
> > mentioned IP is generated with private DMA engine, that's called Intel
> > iDMA 64-bit. Basically it's two devices under a single PCI hood.
> > The problem here is that when PCI device is in D3, both devices are
> > powered off, but something sends an interrupt and it's not recognized
> > being the one, send by a device (touchpad).
> >
> > There is one of the following potential issues (or their combinations):
> >
> > - the I²C host controller hardware got off too early
> > - the line is shared with something else that generates interrupt storm
> > - the BIOS does weird (wrong) things at a boot time, like not properly
> >   shutting down and disabling interrupt sources; also may have wrong
> >   pin control settings
> > - the touchpad is operating on higher frequency like 400kHz (because
> >   BIOS told to use that one instead of 100kHz) than the HW is designed
> >   for and hence unreliable with all possible side effects
> > - the touchpad firmware behaves wrongly on some sequences (see also
> >   note about the bus speed above), try to upgrade touchpad FW
> >
> > With my experience with the case of the above mentioned commit that it
> > may be BIOS thingy. Also consider the bus speed, there are quirks in
> > the kernel for that.
> 
> Thank you for the detailed notes.  I will see if I can update my BIOS and
> experiment with different quirks values, though I won't be able to do that
> until late next week.

You're welcome!

> >> Here are the related logs:
> >> 
> >> ---
> >> 
> >> irq 27: nobody cared (try booting with the "irqpoll" option)
> >
> > Almost all below is not so interesting.
> >
> > ...
> >
> >> handlers:
> >> [<00000000104a7621>] idma64_irq [idma64]
> >> [<00000000bd8d08e9>] i2c_dw_isr
> >> Disabling IRQ #27
> >
> > Yes, this line at least shared between those two and might be more.
> >
> > ...
> >
> >> i2c_designware i2c_designware.0: controller timed out
> >> hid (null): reading report descriptor failed
> >> i2c_hid_acpi i2c-ELAN06FA:00: can't add hid device: -110
> >> i2c_hid_acpi i2c-ELAN06FA:00: probe with driver i2c_hid_acpi failed with error -110
> >
> > Yes, sounds familiar with the speed settings. Try to down it to 100kHz in case
> > it's confirmed to be 400kHz.
> >
> >> ---
> >
> > Any pointers to that thread, please?
> 
> The following threads have users who were able to restore touchpad
> functionality by undoing the idma64 change in initramfs:

Yes, = "they have hidden the existing problem". No value in that, sorry.
What is the exact link that refer to the thread you previously mentioned?

...

> Lastly, I saw another bug report that mentions the "probe with driver
> i2c_hid_acpi failed with error -110" error.  It seems to state that the error
> only occurs when a power cable is connected during boot:
> 
> - https://bugzilla.altlinux.org/57094
>   - Huawei Matebook D15 BOD-WXX9-PCB-B4
>   - i2c-GXTP7863:00
> 
> >> so I don't think this is a hardware issue with my individual laptop.
> >
> > I don't know how this conclusion is came here. You mean HW as laptop model?
> > But are the involved components the same (I²C host controller + touchpad)?
> 
> Sorry for the confusion.  I meant the individual machine in my possession and
> not the laptop model as a whole.

Yeah, something here is common and I can't say for sure this all about Synaptic
touchpads...

-- 
With Best Regards,
Andy Shevchenko



