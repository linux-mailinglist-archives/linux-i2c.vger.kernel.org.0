Return-Path: <linux-i2c+bounces-7889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5559C1D4A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 13:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73EFC1F216EB
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 12:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB9F1E32B6;
	Fri,  8 Nov 2024 12:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TejAm0P3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB041E511;
	Fri,  8 Nov 2024 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070026; cv=none; b=NhtoVadA8zMAksEgWOTBRYd7K28GHMX7ulGD3CzEvCMCPyFbdwYeRFhLfk9Jm31CCfy4v3s2fStrkgik+uDZhC3zsr/SUCxxtYp4+2R2hy0w/mHyqqgEZIPuX5NV7VaXMjqPY8nA2oKuOhLP2jlQILPjsfawbyTB1I7vNeW+mOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070026; c=relaxed/simple;
	bh=3Uw7uy+b881AIN03xXeND7PI2YP0JBmlekKKcBMOtto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8JGJvmVhWWsn6fuYHkJinL/eZ/C3poQhzg4eV0QeIbgjWFZrQmB1dd9B6LF7pcTK/q+35GGrYC9WqM/9Ga6fZRCHpWYHeqVCU7bHLJ2GxF0idfYbdGsbJazsJ6dqTnzfsweZHvS1CPaNn/moAjwUy6afxP8J2u2JnN09DX/EmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TejAm0P3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731070025; x=1762606025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Uw7uy+b881AIN03xXeND7PI2YP0JBmlekKKcBMOtto=;
  b=TejAm0P3xPmZOQz9AmhWbcrt7RKpLuJcYGh2a7bq7ic0u2D62BTwWbl6
   0T+lrsd83PZdDnWbxq2lScUph+fdlT4mUR120GQ9ZXxnvYwz8aoCAQ/Oi
   yykoo8USoTop/ChVn6CgHN6I4F0F5sPL66ufdo8gJ7UC99VwaMBC2mTvc
   uxdJ+2+MUsdzr5zNF4cDaCpo9UVWhGOj79K1sgQyqzBmW9vLORmz4hhCu
   6tY0Shxnbajl4Nsk5ksT2vEyFLl4I1aMHRs1Cwnf73V4/Rv2p0iZfPUGG
   riLMe29XmyEcgz8wqAJ1CjcQ2ZkObeqyN2yaEymcohvkLUqDzlOfm5Efj
   A==;
X-CSE-ConnectionGUID: JVE4NY4uTiG3bMlIR9Qk9A==
X-CSE-MsgGUID: 1Lg2ZDy5RTmlHkRhjCOfUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34642165"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34642165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:47:05 -0800
X-CSE-ConnectionGUID: ukbZ3N8oRvGdDb57JU/GjA==
X-CSE-MsgGUID: 4DBDMh1hQeCHj0NcCvWf6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85647486"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:47:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9OOC-0000000Cc2q-1qZV;
	Fri, 08 Nov 2024 14:47:00 +0200
Date: Fri, 8 Nov 2024 14:47:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: Florian Eckert <fe@dev.tdt.de>, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT
 overlay method
Message-ID: <Zy4IRAeLvoku4LfL@smile.fi.intel.com>
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
 <Zy3P7ld7UUL8XCrR@smile.fi.intel.com>
 <7fc0f59b8264e965efc96c0aa0ba4c31@dev.tdt.de>
 <CACSj6VW7WKv5tiAkLCvSujENJvXq1Mc7_7vtkQsRSz3JGY0i3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACSj6VW7WKv5tiAkLCvSujENJvXq1Mc7_7vtkQsRSz3JGY0i3Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 02:48:44PM +0300, Konstantin Aladyshev wrote:
> Thanks for the help!


> $ cat /sys/bus/acpi/devices/device\:25/path

These cat:s you made are mostly useless in this case. And you should look for
the real device folders in sysfs and firmware_node links there.

...

> However I was using the at24 device only as an example.
> My real target device is jc42
> (https://github.com/torvalds/linux/blob/906bd684e4b1e517dd424a354744c5b0aebef8af/drivers/hwmon/jc42.c#L600).

> Does it mean that jc42 driver doesn't support ACPI binding?

Kinda. I just sent a patch, please test and provide your Tested-by if it helps.

...

> Just in case here is my SSDT:
> ```
> DefinitionBlock ("jc42.aml", "SSDT", 5, "", "JC42", 1)
> {
>     External (_SB_.PCI0.SMBS, DeviceObj)
> 
>     Scope (\_SB_.PCI0.SMBS)
>     {
>         Device (SMB0) {
>             Name (_ADR, 0)
>         }
>         Device (SMB1) {
>             Name (_ADR, 1)
>         }
>         Device (SMB2) {
>             Name (_ADR, 2)
>         }
>     }
> 
>     Scope (\_SB.PCI0.SMBS)

While this works, we expect Scope to be under the respective host controller, i.e.

     Scope (\_SB.PCI0.SMBS.SMB0)

in your case.

>     {
>         Device (JC42) {
>             Name (_HID, "PRP0001")
>             Name (_DDN, "JC42 Temperature sensor")
>             Name (_CRS, ResourceTemplate () {
>                 I2cSerialBusV2 (
>                     0x001c,              // I2C Slave Address
>                     ControllerInitiated,
>                     400000,              // Bus speed
>                     AddressingMode7Bit,
>                     "\\_SB.PCI0.SMBS.SMB0",   // Link to ACPI I2C host
> controller
>                     0
>                 )
>             })
> 
>             Name (_DSD, Package () {
>                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                 Package () {
>                     Package () { "compatible", Package() {
> "jedec,jc-42.4-temp" } },
>                 }
>             })
>         }
>     }
> }

-- 
With Best Regards,
Andy Shevchenko



