Return-Path: <linux-i2c+bounces-11022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250AFABBD55
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 14:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B038A17C313
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 12:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD8C277004;
	Mon, 19 May 2025 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdCRGhaE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99371276047;
	Mon, 19 May 2025 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656416; cv=none; b=Rxkt7+GpikLW601PhuNzQ959HzqtiyFfmegKl1fvezkJ1fM5UJJwxMi/X5l8j0pMKxBLGfNq9rtxpsj6ChUe3lGeUIXidP9DFbsSFmj+I6a2ZQt7PXqCNpFcEc7Hrawy0KBZwAzQVD65XU13nm+II8B4QAIuaurNW4YCkYL+8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656416; c=relaxed/simple;
	bh=X9JYOmBZRRIrcEoIxM35PaaiyYlkP8TFD/KMSQVTS0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSJxyhKj4UczyZvSOeKuVvQgQPmZXzcRdS+K5mmN4V3lKKpHKLl2QIC0VCxvRfNERQqv6EAMl9oHZpdjD6xM2PTG2g73XsspcdvXop+/WH0KCZoGW4N9WZDwbOTnRPtX4m4lYCidGM2SM+dwHTPB2GNP60c9zaoi1xURvfeFZTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdCRGhaE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747656415; x=1779192415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X9JYOmBZRRIrcEoIxM35PaaiyYlkP8TFD/KMSQVTS0U=;
  b=JdCRGhaEn+qI5doIMAOdkK0za+kEkIfrP8JdhCuUHib+5Zy1cJhOLby0
   gtnGpWi68AnCrpxljfa3tGYGIF6LvWDc87kmR9j+8xoLUbc7jDalbXFHW
   QsHe1k6dWhj4xmgheqLsboyUME2sDZ6bwymPNUIGq6ThSds2CrEuuBpOj
   cDGImTriG7+F4UVsOOdSOHo05afZRfYHejrP5mypqeyb3gsMenT6Qim4L
   j7nAOoMDr520kZ81eN/KLsF9D0yAxdpcL8GBDbzHsSM7hMB4vc57N2OOa
   wW/zBoAvwvv2Ii4vWueLeWTvPCOupbvrJH2E33X9phy8kmoUSZ6vkh2Kk
   g==;
X-CSE-ConnectionGUID: Y8/IPI4FQa2Sc3Pzp539bA==
X-CSE-MsgGUID: C2t87Q/vSEGvo4wlFQyPTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53225182"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="53225182"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:06:54 -0700
X-CSE-ConnectionGUID: WMsdqKWhTEWrSxf4sLI6yQ==
X-CSE-MsgGUID: iTaMPZPKSmWRJ7+uxsle8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144112208"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:06:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uGzGL-000000031iT-3wdP;
	Mon, 19 May 2025 15:06:33 +0300
Date: Mon, 19 May 2025 15:06:33 +0300
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
Message-ID: <aCseyW1iZgZNZNqd@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-6-herve.codina@bootlin.com>
 <aBy_aBkC7NpicXho@smile.fi.intel.com>
 <20250519135818.01db3341@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519135818.01db3341@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 19, 2025 at 01:58:18PM +0200, Herve Codina wrote:
> On Thu, 8 May 2025 17:27:52 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, May 07, 2025 at 09:12:47AM +0200, Herve Codina wrote:

...

> > >  		if (of_property_match_string(np, "compatible", match->compatible) == 0)  
> > 
> > Side note, there is an fwnode_is_device_compatible() API for such cases. And IIRC
> > there is also OF variant of it.
> 
> fwnode_device_is_compatible() checked for all compatible string. I mean, if
> we have compatible = "foo,custom-bus", "simple-bus";
> fwnode_device_is_compatible() checking against "simple-bus" returns true.
> 
> Here, we want "simple-bus" as the first position in the compatible string.
> In other word, we want to match the more specific compatible string as
> mentioned in the comment.

I admit I'm not an expert in DT, but why is the compatibility position
dependent?

...

> > > +	if (pdev->dev.of_node)  
> > 
> > Why do you need this check? AFAICS it dups the one the call has already in it.
> 
> of_platform_populate() was called only if an OF node is present.
> I want to call of_platform_depopulate() on removal also only if an OF node
> is present.
> 
> I don't see the other call that duplicated this check.
> 
> Can you clarify?

The of_...() is already NULL-aware (AFAICS), why do you need the duplicated
check?

> > > +		of_platform_depopulate(&pdev->dev);  

-- 
With Best Regards,
Andy Shevchenko



