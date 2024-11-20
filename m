Return-Path: <linux-i2c+bounces-8091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92B9D400F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 17:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6E9283511
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 16:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9FB14C5AF;
	Wed, 20 Nov 2024 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaDiOvIn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C009413BC02;
	Wed, 20 Nov 2024 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732120149; cv=none; b=OSTv4UFUppDgzHs8Om6Fz8JpUZiiZ2hfdaGZwpEZjqDAFSHlgQ8U6/6mWJYXIYOagVh+MR1CE/8Z9qodBSbVUtP72N27nWK0xa4MQN3gkzalXkRC/VOnzm7d4HZMEczgk8bPQWRwGHz6xhGEUcrA3KK2jJaz2mczoFA2KP9QB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732120149; c=relaxed/simple;
	bh=dUhZDVQ5AGIqcHNaQLGwT3Us1ByBOPuck7DpHE24sjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl0002z3rLXLaHSZSgQHG4pBYlax3FQxGlRIEvXLjKAOPGEpLNCWymwt1YqgTXCz6NVwsEfMmZIwpr1IfwETqI9lZN+GLWeyAHEndB5YaQOL0lT8yp5aGERs4v04b03yu+dmGyL/0ibc3XgPWidORsYHPZhkXrPNuol4t3VfQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaDiOvIn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732120148; x=1763656148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dUhZDVQ5AGIqcHNaQLGwT3Us1ByBOPuck7DpHE24sjE=;
  b=FaDiOvInT7ijDimFIsHcXSgyeSr6yhNo2V/jbDHftLMAqSF2aJWyU/LO
   +BoaRi8hZvMRKgL3FplBrDTN8bDNc+o3se3bQuIjUL/GGJTUKunFYa/HL
   MwPV9ueD7OudmLjrOIeIFudoI1+vnKI7Noz+LwFvCsKqYbj1zf+BfbXvd
   Jy5YOUnAHW1C94T8ZqhP+NKyrMS7jaJZq2DzDJYZrrxT1eKaVuNImqx6P
   wlsjiCFPiaUPGEKBaBJzz4wcY3+G146aD4DeS8oylsfq6oKesl3e+bo7G
   Q295SNDQijzbPx9pZxdAvcKQIULFCgMSRzODzbFUsY4PAPXOBGhJ0c9/x
   g==;
X-CSE-ConnectionGUID: UYIeXRUZQvyyC0uSCrReVw==
X-CSE-MsgGUID: DhiFSVVLTQKOCJ8g7IsBZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32120414"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32120414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 08:29:07 -0800
X-CSE-ConnectionGUID: I/2O9r3CQFSWHPFT0atoOQ==
X-CSE-MsgGUID: ITmw+jxSSlKfybpX78XRMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="89547097"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 08:29:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tDnZc-0000000Gm2Z-1Kir;
	Wed, 20 Nov 2024 18:29:00 +0200
Date: Wed, 20 Nov 2024 18:29:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
Message-ID: <Zz4OTBF66WfvnP2P@smile.fi.intel.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
 <Zz3plZOyMcxn54_h@smile.fi.intel.com>
 <4cfb8bd8-4ce7-4474-b7c0-0fd2693ce34f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cfb8bd8-4ce7-4474-b7c0-0fd2693ce34f@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 20, 2024 at 06:53:58AM -0800, Guenter Roeck wrote:
> On 11/20/24 05:52, Andy Shevchenko wrote:
> > On Wed, Nov 20, 2024 at 11:58:26AM +0800, Cedric Encarnacion wrote:

...

> > > +#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
> > 
> > Why? Is the data type undefined without this?
> 
> Look into other drivers. That is how it is implemented there,
> and not really the point. One has to know about an alternative to use it.
> 
> > > +static const struct regulator_desc adp1050_reg_desc[] = {
> > > +	PMBUS_REGULATOR_ONE("vout"),
> > > +};
> > > +#endif /* CONFIG_SENSORS_ADP1050_REGULATOR */
> > 
> > Note, this can be dropped anyway in order to use PTR_IF() below, if required.
> 
> FWIW, PTR_IF() isn't widely used, and I for my part was not aware that
> it exists.

Yeah, it's a relatively new one...

...

> > > +#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
> > > +	.num_regulators = 1,
> > > +	.reg_desc = adp1050_reg_desc,
> > > +#endif
> > 
> > Ditto, are the fields not defined without the symbol?
> 
> They are, but they must be 0/NULL. PTR_IF() would be an alternative.
> It is a bit odd to use it for a non-pointer, but it is type-agnostic,
> so using it should be ok to avoid the #ifdefs. We should maybe adopt
> that mechanism for other PMBus drivers.

I see, thanks for elaboration on all of this.

...

> > Please, split this patch to at least two:
> > 1) Introduce chip_info;
> 
> That would really be "Use driver data to point to chip info".

I agree on the title, what I meant is the rough description of what
should be done in the change.

> > 2) add new devices.
> 
> I don't really care much about separating those two (after all, they are
> related), but adding regulator support to the driver is a major change
> and should be a separate patch. On top of that, it isn't even mentioned
> in the patch description.

Indeed, that's why I mentioned "at least" in the reply.

-- 
With Best Regards,
Andy Shevchenko



