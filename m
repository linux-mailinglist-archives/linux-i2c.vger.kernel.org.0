Return-Path: <linux-i2c+bounces-15079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A3CD142E8
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 17:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA9733008C9E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3A02D7DCE;
	Mon, 12 Jan 2026 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aolkf+cT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92D36E46C;
	Mon, 12 Jan 2026 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236781; cv=none; b=rfB26lI2hDFSZK4qhayxM5tSVCK0nzancIvnrPE8WZGJSEAUybA/1TR6oKzBVy8gVqv3aMgCts4bkQYYT/e/MoX/stjqw3aWsdrwIUHzhNPOkESM/7JcEQaWwv8/d6nimZ/thYoO+aoDAIGwbghnOvAf1xJuPlaJ4iK4R1kjvns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236781; c=relaxed/simple;
	bh=laV8xz/6V9G3zKvzYctIE/Zg4SHdexkGs0xwcwO8fzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4D0XpGDl9tP6VfY5L7ZXyBZymb4m86VGgN23ZbzRbO71Y7V2IAgJrp99fVBs//S6T5UOBt8ueIJ+N2q19ljAQH6xasqrImq1qu8n6pwEpZH32SQn3gr4p8YWKbhQnVMPf03vgi43NwXstdO+d89ivWDbV5/XfDjaWJ+im9Laog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aolkf+cT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768236780; x=1799772780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=laV8xz/6V9G3zKvzYctIE/Zg4SHdexkGs0xwcwO8fzM=;
  b=aolkf+cT6beSadffBBwt7cwokN52UurUF9lmUfAZFU8UIcXpcKvvY35Y
   45rT4Xq38Fym0D468XNITHzSYxOh/k+f/n04euuDUlFHsOe9unlfj0Aps
   fwRPGFaQIX8wULae+zeyQQwawX4k4r81ZF0pZqTqGQy1pQO0XSq8WkFoV
   hnB6H/HsCb98UZ7N2Hq/FXNzmdkAeeVoQNS86MhpUnv3MywdqAhkiDGwZ
   4zBmS6D2u6WhEFarAoxaTNbP1sicl76c+haCqyg+a51+fUpLbIn/kOXHL
   Hx5rLl8E3JbEGO7GCicS6jP7lKQqoKayWgv/HbRKkHjuZemV8mq9wMdbC
   w==;
X-CSE-ConnectionGUID: JkaWjF46Rcyg0EYbw91BTw==
X-CSE-MsgGUID: q6E2KvS1TgCtsZmu3MoTwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69499557"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69499557"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:53:00 -0800
X-CSE-ConnectionGUID: 6yMCn+3DSnGtPVZ4MqnqCg==
X-CSE-MsgGUID: pFAlkfMLR3C3UGbxBjlfMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208288084"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:52:58 -0800
Date: Mon, 12 Jan 2026 18:52:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: correctmost <cmlists@sent.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: dmaengine@vger.kernel.org, regressions@lists.linux.dev,
	vkoul@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work
 when idma64 is present in initramfs
Message-ID: <aWUm6DLDADMX1m-H@smile.fi.intel.com>
References: <51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com>
 <aWUGmfcjWpFJs3-X@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWUGmfcjWpFJs3-X@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

+Cc: Mika

On Mon, Jan 12, 2026 at 04:35:08PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 16, 2025 at 12:57:10PM -0500, correctmost wrote:
> 
> > The following commit
> 
> No, it's false positive. The reality is that something else is going on
> there on this and other similar laptops.
> 
> > causes my Lenovo IdeaPad touchpad not to work when
> > kernel/drivers/dma/idma64.ko.zst is present in the initramfs image:
> > 
> > #regzbot introduced: 9140ce47872bfd89fca888c2f992faa51d20c2bc
> > 
> > "idma64: Don't try to serve interrupts when device is powered off"
> 
> So, the touchpad is an I²C device, which is connected to an Intel SoC.
> The I²C host controller is Synopsys DesignWare. On Intel SoCs the above
> mentioned IP is generated with private DMA engine, that's called Intel
> iDMA 64-bit. Basically it's two devices under a single PCI hood.
> The problem here is that when PCI device is in D3, both devices are
> powered off, but something sends an interrupt and it's not recognized
> being the one, send by a device (touchpad).
> 
> There is one of the following potential issues (or their combinations):
> 
> - the I²C host controller hardware got off too early
> - the line is shared with something else that generates interrupt storm
> - the BIOS does weird (wrong) things at a boot time, like not properly
>   shutting down and disabling interrupt sources; also may have wrong
>   pin control settings
> - the touchpad is operating on higher frequency like 400kHz (because
>   BIOS told to use that one instead of 100kHz) than the HW is designed
>   for and hence unreliable with all possible side effects
> - the touchpad firmware behaves wrongly on some sequences (see also
>   note about the bus speed above), try to upgrade touchpad FW
> 
> With my experience with the case of the above mentioned commit that it
> may be BIOS thingy. Also consider the bus speed, there are quirks in
> the kernel for that.
> 
> > Here are the related logs:
> > 
> > ---
> > 
> > irq 27: nobody cared (try booting with the "irqpoll" option)
> 
> Almost all below is not so interesting.
> 
> ...
> 
> > handlers:
> > [<00000000104a7621>] idma64_irq [idma64]
> > [<00000000bd8d08e9>] i2c_dw_isr
> > Disabling IRQ #27
> 
> Yes, this line at least shared between those two and might be more.
> 
> ...
> 
> > i2c_designware i2c_designware.0: controller timed out
> > hid (null): reading report descriptor failed
> > i2c_hid_acpi i2c-ELAN06FA:00: can't add hid device: -110
> > i2c_hid_acpi i2c-ELAN06FA:00: probe with driver i2c_hid_acpi failed with error -110
> 
> Yes, sounds familiar with the speed settings. Try to down it to 100kHz in case
> it's confirmed to be 400kHz.
> 
> > ---
> > 
> > Hardware info:
> > - Lenovo 16" IdeaPad Slim 5 - 16IRU9
> >   - Hardware name: LENOVO 83FW/LNVNB161216, BIOS PFCN14WW 09/20/2024
> >   - ELAN06FA:00 04F3:327E Touchpad
> > 
> > Steps to reproduce:
> > - Cold boot the laptop on Arch Linux
> > 
> > The bug is still present with the 6.19.0-rc1-1-git kernel.
> > 
> > The bisected commit is from March 2024, but I only recently noticed the issue
> > because the initramfs images on Arch Linux now include these additional
> > drivers (as of November 2025):
> > - kernel/drivers/dma/idma64.ko.zst
> > - kernel/drivers/mfd/intel-lpss-pci.ko.zst
> > - kernel/drivers/mfd/intel-lpss.ko.zst
> > 
> > Two other users have reported the issue on the Arch Linux and CachyOS forums,
> 
> Any pointers to that thread, please?
> 
> > so I don't think this is a hardware issue with my individual laptop.
> 
> I don't know how this conclusion is came here. You mean HW as laptop model?
> But are the involved components the same (I²C host controller + touchpad)?

-- 
With Best Regards,
Andy Shevchenko



