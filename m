Return-Path: <linux-i2c+bounces-7919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEA29C3EB4
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 13:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE733281209
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 12:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67681A072C;
	Mon, 11 Nov 2024 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtSGHWZW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACF31A0714;
	Mon, 11 Nov 2024 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731329332; cv=none; b=dS/p2cFaWvEoUNFEmkK+4ShvuwVu+34Qncs1XdoCrxl6EIo0JguWJapETK/ufua+VsuUGC9Z8rDVxXMccohuz0fKO74k87ouXA8gTlr4N+buroHZ4uds7QvNLNeXqycD8udbB5ii7Bia5TnEgh/OR0cgFn8fPFzXQ/m8HDf04ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731329332; c=relaxed/simple;
	bh=ZuzRcqj2Tt6yI2eaezqsQcnYyJxeuumsLlvZLlaL3F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmXk/NdEyT8vZk5PQ2u1BY24RzHbaThUvsBT1Oril2f1k3zh8xCYzmx2Ex/A+XpT0zZLy4KIq3WMTXxAJfNgfhlKXu1K5xtSvxKoIv9qvBCwtSKTwWd7X9I03DEvYHnbrfITW+ULOa4oJmus4/itJlaCuD/plM+uQm3+TdX0q8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtSGHWZW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731329331; x=1762865331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZuzRcqj2Tt6yI2eaezqsQcnYyJxeuumsLlvZLlaL3F4=;
  b=dtSGHWZWMMzvETPyr9gp4NreKK8MnHs6ATuys79b1t2akwwhe2+cy9d7
   8r6el5TvjcSpmNndw/THv/t4nUE2fHhli7LUW0fluhmccfyFpm68NIIll
   ZtXQKkLBBE5v589+G5YIYXNUL2KSRVjks/Yua6HW+phV9nTz6u0LbrUnI
   r6tXlGQyS4MecCgaSdJ9IOzPNrVUPUkydgwcbml+ITqBM711n89ILI5qK
   wyQPkGpooj9qodZHnGBpLX6qI2dqwhpy+OjwV4FUh0z856DppYuBYQOnR
   v2ME3a8L5Z8nyWI8wFE07/zo6XXEydRU504aDrNBIbxB+FKOPaVV1sTca
   A==;
X-CSE-ConnectionGUID: beJ0rlUQQIyvO/rAZLcTCQ==
X-CSE-MsgGUID: eLy6aIaeRK2uZobMA5PHjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34820680"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34820680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 04:48:51 -0800
X-CSE-ConnectionGUID: mxOnGBERS2u5SeqswAsDiQ==
X-CSE-MsgGUID: YAPqokeuQFmbS79ijuirNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="87018090"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 04:48:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tATqY-0000000DcHW-2QvI;
	Mon, 11 Nov 2024 14:48:46 +0200
Date: Mon, 11 Nov 2024 14:48:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: Florian Eckert <fe@dev.tdt.de>, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT
 overlay method
Message-ID: <ZzH9Lo1opjzJ9VS_@smile.fi.intel.com>
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
 <Zy3P7ld7UUL8XCrR@smile.fi.intel.com>
 <7fc0f59b8264e965efc96c0aa0ba4c31@dev.tdt.de>
 <CACSj6VW7WKv5tiAkLCvSujENJvXq1Mc7_7vtkQsRSz3JGY0i3Q@mail.gmail.com>
 <Zy4IRAeLvoku4LfL@smile.fi.intel.com>
 <CACSj6VU1pxDeJaGT6qsA4_ftn_z0rqDicTTB1Hert5Zc1fF0OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSj6VU1pxDeJaGT6qsA4_ftn_z0rqDicTTB1Hert5Zc1fF0OA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 11, 2024 at 03:09:55PM +0300, Konstantin Aladyshev wrote:
> Sorry, I needed some time to recompile my kernel.
> I've verified your patch for the jc42 driver and it works as expected.
> Now the driver correctly connects to the I2C device and the hwmon
> directory created in the sysfs.

Thank you for confirming that! It will be part of v6.13-rc1
(and the respective release).

> Thanks for the help!

You're welcome!

> I've also sent a patchset for the piix4 documentation update as you've
> requested. Please review.

Thanks, I will.

> On Fri, Nov 8, 2024 at 3:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Nov 08, 2024 at 02:48:44PM +0300, Konstantin Aladyshev wrote:
> > > Thanks for the help!
> >
> > > $ cat /sys/bus/acpi/devices/device\:25/path
> >
> > These cat:s you made are mostly useless in this case. And you should look for
> > the real device folders in sysfs and firmware_node links there.
> >
> > ...
> >
> > > However I was using the at24 device only as an example.
> > > My real target device is jc42
> > > (https://github.com/torvalds/linux/blob/906bd684e4b1e517dd424a354744c5b0aebef8af/drivers/hwmon/jc42.c#L600).
> >
> > > Does it mean that jc42 driver doesn't support ACPI binding?
> >
> > Kinda. I just sent a patch, please test and provide your Tested-by if it helps.
> >
> > ...
> >
> > > Just in case here is my SSDT:
> > > ```
> > > DefinitionBlock ("jc42.aml", "SSDT", 5, "", "JC42", 1)
> > > {
> > >     External (_SB_.PCI0.SMBS, DeviceObj)
> > >
> > >     Scope (\_SB_.PCI0.SMBS)
> > >     {
> > >         Device (SMB0) {
> > >             Name (_ADR, 0)
> > >         }
> > >         Device (SMB1) {
> > >             Name (_ADR, 1)
> > >         }
> > >         Device (SMB2) {
> > >             Name (_ADR, 2)
> > >         }
> > >     }
> > >
> > >     Scope (\_SB.PCI0.SMBS)
> >
> > While this works, we expect Scope to be under the respective host controller, i.e.
> >
> >      Scope (\_SB.PCI0.SMBS.SMB0)
> >
> > in your case.
> >
> > >     {
> > >         Device (JC42) {
> > >             Name (_HID, "PRP0001")
> > >             Name (_DDN, "JC42 Temperature sensor")
> > >             Name (_CRS, ResourceTemplate () {
> > >                 I2cSerialBusV2 (
> > >                     0x001c,              // I2C Slave Address
> > >                     ControllerInitiated,
> > >                     400000,              // Bus speed
> > >                     AddressingMode7Bit,
> > >                     "\\_SB.PCI0.SMBS.SMB0",   // Link to ACPI I2C host
> > > controller
> > >                     0
> > >                 )
> > >             })
> > >
> > >             Name (_DSD, Package () {
> > >                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> > >                 Package () {
> > >                     Package () { "compatible", Package() {
> > > "jedec,jc-42.4-temp" } },
> > >                 }
> > >             })
> > >         }
> > >     }
> > > }

-- 
With Best Regards,
Andy Shevchenko



