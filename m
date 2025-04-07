Return-Path: <linux-i2c+bounces-10177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F5DA7E518
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B32541883DAE
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA13201021;
	Mon,  7 Apr 2025 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHoLWBkR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5588B200106;
	Mon,  7 Apr 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040325; cv=none; b=m/r3Ypx0XFYSpM1R8skA5yPPw987bdhwrf0PKn9sw/940VURCE4Dd/IBFw9Wco46i2tTbR1j6w5gRJvZXebALJyFOZCvUIJCOTaue4HQnylA1s1tIgv18ZNgzP1d7UzzxzV5b5VpmXhqzOLMdYTGLDPiCZ/U1DrjErGWDbIuh1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040325; c=relaxed/simple;
	bh=LKcgqnfETeD5E25/OJgmgcuHbrOXdpZ82Zu7gUGorQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTsIrelLuueJ6sf7EAgZwjweR5WYKxuxr0s2esIEadtE641fboYM7lqrlbTK+RT32VhmRrm0Z7KV+0vCLS59MSwsbNglRtT1GzY94J7xc13jWPi+G/balv5YQnbZw3rCZqkk+NoK9dKNt02aPAEOpFgsmNNnyaqtbv1u5tZYZe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHoLWBkR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040323; x=1775576323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LKcgqnfETeD5E25/OJgmgcuHbrOXdpZ82Zu7gUGorQM=;
  b=cHoLWBkR4JBK91F6MrvKcpIzC89fFhGiDdkN8ydVmKhRiSXgzHjhb2ni
   003xFdjrLOltpL3qNGG8x5SUNjoklO9RNJztNLqtkuavWwIOarOIaQTA1
   HMMVv8ZBzxD5eS1+0kc0gvZFuc082Amf/dpGvz99eJfEUNHxVTztPSawb
   qBFXXKVHlmjY8RnYAkf5ZmKDT3JMBejPUml2VvZbubvhIOAZcHOBMlx+g
   uf5Xwx8xojcR/hqp9IwoXhl/LGtSnq0druB254QEk95s/Ht5vdy7zHAFa
   uyXl8WunL4Dl7QRMdIKIC8IIBgGawnXAdECW7igSAACeBc1L8z9+HIf2J
   g==;
X-CSE-ConnectionGUID: WBqAL4NsRLmwL+IMWOtjlA==
X-CSE-MsgGUID: rdr3y0fpRO6AQgv0Fwb/Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56073767"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56073767"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:38:42 -0700
X-CSE-ConnectionGUID: ZaM6breCTEu2fVcXhk221g==
X-CSE-MsgGUID: SW7yuP2sS1iNa9uO/jM7Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128498972"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:38:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oYQ-0000000A71t-3Nnw;
	Mon, 07 Apr 2025 18:38:30 +0300
Date: Mon, 7 Apr 2025 18:38:30 +0300
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
Subject: Re: [PATCH 12/16] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Message-ID: <Z_PxdmKbBGlhpQpr@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-13-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-13-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:41PM +0200, Herve Codina wrote:
> The lan966x clock controller depends on the LAN969x architecture or the
> LAN966x SoC.
> 
> This clock controller can be used by the LAN966x PCI device and so it
> needs to be available when the LAN966x PCI device is enabled.

...

>  	depends on HAS_IOMEM
>  	depends on OF
> -	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
> +	depends on SOC_LAN966 || ARCH_LAN969X || MCHP_LAN966X_PCI || COMPILE_TEST

This doesn't seem to scale. Why not simply

	depends on HAS_IOMEM
	depends on OF || COMPILE_TEST

?

-- 
With Best Regards,
Andy Shevchenko



