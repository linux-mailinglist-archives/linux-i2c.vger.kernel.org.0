Return-Path: <linux-i2c+bounces-13707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C913BF6F75
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 16:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9812F402521
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 14:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A382633B970;
	Tue, 21 Oct 2025 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COd4ZwD/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C30339B4B;
	Tue, 21 Oct 2025 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055673; cv=none; b=ODBoVaHzjR4jugungenKZwQX6F1Tt2b/zV2AfV+x+6jO9oKKlFSpYMPt/oRyLv/ZWWxHlxpkt11ZccxHWZSro5XdWMtUCitF0VzGKKj+p91O0vsJbivfGU1PJ5QkgUlmnwJjvT+qs7Q5P1gDhhsSIcdf7J9tAIoNbT23hjw2EHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055673; c=relaxed/simple;
	bh=MLoAqGWmWG0tS39BHCw04giIQ56RcWiSSu/4KePK/yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgmGlrKUdb4tksrHQsZ1HcjDvoKlG0Kh70mbQ0CCMcREOXY6c5yPSlsnUz3WslxCc7HQagKPneHaMhv7rcPcg8yhev8MuwPWxF6PfhwPEelNH4lkPTFC93dOGqIJpO72OgBcXakJxEuqunPYxXWscmxcAd8brb9ez0CQl8X+6BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COd4ZwD/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761055671; x=1792591671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MLoAqGWmWG0tS39BHCw04giIQ56RcWiSSu/4KePK/yY=;
  b=COd4ZwD/UvEs7tmxenfEITc1kFvq/9VVf2748orKc9eEky4SF+Skqk8O
   t4WVJ8jyg/v1Qur6lvugsLGVFcSEX6y9fbdPogNgOFSS4oUxeGiPV6B68
   aWhWngrml6SKQdM/HtmaVCyuQXic+iRKOEctS/HJE7WswZEO0dgRHaEh8
   /fcTHQzdAdC4J7Flf4Gk5E9TIZRuBTjFlhVdHvyih+DssVZUmGPX0PH5x
   fR+Of66GBQoX/TZ5sAlmvKIg7H+dyvJLJVrpqpFMxjPPVxsKbj4Qaca5+
   R6M/c9+CbshllIuABBawbgQYi42jNfOeCv2tbTGyFpTxLQ4FxLptEjYCi
   Q==;
X-CSE-ConnectionGUID: oJTT6URlQIi3BtwyR79hig==
X-CSE-MsgGUID: YUZFebCiQHSJzRYuFTV9Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73788480"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="73788480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:07:50 -0700
X-CSE-ConnectionGUID: OIuqUSuiRNiNI7aTyE6D3g==
X-CSE-MsgGUID: pogwMQpnS7K/l603s2LfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="184081155"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:07:39 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBD1S-00000001VzY-2SRO;
	Tue, 21 Oct 2025 17:07:34 +0300
Date: Tue, 21 Oct 2025 17:07:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 06/29] bus: Introduce simple-platorm-bus
Message-ID: <aPeTppUgRC1wWQU9@smile.fi.intel.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015071420.1173068-7-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 15, 2025 at 09:13:53AM +0200, Herve Codina wrote:
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
> In order to have correct devlinks created, make the simple-bus driver
> compliant with the devlink assumption and create its child devices
> during its probe.
> 
> Doing that leads to other issues due to the fact that simple-bus is
> closely related to of_platform_populate().
> 
> Indeed, of_platform_populate() can probe child devices if a simple-bus
> compatible node is detected. This behavior is expected by some drivers
> such as some MFD drivers. Those drivers perform some operations in their
> probe() but rely on the core (simple-mfd, simple-bus compatible) to
> populate child devices [1].
> 
> Avoiding recursive probing in of_platform_populate() and let the
> simple-bus driver probe its child devices will break some system.
> 
> For this reason, keep the current behavior of the simple-bus driver and
> of_platform_populate() as they are and introduce simple-platform-bus
> driver.
> 
> This driver doesn't interfere with of_platform_populate() and populates
> child devices during its probe() as expected by fw_devlink.
> 
> [1] https://lore.kernel.org/all/20250715095201.1bcb4ab7@bootlin.com/

Link tag?

...

The below is simply wrong. The luck that you got no errors is due to CONFIG_OF
being bool and not tristate in Kconfig. I dunno if this driver ever gets the
'm' capability, but currently it uses tons of dead code (such as MODULE_*()
macros). Disregard of that, the proposed change should go to the separate
compilation unit at bare minimum.

...

>  module_platform_driver(simple_pm_bus_driver);

> +module_platform_driver(simple_platform_bus_driver);

^^^ WRONG!

-- 
With Best Regards,
Andy Shevchenko



