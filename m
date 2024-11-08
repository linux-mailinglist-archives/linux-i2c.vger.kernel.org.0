Return-Path: <linux-i2c+bounces-7882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 459A69C17F0
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 09:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14041F21C3A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 08:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A991DDA2D;
	Fri,  8 Nov 2024 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTu8XagF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800C71DC195;
	Fri,  8 Nov 2024 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054565; cv=none; b=h9wPDL6p0aPvnd/RJuXb6+XJb5sXw47CsHzG5BTrtErMVRkghHeonJL4lnE+HVEhKhLw01t8brpmWSTRhTeFD3Wn8bJ6QCPYkvhelQ0hXRwxGu8SZB0UKyks+59WtkTclgfqNIamxeomu2d8ItjglOFn/CHlNMdTUP6jCmpOzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054565; c=relaxed/simple;
	bh=+git/KiauOnaADR9Sl1vQHpNUXCPC4iFD1DU55d4TwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9sXzciSmm30YqYpUF4DroG6LMM5Dsyw2nCoOue/f6DMmn53T3JnHEXHsvFPw39YISpY7g8J3H0m8HcsVYkiuw03j0yNML6qDBXXkEMXDz/WMzTW7pkmHKDrgAQu1RTscusDyta8cQ/BMS4CIegYf6H3bRSo/HDkZXC5k5AbtOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTu8XagF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731054564; x=1762590564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+git/KiauOnaADR9Sl1vQHpNUXCPC4iFD1DU55d4TwM=;
  b=hTu8XagFlQM5FI68UX7LX5OUwTZRsIH58ND5DvBjjZlOFEYYlJI1m/sC
   yfjoZBnKL79aaSDYqznBO0C3STmFV5KmXfZRBYhuZHEX7VFxIkp+oZA8A
   mRpsCi2PGXG5aPGdUzE1NpNienAhvZLFUZ6FE/35bC8Hn+Tm5CafDozfs
   BqKDXRz9j+Jlww2DKoI18ST2A1MlTk/aZTUPe/1PUZWJCTW6U66FFd2q3
   3n5mUpRq3ekWiKt9SIZrPfGsgaVzJgT3Xu/NrZpaGipzimo53Zu0qTabx
   JhCljmwjPIzEtesWlTshbpXlcaFyxhtuxY/kk9s3TCTDPC5fMlxu+i/9x
   w==;
X-CSE-ConnectionGUID: L/qzAQLSRqWQC5JYt4u2Fw==
X-CSE-MsgGUID: SezWw/JyQ/am1ILrBJBBEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30344974"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="30344974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:29:23 -0800
X-CSE-ConnectionGUID: a3lFX3xWQeiLylbKLYSE3g==
X-CSE-MsgGUID: sAOQ2X8qTF2Q8gu8p0P5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="89990033"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:29:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9KMn-0000000CXIr-0TJq;
	Fri, 08 Nov 2024 10:29:17 +0200
Date: Fri, 8 Nov 2024 10:29:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT
 overlay method
Message-ID: <Zy3L3IvW_E6Lnhe4@smile.fi.intel.com>
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
 <Zy3LOV3VA5Wg9XYh@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy3LOV3VA5Wg9XYh@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 10:26:33AM +0200, Andy Shevchenko wrote:
> On Thu, Nov 07, 2024 at 06:51:03PM +0300, Konstantin Aladyshev wrote:

> > I'm trying to add I2C devices to I2C/SMBus buses via the ACPI SSDT
> > overlay method. I've managed to do it for the I2C buses, but can't get
> > it working for the SMBus (PIIX4).

...

> > Now I'm trying to add devices to the SMBus bus. Which in my case is
> > produced from the i2c_piix4 PCI device:
> > ```
> > $ lspci -s 00:14.0 -vvvxxx
> > 00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 61)
> >         Subsystem: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller
> >         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
> > ParErr- Stepping- SERR- FastB2B- DisINTx+
> >         Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium
> > >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> >         NUMA node: 0
> >         IOMMU group: 58
> >         Kernel driver in use: piix4_smbus
> >         Kernel modules: i2c_piix4, sp5100_tco
> > 00: 22 10 0b 79 03 04 20 02 61 00 05 0c 00 00 80 00
> > 10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 10 0b 79
> > 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > ```
> > 
> > It is described as simple as this in the system ACPI code:
> > ```
> > Device (SMBS) // \_SB_.PCI0.SMBS
> > {
> >     Name (_ADR, 0x00140000)  // _ADR: Address
> 
> So, you need to add Device objects here
> 
> The driver (drivers/i2c/busses/i2c-piix4.c::1157) has this call:
> 
> 	acpi_preset_companion(&adap->dev, ACPI_COMPANION(&dev->dev), hw_port_nr);
> 
> Means, that the _ADR will be evaluated, but there is none for the ports, only
> for the physical device.
> 
> So, you need something like this:
> 
> 	Scope (\_SB_.PCI0.SMBS)
> 	{
> 	  Device (SMB1)
> 	  {
> 	    Name (_ADR, 0)
> 	  }
> 	  Device (SMB1)
> 	  {
> 	    Name (_ADR, 1)
> 	  }
> 	  Device (SMB2)
> 	  {
> 	    Name (_ADR, 2)
> 	  }
> 	}
> 
> 
> And then refer to the controller (respective port) as, for example,
> 
> 	\_SB_.PCI0.SMBS.SMB1
> 
> in your SSDT. Note, the above _ADR assignments you should also add to SSDT
> (better to the same one).
> 
> > }
> > ```
> > And produces several I2C busses to the system:
> > ```
> > i2c-7   unknown         SMBus PIIX4 adapter port 0 at 0b00      N/A
> > i2c-8   unknown         SMBus PIIX4 adapter port 2 at 0b00      N/A
> > i2c-9   unknown         SMBus PIIX4 adapter port 1 at 0b20      N/A
> > ```
> > 
> > No matter how I've tried, I can't get to add my custom devices to
> > these SMBus buses.
> > 
> > Apparently just using "\\_SB.PCI0.SMBS" is not enough for this case.
> > Maybe I need to somehow create port nodes for this Device? Or maybe it
> > is not possible at all with the current piix driver?
> > 
> > Anyway I've started digging and I've noticed that for the I2C device
> > there are two physical_nodes in the sysfs. Where the 'physical_node'
> > is a standard folder and 'physical_node1' is a direct link to the
> > proper i2c bus:
> 
> > Maybe I need to modify ACPI code somehow to create these
> > 'physical_nodesX' folders for the relevant i2c-7/8/9 buses?
> 
> If you succeed with the above, please add the respective section to
> the Documentation/i2c/busses/i2c-piix4.rst and send a patch. It will
> be very appreciated!

The last but not least remark: you have to load your SSDT _before_ the driver,
which means the only methods you may use either initramfs or EFI variable.
ACPI ConfigFS won't work!

-- 
With Best Regards,
Andy Shevchenko



