Return-Path: <linux-i2c+bounces-9383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E9A325A9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 13:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A113A26C9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 12:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABEF20B7E6;
	Wed, 12 Feb 2025 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lupQm6Q1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE420B1ED;
	Wed, 12 Feb 2025 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739362016; cv=none; b=Ov3QAWb0b7sGRUl8ErsNjgRNAUcNIs81YfIOZcjwAGQTDvoh995ce2HZhMZAlzv7jvVa+HhTdjNhymUMi+C341BwnRMdJNCj+N55OrwhMjwKjDs+hcvhTj674iRTgp+6IJT6T6a4BPhq2J0zlQdHodo5x9h2Z0pX3uGtEClEtj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739362016; c=relaxed/simple;
	bh=CS1uQ8iE4eQNLCyQkyXL26s2q/7ENWEVVF7yknu5f28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fk1XNvgN8JFOT9vAvP8mceA5N9l9qr3ZRIXSN3rw3AfYmoQtlIqQ7b5Uw7UxuClRFs1ViUk7sj4GT/nCqIl1RIDf/dFphn8PxxdtdxuSZ7fp9vi2zH8W6XLRJMzGFdXsX6fFCLrJFPdSpdR8PPSSfmBBv+b/JBveM0oqZ1lszfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lupQm6Q1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739362014; x=1770898014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CS1uQ8iE4eQNLCyQkyXL26s2q/7ENWEVVF7yknu5f28=;
  b=lupQm6Q1Ak6vHxuLRwF/RFuemOpmkxIOwtMR0I/Wm65LTOIEvFIMzgB3
   dZyQDszWOXlE2S0m6LEokRsI1mvJhdV5dL8p32uuXC4mVBOvSut1QQqfE
   kJjiJTJjw0cPU/GW/srUQmIvklpS/9FJFiIuFidAobJPylZWA7TGkfb37
   W2MHy4OvpL1mvzQrsnMc+IIrzulKHUTcjgRK2is9JIrh8Hua5dPxT0YO5
   KqOGh+qn4MgR6mLfuTyQAB5gkCrnbHxuxmEVnVSMtq3FR2/zBRb9zTdgl
   runVzfxhyxl/vMgl9xOVTZ6ewgTLW4Syg/+kPDqkBhIQUuqGelaHgxpbT
   A==;
X-CSE-ConnectionGUID: Z6fhuAxrRKmUTHiSEeis9Q==
X-CSE-MsgGUID: 7a/UzR08RU2pbx48mVNMcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43777619"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="43777619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 04:06:53 -0800
X-CSE-ConnectionGUID: BNfCxHmNS8qWN/EpVRsJSg==
X-CSE-MsgGUID: CVsdaQmLQLi5LZHoPzBTEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="143655043"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 04:06:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiBVv-0000000ApKr-2TRs;
	Wed, 12 Feb 2025 14:06:47 +0200
Date: Wed, 12 Feb 2025 14:06:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Assigning fixed numbers to i2c buses via ACPI code
Message-ID: <Z6yO1wJ12FuiEVdf@smile.fi.intel.com>
References: <CACSj6VVNFZWJZVk4k98QYGdCQ=u5TzyfRE9NC_3xAKMRoPGzJA@mail.gmail.com>
 <Z6yBGoUeoNQGZHVn@smile.fi.intel.com>
 <CACSj6VWkDnQj2=tOPMsbTo0uerNSR6sGSMO9c1FxWbEfYFz7Lg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSj6VWkDnQj2=tOPMsbTo0uerNSR6sGSMO9c1FxWbEfYFz7Lg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 12, 2025 at 03:06:37PM +0300, Konstantin Aladyshev wrote:
> I'm running OpenBmc project on the x86 host. One of the applications
> from the OpenBmc ecosystem tries to find IPMI FRU devices on all
> available I2C buses. For that it would perform some transactions for
> every possible I2C device on every I2C bus to understand if it is an
> EEPROM or not.
> If the user doesn't want to scan some buses it can provide
> blocklist.json with addresses of the buses which shouldn't be scanned
> for FRU. But this blocklist operates with absolute addresses, which is
> why I want to be sure that my I2C buses would have fixed numbers on
> all systems.

The problem is how that blacklist is being organized. Nobody has to rely on
the bus numbers that are assigned during runtime by Linux kernel.

> Also it can be the case when the user wants to make sure that buses
> behind different I2C muxes are numbered in a particular way.

Why?

> Shortly speaking, existing OpenBmc software relies on this alias
> functionality in a couple of different scenarios.

Bad design. Even in OF world aliases are admitted to be a hack rather than
a solution.

> There are many examples of its usage in the BMC DTS code for different
> machines. Therefore I wonder if it is possible to do the same with x86 via
> ACPI tables to support existing OpenBmc applications.

I believe this is not an ACPI issue, this is issue of how that blacklist and
other things were designed and implemented. The correct way is to analyse sysfs
based on the registered host controllers, if one wants a platform-specific black
list, it should contain the HW addresses (bus, address, etc.) to identify
the controller and never the number that is assigned by the OS.

This is the very similar trap people got with eth0, eth1, ... in the past.

> On Wed, Feb 12, 2025 at 2:08 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Feb 12, 2025 at 11:18:44AM +0300, Konstantin Aladyshev wrote:
> > > Hello!
> > >
> > > Is it possible to assign fixed numbers to i2c buses via ACPI code?
> > >
> > > In DTS code it is done via aliases
> > > (https://docs.kernel.org/i2c/i2c-sysfs.html#caveat).
> > >
> > > For example:
> > > ```
> > > aliases {
> > >     i2c20 = &imux20;
> > > }
> > >
> > > &i2c1 {
> > > status = "okay";
> > >
> > >   i2c-mux@77 {
> > >      ...
> > >      imux20: i2c@0 {
> > >         ...
> > >      }
> > >      ...
> > >   }
> > > }
> > > ```
> > >
> > > Is it possible to do something like that in ACPI code?
> >
> > Why? What the problem do you actually have?

-- 
With Best Regards,
Andy Shevchenko



