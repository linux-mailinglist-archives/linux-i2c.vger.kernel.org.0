Return-Path: <linux-i2c+bounces-10178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C483A7E535
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC160188CB7D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6492040B9;
	Mon,  7 Apr 2025 15:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObF23tKu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C12036F6;
	Mon,  7 Apr 2025 15:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040590; cv=none; b=Tk5CiLVoZ3N2RtKIY26VPvhNw+1Zf9ul80ncFwuVNTJiQAinevd+7DS4t5OFzxmnCMl5wMs7l8rACfVOJR1gNte54dv3Y8Wxz5Yj8YFp5+We3KR5Bf/pirUoIpykLemgAs3VKj/gF8DFj+b6ZUan0qajhuATGVy920uJED9ueBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040590; c=relaxed/simple;
	bh=+bfBlrTODZYu3pKVpWowUt5ekRSxDmvofhdH7JASR9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3tvhLyVBwbIPtPcnp+TknVTco7awDS74FLwG20VMpBeboqt9TyHscyfclKcgIFF9lSJrsHAWK5X/XpI8zxmBE2LQd1RDOUKQLAm7CCUSxbEimY+XaAkYlCdQLS+JFCAVwxuJv93Es4G1OYZQUNMCDEBAwqaH5U9EJKT/riGANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObF23tKu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040589; x=1775576589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+bfBlrTODZYu3pKVpWowUt5ekRSxDmvofhdH7JASR9A=;
  b=ObF23tKuc/zre5XJ4WY+l+jeR96cvn6oIPxB73mjHaEtfLIcbVExqYSj
   RrNiueqan2eaYsISKgL/2aCTqI1jhdSkHBewTsneywly28qHO8NRc1AZk
   /IB25SCEyjxXgyQnMv2KAfiwMGoNCAY+8wfqUUuwsjUH9IVuwMk6m7HOK
   DwQ81f7axn/3NQyU5CwKDP3MPRBtBZlLpchgtvEqA7Yql9r1T5nj2QY93
   CeyYHD6TTcl1rPnj7E2g4hb8lua48/PBaVdJwV3iTz3h80pcDnJVIcY10
   jPKlztFOPRKdHurfpY0Zdscy/WZverE2dI0dNhuNtYsY/1kIz+xeIfj3E
   w==;
X-CSE-ConnectionGUID: vaRHodjPQselcu6sB0bpMw==
X-CSE-MsgGUID: PGolypC6TUOar++ZLZ/hUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56096639"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56096639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:43:08 -0700
X-CSE-ConnectionGUID: z2HD4fT+SiaRoL9kWQVDJQ==
X-CSE-MsgGUID: +KOv1CCeSF2YtmEZIw2xfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="133195403"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:42:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1och-0000000A75j-0ycM;
	Mon, 07 Apr 2025 18:42:55 +0300
Date: Mon, 7 Apr 2025 18:42:55 +0300
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
Subject: Re: [PATCH 13/16] i2c: busses: at91: Add MCHP_LAN966X_PCI dependency
Message-ID: <Z_PyfyBq5cDeIQwS@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-14-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-14-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:42PM +0200, Herve Codina wrote:
> The AT91 I2C driver depends on ARCH_AT91.
> 
> This I2C controller can be used by the LAN966x PCI device and so
> it needs to be available when the LAN966x PCI device is enabled.

...

>  config I2C_AT91
>  	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
> -	depends on ARCH_AT91 || COMPILE_TEST
> +	depends on ARCH_AT91 || MCHP_LAN966X_PCI || COMPILE_TEST

I would drop it altogether in similar way as suggested for the clock driver.

-- 
With Best Regards,
Andy Shevchenko



