Return-Path: <linux-i2c+bounces-10900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE55AAAFCFA
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 16:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDAAD1C23531
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 14:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CC926F453;
	Thu,  8 May 2025 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i70ls6+T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9CC253953;
	Thu,  8 May 2025 14:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714490; cv=none; b=XzAyN+Cr4eCGHttWhGKaBvp+ClNxaA1D8G6E2Uqx/ST8h06peb9fSpyPJigjIzBKIgrcgnJIpGSnym3eJTHlbO2fTssG2ty7FZxUxqNQmeUR+kR6eKrUpm9ZATHLYpQoO+Zj19+F5ePT7YraAtXX+W6o6ZBSCu9lPFQe+iKs9vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714490; c=relaxed/simple;
	bh=IY3VG/gRbQesJTL7PGEn0YX+FszGyoQR0i1Wr/j85Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwqlBeWKvtu87mLhnI6qwi0k12d3D7XZGjy58n28yZF/IJTpHYKRe31oX+QtbNgWJNBuxE36EPJp86ZNm+0QghNW1SvPYVFUtrl4RfyCMyqKuquL3LpsFWYGD74NsAIu5bohO2BBCnAArjL9Kr0AJU+7HyXIalbWHqc6X7vxtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i70ls6+T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714489; x=1778250489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IY3VG/gRbQesJTL7PGEn0YX+FszGyoQR0i1Wr/j85Qc=;
  b=i70ls6+Tn7yvDvq2T3McTEscfVbJMnfaB0RWlVbqds+7kBwifScUPzHz
   UAQtVCuavO6xzdDes4AEpRlvn9eXTZJt4VVUBPxgfyWvsn5oC0s5tZ/7W
   w0uczTSgfd5FcWFu3c4izJK2klBiMBqSRDhUUoxGkTl2Jh43hvQ9Up97Y
   Zza0OiYKtFubTEOSENoJAbJ6VpXhEmrRchZ881cz/9UtVEMmL+sSypkeH
   zm/ud7v+ltHWoAqmxZMNLEOG+6OV80mHfq5ojciPQ0x+WI7Cfe8IGmW61
   U/xWJQsbx+MZ7AjGgvfAi4nV/rb4z8iNRNmzsalwb1h7iGhjUACSIstAK
   w==;
X-CSE-ConnectionGUID: /Xgp2YLlSfehnor8qcdWNA==
X-CSE-MsgGUID: 6ySq++zpS1C467VllERKlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59496600"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59496600"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:28:06 -0700
X-CSE-ConnectionGUID: rdEp9pKSQSOxGK7lJDtSyw==
X-CSE-MsgGUID: uy6WKA9hT6e5NY9UIu6Ijw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136320287"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:27:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD2E4-000000048Ph-1tm1;
	Thu, 08 May 2025 17:27:52 +0300
Date: Thu, 8 May 2025 17:27:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v2 05/26] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <aBy_aBkC7NpicXho@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-6-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:47AM +0200, Herve Codina wrote:
> The simple-pm-bus drivers handles several simple bus. When it is used

bus --> busses ?

> with busses other than a compatible "simple-pm-bus", it don't populate
> its child devices during its probe.
> 
> This confuses fw_devlink and results in wrong or missing devlinks.
> 
> Once a driver is bound to a device and the probe() has been called,
> device_links_driver_bound() is called.
> 
> This function performs operation based on the following assumption:
>     If a child firmware node of the bound device is not added as a
>     device, it will never be added.
> 
> Among operations done on fw_devlinks of those "never be added" devices,
> device_links_driver_bound() changes their supplier.
> 
> With devices attached to a simple-bus compatible device, this change
> leads to wrong devlinks where supplier of devices points to the device
> parent (i.e. simple-bus compatible device) instead of the device itself
> (i.e. simple-bus child).
> 
> When the device attached to the simple-bus is removed, because devlinks
> are not correct, its consumers are not removed first.
> 
> In order to have correct devlinks created, make the simple-pm-bus driver
> compliant with the devlink assumption and create its child devices
> during its probe.

...

>  	if (match && match->data) {
>  		if (of_property_match_string(np, "compatible", match->compatible) == 0)

Side note, there is an fwnode_is_device_compatible() API for such cases. And IIRC
there is also OF variant of it.

> -			return 0;
> +			goto populate;
>  		else
>  			return -ENODEV;
>  	}

...

> +	if (pdev->dev.of_node)

Why do you need this check? AFAICS it dups the one the call has already in it.

> +		of_platform_depopulate(&pdev->dev);

-- 
With Best Regards,
Andy Shevchenko



