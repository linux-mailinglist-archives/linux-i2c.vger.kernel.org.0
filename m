Return-Path: <linux-i2c+bounces-7881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BDE9C17E3
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 09:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32BF61F22143
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941B81DDC38;
	Fri,  8 Nov 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpyXHcmi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE141DD9A8;
	Fri,  8 Nov 2024 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054399; cv=none; b=eEUZEgDeklajRh/3/C3NeFAUImn5AedFEw/lR8nja+WeuUt9hB0VwoRoyziu92GGqbLBQ7Z3OcGUJe6ZGTRZDnxSo60qIjsTDbTr+4sqoVmrUiurWZJjx6VKHK7WjI+YKxPb61YJB0DuAR02EhI3R0hGYL6kTqLZzC18Hc5XMok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054399; c=relaxed/simple;
	bh=q9R861ahyfC8y2jN0AEg0PnrVl3YXuo8JkAsY5l3/SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYbpc7wt7Rqk+zaoYQ5Jb32WCY8lqWhU4zDOdICYEgS7L0u8ZJ+jAzYF19dtmNPZomOZRSpttH7oTSFWfONTluZNmDmoZ+JBkVACsP0+jhJ7B0OnqR5iW4yi2ZjhiLZRc5jLHTP+YX/OrJDlBH9vowGsoGGRZdaixicgSbRjQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpyXHcmi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731054398; x=1762590398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q9R861ahyfC8y2jN0AEg0PnrVl3YXuo8JkAsY5l3/SI=;
  b=CpyXHcmij4klhNWpUaGvfutNk763rmFlG7cEaeYXSGSykyVEBDS10D8T
   aRf7D06Pnl9ySu4DLYw/s7ONyoyl0Im9kXJmEaOjbxnp+RL98WJn1TdbJ
   VQEwkk5Hk/gO8ntxtom7BHGP7mSjUWZMn7NJk8lyRWJjJAo8A2wpDHd4h
   eMUOs8xpsh8vWyN1Ez0WUg2gyDGB28e8aM6APwO3NwtiGuSB/QzQj1ZL0
   I2EuS/0enI42g2Y8w07lqji7crJ3HFJxVuHWNaGu8Xk/ow78oqn3rQvRb
   fU7YZs21Z9r9icYUzLB4NHF4mLd11siy/22bb7B09InUfHqsvjd36+E9c
   A==;
X-CSE-ConnectionGUID: 4PFnVp8HQ0m6JZsUNOwhMg==
X-CSE-MsgGUID: 4ApPMw3vR4uqlrlncToRsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42327927"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="42327927"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:26:37 -0800
X-CSE-ConnectionGUID: 5vBR9cHLRNCEajiRXMtTXg==
X-CSE-MsgGUID: 4H0h80CdT/GBnCRYRxBTiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85557996"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:26:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9KK9-0000000CXFw-3H1E;
	Fri, 08 Nov 2024 10:26:33 +0200
Date: Fri, 8 Nov 2024 10:26:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT
 overlay method
Message-ID: <Zy3LOV3VA5Wg9XYh@smile.fi.intel.com>
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 07, 2024 at 06:51:03PM +0300, Konstantin Aladyshev wrote:
> Hello!
> 
> I'm trying to add I2C devices to I2C/SMBus buses via the ACPI SSDT
> overlay method. I've managed to do it for the I2C buses, but can't get
> it working for the SMBus (PIIX4).

...

> Now I'm trying to add devices to the SMBus bus. Which in my case is
> produced from the i2c_piix4 PCI device:
> ```
> $ lspci -s 00:14.0 -vvvxxx
> 00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev 61)
>         Subsystem: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium
> >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         NUMA node: 0
>         IOMMU group: 58
>         Kernel driver in use: piix4_smbus
>         Kernel modules: i2c_piix4, sp5100_tco
> 00: 22 10 0b 79 03 04 20 02 61 00 05 0c 00 00 80 00
> 10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 20: 00 00 00 00 00 00 00 00 00 00 00 00 22 10 0b 79
> 30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ```
> 
> It is described as simple as this in the system ACPI code:
> ```
> Device (SMBS) // \_SB_.PCI0.SMBS
> {
>     Name (_ADR, 0x00140000)  // _ADR: Address

So, you need to add Device objects here

The driver (drivers/i2c/busses/i2c-piix4.c::1157) has this call:

	acpi_preset_companion(&adap->dev, ACPI_COMPANION(&dev->dev), hw_port_nr);

Means, that the _ADR will be evaluated, but there is none for the ports, only
for the physical device.

So, you need something like this:

	Scope (\_SB_.PCI0.SMBS)
	{
	  Device (SMB1)
	  {
	    Name (_ADR, 0)
	  }
	  Device (SMB1)
	  {
	    Name (_ADR, 1)
	  }
	  Device (SMB2)
	  {
	    Name (_ADR, 2)
	  }
	}


And then refer to the controller (respective port) as, for example,

	\_SB_.PCI0.SMBS.SMB1

in your SSDT. Note, the above _ADR assignments you should also add to SSDT
(better to the same one).

> }
> ```
> And produces several I2C busses to the system:
> ```
> i2c-7   unknown         SMBus PIIX4 adapter port 0 at 0b00      N/A
> i2c-8   unknown         SMBus PIIX4 adapter port 2 at 0b00      N/A
> i2c-9   unknown         SMBus PIIX4 adapter port 1 at 0b20      N/A
> ```
> 
> No matter how I've tried, I can't get to add my custom devices to
> these SMBus buses.
> 
> Apparently just using "\\_SB.PCI0.SMBS" is not enough for this case.
> Maybe I need to somehow create port nodes for this Device? Or maybe it
> is not possible at all with the current piix driver?
> 
> Anyway I've started digging and I've noticed that for the I2C device
> there are two physical_nodes in the sysfs. Where the 'physical_node'
> is a standard folder and 'physical_node1' is a direct link to the
> proper i2c bus:

> Maybe I need to modify ACPI code somehow to create these
> 'physical_nodesX' folders for the relevant i2c-7/8/9 buses?

If you succeed with the above, please add the respective section to
the Documentation/i2c/busses/i2c-piix4.rst and send a patch. It will
be very appreciated!

-- 
With Best Regards,
Andy Shevchenko



