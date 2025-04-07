Return-Path: <linux-i2c+bounces-10174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ADEA7E4FE
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3528A3AFABD
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2241FECC0;
	Mon,  7 Apr 2025 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDkweTAB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C731FE468;
	Mon,  7 Apr 2025 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039643; cv=none; b=jmApTsU57UfJdi1Sg8/0NzXhTC7eyVQ6Vm5ubfRY+xoyaBHdJldIY0LB2029YNcELg8o1Mu/FZUQlzSEvxWXq4gr7z0W0gjL9/UKnoJUg++xonthPJFw6v57yPayglH149sW3anV45RQxQPyWzmaP6d3+lJPkKNHHk3nC+1xbZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039643; c=relaxed/simple;
	bh=wzVkiX1WHW1+VEd41zgoCl+IvRzbkG2erhgb/grMY6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+5Bcz+UUIlKhEGpIvq8qn97C+8mUc9g1362tyxvAlTRrUKL85JA98OXQhbZmJjbH7rUlbCh/v/o1uCmsnXQ9cuLP4N4DfFgvp9aqvlj6JWmAaevawimUooy60RJEScJLbu07f7/eQ+MgkF3jRJ/Eia2mv6Z8Tgj+s9fAHB6nMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDkweTAB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039641; x=1775575641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wzVkiX1WHW1+VEd41zgoCl+IvRzbkG2erhgb/grMY6c=;
  b=KDkweTABnKRrWzNr6Ob3RSO09XarIaNp1DlAebYbttNksP0PgKwlM6Yx
   HTyskV5KxRdChGsoPSeq+ltCSh/4BUHjBNKszyM14p4ADjs9D1nk1C81d
   3o8XHhiF8ls69Hx/2zyoDKSJBcWyVxKZrkYWGl7U/feFuz0C6DCiVbJF7
   UnYqeLZaaQ91G9FDAGxzH+ZgEDBRQWejsd6SbBjf9idwhFmUE5fNF+wkw
   WZtotpUtMOEIShzOlfRKM75UTttZ8/iZAIjzUD/WoH5Q/bdGq5L5K8u2o
   d5H771YKwNBmjymqX4Ls2WrbxCdTqxYzvNNT9sjQQrw9F8H3+XVXKKqNL
   A==;
X-CSE-ConnectionGUID: g+cQroHrQ/aRapVHbeMvJA==
X-CSE-MsgGUID: LrAqoUG7RNe1ITvknoee2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56071565"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56071565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:27:20 -0700
X-CSE-ConnectionGUID: jvFf7bVAQseoAmXxE0FYLw==
X-CSE-MsgGUID: HlBrMmKlQUu/6KGFBwYp/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128496587"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:27:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oNQ-0000000A6q5-0tDQ;
	Mon, 07 Apr 2025 18:27:08 +0300
Date: Mon, 7 Apr 2025 18:27:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 08/16] i2c: core: Introduce i2c_get_adapter_supplier()
Message-ID: <Z_Puy8eEBc6tubEx@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-9-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:37PM +0200, Herve Codina wrote:
> The supplier device of an I2C adapter is the device that calls
> i2c_add_adapter() or variants and i2c_del_adapter().
> 
> Most of the time this supplier device is the parent of the adapter dev.
> 
> Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
> parent of the adapter dev points to the adapter dev the mux is connected

dev --> device (in both cases)

> to instead of the supplier of this adapter.
> 
> Introduce i2c_get_adapter_supplier() and a new supplier field in the
> adapter structure in order to ease the adapter supplier retrieval.

...

> +/**
> + * i2c_get_adapter_supplier() - Get the supplier of an adapter
> + * @adapter: the adapter to get the supplier from
> + *
> + * return:

Return:

> + * Look up and return the &struct device corresponding to the device supplying
> + * this adapter.

@adapter

> + * The user must call put_device() once done with the supplier returned.
> + */
> +struct device *i2c_get_adapter_supplier(struct i2c_adapter *adapter)
> +{
> +	return get_device(adapter->supplier ?: adapter->dev.parent);

What will be the meaning when both are set? Why dev.parent is not the same
as supplier in this case?  Looking at the commit message example, it seems
like you want to provide a physdev or sysdev (as term supplier seems more
devlink:ish), like it's done elsewhere. And in the same way _always_ initialise
it. In such a case, the ambiguity will be gone.

> +}

-- 
With Best Regards,
Andy Shevchenko



