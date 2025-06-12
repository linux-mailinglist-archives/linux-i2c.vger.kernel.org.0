Return-Path: <linux-i2c+bounces-11373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D0AD70E7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 14:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9601BC6ED3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 12:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76903239E9E;
	Thu, 12 Jun 2025 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIJG8GHd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014B222574;
	Thu, 12 Jun 2025 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732932; cv=none; b=IWoKlf+FLgsTvUCTdatzJor5+UAwuly6GhuIRkngbuofg5IluJlZUP/O7fWWyNzHkJPZVxl4dhIgYMJyysZchA6xprcEEDsVmKcAp1xy9CPsexLBHXivMjrC0vJSVLWC1YGhMfyREiQinQWHvEtXuev+BVipvLOTbiOhksJle98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732932; c=relaxed/simple;
	bh=dP3SRX/cv37DsGg35U7B1sRrw0buqGQozmHVM2Feb4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3vZQGIClkA2bk64aH/cqRfiqo6cAxlpFRcBcECYDx5OhUxwMTk88hqWyrI+wM6W9FLx4wu/XsyipGJn1DvOSpoRg45hpXkkBekx4QW4I+cGsWzO+/BK0IemIwjCwkM95b68cAemPD/c3wnQ6Vo4QqKuT9QrLsFz7QfXReTqYZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIJG8GHd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749732931; x=1781268931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dP3SRX/cv37DsGg35U7B1sRrw0buqGQozmHVM2Feb4s=;
  b=VIJG8GHdTw8jPikhH9u/u65xA9Sy/i6v19kShLW2Y+Fth+uXYAUf4KJl
   aovWyl/zkHRxVTMzKCvvQe1Pmoa2TmJQyP+3fvW5sYmdr+TMvbOe1wVJc
   wGbfLWeKRndQGY+vcR46OVY9d32MxGr690/vC0xjQvtHEnOJ9t0eSOW16
   B+5wQxWKdveoQhjCuvTMT00STnFQaF/3oZOsNRQQG2u4uu/YxO8femXTT
   cdbsGp4UFpgPvZW/oMGdEfMH/QUMZsxe9mZ1BtGAqZ/ss/H4k1MtXPjcs
   hdCpRA9mE8X/2Geg55GSul7e5XY7DEGWR6VpAWhTtdoyRwsv2PMD7Cgw+
   A==;
X-CSE-ConnectionGUID: 2LJLMr4gR5OE/j893IcckQ==
X-CSE-MsgGUID: LMJ7fseEQpa6QLh1Etgj6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="54538205"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="54538205"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:55:30 -0700
X-CSE-ConnectionGUID: bQREP0MoTt6cbAdraUhGWA==
X-CSE-MsgGUID: rli+VdjxRTaUK+BP6L+FeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="184745704"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 05:55:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPhSk-00000005xBk-0X8p;
	Thu, 12 Jun 2025 15:55:22 +0300
Date: Thu, 12 Jun 2025 15:55:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	ldewangan@nvidia.com, digetx@gmail.com, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] i2c: tegra: make reset an optional property
Message-ID: <aErOOSxt0ovCIeSA@smile.fi.intel.com>
References: <20250603153022.39434-1-akhilrajeev@nvidia.com>
 <20250603153022.39434-2-akhilrajeev@nvidia.com>
 <7sncphuidgiz6orsocixgybm2npcsjrdm7gnl3e52vfms2polu@4mmhdtc4zg5x>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7sncphuidgiz6orsocixgybm2npcsjrdm7gnl3e52vfms2polu@4mmhdtc4zg5x>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 12, 2025 at 02:57:36AM +0200, Andi Shyti wrote:

...

> > +static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
> > +{
> > +	if (!i2c_dev->hw->has_mst_reset)
> > +		return -EOPNOTSUPP;
> > +
> > +	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
> > +	udelay(2);
> > +
> > +	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
> > +	udelay(2);
> > +
> > +	return 0;
> > +}
> > +
> >  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
> >  {
> >  	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
> > @@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
> >  	 */
> >  	if (handle)
> >  		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
> > -	else
> > +	else if (i2c_dev->rst)
> >  		err = reset_control_reset(i2c_dev->rst);
> > +	else
> > +		err = tegra_i2c_master_reset(i2c_dev);
> 
> Can you please take a look here? Should the reset happen in ACPI?

This is a good question. Without seeing all the implementations of _RST method
for the platforms based on this SoC it's hard to say. Ideally the _RST (which
is called above) must handle it properly, but firmwares have bugs...

TL;DR: I think the approach is correct, and if any bug in ACPI will be found,
the workaround (quirk) needs to be added here later on.

-- 
With Best Regards,
Andy Shevchenko



