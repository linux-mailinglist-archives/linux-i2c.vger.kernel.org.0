Return-Path: <linux-i2c+bounces-11490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC750ADAE73
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 13:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7BD16F8E7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 11:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48512D9ECB;
	Mon, 16 Jun 2025 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GkmbC+BN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF8D2C08B4;
	Mon, 16 Jun 2025 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073331; cv=none; b=cq+6wUuJG4kN7F5uH+cUuiIp/rnAByW9E86WSaXaOkdtl+D6T1nMcUnyBq0dW3OdUlNZZ8qcux3Wj2LhJ/XBcew9+8wMRCPhzMlg30q+yrc78hLNuS+YY6k8iaI19Jj1vjUQPzbVqcFrfUVJ3A3j+zBU7yiPn2oiaAjzXAmOgsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073331; c=relaxed/simple;
	bh=tKv3IVxR4x+Lo88hvTXaRanXQjO9bR1OAuTbuJp33RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkaLqlOSG2pbAb+aoNhBVZsCb6Z3bAKfyZMwqmUfc7jbswDfwInqR/Bxdo7W+/Et2smtpxkX+/J0cjml5HDsbmeZ4Op7Bfw4oDl2K84JfQDCNgBQWh7IjKbZAH/jd8GLYC0g/pOE9+0GURJD0uslJN8VNgNkCXswG+2x1f8nqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GkmbC+BN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073330; x=1781609330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tKv3IVxR4x+Lo88hvTXaRanXQjO9bR1OAuTbuJp33RA=;
  b=GkmbC+BNJOzSb78JPRa1YQhS1WhaaiE7toW1kwqlO2Jmwxy/MAbs9309
   YQUcj5Fab/HYf3gUVfTiC5pG6XJkTg05kJPKaMTfEvYxWqRO1lAYOGGu5
   wGazwVurQroFJ0WCwaLP0vIaNT+YhtPB1wSiwQ1FQUgviS3H52kCKt2O0
   OTLIVQRimzqpO1Ht/cp8j75PG6nGkOggmpm+HQi0Z3lktVNxQAYymZcU6
   Q2adXXri5wC/6xEQ7E/4wU3nJ3aouwvWI8qyz3IdmptMYji4UpnmOVPrQ
   ZzACK1ypxz4pK0ZoGwDMQmpEM/YBinQH2xZfwzQtD0ymC+/KuoNZEUORw
   A==;
X-CSE-ConnectionGUID: Tsefuzu5RReGHKY8qmcwdQ==
X-CSE-MsgGUID: kcao5GnHQ9qjnPPQVzHU6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56013992"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="56013992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:28:48 -0700
X-CSE-ConnectionGUID: CavMHqxJRc6wvzpGQZrJ0Q==
X-CSE-MsgGUID: 9jp8Syx1RJy/G1rE/YliHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179344519"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:28:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR80v-000000073fj-0ZrN;
	Mon, 16 Jun 2025 14:28:33 +0300
Date: Mon, 16 Jun 2025 14:28:32 +0300
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 05/28] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <aE__4I0vLIDgteME@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-6-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 03:47:45PM +0200, Herve Codina wrote:
> The simple-pm-bus driver handles several simple busses. When it is used
> with busses other than a compatible "simple-pm-bus", it doesn't populate
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
> -			return 0;
> +			goto populate;
>  		else
>  			return -ENODEV;
>  	}

A nit: seems that now we don't need to keep a symmetry in the branches and
hence the redundant 'else' can be dropped

		if (of_property_match_string(np, "compatible", match->compatible) != 0)
			return -ENODEV;
		goto populate;
	}

But this might be out of the scope here and can be done later on. In my opinion
it will make code slightly easier to follow.


-- 
With Best Regards,
Andy Shevchenko



