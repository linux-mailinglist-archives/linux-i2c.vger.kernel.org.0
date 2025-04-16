Return-Path: <linux-i2c+bounces-10381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73002A8B06E
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 08:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 839987AB265
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 06:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738A01F4611;
	Wed, 16 Apr 2025 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5VTRIpe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB82BE571;
	Wed, 16 Apr 2025 06:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785486; cv=none; b=MgZ2sU9jZVo5rvQuUC5UmcBR7fvVC2nQ4pUXw+w1eZxKjOeHbeLRSc6kaPDsV6hODUtbA6w1JFbn1inlNGhM45hWUWL94LskksHX6fVsLp6pPWEw5qLCwzzLRxq3WMUEohzEWGUxpKdVcWlQVNIZXdju2AXGPPJ3TPS+MShx2aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785486; c=relaxed/simple;
	bh=HpgZIplj4QnQrznqe1CKE4kzLuHSZXrzDHut5bpN9kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYsIIZfafTNLj+55Zy5dZmaPvDFLIqJlYIrhjIzpD5KmNRmAgsteTg5I3JEr4QCrjoyLeEWC4rBc9CIj2e9XtymzYLhBURqWvXTGVLE//eGkujKgJUYAPgHEJBygFSFqj0arytETTP5Tpt6AfQeIj3m5UO3kz32zQ8BXt5T6xGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5VTRIpe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744785485; x=1776321485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HpgZIplj4QnQrznqe1CKE4kzLuHSZXrzDHut5bpN9kA=;
  b=l5VTRIpeHYfEit28+LTFMFbqKI5fgDX70jjCqCL32vCnSpTaKDWyTRT3
   qd7sUwJNmZLptm0LdhQWRftsUFR5okkAJvdIugvPkfuE9ENg9zlnBR52y
   hcSCTKTdihGn++MLC+xfEPOyJWU1HNhQZOUvhsv0tEzloAFRn3c7aY+lb
   BXiX7G7F9BDVs6wfkd6TkXwiM3zz4Dlsjf3jenbGBNShQbDTKBAERwWyo
   pPcQYqGTRnYZzwoPbPRf9IKQ5TMgKskOUWtPPXJw790NvzCxyWzsdT/vR
   00fglneuIZHgT4GJI9w4IMttl9k33zcS+YidbUKwW795xopHaY4qQrkPy
   w==;
X-CSE-ConnectionGUID: CPPfJ/ZmSSWRF+JttTa1uQ==
X-CSE-MsgGUID: d1DTMTwwSzSWuvSDvSW4gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57705668"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="57705668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:38:04 -0700
X-CSE-ConnectionGUID: 0lxYUVZSTryiOhaMh0wcNg==
X-CSE-MsgGUID: ovcF78FOQse1vrQIc7Vv1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="167510603"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:38:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wPG-0000000Clcl-38Hv;
	Wed, 16 Apr 2025 09:37:58 +0300
Date: Wed, 16 Apr 2025 09:37:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Luis Oliveira <lolivei@synopsys.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	kernel-team <kernel-team@cloudflare.com>
Subject: Re: Hitting WARN_ON_ONCE in i2c-designware-common.c
Message-ID: <Z_9QRqk_8rTkQVpx@smile.fi.intel.com>
References: <20c191d9-5f7a-4ec6-a663-dcc8d0b54c18@kernel.org>
 <Z_5OYSxZS05LO7cE@smile.fi.intel.com>
 <Z_5Ov9j-tF8rABDZ@smile.fi.intel.com>
 <36736a3d-9ba1-43d7-ac52-d0f2f8a36bec@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36736a3d-9ba1-43d7-ac52-d0f2f8a36bec@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 02:30:10PM +0200, Jesper Dangaard Brouer wrote:
> On 15/04/2025 14.19, Andy Shevchenko wrote:
> > On Tue, Apr 15, 2025 at 03:17:37PM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 15, 2025 at 02:03:26PM +0200, Jesper Dangaard Brouer wrote:
> > > > 
> > > > I'm hitting a WARN_ON_ONCE in drivers/i2c/busses/i2c-designware-common.c
> > > > when booting the kernel on our Gen12 hardware.
> > > > 
> > > > I'm using devel kernel net-next at commit 1a9239bb425 (merge tag
> > > > 'net-next-6.15').
> > > > 
> > > > I assume you want this report.
> > > > 
> > > > Maybe it is not a critical error(?)
> > > > ... looking the comment in the function:
> > > 
> > > Have you forgotten to compile in the drivers/acpi/acpi_apd.c?
> 
> I have double checked that drivers/acpi/acpi_apd.o is compiled.

Hmm... But is the function that creates clock is compiled? And does it succeed
(see also my comment about missing error check which you probably want to
 address independently on the affection on this issue).

> > Also that driver has the missing error check in acpi_apd_setup() for
> > clk_register_clkdev().
> 
> Are you saying I'm missing a .config option?

I'm saying that please double check that the clock is provided and AFAICT it
has to be created by the above mentioned module.

-- 
With Best Regards,
Andy Shevchenko



