Return-Path: <linux-i2c+bounces-10874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1EAAE3C3
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 17:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14AD5985009
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 15:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A9E28981B;
	Wed,  7 May 2025 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pt0ektGr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C185F186E2E;
	Wed,  7 May 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630176; cv=none; b=hDj2AqwRhNlv6D3eBCp/NmxThWN4GK1L3hFB+gSTOw3IvxqWy85HJRQfIUkC1ncsyZ5B23jCmjZJXEKoLEEpXk/n9Xrx+lML67D611mmV6UcjfCMresgS79omm1HT/hVFAZcNZAOysr+8L/hZYVxEUjVLaAqdIBY4RozpcjdYYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630176; c=relaxed/simple;
	bh=vtUHYngmcvy8/hID4LtvlRBZCfZROB/R+TjQOTME2Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vkg3oZlzc1nezsRxZTGcClrBE9qPCB+zFe3mELv1G0dMfbFV1sZO55ekzRCa/If34VtYuj2Omu8S9Fr+q4QdQky4uUOYdyWWPuaTh4GxnuO26Onzs5K1IVC1h5poo3A8RTvvINlK/e3SulWpBdl309ee50zyanlr2+0/lh1MiV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pt0ektGr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746630176; x=1778166176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vtUHYngmcvy8/hID4LtvlRBZCfZROB/R+TjQOTME2Bg=;
  b=Pt0ektGrfPj6ZfwLbEZkwSR/s3GRM+E05yt7VclqGI18VRg6tsvzO8c7
   DdbazJHoeY1zLPqpHNlsJT3ate2YSd5/HHODVk5L003Wa6oJk0Ue+wWob
   b5iSfhc/Lmlmuve3LTUcmKghoup+V0Cy+iVfUz/b4MpsqdmJih60TSLCF
   3dzHwWtS5ewueyu49T/yvW6/OveOCpB42Ig4oJnnD6AnQrHy+KsaXLd7o
   0N3AbXBMbf8CG/T7K6EkqtqyTS6TXg8JO2QFVenrZ+dZV3TQ7dMRl/bbR
   kul+zrpeqU+xr57MEeYxB3h32EgTnf+dujhUztCqpds8zBvkGU6V42se/
   A==;
X-CSE-ConnectionGUID: zqveaGftRW+KRVdI0y87Ow==
X-CSE-MsgGUID: xTD69FyQSu6g7chF6SkdnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52020383"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52020383"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:02:54 -0700
X-CSE-ConnectionGUID: lRvf7inWQZi1tpGGkpwiJA==
X-CSE-MsgGUID: n7eeEJ6hSiWvPOaKwLixag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166908528"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:02:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uCgID-00000003lNr-0NGr;
	Wed, 07 May 2025 18:02:41 +0300
Date: Wed, 7 May 2025 18:02:40 +0300
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
Subject: Re: [PATCH v2 06/26] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <aBt2EHYf6j6Ulthb@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-7-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:48AM +0200, Herve Codina wrote:
> Setting fwnode->dev is specific to fw_devlink.
> 
> In order to avoid having a direct 'fwnode->dev = dev;' in several
> place in the kernel, introduce fw_devlink_set_device() helper to perform
> this operation.

Makes sense, can you also mark that field as __private? So sparse can catch
the abusers up.

-- 
With Best Regards,
Andy Shevchenko



